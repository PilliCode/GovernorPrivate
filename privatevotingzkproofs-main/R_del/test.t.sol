pragma solidity >=0.8.4;

import "forge-std/Test.sol";
import {UltraVerifier} from './contract/R_del/plonk_vk.sol';

contract testContract is Test {

    UltraVerifier verifier;
    bytes proofBytes;

    function setUp() public {
        verifier = new UltraVerifier();
        //voteContract = new zkVote(merkleRoot, address(verifier));
        //voteContract.propose("First proposal", block.timestamp + 10000000);
        
        string memory proof = vm.readLine("./proofs/R_del.proof");
        proofBytes = vm.parseBytes(proof);
    }

    function testVerify() public {
        bytes32[] memory inputs = new bytes32[](14);
        inputs[0] = bytes32(0x19b8f42eb7972db62918635a2a6c105916462671b8d0dca90d01e3950e9b3ba5);    // pk enc x
        inputs[1] = bytes32(0x04ce77f6bda60390fb4e95b4ef9e71fdef939c49ea9cf760c0a0646f9f4dc9bc);    // pk enc y

        // cts
        inputs[2] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        inputs[3] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000001);
        inputs[4] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        inputs[5] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000001);
        inputs[6] = bytes32(0x2ca95375566f8a3cd867e7a1c68db053ad5bad4515b8d0f15e34d0a652e5ab22);
        inputs[7] = bytes32(0x27df61b0fab16887e5d3a1e1545b27c7bde0a861bce609fe8350358b43386168);
        inputs[8] = bytes32(0x162d7e417903fa1c82f2d227e35b846b1133cfca4f558b5feb9fdcd5f81dd902);
        inputs[9] = bytes32(0x01666cafbf0a30da8b9ebeaf848a1da067a892296f1043188e1705402b6d6853);

        // random states
        inputs[10] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        inputs[11] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000002);

        // delegate addrs
        inputs[12] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        inputs[13] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000002);

        require(verifier.verify(proofBytes, inputs), "Proof is not valid");
    }
}