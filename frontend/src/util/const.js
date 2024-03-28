// export const backend_ip = "http://127.0.0.1:9797"
// export const backend_ip = "http://10.112.56.130:9797"
export const backend_ip = "http://35.236.3.155:9797"
export const foundry_ip = "http://34.94.30.170:8545/"

// export const trusted_auth_ip = "http://127.0.0.1:9999"
// export const trusted_auth_ip = "http://10.112.53.230:9999"
export const trusted_auth_ip = "http://35.235.104.220:9999"
export const timelock = "0x09635f643e140090a9a8dcd712ed6285858cebef"
// export const token = "0xe7f1725e7734ce288f8367e1bb143e90bb3f0512"
export const guardian = "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC"
export const tokenrecip = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
export const defaultAccount = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266".toLowerCase();
export const GENESIS = '0x0000000000000000000000000000000000000000000000000000000000000000';

export const contractAddress = "0xc5a5c42992decbae36851359345fe25997f5c42d";
export const comp_contractAddress = "0xe7f1725e7734ce288f8367e1bb143e90bb3f0512";
export const comp_abi = [{"type":"constructor","inputs":[{"name":"initialOwner","type":"address","internalType":"address"}],"stateMutability":"nonpayable"},{"type":"function","name":"DOMAIN_SEPARATOR","inputs":[],"outputs":[{"name":"","type":"bytes32","internalType":"bytes32"}],"stateMutability":"view"},{"type":"function","name":"allowance","inputs":[{"name":"owner","type":"address","internalType":"address"},{"name":"spender","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"approve","inputs":[{"name":"spender","type":"address","internalType":"address"},{"name":"value","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"nonpayable"},{"type":"function","name":"balanceOf","inputs":[{"name":"account","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"decimals","inputs":[],"outputs":[{"name":"","type":"uint8","internalType":"uint8"}],"stateMutability":"view"},{"type":"function","name":"eip712Domain","inputs":[],"outputs":[{"name":"fields","type":"bytes1","internalType":"bytes1"},{"name":"name","type":"string","internalType":"string"},{"name":"version","type":"string","internalType":"string"},{"name":"chainId","type":"uint256","internalType":"uint256"},{"name":"verifyingContract","type":"address","internalType":"address"},{"name":"salt","type":"bytes32","internalType":"bytes32"},{"name":"extensions","type":"uint256[]","internalType":"uint256[]"}],"stateMutability":"view"},{"type":"function","name":"isLocked","inputs":[{"name":"addr","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"view"},{"type":"function","name":"lock","inputs":[{"name":"addr","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"nonpayable"},{"type":"function","name":"mint","inputs":[{"name":"to","type":"address","internalType":"address"},{"name":"amount","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"name","inputs":[],"outputs":[{"name":"","type":"string","internalType":"string"}],"stateMutability":"view"},{"type":"function","name":"nonces","inputs":[{"name":"owner","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"owner","inputs":[],"outputs":[{"name":"","type":"address","internalType":"address"}],"stateMutability":"view"},{"type":"function","name":"permit","inputs":[{"name":"owner","type":"address","internalType":"address"},{"name":"spender","type":"address","internalType":"address"},{"name":"value","type":"uint256","internalType":"uint256"},{"name":"deadline","type":"uint256","internalType":"uint256"},{"name":"v","type":"uint8","internalType":"uint8"},{"name":"r","type":"bytes32","internalType":"bytes32"},{"name":"s","type":"bytes32","internalType":"bytes32"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"renounceOwnership","inputs":[],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"symbol","inputs":[],"outputs":[{"name":"","type":"string","internalType":"string"}],"stateMutability":"view"},{"type":"function","name":"totalSupply","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"transfer","inputs":[{"name":"to","type":"address","internalType":"address"},{"name":"value","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"nonpayable"},{"type":"function","name":"transferFrom","inputs":[{"name":"from","type":"address","internalType":"address"},{"name":"to","type":"address","internalType":"address"},{"name":"value","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"nonpayable"},{"type":"function","name":"transferOwnership","inputs":[{"name":"newOwner","type":"address","internalType":"address"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"unlock","inputs":[{"name":"addr","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"nonpayable"},{"type":"event","name":"Approval","inputs":[{"name":"owner","type":"address","indexed":true,"internalType":"address"},{"name":"spender","type":"address","indexed":true,"internalType":"address"},{"name":"value","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"EIP712DomainChanged","inputs":[],"anonymous":false},{"type":"event","name":"OwnershipTransferred","inputs":[{"name":"previousOwner","type":"address","indexed":true,"internalType":"address"},{"name":"newOwner","type":"address","indexed":true,"internalType":"address"}],"anonymous":false},{"type":"event","name":"Transfer","inputs":[{"name":"from","type":"address","indexed":true,"internalType":"address"},{"name":"to","type":"address","indexed":true,"internalType":"address"},{"name":"value","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"error","name":"ECDSAInvalidSignature","inputs":[]},{"type":"error","name":"ECDSAInvalidSignatureLength","inputs":[{"name":"length","type":"uint256","internalType":"uint256"}]},{"type":"error","name":"ECDSAInvalidSignatureS","inputs":[{"name":"s","type":"bytes32","internalType":"bytes32"}]},{"type":"error","name":"ERC20InsufficientAllowance","inputs":[{"name":"spender","type":"address","internalType":"address"},{"name":"allowance","type":"uint256","internalType":"uint256"},{"name":"needed","type":"uint256","internalType":"uint256"}]},{"type":"error","name":"ERC20InsufficientBalance","inputs":[{"name":"sender","type":"address","internalType":"address"},{"name":"balance","type":"uint256","internalType":"uint256"},{"name":"needed","type":"uint256","internalType":"uint256"}]},{"type":"error","name":"ERC20InvalidApprover","inputs":[{"name":"approver","type":"address","internalType":"address"}]},{"type":"error","name":"ERC20InvalidReceiver","inputs":[{"name":"receiver","type":"address","internalType":"address"}]},{"type":"error","name":"ERC20InvalidSender","inputs":[{"name":"sender","type":"address","internalType":"address"}]},{"type":"error","name":"ERC20InvalidSpender","inputs":[{"name":"spender","type":"address","internalType":"address"}]},{"type":"error","name":"ERC2612ExpiredSignature","inputs":[{"name":"deadline","type":"uint256","internalType":"uint256"}]},{"type":"error","name":"ERC2612InvalidSigner","inputs":[{"name":"signer","type":"address","internalType":"address"},{"name":"owner","type":"address","internalType":"address"}]},{"type":"error","name":"InvalidAccountNonce","inputs":[{"name":"account","type":"address","internalType":"address"},{"name":"currentNonce","type":"uint256","internalType":"uint256"}]},{"type":"error","name":"InvalidShortString","inputs":[]},{"type":"error","name":"OwnableInvalidOwner","inputs":[{"name":"owner","type":"address","internalType":"address"}]},{"type":"error","name":"OwnableUnauthorizedAccount","inputs":[{"name":"account","type":"address","internalType":"address"}]},{"type":"error","name":"StringTooLong","inputs":[{"name":"str","type":"string","internalType":"string"}]}];

// export const abi = GovContract.abi

export const abi = [{"type":"constructor","inputs":[{"name":"timelock_","type":"address","internalType":"address"},{"name":"comp_","type":"address","internalType":"address"},{"name":"votingPeriod_","type":"uint256","internalType":"uint256"},{"name":"votingDelay_","type":"uint256","internalType":"uint256"},{"name":"proposalThreshold_","type":"uint256","internalType":"uint256"}],"stateMutability":"nonpayable"},{"type":"function","name":"BALLOT_TYPEHASH","inputs":[],"outputs":[{"name":"","type":"bytes32","internalType":"bytes32"}],"stateMutability":"view"},{"type":"function","name":"DOMAIN_TYPEHASH","inputs":[],"outputs":[{"name":"","type":"bytes32","internalType":"bytes32"}],"stateMutability":"view"},{"type":"function","name":"MAX_PROPOSAL_THRESHOLD","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"MAX_VOTING_DELAY","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"MAX_VOTING_PERIOD","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"MIN_PROPOSAL_THRESHOLD","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"MIN_VOTING_DELAY","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"MIN_VOTING_PERIOD","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"_acceptAdmin","inputs":[],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"_initiate","inputs":[{"name":"governorAlpha","type":"address","internalType":"address"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"_setPendingAdmin","inputs":[{"name":"newPendingAdmin","type":"address","internalType":"address"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"_setProposalThreshold","inputs":[{"name":"newProposalThreshold","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"_setVotingDelay","inputs":[{"name":"newVotingDelay","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"_setVotingPeriod","inputs":[{"name":"newVotingPeriod","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"_setWhitelistAccountExpiration","inputs":[{"name":"account","type":"address","internalType":"address"},{"name":"expiration","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"_setWhitelistGuardian","inputs":[{"name":"account","type":"address","internalType":"address"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"active","inputs":[{"name":"","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"view"},{"type":"function","name":"admin","inputs":[],"outputs":[{"name":"","type":"address","internalType":"address"}],"stateMutability":"view"},{"type":"function","name":"castVote","inputs":[{"name":"proposalId","type":"uint256","internalType":"uint256"},{"name":"support","type":"uint8","internalType":"uint8"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"castVoteBySig","inputs":[{"name":"proposalId","type":"uint256","internalType":"uint256"},{"name":"support","type":"uint8","internalType":"uint8"},{"name":"v","type":"uint8","internalType":"uint8"},{"name":"r","type":"bytes32","internalType":"bytes32"},{"name":"s","type":"bytes32","internalType":"bytes32"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"castVoteWithReason","inputs":[{"name":"proposalId","type":"uint256","internalType":"uint256"},{"name":"support","type":"uint8","internalType":"uint8"},{"name":"reason","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"comp","inputs":[],"outputs":[{"name":"","type":"address","internalType":"contract CompInterface"}],"stateMutability":"view"},{"type":"function","name":"decrypt_tally","inputs":[{"name":"proposalID","type":"uint256","internalType":"uint256"},{"name":"decryptedVotes","type":"bytes32[3]","internalType":"bytes32[3]"},{"name":"proof","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"delegate","inputs":[{"name":"ct_new","type":"bytes32[80]","internalType":"bytes32[80]"},{"name":"rand_states","type":"bytes32[20]","internalType":"bytes32[20]"},{"name":"delegates","type":"bytes32[20]","internalType":"bytes32[20]"},{"name":"vote_root","type":"bytes32","internalType":"bytes32"},{"name":"votes_hashpath","type":"bytes32[20]","internalType":"bytes32[20]"},{"name":"vote_idx","type":"bytes32","internalType":"bytes32"},{"name":"ct_old","type":"bytes32[80]","internalType":"bytes32[80]"},{"name":"ct_sum","type":"bytes32[80]","internalType":"bytes32[80]"},{"name":"proof","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"election_setup","inputs":[{"name":"targets","type":"address[]","internalType":"address[]"},{"name":"values","type":"uint256[]","internalType":"uint256[]"},{"name":"signatures","type":"string[]","internalType":"string[]"},{"name":"calldatas","type":"string[]","internalType":"string[]"},{"name":"title","type":"string","internalType":"string"},{"name":"description","type":"string","internalType":"string"},{"name":"ct0","type":"bytes32[4]","internalType":"bytes32[4]"},{"name":"voting_delay","type":"uint256","internalType":"uint256"},{"name":"voting_period","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"nonpayable"},{"type":"function","name":"election_start","inputs":[{"name":"proposalID","type":"uint256","internalType":"uint256"},{"name":"votingRootSnapshot","type":"bytes32","internalType":"bytes32"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"exec","inputs":[{"name":"proposalId","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"payable"},{"type":"function","name":"fromHex","inputs":[{"name":"s","type":"string","internalType":"string"}],"outputs":[{"name":"","type":"bytes","internalType":"bytes"}],"stateMutability":"pure"},{"type":"function","name":"fromHexChar","inputs":[{"name":"c","type":"uint8","internalType":"uint8"}],"outputs":[{"name":"","type":"uint8","internalType":"uint8"}],"stateMutability":"pure"},{"type":"function","name":"getCiphertext","inputs":[{"name":"addr","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bytes32","internalType":"bytes32"},{"name":"","type":"bytes32","internalType":"bytes32"},{"name":"","type":"bytes32","internalType":"bytes32"},{"name":"","type":"bytes32","internalType":"bytes32"}],"stateMutability":"view"},{"type":"function","name":"getLd","inputs":[],"outputs":[{"name":"","type":"bytes32[4][]","internalType":"bytes32[4][]"}],"stateMutability":"view"},{"type":"function","name":"getReceipt","inputs":[{"name":"proposalId","type":"uint256","internalType":"uint256"},{"name":"voter","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"tuple","internalType":"struct GovernorBravoDelegateStorageV1.Receipt","components":[{"name":"hasVoted","type":"bool","internalType":"bool"},{"name":"support","type":"uint8","internalType":"uint8"},{"name":"votes","type":"uint96","internalType":"uint96"}]}],"stateMutability":"view"},{"type":"function","name":"get_proposal_votes","inputs":[{"name":"votes","type":"uint256","internalType":"uint256"},{"name":"proposalID","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"","type":"bytes32[4]","internalType":"bytes32[4]"}],"stateMutability":"view"},{"type":"function","name":"get_proposal_votes_all","inputs":[{"name":"proposalID","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"","type":"bytes32[4]","internalType":"bytes32[4]"},{"name":"","type":"bytes32[4]","internalType":"bytes32[4]"},{"name":"","type":"bytes32[4]","internalType":"bytes32[4]"}],"stateMutability":"view"},{"type":"function","name":"implementation","inputs":[],"outputs":[{"name":"","type":"address","internalType":"address"}],"stateMutability":"view"},{"type":"function","name":"initialProposalId","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"initialize_private","inputs":[{"name":"pk_enc_x","type":"bytes32","internalType":"bytes32"},{"name":"pk_enc_y","type":"bytes32","internalType":"bytes32"},{"name":"r_t_","type":"bytes32","internalType":"bytes32"},{"name":"signature_","type":"string","internalType":"string"},{"name":"pk_sig_","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"isWhitelisted","inputs":[{"name":"account","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"view"},{"type":"function","name":"is_active","inputs":[{"name":"user","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bool","internalType":"bool"}],"stateMutability":"view"},{"type":"function","name":"l_d_index","inputs":[{"name":"","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"l_did","inputs":[{"name":"","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"bytes32","internalType":"bytes32"}],"stateMutability":"view"},{"type":"function","name":"latestProposalIds","inputs":[{"name":"","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"name","inputs":[],"outputs":[{"name":"","type":"string","internalType":"string"}],"stateMutability":"view"},{"type":"function","name":"pendingAdmin","inputs":[],"outputs":[{"name":"","type":"address","internalType":"address"}],"stateMutability":"view"},{"type":"function","name":"postTally","inputs":[{"name":"proposalId","type":"uint256","internalType":"uint256"},{"name":"forVotes","type":"uint256","internalType":"uint256"},{"name":"againstVotes","type":"uint256","internalType":"uint256"},{"name":"abstainVotes","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"proposalCount","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"proposalMaxOperations","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"proposalThreshold","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"proposals","inputs":[{"name":"","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"id","type":"uint256","internalType":"uint256"},{"name":"proposer","type":"address","internalType":"address"},{"name":"eta","type":"uint256","internalType":"uint256"},{"name":"startBlock","type":"uint256","internalType":"uint256"},{"name":"endBlock","type":"uint256","internalType":"uint256"},{"name":"canceled","type":"bool","internalType":"bool"},{"name":"executed","type":"bool","internalType":"bool"},{"name":"initialized","type":"bool","internalType":"bool"},{"name":"decrypted","type":"bool","internalType":"bool"},{"name":"successful","type":"bool","internalType":"bool"},{"name":"queued","type":"bool","internalType":"bool"},{"name":"snapshot","type":"bytes32","internalType":"bytes32"}],"stateMutability":"view"},{"type":"function","name":"quorumVotes","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"registerDelegate","inputs":[{"name":"balance","type":"bytes32","internalType":"bytes32"},{"name":"cex","type":"bytes32","internalType":"bytes32"},{"name":"cey","type":"bytes32","internalType":"bytes32"},{"name":"cvx","type":"bytes32","internalType":"bytes32"},{"name":"cvy","type":"bytes32","internalType":"bytes32"},{"name":"proof","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"state","inputs":[{"name":"proposalId","type":"uint256","internalType":"uint256"}],"outputs":[{"name":"","type":"uint8","internalType":"enum GovernorBravoDelegateStorageV1.ProposalState"}],"stateMutability":"view"},{"type":"function","name":"timelock","inputs":[],"outputs":[{"name":"","type":"address","internalType":"contract TimelockInterface"}],"stateMutability":"view"},{"type":"function","name":"undelegate","inputs":[{"name":"ct_new","type":"bytes32[80]","internalType":"bytes32[80]"},{"name":"ct_old","type":"bytes32[80]","internalType":"bytes32[80]"},{"name":"ct_sum","type":"bytes32[80]","internalType":"bytes32[80]"},{"name":"proof","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"unregisterDelegate","inputs":[{"name":"balance","type":"bytes32","internalType":"bytes32"},{"name":"old_cex","type":"bytes32","internalType":"bytes32"},{"name":"old_cey","type":"bytes32","internalType":"bytes32"},{"name":"old_cvx","type":"bytes32","internalType":"bytes32"},{"name":"old_cvy","type":"bytes32","internalType":"bytes32"},{"name":"new_cex","type":"bytes32","internalType":"bytes32"},{"name":"new_cey","type":"bytes32","internalType":"bytes32"},{"name":"new_cvx","type":"bytes32","internalType":"bytes32"},{"name":"new_cvy","type":"bytes32","internalType":"bytes32"},{"name":"proof","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"vote","inputs":[{"name":"proposalID","type":"uint256","internalType":"uint256"},{"name":"support","type":"uint8","internalType":"uint8"},{"name":"message","type":"string","internalType":"string"},{"name":"rAdd","type":"bytes32[12]","internalType":"bytes32[12]"},{"name":"root","type":"bytes32","internalType":"bytes32"},{"name":"path","type":"bytes32[20]","internalType":"bytes32[20]"},{"name":"merkleIndex","type":"bytes32","internalType":"bytes32"},{"name":"proof","type":"string","internalType":"string"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"votingDelay","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"votingPeriod","inputs":[],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"whitelistAccountExpirations","inputs":[{"name":"","type":"address","internalType":"address"}],"outputs":[{"name":"","type":"uint256","internalType":"uint256"}],"stateMutability":"view"},{"type":"function","name":"whitelistGuardian","inputs":[],"outputs":[{"name":"","type":"address","internalType":"address"}],"stateMutability":"view"},{"type":"event","name":"DecryptTally","inputs":[{"name":"proposalId","type":"uint256","indexed":true,"internalType":"uint256"},{"name":"forVote","type":"bytes32","indexed":false,"internalType":"bytes32"},{"name":"againstVote","type":"bytes32","indexed":false,"internalType":"bytes32"},{"name":"abstainVote","type":"bytes32","indexed":false,"internalType":"bytes32"}],"anonymous":false},{"type":"event","name":"Delegated","inputs":[{"name":"sender","type":"address","indexed":true,"internalType":"address"},{"name":"ldid_hash","type":"bytes32","indexed":true,"internalType":"bytes32"},{"name":"lock_of_sender","type":"bool","indexed":false,"internalType":"bool"}],"anonymous":false},{"type":"event","name":"ElectionSetup","inputs":[{"name":"id","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"proposer","type":"address","indexed":false,"internalType":"address"},{"name":"startBlock","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"endBlock","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"description","type":"string","indexed":false,"internalType":"string"},{"name":"title","type":"string","indexed":false,"internalType":"string"}],"anonymous":false},{"type":"event","name":"ElectionStart","inputs":[{"name":"id","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"proposer","type":"address","indexed":false,"internalType":"address"},{"name":"reid","type":"bytes32","indexed":false,"internalType":"bytes32"}],"anonymous":false},{"type":"event","name":"InitializePrivate","inputs":[{"name":"pk_enc_x","type":"bytes32","indexed":true,"internalType":"bytes32"},{"name":"pk_enc_y","type":"bytes32","indexed":true,"internalType":"bytes32"},{"name":"r_t_","type":"bytes32","indexed":true,"internalType":"bytes32"},{"name":"signature_","type":"string","indexed":false,"internalType":"string"},{"name":"pk_sig_","type":"string","indexed":false,"internalType":"string"}],"anonymous":false},{"type":"event","name":"NewAdmin","inputs":[{"name":"oldAdmin","type":"address","indexed":false,"internalType":"address"},{"name":"newAdmin","type":"address","indexed":false,"internalType":"address"}],"anonymous":false},{"type":"event","name":"NewImplementation","inputs":[{"name":"oldImplementation","type":"address","indexed":false,"internalType":"address"},{"name":"newImplementation","type":"address","indexed":false,"internalType":"address"}],"anonymous":false},{"type":"event","name":"NewPendingAdmin","inputs":[{"name":"oldPendingAdmin","type":"address","indexed":false,"internalType":"address"},{"name":"newPendingAdmin","type":"address","indexed":false,"internalType":"address"}],"anonymous":false},{"type":"event","name":"PostTally","inputs":[{"name":"proposalId","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"forVotes","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"againstVotes","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"abstainVotes","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"ProposalCanceled","inputs":[{"name":"id","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"ProposalCreated","inputs":[{"name":"id","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"proposer","type":"address","indexed":false,"internalType":"address"},{"name":"targets","type":"address[]","indexed":false,"internalType":"address[]"},{"name":"values","type":"uint256[]","indexed":false,"internalType":"uint256[]"},{"name":"signatures","type":"string[]","indexed":false,"internalType":"string[]"},{"name":"calldatas","type":"bytes[]","indexed":false,"internalType":"bytes[]"},{"name":"startBlock","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"endBlock","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"description","type":"string","indexed":false,"internalType":"string"}],"anonymous":false},{"type":"event","name":"ProposalExecuted","inputs":[{"name":"id","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"ProposalQueued","inputs":[{"name":"id","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"eta","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"ProposalThresholdSet","inputs":[{"name":"oldProposalThreshold","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"newProposalThreshold","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"RegisterDelegate","inputs":[{"name":"sender","type":"address","indexed":true,"internalType":"address"},{"name":"sender_index","type":"uint256","indexed":true,"internalType":"uint256"},{"name":"lock_of_sender","type":"bool","indexed":false,"internalType":"bool"},{"name":"active_of_sender","type":"bool","indexed":false,"internalType":"bool"},{"name":"delegate_bal","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"Undelegated","inputs":[{"name":"sender","type":"address","indexed":true,"internalType":"address"},{"name":"ldid_hash","type":"bytes32","indexed":true,"internalType":"bytes32"},{"name":"lock_of_sender","type":"bool","indexed":false,"internalType":"bool"}],"anonymous":false},{"type":"event","name":"UnregisterDelegate","inputs":[{"name":"sender","type":"address","indexed":true,"internalType":"address"},{"name":"lock_of_sender","type":"bool","indexed":false,"internalType":"bool"},{"name":"active_of_sender","type":"bool","indexed":false,"internalType":"bool"},{"name":"delegate_bal","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"sender_index","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"Vote","inputs":[{"name":"proposalId","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"proposer","type":"address","indexed":false,"internalType":"address"},{"name":"support","type":"uint8","indexed":false,"internalType":"uint8"},{"name":"message","type":"string","indexed":false,"internalType":"string"},{"name":"resVote","type":"bytes32[4]","indexed":false,"internalType":"bytes32[4]"}],"anonymous":false},{"type":"event","name":"VoteCast","inputs":[{"name":"voter","type":"address","indexed":true,"internalType":"address"},{"name":"proposalId","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"support","type":"uint8","indexed":false,"internalType":"uint8"},{"name":"votes","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"reason","type":"string","indexed":false,"internalType":"string"}],"anonymous":false},{"type":"event","name":"VotingDelaySet","inputs":[{"name":"oldVotingDelay","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"newVotingDelay","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"VotingPeriodSet","inputs":[{"name":"oldVotingPeriod","type":"uint256","indexed":false,"internalType":"uint256"},{"name":"newVotingPeriod","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"WhitelistAccountExpirationSet","inputs":[{"name":"account","type":"address","indexed":false,"internalType":"address"},{"name":"expiration","type":"uint256","indexed":false,"internalType":"uint256"}],"anonymous":false},{"type":"event","name":"WhitelistGuardianSet","inputs":[{"name":"oldGuardian","type":"address","indexed":false,"internalType":"address"},{"name":"newGuardian","type":"address","indexed":false,"internalType":"address"}],"anonymous":false}];
