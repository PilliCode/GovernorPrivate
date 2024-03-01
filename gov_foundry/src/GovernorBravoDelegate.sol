// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.10;

import "./GovernorBravoInterfaces.sol";
import {UltraVerifier} from './plonk_vk.sol';

contract GovernorBravoDelegate is
    GovernorBravoDelegateStorageV2,
    GovernorBravoEvents
{
    /// @notice The name of this contract
    string public constant name = "Private Governor Bravo";

    /// @notice The minimum setable proposal threshold
    uint public constant MIN_PROPOSAL_THRESHOLD = 1000e18; // 1,000 Comp

    /// @notice The maximum setable proposal threshold
    uint public constant MAX_PROPOSAL_THRESHOLD = 100000e18; //100,000 Comp

    /// @notice The minimum setable voting period
    uint public constant MIN_VOTING_PERIOD = 5760; // About 24 hours

    /// @notice The max setable voting period
    uint public constant MAX_VOTING_PERIOD = 80640; // About 2 weeks

    /// @notice The min setable voting delay
    uint public constant MIN_VOTING_DELAY = 1;

    /// @notice The max setable voting delay
    uint public constant MAX_VOTING_DELAY = 40320; // About 1 week

    /// @notice The number of votes in support of a proposal required in order for a quorum to be reached and for a vote to succeed
    uint public constant quorumVotes = 400000e18; // 400,000 = 4% of Comp

    /// @notice The maximum number of actions that can be included in a proposal
    uint public constant proposalMaxOperations = 10; // 10 actions

    /// @notice The EIP-712 typehash for the contract's domain
    bytes32 public constant DOMAIN_TYPEHASH =
        keccak256(
            "EIP712Domain(string name,uint256 chainId,address verifyingContract)"
        );

    /// @notice The EIP-712 typehash for the ballot struct used by the contract
    bytes32 public constant BALLOT_TYPEHASH =
        keccak256("Ballot(uint256 proposalId,uint8 support)");

    // Gov private bravo

    /// @notice L_did delegation identifier mapping from address to hash of cipher text
    mapping(address => bytes32) public l_did;

    /// @notice active map
    mapping(address => bool) public active;

    /// @notice map from delegate addrs to index in l_d for true index subtract 1 from this
    mapping(address => uint256) public l_d_index;

    /// @notice array of cipher texts that represents delegate voting power in the order of cex,cey,cvx,cvy
    bytes32[4][] l_d;
    
    ///@notice root of balances 
    bytes32 r_t;

    ///@notice public key x values of trusted authority
    bytes32 pk_x;

    ///@notice public key y values of trusted authority
    bytes32 pk_y;

    ///@notice verifier for zkproofs
    UltraVerifier verifier;

    /**
     * @notice Used to initialize the contract during delegator constructor
     * @param timelock_ The address of the Timelock
     * @param comp_ The address of the COMP token
     * @param votingPeriod_ The initial voting period
     * @param votingDelay_ The initial voting delay
     * @param proposalThreshold_ The initial proposal threshold
     */
    constructor(
        address timelock_,
        address comp_,
        uint votingPeriod_,
        uint votingDelay_,
        uint proposalThreshold_
    ) public  {
        require(
            address(timelock) == address(0),
            "GovernorBravo::initialize: can only initialize once"
        );
        // require(msg.sender == admin, "GovernorBravo::initialize: admin only");
        require(
            timelock_ != address(0),
            "GovernorBravo::initialize: invalid timelock address"
        );
        require(
            comp_ != address(0),
            "GovernorBravo::initialize: invalid comp address"
        );
        require(
            votingPeriod_ >= MIN_VOTING_PERIOD &&
                votingPeriod_ <= MAX_VOTING_PERIOD,
            "GovernorBravo::initialize: invalid voting period"
        );
        require(
            votingDelay_ >= MIN_VOTING_DELAY &&
                votingDelay_ <= MAX_VOTING_DELAY,
            "GovernorBravo::initialize: invalid voting delay"
        );
        require(
            proposalThreshold_ >= MIN_PROPOSAL_THRESHOLD &&
                proposalThreshold_ <= MAX_PROPOSAL_THRESHOLD,
            "GovernorBravo::initialize: invalid proposal threshold"
        );
        timelock = TimelockInterface(timelock_);
        comp = CompInterface(comp_);
        votingPeriod = votingPeriod_;
        votingDelay = votingDelay_;
        proposalThreshold = proposalThreshold_;
        initialProposalId++;
        verifier = new UltraVerifier();
    }
    /**
     * @notice Used to initialize the contract during delegator constructor
     * @param pk_enc_x trusted auth public key
     * @param pk_enc_y trusted auth public key
     * @param r_t_ balance of each user already in contract
     * @param signature_ signature on lt 
     * @param pk_sig_ public key used to sign the signature
     */
    function initialize_private(
        bytes32 pk_enc_x,
        bytes32 pk_enc_y,
        bytes32 r_t_,
        string memory signature_,
        string memory pk_sig_
    ) public {
        pk_x = pk_enc_x;
        pk_y = pk_enc_y;
        r_t = r_t_;

        emit InitializePrivate(pk_x, pk_y, r_t, signature_, pk_sig_);
    }

    /** 
     * @notice Used to register the sender as a delegate
     * @param balance user balance
     * @param cex encrypted cipher text e.x 
     * @param cey encrypted cipher text e.y 
     * @param cvx encrypted cipher text v.x
     * @param cvy encrypted cipher text v.y 
     * @param proof proof c was created correctly
     */
    function register_delegate(
        bytes32 balance,
        bytes32 cex,
        bytes32 cey,
        bytes32 cvx,
        bytes32 cvy,
        bytes memory proof
    ) public {
        require(active[msg.sender] == false, "user already an active delegate");
        require(comp.isLocked(msg.sender) == false, "users tokens are currently locked");
        bytes32[] memory inputs = new bytes32[](8);
        inputs[0] = pk_x;
        inputs[1] = pk_y;
        /* Not an issue for demo but in real world. Caveat if there balance changes while registering the old one is used */ 
        inputs[2] = balance;  // msg
        inputs[3] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);  // random state
        inputs[4] = cex;  // c_e_x
        inputs[5] = cey;  // c_e_y
        inputs[6] = cvx;  // c_v_x
        inputs[7] = cvy;  // c_v_y

        // verify proof
        require(verifier.verify(proof, inputs, 3), "Invalid Proof");

        // set active true
        active[msg.sender] = true;
        if(l_d_index[msg.sender] == 0){
            l_d_index[msg.sender] = l_d.length+1;
        }
        uint256 sender_index = l_d_index[msg.sender]-1;

        // if new account push ciphertext 
        if (sender_index == l_d.length){
            l_d.push([cex,cey,cvx,cvy]);
        }else{
            // if old account update old index
            l_d[sender_index] = [cex,cey,cvx,cvy];
        }
        // lock users tokens
        require(comp.lock(msg.sender));
        emit RegisterDelegate(msg.sender, sender_index, comp.isLocked(msg.sender),active[msg.sender],uint256(balance));
    }
    
    function unregister_delegate(
        bytes32 balance,
        bytes32 old_cex,
        bytes32 old_cey,
        bytes32 old_cvx,
        bytes32 old_cvy,
        bytes32 new_cex,
        bytes32 new_cey,
        bytes32 new_cvx,
        bytes32 new_cvy,
        bytes memory proof
    ) public {
        require(active[msg.sender], "user is not an active delegate so can not undelegate");
        require(comp.isLocked(msg.sender), "users tokens are unlocked can not undelegate");
        bytes32[] memory inputs = new bytes32[](9);
        inputs[0] = old_cex;
        inputs[1] = old_cey;
        inputs[2] = old_cvx;  
        inputs[3] = old_cvy;
        inputs[4] = balance;  
        inputs[5] = new_cex;  
        inputs[6] = new_cey;  
        inputs[7] = new_cvx;  
        inputs[8] = new_cvy;  
        require(verifier.verify(proof, inputs, 6), "Invalid Proof");
        active[msg.sender] = false;
        uint256 sender_index = l_d_index[msg.sender]-1;
        l_d[sender_index] = [new_cex,new_cey,new_cvx,new_cvy];
        require(comp.unlock(msg.sender), "token could not unlock");

        emit UnregisterDelegate(msg.sender,comp.isLocked(msg.sender),active[msg.sender],uint256(balance),sender_index);
    }


    function delegate(
        bytes32[] memory ct_new,
        bytes32[] memory rand_states, 
        bytes32[] memory delegates,
        bytes32 vote_root,
        bytes32[] memory votes_hashpath, 
        bytes32 vote_idx,
        bytes32[] memory ct_old,
        bytes32[] memory ct_sum, 
        uint[] memory shuffled_indices,
        bytes memory proof
    ) public {        
        require(comp.isLocked(msg.sender) == false, "users tokens are locked can not delegate your vote");
        {
            uint anonymity_size = rand_states.length;
            /* variable inputs size based on anonymity size */
            bytes32[] memory inputs = new bytes32[](anonymity_size * 14 + 24);
            inputs[0] = pk_x;
            inputs[1] = pk_y;
            uint index = 2;
            // ct new
            for (uint i = 0; i < ct_new.length; i++) {
                inputs[index] = ct_new[i];
                index+=1;
            }     
            // rand state
            for (uint i = 0; i < rand_states.length; i++) {
                inputs[index] = rand_states[i];
                index+=1;
            }    
            // delegates
            for (uint i = 0; i < delegates.length; i++) {
                inputs[index] = delegates[i];
                index+=1;
            }  
            // vote root
            inputs[index] = vote_root;
            index+=1;
            // vote hashpath
            for (uint i = 0; i < votes_hashpath.length; i++) {
                inputs[index] = votes_hashpath[i];
                index+=1;
            }  
            // vote index
            inputs[index] = vote_idx;
            index+=1;
            // old ct
            for (uint i = 0; i < ct_old.length; i++) {
                inputs[index] = ct_old[i];
                index+=1;
            }  
            // sum ct
            for (uint i = 0; i < ct_sum.length; i++) {
                inputs[index] = ct_sum[i];
                index+=1;
            }  
            if (anonymity_size == 20) require(verifier.verify(proof, inputs, 2), "Invalid Proof");
            else if (anonymity_size == 10) require(verifier.verify(proof, inputs, 11), "Invalid Proof");
            else if (anonymity_size == 5) require(verifier.verify(proof, inputs, 10), "Invalid Proof");
            else require(2==1, "invalid anonymity size");

        }
        require(comp.lock(msg.sender), "users tokens did not successfully lock");
        
        // update ld
        for (uint i = 0; i < shuffled_indices.length; i++) {
            bytes32[4] memory cts = [ct_sum[i*4],ct_sum[i*4+1],ct_sum[i*4+2],ct_sum[i*4+3]];
            l_d[shuffled_indices[i]] = cts;
        }

        // update ldid
        l_did[msg.sender] = keccak256(abi.encode(ct_new));

        // emit pi, ldid[pi], lock[pi] did not print l[d] since it is huge array
        emit Delegated(msg.sender, l_did[msg.sender], comp.isLocked(msg.sender));
    }

    function undelegate(
        bytes32[] memory ct_new,
        bytes32[] memory ct_old,
        bytes32[] memory ct_sum,
        uint[] memory shuffled_indices,
        uint anonymity_size,
        bytes memory proof
    ) public {
        require(comp.isLocked(msg.sender), "users tokens are unlocked there is no tokens to undelegate");
        /* ensure hash is the same as during delegation*/
        {
            bytes32[] memory temp = new bytes32[](anonymity_size*4);
            for (uint i = 0; i < anonymity_size*4; i++) {
                temp[i] = ct_old[i];
            }
            require(l_did[msg.sender] == keccak256(abi.encode(temp)), "hash mismatch");
        }

        /* verify proof */
        {
            bytes32[] memory inputs = new bytes32[](ct_new.length*3);
            uint index = 0;
            // ct new
            for (uint i = 0; i < ct_new.length; i++) {
                inputs[index] = ct_new[i];
                index+=1;
            }     
            // old ct
            for (uint i = 0; i < ct_old.length; i++) {
                inputs[index] = ct_old[i];
                index+=1;
            }  
            // sum ct
            for (uint i = 0; i < ct_sum.length; i++) {
                inputs[index] = ct_sum[i];
                index+=1;
            }  
            require(verifier.verify(proof, inputs, 9), "Invalid Proof");
        }

        /* unlock tokens*/
        require(comp.unlock(msg.sender), "users tokens did not successfully unlock");
        
        /* update ld */
        for (uint i = 0; i < shuffled_indices.length; i++) {
            bytes32[4] memory cts = [ct_sum[4*i],ct_sum[4*i+1],ct_sum[4*i+2],ct_sum[4*i+3]];
            l_d[shuffled_indices[i]] = cts;
        }

         /* update ldid */
        l_did[msg.sender] = keccak256(abi.encode(ct_sum));

        /* emit pi, ldid[pi], lock[pi] did not print l[d] since it is huge array */
        emit Undelegated(msg.sender, l_did[msg.sender], comp.isLocked(msg.sender));
    }

    function election_setup (
        address[] memory targets,
        uint[] memory values,
        string[] memory signatures,
        bytes[] memory calldatas,
        string memory title,
        string memory description,
        bytes32[4] memory ct0,
        uint voting_delay,
        uint voting_period
    ) public returns (uint) {
        /* make sure governance has been deployed*/
        require(
            initialProposalId != 0,
            "GovernorBravo::propose: Governor Bravo private not active"
        );

        uint startBlock = add256(block.number, voting_delay);
        uint endBlock = add256(startBlock, voting_period);
    
        /* Create new proposal */
        proposalCount++;
        uint newProposalID = proposalCount;
        Proposal storage newProposal = proposals[newProposalID];

        /* make sure eid not in leid */
        require(
            newProposal.id == 0,
            "GovernorBravo::propose: This id has been used"
        );

        /* populate proposal */
        newProposal.id = newProposalID;
        newProposal.proposer = msg.sender;
        newProposal.eta = 0;
        newProposal.targets = targets;
        newProposal.values = values;
        newProposal.signatures = signatures;
        newProposal.calldatas = calldatas;
        newProposal.startBlock = startBlock;
        newProposal.endBlock = endBlock;
        newProposal.forVotes = ct0;
        newProposal.againstVotes = ct0;
        newProposal.abstainVotes = ct0;
        newProposal.canceled = false;
        newProposal.executed = false;
        newProposal.initialized = false;
        newProposal.decrypted = false;
        newProposal.successful = false;
        newProposal.queued = false;

        /* emit proposal info */
        emit ElectionSetup(
            newProposal.id,
            msg.sender,
            startBlock,
            endBlock,
            description,
            title
        );
        return newProposal.id;
    }

    function election_start (
        uint proposalID,
        bytes32 votingRootSnapshot
    ) public {
        require(
            initialProposalId != 0,
            "GovernorBravo::propose: Governor Bravo private not active"
        );
        require(msg.sender == proposals[proposalID].proposer, "You are not the original proposer of this proposal");
        require(block.number >= proposals[proposalID].startBlock, "Trying to start election too early");
        require(block.number <= proposals[proposalID].endBlock, "Trying to start election too late");
        proposals[proposalID].snapshot = votingRootSnapshot;
        proposals[proposalID].initialized = true;
        emit ElectionStart(proposalID, msg.sender, votingRootSnapshot, l_d);
    }

    function vote (
        uint proposalID,
        uint8 support,
        string memory message,
        bytes32[12] memory rAdd, //first 4 are old vt, second set of 4 is delegate voting power, last set of 4 is result
        bytes32 root,
        bytes32[20] memory path,
        bytes32 merkleIndex,
        bytes memory proof
    ) public {
        require(
            initialProposalId != 0,
            "GovernorBravo::propose: Governor Bravo private not active"
        );
        Proposal storage currentProposal = proposals[proposalID];
        require(currentProposal.snapshot != bytes32(0), "There is not a valid snapshot for this election, it may not have been started");
        require(comp.isLocked(msg.sender), "Your tokens are not locked");
        require(active[msg.sender], "You are not an active delegate");
        require(!currentProposal.receipts[msg.sender].hasVoted, "You have already voted in this proposal");
        require(support >= 0, "votes value must be 0,1, or 2 the input is negative");
        require(support <= 2, "votes value must be 0,1, or 2 the input is > 2");
        require(block.number >= proposals[proposalID].startBlock, "Trying to vote too early");
        require(block.number <= proposals[proposalID].endBlock, "Trying to vote too late");
        
        /* Verify proof*/
        bytes32[] memory inputs = new bytes32[](34);
            // add 12 cts old, myvote, res
        uint index = 0;
        for (uint i = 0; i < rAdd.length; i++) {
            inputs[index] = rAdd[i];
            index+=1;
        }  
            // merkle root
        inputs[index] = root;
        index+=1;
            // hashpath
        for (uint i = 0; i < path.length; i++) {
            inputs[index] = path[i];
            index+=1;
        }
        inputs[index] = merkleIndex;
        index+=1;  
        require(verifier.verify(proof, inputs, 4), "Invalid Proof");

        /* count their vote*/
        currentProposal.receipts[msg.sender].hasVoted = true;
        currentProposal.receipts[msg.sender].support = support;

        /* identify if it succeeded */
        bytes32[4] memory resVote = [rAdd[8],rAdd[9],rAdd[10],rAdd[11]];
        if (support == 0){
            proposals[proposalID].forVotes = resVote;
        } else if (support == 1){
            proposals[proposalID].againstVotes = resVote;
        } else if (support == 2){
            proposals[proposalID].abstainVotes = resVote;
        }

        /* emit log */
        emit Vote(proposalID, msg.sender, support, message, resVote);

    }

    function decrypt_tally(
        uint proposalID,
        bytes32[3] memory percents,
        bytes memory proof
    ) public {
        Proposal storage p  = proposals[proposalID];
        require(block.number >= p.endBlock, "election has not finished");

        /* Verify proof*/
        bytes32[] memory inputs = new bytes32[](17);
        inputs[0] = pk_x;
        inputs[1] = pk_y;
        inputs[2] = p.forVotes[0];
        inputs[3] = p.forVotes[1];
        inputs[4] = p.forVotes[2];
        inputs[5] = p.forVotes[3];
        inputs[6] = p.againstVotes[0];
        inputs[7] = p.againstVotes[1];
        inputs[8] = p.againstVotes[2];
        inputs[9] = p.againstVotes[3];
        inputs[10] = p.abstainVotes[0];
        inputs[11] = p.abstainVotes[1];
        inputs[12] = p.abstainVotes[2];
        inputs[13] = p.abstainVotes[3];
        inputs[14] = percents[0];
        inputs[15] = percents[1];
        inputs[16] = percents[2];
        require(verifier.verify(proof, inputs, 8), "Invalid Proof");

        /* mark proposal as decrypted */
        p.decrypted = true;
        if (percents[0] > percents[1]){
            p.successful = true;
        }else{
            p.successful = false;
        }

        /* emit */
        emit DecryptTally(proposalID, percents[0], percents[1], percents[2]);
    }

    /**
     * @notice Gets the state of a proposal
     * @param proposalId The id of the proposal
     * @return Proposal state
     */
    function state(uint proposalId) public view returns (ProposalState) {
        require(
            proposalCount >= proposalId && proposalId >= initialProposalId,
            "GovernorBravo::state: invalid proposal id"
        );
        Proposal storage proposal = proposals[proposalId];
        if (proposal.canceled) {
            return ProposalState.Canceled;
        } else if (block.number < proposal.startBlock) {
            return ProposalState.Pending;
        } else if (block.number < proposal.endBlock && !proposal.initialized) {
            return ProposalState.AwaitingInit;
        }else if (block.number < proposal.endBlock && proposal.initialized) {
            return ProposalState.Active;
        } else if (!proposal.decrypted) {
            return ProposalState.AwaitingDecrypt;
        } else if (proposal.executed) {
            return ProposalState.Executed;
        }else if (proposal.queued) {
            return ProposalState.Queued;
        }  else if (proposal.successful) {
            return ProposalState.Succeeded;
        } else {
            return ProposalState.Defeated;
        }
    }

    function get_proposal_votes(uint votes, uint proposalID) public view returns (bytes32[4] memory){
        require(proposalID <= proposalCount, "Invalid proposal ID");
        require(votes >= 0, "votes value must be 0,1, or 2 the input is negative");
        require(votes <= 2, "votes value must be 0,1, or 2 the input is > 2");

        if (votes == 0){
            return proposals[proposalID].forVotes;
        } else if (votes == 1){
            return proposals[proposalID].againstVotes;
        } else if (votes == 2){
            return proposals[proposalID].abstainVotes;
        }
    }

    function get_proposal_votes_all(uint proposalID) public view returns (bytes32[4] memory ,bytes32[4] memory, bytes32[4] memory){
        require(proposalID <= proposalCount, "Invalid proposal ID");
        return (proposals[proposalID].forVotes, proposals[proposalID].againstVotes, proposals[proposalID].abstainVotes);
    }


    function getCiphertext(address addr) public view returns (bytes32,bytes32,bytes32,bytes32 ) {
        uint index = l_d_index[addr];
        bytes32[4] memory ct = l_d[index-1];
        return (ct[0], ct[1], ct[2], ct[3]);
    }

    function getLd() external view returns (bytes32[4][] memory){
        return l_d;
    }

    function is_active(address user) public view returns (bool){
        return active[user];
    }

    function exec(uint proposalId) external payable {
        Proposal storage p = proposals[proposalId];
          // solium-disable-next-line security/no-call-value
        (bool success, bytes memory returnData) = p.targets[0].call{value: p.values[0]}(p.calldatas[0] );
        require(success, "Exec::executeTransaction: Transaction execution reverted.");
        p.executed = true;
        emit ProposalExecuted(proposalId);
    }

    /**
     * @notice Gets the receipt for a voter on a given proposal
     * @param proposalId the id of proposal
     * @param voter The address of the voter
     * @return The voting receipt
     */
    function getReceipt(
        uint proposalId,
        address voter
    ) external view returns (Receipt memory) {
        return proposals[proposalId].receipts[voter];
    }

    /**
     * @notice View function which returns if an account is whitelisted
     * @param account Account to check white list status of
     * @return If the account is whitelisted
     */
    function isWhitelisted(address account) public view returns (bool) {
        return (whitelistAccountExpirations[account] > block.timestamp);
    }

    /**
     * @notice Admin function for setting the voting delay
     * @param newVotingDelay new voting delay, in blocks
     */
    function _setVotingDelay(uint newVotingDelay) external {
        require(
            msg.sender == admin,
            "GovernorBravo::_setVotingDelay: admin only"
        );
        require(
            newVotingDelay >= MIN_VOTING_DELAY &&
                newVotingDelay <= MAX_VOTING_DELAY,
            "GovernorBravo::_setVotingDelay: invalid voting delay"
        );
        uint oldVotingDelay = votingDelay;
        votingDelay = newVotingDelay;

        emit VotingDelaySet(oldVotingDelay, votingDelay);
    }

    /**
     * @notice Admin function for setting the voting period
     * @param newVotingPeriod new voting period, in blocks
     */
    function _setVotingPeriod(uint newVotingPeriod) external {
        require(
            msg.sender == admin,
            "GovernorBravo::_setVotingPeriod: admin only"
        );
        require(
            newVotingPeriod >= MIN_VOTING_PERIOD &&
                newVotingPeriod <= MAX_VOTING_PERIOD,
            "GovernorBravo::_setVotingPeriod: invalid voting period"
        );
        uint oldVotingPeriod = votingPeriod;
        votingPeriod = newVotingPeriod;

        emit VotingPeriodSet(oldVotingPeriod, votingPeriod);
    }

    /**
     * @notice Admin function for setting the proposal threshold
     * @dev newProposalThreshold must be greater than the hardcoded min
     * @param newProposalThreshold new proposal threshold
     */
    function _setProposalThreshold(uint newProposalThreshold) external {
        require(
            msg.sender == admin,
            "GovernorBravo::_setProposalThreshold: admin only"
        );
        require(
            newProposalThreshold >= MIN_PROPOSAL_THRESHOLD &&
                newProposalThreshold <= MAX_PROPOSAL_THRESHOLD,
            "GovernorBravo::_setProposalThreshold: invalid proposal threshold"
        );
        uint oldProposalThreshold = proposalThreshold;
        proposalThreshold = newProposalThreshold;

        emit ProposalThresholdSet(oldProposalThreshold, proposalThreshold);
    }

    /**
     * @notice Admin function for setting the whitelist expiration as a timestamp for an account. Whitelist status allows accounts to propose without meeting threshold
     * @param account Account address to set whitelist expiration for
     * @param expiration Expiration for account whitelist status as timestamp (if now < expiration, whitelisted)
     */
    function _setWhitelistAccountExpiration(
        address account,
        uint expiration
    ) external {
        require(
            msg.sender == admin || msg.sender == whitelistGuardian,
            "GovernorBravo::_setWhitelistAccountExpiration: admin only"
        );
        whitelistAccountExpirations[account] = expiration;

        emit WhitelistAccountExpirationSet(account, expiration);
    }

    /**
     * @notice Admin function for setting the whitelistGuardian. WhitelistGuardian can cancel proposals from whitelisted addresses
     * @param account Account to set whitelistGuardian to (0x0 to remove whitelistGuardian)
     */
    function _setWhitelistGuardian(address account) external {
        require(
            msg.sender == admin,
            "GovernorBravo::_setWhitelistGuardian: admin only"
        );
        address oldGuardian = whitelistGuardian;
        whitelistGuardian = account;

        emit WhitelistGuardianSet(oldGuardian, whitelistGuardian);
    }

    /**
     * @notice Initiate the GovernorBravo contract
     * @dev Admin only. Sets initial proposal id which initiates the contract, ensuring a continuous proposal id count
     * @param governorAlpha The address for the Governor to continue the proposal id count from
     */
    function _initiate(address governorAlpha) external {
        require(msg.sender == admin, "GovernorBravo::_initiate: admin only");
        require(
            initialProposalId == 0,
            "GovernorBravo::_initiate: can only initiate once"
        );
        proposalCount = GovernorAlpha(governorAlpha).proposalCount();
        initialProposalId = proposalCount;
        timelock.acceptAdmin();
    }

    /**
     * @notice Begins transfer of admin rights. The newPendingAdmin must call `_acceptAdmin` to finalize the transfer.
     * @dev Admin function to begin change of admin. The newPendingAdmin must call `_acceptAdmin` to finalize the transfer.
     * @param newPendingAdmin New pending admin.
     */
    function _setPendingAdmin(address newPendingAdmin) external {
        // Check caller = admin
        require(
            msg.sender == admin,
            "GovernorBravo:_setPendingAdmin: admin only"
        );

        // Save current value, if any, for inclusion in log
        address oldPendingAdmin = pendingAdmin;

        // Store pendingAdmin with value newPendingAdmin
        pendingAdmin = newPendingAdmin;

        // Emit NewPendingAdmin(oldPendingAdmin, newPendingAdmin)
        emit NewPendingAdmin(oldPendingAdmin, newPendingAdmin);
    }

    /**
     * @notice Accepts transfer of admin rights. msg.sender must be pendingAdmin
     * @dev Admin function for pending admin to accept role and update admin
     */
    function _acceptAdmin() external {
        // Check caller is pendingAdmin and pendingAdmin ≠ address(0)
        require(
            msg.sender == pendingAdmin && msg.sender != address(0),
            "GovernorBravo:_acceptAdmin: pending admin only"
        );

        // Save current values for inclusion in log
        address oldAdmin = admin;
        address oldPendingAdmin = pendingAdmin;

        // Store admin with value pendingAdmin
        admin = pendingAdmin;

        // Clear the pending value
        pendingAdmin = address(0);

        emit NewAdmin(oldAdmin, admin);
        emit NewPendingAdmin(oldPendingAdmin, pendingAdmin);
    }

    function add256(uint256 a, uint256 b) internal pure returns (uint) {
        uint c = a + b;
        require(c >= a, "addition overflow");
        return c;
    }

    function sub256(uint256 a, uint256 b) internal pure returns (uint) {
        require(b <= a, "subtraction underflow");
        return a - b;
    }

    function getChainIdInternal() internal view returns (uint) {
        uint chainId;
        assembly {
            chainId := chainid()
        }
        return chainId;
    }
}
