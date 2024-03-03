// Verification Key Hash: fd804a482c7fbac3c2109023fc23fc7785ad8c13f177e3ae32eb0604798651f0
// SPDX-License-Identifier: Apache-2.0
// Copyright 2022 Aztec
pragma solidity >=0.8.4;

library UltraVerificationKey {

    function verificationKeyHashEnc() internal pure returns(bytes32) {
       return 0x0965cc1a70f8b0d99b6d4933c5fdf9e4ddf209910793f6dc2a2d2caf2f0b9434;
    }

    function verificationKeyHashDel() internal pure returns(bytes32) {
        return 0xf661f10a02a46bd566585e0fe9fad36fdd4dd3fe6486fc4318ca462bde049933;
    }

    function verificationKeyHashEncSub() internal pure returns(bytes32) {
        return 0xd3827a634416580403deb305dba4735a321db3a2addb2a2639a4c1388f074db6;
    }

    function verificationKeyHashAdd() internal pure returns(bytes32) {
        return 0xadd83e8b43220b9a27318831369346f94099bd877a6c4d1f97bdeebf08ac98f3;
    }

    function verificationKeyHashVote() internal pure returns(bytes32) {
        return 0x83c43649c6d52531bab91160778948cc4679cee3a45ea93bfc513776801e2159;
    }

    function verificationKeyHashDecPercent() internal pure returns(bytes32) {
        return 0xfe32a2a0735be3695189063bca11bda34612498dbeef300329d2779b8b70b975;
    }

    function verificationKeyHashVecSub() internal pure returns(bytes32) {
        return 0xa88c2874e3d2898f66c97f30f093ad46d9528b2fc67053f8e0c3bfdc114c6aff;
    }

    function verificationKeyHashDel5() internal pure returns(bytes32) {
        return 0x5214dbd5dfc3aeeb1dfbd7d554f69788aad5f5301103dd7cc78705239cb0a59a;
    }

    function verificationKeyHashDel10() internal pure returns(bytes32) {
        return 0xc1aa592abd01596e23127c6587f61f08e583db51f95f3cd2d930c0ca7bcefc85;
    }


    function loadVerificationKeyEnc(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000008000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000008) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x2d1ba66f5941dc91017171fa69ec2bd0022a2a2d4115a009a93458fd4e26ecfb) // vk.work_root
            mstore(add(_vk, 0x60), 0x3063edaa444bddc677fcd515f614555a777997e0a9287d1e62bf6dd004d82001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x1f3f9ddc538ddbf4c033ffd8b7cc0967b43882016c70fc1fd8e07d006dfaa773) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x2f59e4ac28afeb6711cb713758c637a0b5bbc19e29e89db7251fa45819d492f8) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x1c046fdb722a8c8f29fdba55addf8cddeeb3275e14b5431c52f8fff1d75600b2) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x203c6906338f40b615df2c9d08d5bf931c41f731b53148cae03811efd4cd32d2) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x1303504e76e0a0941ba6768f398f0111f41c337d91def9bfb6ec1f3d0c732deb) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x0619feb7f05a4c71b402b82c95868d36d3b0877932473ad8f388b5c994706c2b) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x2a1a4064bc6ef924bed1e22784c9d45441b37b332af09988d2f7be7c008be355) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x29b121efdfb14341241f24629e5f0940311477193ffd0718d7fbf983920862f0) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x01318697ea52e73987f11e3c569406e20491bbb800438cda4ed121a3c1e4e9b2) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x071a8569a6670c4cf76b1b22423e51c57e6a2292930f6ea3d8505d5ac533830f) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x25a8418d50153aa05dc4f335d79cf2bea0dfb28ab6bcda9c7fd449997a24f17d) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x01efee74f656dfea15d9d26f4403f086783fd66f5b4ff20ab49f4461bf531cb5) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x22e33fb94a1749fd2fbdbe04e53832fa18a0c1fd840b7a9ff98f937dd27fd8c3) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x177352e673d2aa6446a53268ed15773fd71ae0e8d53bcaeae490eec222a6023b) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x17de1ad04387d41136801f4a1b8ed7ac6147858366cce063f6820f5229cc10ca) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x2af0a108ed7faa4f4e968b871de1d39983518b22bcd43ff0c98bf36892763dd9) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x21959276775cd4749236c8bf773a9b2403cecb45fbf70e6439f73d75442e8850) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x017714509f01d1a9ee7ebaf4d50745e33a14150b4fe9850a27e44de56d88cb14) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x2e76c4474fcb457db84fb273ccc10a4647a1a37444369f2f275bb74540f5e2d0) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x209035caddd02a78acd0ed617a85d782533bd142c6cad8e3338f3142b919c3a4) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x2f17bba618b20354a4df2744ae60e4e7cfaa1f3bd6e5eead89a003c7be52c067) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x268a6f4f98d087d3ccc9bc6bedeebcd3666bab09e0d22e2b7c0ed1fcc1eed92f) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x24aa338dcb6b186ce017452afe11b61f9e3ae645ad54a71fe3f9d0d294fbb02a) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x07fbaa24db3121e93f3df7dab757771b941b0536064ff88a34cd722fe7c771ec) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x11f48352f4036bce6280e57447b4787d1cb0e07a6034aafbc19c94453511b845) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x0c45add3fd75a480e7f11eb4278780cc25caccbebb5cba3efb80db617812f7e5) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x0f06b5e20a9382b55bfbabf70e89b138bee0c8b35d3a1447f72d51edab6b9d7e) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x1c14301b4ec63228b63879be1d834ecad7c068fbffc7086eb5a8b9351051bc0e) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x0c14de0a66a29fef89dd6b25fd3dad2c934048825338d32c9be06295d6895cd3) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x27e139fd5f94a95aed910fc16c4497e04e258a714b90ff5b7cb6a25af764b552) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x2d283760e83465149e358f2910d2515f4df4e281eb18f1ef89f9ad7e72bbf9bf) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x1e7bc1bdd03c522b54abfc3879fea26bcda8b544a524e1ca08ef3d5c5f615c06) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x26ac63c1f22adb0e7f8bbcb49f009546c50d24b1247a743a505416bd4bf12e27) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x1542e08ee844541bb7f00b5d7e456b1454a0f66a8793e87ee99a04b4686631b1) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x2c5519e9f4218e2873b91dacf2c455670a5bbbd72ce413230f8b88aea0b1cda8) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x207960ab6d379cbcdd1ec8b7d562f474d2df14bcf4faa4346a82d4dcbba683dd) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x254c7c79f29e6f05184889d52a7c01375832d53ea8dd60b93162a5805d715657) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x23558713233600d8847c983db3c2771210aad83fc39e33f4821c4b483fe579c1) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x0706e29711a30848299262823fcda696c0628e2344c1873df3152bf2d1e653b1) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x053f5878c8aae8f43baa0d783a6a11da490ba56b9c37fe98c9f27b02c6660614) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x18632667b32553a50fe32c70575bfdd284c248cbced691cb386e0470ce61f2c3) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x1cf95522b33973c7aa8b704535d54b9e47c356c79c6a30e3934d73e1ae1514cd) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x2d98b7bdf9030175f410c44df10bb43c7be1d03313846afedc75617f1992f2d8) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x1b534e8c8dc40aaeba533860f48f1ff1f5218d07459905279c63d684e841f9ce) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x05d33766e4590b3722701b6f2fa43d0dc3f028424d384e68c92a742fb2dbc0b4) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyDel(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000080000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000130) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x2260e724844bca5251829353968e4915305258418357473a5c1d597f613f6cbd) // vk.work_root
            mstore(add(_vk, 0x60), 0x3064486657634403844b0eac78ca882cfd284341fcb0615a15cfcd17b14d8201) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x2c6685248b7a1f5eaa2bc0ae57450ff8f1cd9ea15a3590d0990febc33ad085ae) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x0d7f0bcbaee88426391da88d633d3eff21f7e7956c972dffa8df2eabb12cef78) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x1a56eb7f2609ad7d5d3a105fa4aa8ff5b93d75d0aeb0b531b39a63e11520cc27) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x20fb33f1de27833d11b82a76ff832392ec11f47c445b3211e9ba9e070ef07272) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x1d9064b80aeffdabc6598c57e68f340448f603baa830a824016bf6733f17a020) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x21915d92b520f838642da95d0c026adedf08b30ce2c3b59ec69c9451150e8b7c) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x0982fbf779d405b37c5c3ff61d938388fd26b1d4a9b30399deba97acc0fe8065) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x17acf6728bc954c3ea853da13fa99993c608b392f65c6428fa5ca949eb3469e2) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x08f66e1d74798dc7d5788af26c5168ef695fba3bac05e911bcddc1969d4df377) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x233750a5d955d4f936ad6ba65867e468144fb98480e9153bef19b104ca56afc7) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x1a8b7b8f702c53073662d0d43bb5a8de6df1f8127755ebe8d6ddd6f868c078f8) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x2042eeb5fb1742be51bfbf098cce241b3790c9e42170dd9da651bafffe9981a2) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x10bcf9046d598b313fdd66a248bdf4e03153f62c07a9b55ea47ec55941910f61) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x048b5a7d7ea06363d2d73486f9ef8b2123cb6c89a4329e30bdecdaecae219732) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x1b8766f07bb622a4c9267404ad44647aedb08462dc7a4e21315ed235ff81d92c) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x1e9dfd842a09db8ae0e5fa0ab6a171269ab4c67f59426eb529ff683b8514a4c4) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x0346eb76deee9a3ae7b350f402a778b1d6d269fccd2036db0ec5fe39439b1e9a) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x12b9c69aa4d51eb3920484e5f218388542023c239f7cb66db4175af241497622) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x1a78811645b84bbd89672882483e957625cf3aec430bbb2096c060a3b45fe470) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x1e083a3d76abacbf139701a1d2fc905090056fde016569cfb325b37e997c6845) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x1d22cf039bd009baccd63656c5f64dada51582744f4c14656a0b0fc6e2c2c932) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x06bce0ecf34e3c6867146754d9895419d25f5d6cc8078f59aa0ca80af890d099) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x2343f40e6a0cf56d41858be594d6f2b9c58ab2909f491a3f81eb6ea8c995a4a6) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x1806c0e4de863ae965e741f95ce231e26e05b1d2782276b31c3eda05de57cb83) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x099c343786345ee22c710af9544ffe631ea5b835759ba2df3e22be0bd01d49e3) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x1d775bcd9df1b128c1cf332d27ecbcdfc9a4207d5303ad622c4b4a165427ec26) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x04335f7d01e3b9f68489861c3e6c97c6e7b433f327242f5dc2d4a089f2dcc018) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x2cf6e02fc1fe82bd4dcc86fd472154cc0d5cfe6f2ce41977c6c316af522b4d34) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x2711b7375e2546141ab13ad0f74188540f350fc88fbde536885c9b38ce6f5d35) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x0ac6469d0af0041582be60f35f6ff3a98bfaaf760544256ac851482d2e58acca) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x2874300094cb0d4fdef7e486326d1138892d802c87c663aa1bde8dc3cf5bb169) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x093666b9fcfac4a86f7f0b73d3722aa5bb18a731dcc33124b4b310d0c10af95e) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x166a6b8cc0a396db510b10dadfb768df7823882fa46cdc86e907db0b83c87206) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x208190016ccbce24c09556329ca349c180a442158cbe58abd483fd0b1e013f91) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x054a8c6e1442f31e9520dd0645d1c7331e6b322e9e15304e5d97299b568174af) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x0884f57f4a72c77ae7d75c4e59a04d8bc98644a5fdaf367c0c4f89026c56ad22) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x16490fa24a57060ddf7b1fac4e9725d6b2c2d48afb7a20e986188b248f31b2ed) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x2183b87b84a44df79a3f6880b6fc9d10d872eb158645065c2937b74bd69f16e9) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x01e5feaaae36dcd24c9c144cb6d41ae216ad8e833818be0f5ec14a3bac44890a) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x28a7c924052c397a97ed260fbc5e0867da8a43a5414d45cbb8a619fe814d66b3) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x2a7a3d2263d163e14d8950a8eeabefbca1753c4d9a78d5ef7654bd984fbe71c5) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x021a87c2e52a3ee9f24818f3f000b90d1cd445ef3bb751d52be2c25d4d88a53a) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x2190141fd07edb806371eeb761d8a4683d329ed1636d614f8a7b2e6dbd731203) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x1cfd20eac3ee55fc8fcc13e0fddf8fff2d6b5267573bb4fdf7f35206797d498f) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x06e402c0a314fb67a15cf806664ae1b722dbc0efe66e6c81d98f9924ca535321) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyEncSub(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000000800) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000009) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x027a358499c5042bb4027fd7a5355d71b8c12c177494f0cad00a58f9769a2ee2) // vk.work_root
            mstore(add(_vk, 0x60), 0x305e41e912d579f5b3193badcab128321c8ee1cb70aa396331b979553d820001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x29e38cb69ad6d70d3e65cc661e2a4f241a3fd7300b4001dd44d7fbdd2024e038) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x0e820b36108a2c8c69c09165092e50ab97b33c31fa4f30302fced010127d78df) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x239aecf6150a6bd26a752900a352a8c35d227f8f1c173d9ea7b51115a6146b75) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x141b153c077a52c816f34037e45c06d51ab12a6f518b6d168b753f7a84a33f14) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x1808685cb7eb3e1d1c051de3e710c16fe98ce411740fce7ed2b3988c41aafe68) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x154da4749995433619dbc3d1d04aabe9914ceea0efba28fe398699eb37e0d7a1) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x094ecec2cc345cfbb94d9742c01871265fe55ae2a4c50ca3f45fc97464e3d526) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x21e26cf685653dfdaa2cc47d5f5a7cd1ca8d18512e4576218b314972835344e9) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x04aee58c3ead80b93e1f452eaf1fa052cb5596776a545a2ba932f2a324cbada2) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x19f20ba6494cddc8946d445258e6efbe8ad5c09a4fefb64dd5c2ace449e3dd39) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x1229fe5fdb6f8eb34cdf695977dce1862afcd72a7a7432cb5ba4c57b93d73b4f) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x19c1ec36aaed223e1642f9a30be756fca0b83f3aa6f9995e4719b9b26ba2a765) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x2bd507f300664103016e42c198858fb557add613750dcdd96a51857a32a92009) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x210f7a5c8f537d9448f82aa235ca5f0758ae68689dd46fd77f715c2434e8d95f) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x212cbe7bff2a75e5891302b32859684b8b18b7ff444d6bc8983a3bb9f3056a8c) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x11a3b3686168e3cefbb1c9c86ce1da04e18050063b128f0a34b0e4ca79f0371d) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x267302f63d129c05fe1ddc1449ce3483d5ff1b943384a3173a40e7395310f526) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x09e8592d07b97663aaf2956e5ee136274e9ce0118f09deb4daab83fad76e78f3) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x01aeeaa2478912af12266b5910ceb966d73be7a982cf4a35e94e64921eedf7e5) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2f612b9bb2a6c45fa28795f7849e8dbd7e24dca8350195f14c4e609201be4889) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x2689aed6fa3df3604422879d89609d000ea4fc9e4c73059c17698c436ab61bb0) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x239966ec5724ad8abd1d36f062610d4dbae0f7a6a6d60008016df6533bf730f2) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x2a1b6da2da6fa4bfc50785a7b1a88e1552d0eb6ee486b4023cb272787a13389c) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x2fc05f604af8375075a614c79f1576fdc3f2154b0a2def5b7c24f04605eab342) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x038dda10a55ddcb030397b4809480347ac1f7f33d9214d3090f28bac536e726d) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x0f07e8f22201319f89ebd350373c3683d46a84ffdead1fcf478a833a6919dc1c) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x2c2409803078e4c020a036e48709e562e6b10f27e9500a941abbed1132381b23) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x11101eb4876958c482670294f545147225ef7bc492d29f35e6ba551dfcd958ab) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x2fe1f6f64807de2f149bb5cc089d144ac28834fef221acbebd02c257a07ac2b3) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x1cb0bf797f59e7289aa96c3e82b29cafe2c7787b19d913dcb65f1713cf6cbb24) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x2c4bdf3bce5f0b79f75af077bf476231433c221814c04ff8cbc7b20773c12e32) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x30584447e0e01072e13afcded59a4017ca595f08af84ea5d513c0697912ea423) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x0f17bb4aee244c33e33b58fdcc19b0e3aab885e02711b4429464fd5ac88a4c0c) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x1e74927e1c8b08244da4b135d9896f4087081c0d7b8578b0298857e0b8ed3752) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x27dc8a579d7f7dd4f0e9c6b795ce733fbaa3a4f24401935fd4fd9c9c37c4950a) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x2d9b73e412e7f5be39bc1bfd988994edd79c4ad33db96df3587e15a3d4dac7a8) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x0721a91cb8da4b917e054f72147e1760cfe0ef3d45090ac0f4961d84ec199696) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x1a25e787b26bd8b50b1a99450f77a424a83513c2b33af268cd253b0587ff50c7) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x22d6d608ec024d5da666e4a1d7e160e4a31138d14cb94cda25b3d2a3e0b00ae9) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x1f22d84b5897b363d1e8d087cd451630f12833219e478399a96d5e77025eda84) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x276843f284e02dda8828f354dd4018059e6629fd190749c0cc3db788df286214) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x2b7c64dbf6ea977ca3b70e48e1351a873fd8be1a2dc86d7e1bf18c1977f89c38) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x25fe08fea77a5af0ccf233ba9ebb458095e269a58fa6b38242ea7fa813678b87) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x2598a9a7862ddbc92922076b39057f5f7e9a3393b9b0175d4df5a9fe899da7d3) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x0fa9bb21bc73d07b3bb6dcd7fddabf54fd7efed80adc442020a3a65d579d71ae) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyAdd(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000010000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000022) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x00eeb2cb5981ed45649abebde081dcff16c8601de4347e7dd1628ba2daac43b7) // vk.work_root
            mstore(add(_vk, 0x60), 0x30641e0e92bebef818268d663bcad6dbcfd6c0149170f6d7d350b1b1fa6c1001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x0f47fa432ea77996a0479c3037daf7614bf6e3684e93529449f21ef98fbada4b) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x21c165703062cccd96b8b2b8cdeb102449ba2795f0eb0c14f5258e2fdb1de445) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x04847f35f833800885674b5027efee16d5d2c9123184e3077c9613603868afc2) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x04f247a76ee732dae94668dd16c0dcbcbdd75ce1c109d443315a3e52e6247357) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x171297487942069bc2314f1eea50632b0b13d68c267862e1eeed481288893105) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x08c7b8f362d36f50c237ba782133af9a682f30c3b7ff87d09ba792cdbcb5ed37) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x0e69dcb6f2298a72c0a6ac79ba4722d5626a0492ae3c016fad8de3cce04094e6) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x12c431268489ee0bc8f51b5478ce9d127faa44a7839f63f2a65eb60e70134770) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x060ce978c7a0e5c8f21341cf22c1110053511ea5b93c93336170e0964cff903b) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x2190938641b8ef51ee1656f902f053afc23094ea32449dff1eae77832c40ce6e) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x11328a2cda20d1ca23131e26c88d9e6a40a51ca21d39f1107030818f73135983) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x2df40da7ca1eaa24506879e84beb91450def0850b490f06b3c433d83c38122d5) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x032678889093759a70d64484cd25740e0aa6c10e6878c44d1e072b201c6a25e8) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x2ef7109c871ae156f9fef0f0a76d4112b92684bc5aa1d8e48dc07b4b5f93fb0e) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x267c51393730a531077816e9cbc47afa4982ea9ea26f94189561b739cc8a69e7) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x0ac3598a83a1b747f29b3eccd46ed7208c8abd8a58e32757a7e09434d24a692b) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x21245d6c0a4d2ff12b21a825f39f30e8f8cf9b259448d111183e975828539576) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x16a409532c8a1693536e93b6ce9920bfc2e6796e8dfe404675a0cdf6ee77ee7a) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x2f213c7a4c064a63d6a07366df0ea85aef9ad2125a188c3e656f95471e416a0a) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x067a270bed55e72ffb3cfa39af3e5b8bcb4961d72bb301978af13c4ddc73e5df) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x1c54b19feca075decde2bae316a370c59a9281be3411d2d5f31a1e27f4aca05c) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x018e1183b3c2d3dce137fd98e33a7eaa47197757993eb60035cc30e6a9db40a8) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x017736b2bbe52ff5415584dd53bba93dc5f27b7062ae709b00e3eee0080c8986) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x3040d71ab13d4373d950a9e46eb72129b5b42d763a3c418b6f7b9dd5ffb53228) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x0d430cf4c2d2a2214eae9c6a52d2001ed0c20179a8769c54b5f8b05eb1fd3e44) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x2e597994dad327470f651b625b298d1e6ab79107820d5d3a0ce78694cec45ab8) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x1d287105c193224210ec4a75f0bf919c4f2a4ac680b74c8a6d0e71b31e4b620c) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x0cd47c1b449ee2d9ce2fd9a44e4115709f845a3ac5dc177ca2b3d9c9806d79c9) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x187e7e35d0116a6672b2670f83bf4f3257d2c5f95ca990943deb07f98e573f87) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x01d2b37054e35124153a8d470749d60e55759ae7aa52dd33c253d7f49f31b768) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x2043ac05206a2f580ed0a148adfaa26ef5516184126c9e67a8741e133af924cc) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x2bf9b2f5f18eac63843fec205836e0e4cf77146523cb2b703ec9fd6f505b2a32) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x01239374280500d61d963adeadc1cfef87ce7f19adb4f4f90c79f63d96468023) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x0290f83ff91799507e620788f5072a71dd03df9c5605f9594bec63d1763724ca) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x089ec02dcc6b3216cf9b4418e0827ad4b07d55d3ffa2b21da0743809bae4c2c8) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x1c522d467e79e574c6bce1ef45cbb9598cc3a99de2de1ce994d0b657450b05b2) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x2546faf6466689ca90de400304774d39e62e214c390b3a8673079fdbddecbd33) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x1d6d3e828b1f70d792d184284184663d315a9e15827e8b76bcb8118293212f18) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x1109fc0fefc148777c02782b673c4d1cea1e1333a8231384dbb4870a8eb34b34) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x3042c8ce4f0f82cb5d19234e3f91eab8cc112fab187c5c163b29a59422d23def) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x183230d2c1a40476a4764a0903a89b67635d3b1252dca052c305557ee1875ea8) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x12a4e7e3b459e636a58e5c586a3b537000ec2d52c35c45e7bfa859d03e9bff6f) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x146f4c2616c985d5252cdc93dc85cec993a3e474c6a791cbdc444300ef85e3cf) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x086903b356b486a9cda9f5d5ed75cf0e193b402d3553f9426fdbb490480196da) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x0b5d56b77fe704e8e92338c0082f37e091126414c830e4c6922d5ac802d842d4) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyVote(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000020000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000028) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x1bf82deba7d74902c3708cc6e70e61f30512eca95655210e276e5858ce8f58e5) // vk.work_root
            mstore(add(_vk, 0x60), 0x30643640b9f82f90e83b698e5ea6179c7c05542e859533b48b9953a2f5360801) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x18d9442da3e67af3783d468ea64999fef4a8d4e7bf98cf31c9969b02efccda86) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x286d02498892b50a2b89dc67f91285d87722b6fbc5a94a4e2d596a3c0def9709) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x1049ed8f63206ef50c0c3f55db5678381d5fbeccfa0361675bd9143565aab5eb) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x22f39c5810c491ab22fdd85e0bd5690789d88efec7bbe29d236a2bb4f457f2fb) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x14fac867239b83fdd573ca198dbd29ec946f4c07e00001cff5f2864670729910) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x0ae8f2384679b26af7acd82b58778b4ffec3bbee118e1ff6760f610369022349) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x0caf9cc3618f0c9593f4c5c5e99a75b208d8d18add91c3175f69f079118c1d08) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x24aa4881d37d4ef0d404caa8f80d058cae6ce61f206bd459b841372089104f58) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x2c424a00dd4b11e6951b1155c4ba03118faec2298998d6fc8c24713421833388) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x2e9447e087e0603280fb3b8cc7ae4b84e612b32b1d49a46249ad061987f352a5) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x0dc77077172edd1844a663fa745a7e78f2fa6fc8de773bdd1c4452fe301252bb) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x042e7a884214be52e5a31293ab769ec81ae52f5cb13ad1af61940d28e31b9bac) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x047d46833940a518fce89efb639f63d51d7cc0e8440ba6847e6be6c5339bcd12) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x1a7e8b8ef7146b9c4be3d9a20a532df40899f6a75a07ce766cf5238ac619802f) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x1ae0f288a9ba7d14d86aa70f8b4d7e66593901604db2bf79aece65307bc5ac01) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x1c621a6018c95880fde480c9426871081472b5a16cbf58ea0a37060c95c49ff6) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x28b955aac4c043cbcfde06eee59b44363f96fe0a6fa93b0b36ef07fbe285d4c7) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x16e1bbb0a7728dcb7696fdf3361b39510c6a4f83cc2159f5fc65ceb2be0599f9) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x1414af76247139fa9e8fef8b393a3e03227ee3a6fedb1e55f5db82cb2352782a) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2c7895a68d2fab5b2bce4d7703daebf9011e63d675bc6898c7f06087d6d83d99) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x1f56234404a65750d447ec51b51f510c0ccf348f7aaf02f9c583e39648aeaf1b) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x055235501995a5d0b3612a5ef6f1a3ec4c077ea367eb3800345b4a3dc7a1182e) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x2c51d75ded7c0becd448e17f5c5904ed9a59dbbb3427d9fc8b1a27baec85640f) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x2009af787f66eceb4595bb704032b17749ad45829625cff0ebb2b68a723652b7) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x2e243c9eb9f64ebfb61e51db86ed094e743b4272dc023a18a2e2fcb5849a73b4) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x0db6e19f6d1d94c4795b530d1e4005575b665c9e0033e75437aaa50d77ab7717) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x2c5a86a144c95c042206aa9d00521646491e88613f1917cf8dcb5990fddd4266) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x1fdf3b48146984da72b758928c886b427dbee3344cc73fea57854372cfc9b591) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x28faa42b5c13a5e9927d13e54a2ed806854cd23c6662b320439aa3168beffe03) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x1e5c18afa66b4c0d19473e0536e64f678c1b094d1b2eff1d7f499dc289efc084) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x10a001251e9f3a9f283ff8f6bd14cba9c706f3c5040ec8ef10ff44988441251c) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x12138fab93fce066ddb2f9be4eff97b0fe128a2a2c079f749b8452698cace8bf) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x133738f359ce2e0f909a0b76a78c602e66e39c41d99f65bfea25f47998283ccd) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x2dd03593caea05125f520c0d02a3bbbdc5519822ba0e0b00984c5a9281143a81) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x09ec9b0aca4e9671903e0577f2a4efd36f7a58af0a5102f5a42e1b8061f62421) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x15affeadf66c8428f4f44d2ebe66e9dc0f04215bef81efbbee166d3f4544feab) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x1fd912d00da77afb70848e4442324157606f77f54ebc05d1a1a5fc2030836b13) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x1b1c85cc22723d352d37c86cfd66d45e809a813b99a452fe452c7ae975de2286) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x2921caa6fb7ec40f99ff673240cceafe47fa004e39fe6acfa130b2a577768a63) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x09610d870de91712a425f520ddc1b4b03e104e6904517471e1d4fda2a08f4642) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x0ac70db2009900c8f7cbf9a55c0c35e1bff2e77044e474a0aabdb9113ec4f698) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x0eb1544fd9401eb9b5222771ac439ac99a3732de44cf0adcfbb0d82e828bc6cd) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x008643bc8309b6075212cc1f337ff054756901c3947890f632c971d3fdb9ec33) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x04ce5187288dede4f3fdcef37068645bcfde9756d8946f6736b8449ab74c523c) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x073bc5885390979e5d836f1692186b4e97f06af392e28bf63cc4f90265c8a8fa) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x2afea4e85f423335ca5b788d5848e569b20f77c3c75b97e3e3ba2d4326eb1fa2) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x244cf010c43ca87237d8b00bf9dd50c4c01c7f086bd4e8c920e75251d96f0d22) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyDecPercent(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000020000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000011) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x1bf82deba7d74902c3708cc6e70e61f30512eca95655210e276e5858ce8f58e5) // vk.work_root
            mstore(add(_vk, 0x60), 0x30643640b9f82f90e83b698e5ea6179c7c05542e859533b48b9953a2f5360801) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x0d577fa0d3dbac286c9b6cbced9e682a2bb3eb7d85308f87e45319a0dee41551) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x2bc090f2324cf613c791ba16fd23f14d14ba52b3d3ab65cfd54b357989819c08) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x2843396376174462714c0cbd5af623aae1eec5a3782b4c496278ad7e1cd5bb6f) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x08249aec3c877514a0c8362b904d699d7ca800e6bb61460c7c1d6c665ccce7b0) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x1a1426e6ffd9e3efb5c86be0ed929ec0c88e4c5c824cec0075c7c766a0f13b57) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x18c3c0049d0b0b2b37578d114724148d326033e60a0de5dd3396bb19832be917) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x06f9baa4696fa5a6f3d5ebaf5cfb94524c04649822e83b9fba030976fec533c4) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x2919a1a20bdb5543c232dccea9a8d21d54aa40c404eb5941fcb1891e2706f891) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x0bef0de27c37fa0f5e761eb4286df92d0dd381fb49e564bc0ad44159cdf6a423) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x17cb93d3d4ed7357f787c82cfd54307424436dec1b03621329bfc76017660985) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x00ed62603ec60eb39acf4295e3aaf9b924412647180d855a7cf0d8cc26c97e0d) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x2db0e124bcd4deaf4b8a45d05068c321cfe6887e0f30dd4367c9c64c7ef81c60) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x092cf5f6c966a28951e2f47200e4de36f5ab4a4c5478257d8d777d92a6a2a1fd) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x2c38057854d61ff79a2dbed8ea0765c6c08cf1826a19cb867af6eaf4871bd25e) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x09cb9211630eb1237e57870bdf07e10e505d804bb06fbe35f4e9108a39158eb7) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x01da397e84a93a29dba7ca0e147cad40d831ab4c99aa7f3d959c83dc3c4d1eb5) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x28b955aac4c043cbcfde06eee59b44363f96fe0a6fa93b0b36ef07fbe285d4c7) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x16e1bbb0a7728dcb7696fdf3361b39510c6a4f83cc2159f5fc65ceb2be0599f9) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x1414af76247139fa9e8fef8b393a3e03227ee3a6fedb1e55f5db82cb2352782a) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2c7895a68d2fab5b2bce4d7703daebf9011e63d675bc6898c7f06087d6d83d99) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x2e88476a1b7f38fcce5548d32ebb72408067a453d9b784bd146d21aa2a28b5bb) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x2706dc32411880bb3dd14916f104be8f0ce419985e3c0381e2c16be4b8bb3dd6) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x16bd4413b43e058730c90f56f8055a872b0505aa14e9c49c2e041848623e7ae7) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x2f60b2ed49b92d8c3d8287bd9b9b598de0ba8b9650972412cc2e2c174719fa68) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x155c9bd8888d4406a7c32f1146054a2925a71cb973ab9d7fbf9e6d73fc6eb96d) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x22054d51ebe5cac4cffa4dca9a87db124e107fa89a5f19e56e3725ec5daf2135) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x1e2bbffab025cf586a970031f5e9ffe108a4911e603c148df0ec2108c3a69c51) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x2b419109aec7e78f155a1528eca21b24c9dcac950a892716d6ac9405a5a72f42) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x28faa42b5c13a5e9927d13e54a2ed806854cd23c6662b320439aa3168beffe03) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x1e5c18afa66b4c0d19473e0536e64f678c1b094d1b2eff1d7f499dc289efc084) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x10a001251e9f3a9f283ff8f6bd14cba9c706f3c5040ec8ef10ff44988441251c) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x12138fab93fce066ddb2f9be4eff97b0fe128a2a2c079f749b8452698cace8bf) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x133738f359ce2e0f909a0b76a78c602e66e39c41d99f65bfea25f47998283ccd) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x2dd03593caea05125f520c0d02a3bbbdc5519822ba0e0b00984c5a9281143a81) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x09ec9b0aca4e9671903e0577f2a4efd36f7a58af0a5102f5a42e1b8061f62421) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x15affeadf66c8428f4f44d2ebe66e9dc0f04215bef81efbbee166d3f4544feab) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x1fd912d00da77afb70848e4442324157606f77f54ebc05d1a1a5fc2030836b13) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x1b1c85cc22723d352d37c86cfd66d45e809a813b99a452fe452c7ae975de2286) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x07d738e475ed11a64f559c83c2fa7e9cae6cd08f022820131e71ccb455d74c65) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x21a89aa1d220f8774c198b913822da0b52717afb10ffe58f9d86c34696e095ab) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x25ecbeda1488320db3a1d6523da5b6dfe49ce53151c3d16947cbc40094a1a97c) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x24165fbb9f06bfc24433fd2a85602d982f6bf5a072a04be4457b5cfe2a57201b) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x20d617e640a10f02cb54919d5b3df3a1fca0bda475c4588cb2199cd15a6771a9) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x22c66e35bc1d3f633bcfa969ee311abd2fb54b3512f3a7d58b5919169b33b5c3) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x0b6c3c069656dbcc297e48170179bccc317bd7d47f837f7b81752f10a35155d8) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x1ef5a76f1a787040d4e551bcb0d9b7e255430e77b5faba3eac74f3481844c24f) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x244cf010c43ca87237d8b00bf9dd50c4c01c7f086bd4e8c920e75251d96f0d22) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyVecSub(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000001000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x00000000000000000000000000000000000000000000000000000000000000f0) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x0931d596de2fd10f01ddd073fd5a90a976f169c76f039bb91c4775720042d43a) // vk.work_root
            mstore(add(_vk, 0x60), 0x3061482dfa038d0fb5b4c0b226194047a2616509f531d4fa3acdb77496c10001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x03bbe04ab13b33392dff5b50836e267dc782f89f94ef9db2cf7c099d8941e37c) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x13cd76c3d5c169c563eb5419d40c9135a5d443eb1308d3e0ea28c88a313c99a2) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x2abff8d28144d574ebb6030b5487d2aced0207d4e834dda0cbe9791c03cb6d69) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x1878f6e557cb8d61d4ed8747e766637e576b6fc2ecb54ba2bec90ed734d97f2d) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x0f0026f1a0cbd6298097e33e023fcd20ed17c3acd3955631628952cab003370c) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x178a32e84c2be184762282996ba4332ccb19206b7524f44ff9241a4fff5e2dc1) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x07ef51ac967c06f754c189c9a228bff1ed08126aacd7c68ffdc36b1fee162406) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x1b5eca060aa6019d59d29a2c1f8e6ff40b18e2e3f6a5826c740309e667eab6cd) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x25e89e4e5e8796f42a365de646a4d7d02ee1d10ce46b13cbbe5074beef51eb80) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x22f4d28c2c1236270a264aee3a92258d9d1f30b5c7c138193942992eeef9ddef) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x060a2a0478ef5d0201e339e8823f7a3af2e3e2c93c481c1df68357811c43c36d) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x0ae6b254ecb1b342ea604455d4ae36c431890a5e6f2591c5bd353d8684d18309) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x1fb3ca5b949f820d7d2acc1a626100cd18a821c3cea34692b47bd53f900835d0) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x187052d626709604953f1c27f01e61cd133c149e6c402fb92bdad5a27f500240) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x08eea98681635fb5e933ec451e2b81d0d2ab8a5876e5d554c2d620bd23e84d60) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x0eff026e9724fc371676400bf5445210e4e3305eaccba2b8edff7fc38534108d) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x13982fd0cf8da5082a77561113bb5ee51e2e82380da3da5ad0f24e49e5f32208) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x1aa5ffd5aa4c16d1c66e18c4574a3ab0b25e9b4e4e04ad1280d1a264237717e0) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x1750f44d3f9dfad78a1e2127ef91051ce018f20536fe45ca28dcc7b248389fc0) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x1a05418f502a965c39994cd3f83e39164b49c0f27d4f5ac4550751cc0a24bb58) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x066dd32de684569fc408a3ff4fc05f266dfb9b25c898ea011d3195cecd2b296e) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x25490dbe21ba8e6605c98e7ffd98c55b7490ced57af645d586d647c40179e215) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x070814815be389fe7c7be8681a278e577fcbaf3825490d32f2e381002d2ecdf0) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x1625488a17cfe0fbf7ed526541c9e06c457880ab5df4d417b5cb8fde52573a2d) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x19e203b80b2b342db7178a59f7fd7a4e9f155f80294b553df43948c881b8e785) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x296d1d0aec3c0735bb64ce35418be2933c6a448904bdbe22e2b3dd1bbd44fc61) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x1666fffc12336a8c85cc5870b919770c2ea1337cb8b7691e0430127db7b41327) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x0633a3b9de63670108372227b2d061933c5f73da3a3c5cfbc381a9d8130bc1fd) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x259f452dc7fd2dda4013dba2196852bcf43c285b1d1f7f85341f3615d25fe97b) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x117500555dd886209c0b10ee8cd10e711e890a1c99a8f689419da8c52d2e8e9d) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x2577f542178a07dac262fdabad6f55a84fca32b13b92e520bb91a7455f78ccf1) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x0fc87ae27122e60eaacc070bd59aafe12644a82ee1345497f8c0302e92925c68) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x1612f501335a4b72ac55dbe2fd1a75e5fe2c041687603b6577581d673d13be50) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x160e8ef7ff5315cb640ec82e965db270846e904bb7d1c7ff02f32823de6c1c71) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x2d540ff1653b38acbcb9cda315442364007633f529476b2f169a0ff131bfb319) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x2198b9feb61f8160e357b8bb7ca329713898655cc94a0ac2d84944c737cf57e5) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x11c8df52c3ef754f80d11792cea4b7ad74612e486596cbe7f7d6a05f19c69444) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x10c8a36cbb2fd9ed8875b5106a37162ac2932f3bd1b6942b132546d2110a63e2) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x1df9fae58966640fb910a6cbf7350281d0940268003e9cbcd9ded9411683dc55) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x047ad9e3d6db146bcca4a4e258f52decbc466452b96700f7cfbda168e3889e9c) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x1a7dd95812827190efd4a33e641a89e063f511e3b18c0e59c9d338b6687c9070) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x09cdb14fecc64143675343083761fd963c8aa797d7eb7fda6224e12d0873dbb9) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x18405bc8dac4280ed6ce6e774b41d31fa0523e37611aafe4269b6a070a6765ee) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x1c8a9c188925f28ea42de33f0c5ca669e1809781ede34abcd18e9b7e55b91d4e) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x1af864d211b88d9ccf2e371c2ba088d9269d3fdea04e05acb6f70f8dc79e0e57) // vk.work_root_inverse
        }
    }

     function loadVerificationKeyDel5(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000040000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x000000000000000000000000000000000000000000000000000000000000005e) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x19ddbcaf3a8d46c15c0176fbb5b95e4dc57088ff13f4d1bd84c6bfa57dcdc0e0) // vk.work_root
            mstore(add(_vk, 0x60), 0x30644259cd94e7dd5045d7a27013b7fcd21c9e3b7fa75222e7bda49b729b0401) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x07472d372e94ed5fd2b5f60bd191f23b33f1b715fa59a0870bfdaa40a3bfa477) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x057f56c27137369ebe1202be6af6206bb4cb1003f360c3157114245db06e34f0) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x00a92c4ed8cbd0301c462b828385a953cde9c72bcd71f5788be8e111ff8cc5bc) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x25ce0676eca08a424692e5307f51b3a72ec8e7fb798e0da01d11760c4c61f0e7) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x1ae0edf4ceb7ab35f83bb2a76ed98ade83f9abd892ce25d4d36db6760cdd32ad) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x2cae11e32417757146553d49232ac64d136ede229291f38781bc35f1b9d95663) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x17f7dfc0106a05fc2aa559a76a43dcf50b5438fd349b750d3f682b9622088778) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x1fe7ec31aa4f2d4e1cf56cfe28fbb588a3025c9087783f50bf4a477f89e4f621) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x15636f75dd1c29b6b443b1b7c936f54b8fc0f24f5f11407d65425860a24ff7a8) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x104e28d93485ec927311b099fdae6a9e5f7f5608f4dd37f73918358d7be149a1) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x27a10d63f81d25f34f660b6eddc4c5db8d9b751a75ec1ecf84744797d5a66aa0) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x1ac40f52b7a55af0561c7f476628a4d270f6918f6d616459986770266fac3b16) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x2c7ca8ca2ece871a1373773d479ac495ad2bd2cab1794b2f191772b5975bb93d) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x0b89d29e0b1a22e38d229866efe65eee45a51c0d52908d0e9af52e97564826ad) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x224fa02763241495e18ac9f41c8251e04a0085ddcebec38be65f1f2bd8421b4d) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x03d120ada22b3ba6598e69fe59e520e0e5864b9fcd4256adf994dfa4bb97d15c) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x2d5247c138f521f72a738d5497ad48d7fac4e2369d9a8e99a9b9f8070d931963) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x055c8ea419d61ab8dcc3533ad944e83262d0648c1864002d48a5f4907aa301a4) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x286b5e87c07e6bfb9f1b4dd9b2758f6abbe43245a0e9e8e6a81778ffec9f3edb) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2afe03cafd4700d14adecb1f54be2e983f0ee45d675e388cef839bba868ea2b2) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x23736ba4c86eb22ba5c8bc66223e38ba64d0ae20d35879b157cac3021801615c) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x22e3254b49a36f35fe713a8daca70a060f0603929614c72574fa98faa6638119) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x1e3043c17e24db9a6aefb863fce9b57056974abd5a3b08a40b55b8d616c585f5) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x200cca7a13dea903bbc764a4a32de76ad143a8c59916a6af4f6330d55c6d72e4) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x041835129a2baeb22738be2561d5c4730c2b2b377c0cbf9b18385c5d050410ea) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x0212a9913ae4cfd9b83b2156ebfda674fff1eb39699b49eb28e7aae7c9ed1ee5) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x1fba58890ea69a1ac6ae4ebe834a829693dac94b6f97e26b851fdf3d5dcbdb53) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x159fd81f5b1a16fd4d950908357a8f90e4c9a6e14094b6ffdbb8a920436e2c54) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x192711fca2f5b36970aae483f46068b91f52060c02f8325294db54bb0a11933e) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x1bff24689c6227448a09dbed17ef39405aa88aedd9f9384dfe3f3d0a0480cbac) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x194b5ba84c106e0146f0952b5454de8274ff80a9f83cf14c4f6f0742eeb19864) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x1ec2dc36740cd8f027ac2c850a042d4482e3b79c8105eef51df522056ae7605a) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x2263709bd57b4b6419d0e9ddb56ac9c9419a18e11184552647e1788e62f3daf3) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x28473c39c8ad63fc67af038fa2594679efec0bf7da69050d9ddee43a5837f731) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x0c55dfdec4ea5722f75304d9d07d41349451120f02efda3f0355fc1c953256c6) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x2018b108aefa236db9e8d68ca15fd206e209683379f8cb36fe3a8a7d0456bf08) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x044840c394aea0c66af2b47aacc5c67b7f95b1b817e8215ff706e6adf02370fd) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x1b231e208d637332ff2182fe11f11404be27e4c2486620025dbaefe957144cbe) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x035ebd1548894cb2db1a5c0adf6da48aa89e68423636db3a2296c78cca20dffb) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x0f7ad0a423f2780296ea7fede4d34171db3f81c85ae3b08d12e5d3564af7243c) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x25ec92e061efabd9940d00fceb3b335d9c89b0ff31d3832e99e11b922e21eee4) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x2b38d3d920f3cabb93769b43067f85d40080fc94d902ba6f8e03171e0ad2105e) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x2fd95d8f1f07f2f0b43c6d4d6d3f3dea9aa941c05d707de54d994862f838fb63) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x028dbb67156942ed1b05a7369c40ab20ede55f027f33cf1ba7e44dc30a67f921) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x036853f083780e87f8d7c71d111119c57dbe118c22d5ad707a82317466c5174c) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyDel10(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000040000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x00000000000000000000000000000000000000000000000000000000000000a4) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x19ddbcaf3a8d46c15c0176fbb5b95e4dc57088ff13f4d1bd84c6bfa57dcdc0e0) // vk.work_root
            mstore(add(_vk, 0x60), 0x30644259cd94e7dd5045d7a27013b7fcd21c9e3b7fa75222e7bda49b729b0401) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x290430080881f465d95e094dd89f2b841f2a23eb988bdb203363dd636629dc01) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x05a4266096e5e188f0d2486d8b663210ee4a492d4aede08aab4b39a787b61c78) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x073e8d511908141302fd077599ffa4bbb3b236b1d1578c33897e27bc1b2ab256) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x0a8bb7c2a78db4f2f9a0de77113e9e2e3b5b4c66dc624f8ef16d5330c1afcb8a) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x26cab0e567ded65682c4d81230e41593fbf5b91f76ade8feff88377c652e3eaa) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x05d3b30837f6daf1140ce57e8786b6841138ca8825314054ebab731ffbd43778) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x17f7dfc0106a05fc2aa559a76a43dcf50b5438fd349b750d3f682b9622088778) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x1fe7ec31aa4f2d4e1cf56cfe28fbb588a3025c9087783f50bf4a477f89e4f621) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x01cb912518a9e013591ca985a445e59aaf07c8ebd9a078faab6616ea8d288bab) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x0f971d6583cc6fa7c4be4640abda4e42f5ecc1a47278def7d223d101c9c95ce3) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x15c2e8bd62697fb984afad095cbc2cbedfa9267dc4b4e8351b565f4b882f6a5e) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x0e9519fd3daee175cade419cadd17e8423d44c4bc1867c9a94f8f8e194edbab6) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x061ff8bfa831618b8f76ef0c3a76f66634ddd42aab0e904c277b4f699d7dd03e) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x0d62bedfa52745c6a15f1f3eb9cba765450408bb5c0ec01487ff79c019788e54) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x224fa02763241495e18ac9f41c8251e04a0085ddcebec38be65f1f2bd8421b4d) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x03d120ada22b3ba6598e69fe59e520e0e5864b9fcd4256adf994dfa4bb97d15c) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x2d5247c138f521f72a738d5497ad48d7fac4e2369d9a8e99a9b9f8070d931963) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x055c8ea419d61ab8dcc3533ad944e83262d0648c1864002d48a5f4907aa301a4) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x286b5e87c07e6bfb9f1b4dd9b2758f6abbe43245a0e9e8e6a81778ffec9f3edb) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2afe03cafd4700d14adecb1f54be2e983f0ee45d675e388cef839bba868ea2b2) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x1a189fd891261c4a9f70231787a2d62f0285796c7d8c532ab4ef84b0c3a557b9) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x2cdc2f6fb97054d8a0bb7d3e8ac4d44caa21a54c99f00e2e8d153475d2d415be) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x17224ada322e4330821b680caab1ec88c2750b916276ad1d72dfa709df4931dc) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x21340c43bc0bd70921608d96934a22a140605cf5c816ec9e55597b6e34e194e0) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x1317a69d22f3a2979d424dd10d8065aace7b62189808b5036a3ccf73e5ed03b0) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x1fef7075037565f4933a92e5e6b302a0a80bd7488ee35eb28b146d3e69cde2f0) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x1b3420beb84d5696a60b2e9cb9fb64f2b1361644f5cdb2aa17bad06d70ba5ca2) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x299f74b320f6da82e60e8396b0252295565b5fccfd9f2633377e4a3a9b4ac59d) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x192711fca2f5b36970aae483f46068b91f52060c02f8325294db54bb0a11933e) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x1bff24689c6227448a09dbed17ef39405aa88aedd9f9384dfe3f3d0a0480cbac) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x194b5ba84c106e0146f0952b5454de8274ff80a9f83cf14c4f6f0742eeb19864) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x1ec2dc36740cd8f027ac2c850a042d4482e3b79c8105eef51df522056ae7605a) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x2263709bd57b4b6419d0e9ddb56ac9c9419a18e11184552647e1788e62f3daf3) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x28473c39c8ad63fc67af038fa2594679efec0bf7da69050d9ddee43a5837f731) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x0c55dfdec4ea5722f75304d9d07d41349451120f02efda3f0355fc1c953256c6) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x2018b108aefa236db9e8d68ca15fd206e209683379f8cb36fe3a8a7d0456bf08) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x044840c394aea0c66af2b47aacc5c67b7f95b1b817e8215ff706e6adf02370fd) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x1b231e208d637332ff2182fe11f11404be27e4c2486620025dbaefe957144cbe) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x0fb8336c167c7b0739f5eb0df254d0c79f26e9ce5c2513f86d8c80d814f1a5fc) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x0f3223b156c3d4993119f2d3d19b1f057df12f54c635af3baffccfe8c4bef683) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x1d455c016d3642c72ed9bd4172f613fd47f487993577b7fe5cc9269cfd87e22c) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x15d3b7976638f93a13ee83486e024c28aaa773f6bb2e513be659c87ae3935172) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x21f79f7464fa9f41c1fb3c49a5076cad41a14e325e6f975b902275dfbd2983c2) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x13ffc9c8711ff73ac4d29c976dff9d1543702b5b771ad68c64cc161016462fec) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x036853f083780e87f8d7c71d111119c57dbe118c22d5ad707a82317466c5174c) // vk.work_root_inverse
        }
    }
}
/**
 * @title Ultra Plonk proof verification contract
 * @dev Top level Plonk proof verification contract, which allows Plonk proof to be verified
 */
abstract contract BaseUltraVerifier {
    // VERIFICATION KEY MEMORY LOCATIONS
    uint256 internal constant N_LOC = 0x380;
    uint256 internal constant NUM_INPUTS_LOC = 0x3a0;
    uint256 internal constant OMEGA_LOC = 0x3c0;
    uint256 internal constant DOMAIN_INVERSE_LOC = 0x3e0;
    uint256 internal constant Q1_X_LOC = 0x400;
    uint256 internal constant Q1_Y_LOC = 0x420;
    uint256 internal constant Q2_X_LOC = 0x440;
    uint256 internal constant Q2_Y_LOC = 0x460;
    uint256 internal constant Q3_X_LOC = 0x480;
    uint256 internal constant Q3_Y_LOC = 0x4a0;
    uint256 internal constant Q4_X_LOC = 0x4c0;
    uint256 internal constant Q4_Y_LOC = 0x4e0;
    uint256 internal constant QM_X_LOC = 0x500;
    uint256 internal constant QM_Y_LOC = 0x520;
    uint256 internal constant QC_X_LOC = 0x540;
    uint256 internal constant QC_Y_LOC = 0x560;
    uint256 internal constant QARITH_X_LOC = 0x580;
    uint256 internal constant QARITH_Y_LOC = 0x5a0;
    uint256 internal constant QSORT_X_LOC = 0x5c0;
    uint256 internal constant QSORT_Y_LOC = 0x5e0;
    uint256 internal constant QELLIPTIC_X_LOC = 0x600;
    uint256 internal constant QELLIPTIC_Y_LOC = 0x620;
    uint256 internal constant QAUX_X_LOC = 0x640;
    uint256 internal constant QAUX_Y_LOC = 0x660;
    uint256 internal constant SIGMA1_X_LOC = 0x680;
    uint256 internal constant SIGMA1_Y_LOC = 0x6a0;
    uint256 internal constant SIGMA2_X_LOC = 0x6c0;
    uint256 internal constant SIGMA2_Y_LOC = 0x6e0;
    uint256 internal constant SIGMA3_X_LOC = 0x700;
    uint256 internal constant SIGMA3_Y_LOC = 0x720;
    uint256 internal constant SIGMA4_X_LOC = 0x740;
    uint256 internal constant SIGMA4_Y_LOC = 0x760;
    uint256 internal constant TABLE1_X_LOC = 0x780;
    uint256 internal constant TABLE1_Y_LOC = 0x7a0;
    uint256 internal constant TABLE2_X_LOC = 0x7c0;
    uint256 internal constant TABLE2_Y_LOC = 0x7e0;
    uint256 internal constant TABLE3_X_LOC = 0x800;
    uint256 internal constant TABLE3_Y_LOC = 0x820;
    uint256 internal constant TABLE4_X_LOC = 0x840;
    uint256 internal constant TABLE4_Y_LOC = 0x860;
    uint256 internal constant TABLE_TYPE_X_LOC = 0x880;
    uint256 internal constant TABLE_TYPE_Y_LOC = 0x8a0;
    uint256 internal constant ID1_X_LOC = 0x8c0;
    uint256 internal constant ID1_Y_LOC = 0x8e0;
    uint256 internal constant ID2_X_LOC = 0x900;
    uint256 internal constant ID2_Y_LOC = 0x920;
    uint256 internal constant ID3_X_LOC = 0x940;
    uint256 internal constant ID3_Y_LOC = 0x960;
    uint256 internal constant ID4_X_LOC = 0x980;
    uint256 internal constant ID4_Y_LOC = 0x9a0;
    uint256 internal constant CONTAINS_RECURSIVE_PROOF_LOC = 0x9c0;
    uint256 internal constant RECURSIVE_PROOF_PUBLIC_INPUT_INDICES_LOC = 0x9e0;
    uint256 internal constant G2X_X0_LOC = 0xa00;
    uint256 internal constant G2X_X1_LOC = 0xa20;
    uint256 internal constant G2X_Y0_LOC = 0xa40;
    uint256 internal constant G2X_Y1_LOC = 0xa60;

    // ### PROOF DATA MEMORY LOCATIONS
    uint256 internal constant W1_X_LOC = 0x1200;
    uint256 internal constant W1_Y_LOC = 0x1220;
    uint256 internal constant W2_X_LOC = 0x1240;
    uint256 internal constant W2_Y_LOC = 0x1260;
    uint256 internal constant W3_X_LOC = 0x1280;
    uint256 internal constant W3_Y_LOC = 0x12a0;
    uint256 internal constant W4_X_LOC = 0x12c0;
    uint256 internal constant W4_Y_LOC = 0x12e0;
    uint256 internal constant S_X_LOC = 0x1300;
    uint256 internal constant S_Y_LOC = 0x1320;
    uint256 internal constant Z_X_LOC = 0x1340;
    uint256 internal constant Z_Y_LOC = 0x1360;
    uint256 internal constant Z_LOOKUP_X_LOC = 0x1380;
    uint256 internal constant Z_LOOKUP_Y_LOC = 0x13a0;
    uint256 internal constant T1_X_LOC = 0x13c0;
    uint256 internal constant T1_Y_LOC = 0x13e0;
    uint256 internal constant T2_X_LOC = 0x1400;
    uint256 internal constant T2_Y_LOC = 0x1420;
    uint256 internal constant T3_X_LOC = 0x1440;
    uint256 internal constant T3_Y_LOC = 0x1460;
    uint256 internal constant T4_X_LOC = 0x1480;
    uint256 internal constant T4_Y_LOC = 0x14a0;

    uint256 internal constant W1_EVAL_LOC = 0x1600;
    uint256 internal constant W2_EVAL_LOC = 0x1620;
    uint256 internal constant W3_EVAL_LOC = 0x1640;
    uint256 internal constant W4_EVAL_LOC = 0x1660;
    uint256 internal constant S_EVAL_LOC = 0x1680;
    uint256 internal constant Z_EVAL_LOC = 0x16a0;
    uint256 internal constant Z_LOOKUP_EVAL_LOC = 0x16c0;
    uint256 internal constant Q1_EVAL_LOC = 0x16e0;
    uint256 internal constant Q2_EVAL_LOC = 0x1700;
    uint256 internal constant Q3_EVAL_LOC = 0x1720;
    uint256 internal constant Q4_EVAL_LOC = 0x1740;
    uint256 internal constant QM_EVAL_LOC = 0x1760;
    uint256 internal constant QC_EVAL_LOC = 0x1780;
    uint256 internal constant QARITH_EVAL_LOC = 0x17a0;
    uint256 internal constant QSORT_EVAL_LOC = 0x17c0;
    uint256 internal constant QELLIPTIC_EVAL_LOC = 0x17e0;
    uint256 internal constant QAUX_EVAL_LOC = 0x1800;
    uint256 internal constant TABLE1_EVAL_LOC = 0x1840;
    uint256 internal constant TABLE2_EVAL_LOC = 0x1860;
    uint256 internal constant TABLE3_EVAL_LOC = 0x1880;
    uint256 internal constant TABLE4_EVAL_LOC = 0x18a0;
    uint256 internal constant TABLE_TYPE_EVAL_LOC = 0x18c0;
    uint256 internal constant ID1_EVAL_LOC = 0x18e0;
    uint256 internal constant ID2_EVAL_LOC = 0x1900;
    uint256 internal constant ID3_EVAL_LOC = 0x1920;
    uint256 internal constant ID4_EVAL_LOC = 0x1940;
    uint256 internal constant SIGMA1_EVAL_LOC = 0x1960;
    uint256 internal constant SIGMA2_EVAL_LOC = 0x1980;
    uint256 internal constant SIGMA3_EVAL_LOC = 0x19a0;
    uint256 internal constant SIGMA4_EVAL_LOC = 0x19c0;
    uint256 internal constant W1_OMEGA_EVAL_LOC = 0x19e0;
    uint256 internal constant W2_OMEGA_EVAL_LOC = 0x2000;
    uint256 internal constant W3_OMEGA_EVAL_LOC = 0x2020;
    uint256 internal constant W4_OMEGA_EVAL_LOC = 0x2040;
    uint256 internal constant S_OMEGA_EVAL_LOC = 0x2060;
    uint256 internal constant Z_OMEGA_EVAL_LOC = 0x2080;
    uint256 internal constant Z_LOOKUP_OMEGA_EVAL_LOC = 0x20a0;
    uint256 internal constant TABLE1_OMEGA_EVAL_LOC = 0x20c0;
    uint256 internal constant TABLE2_OMEGA_EVAL_LOC = 0x20e0;
    uint256 internal constant TABLE3_OMEGA_EVAL_LOC = 0x2100;
    uint256 internal constant TABLE4_OMEGA_EVAL_LOC = 0x2120;

    uint256 internal constant PI_Z_X_LOC = 0x2300;
    uint256 internal constant PI_Z_Y_LOC = 0x2320;
    uint256 internal constant PI_Z_OMEGA_X_LOC = 0x2340;
    uint256 internal constant PI_Z_OMEGA_Y_LOC = 0x2360;

    // Used for elliptic widget. These are alias names for wire + shifted wire evaluations
    uint256 internal constant X1_EVAL_LOC = W2_EVAL_LOC;
    uint256 internal constant X2_EVAL_LOC = W1_OMEGA_EVAL_LOC;
    uint256 internal constant X3_EVAL_LOC = W2_OMEGA_EVAL_LOC;
    uint256 internal constant Y1_EVAL_LOC = W3_EVAL_LOC;
    uint256 internal constant Y2_EVAL_LOC = W4_OMEGA_EVAL_LOC;
    uint256 internal constant Y3_EVAL_LOC = W3_OMEGA_EVAL_LOC;
    uint256 internal constant QBETA_LOC = Q3_EVAL_LOC;
    uint256 internal constant QBETA_SQR_LOC = Q4_EVAL_LOC;
    uint256 internal constant QSIGN_LOC = Q1_EVAL_LOC;

    // ### CHALLENGES MEMORY OFFSETS

    uint256 internal constant C_BETA_LOC = 0x2600;
    uint256 internal constant C_GAMMA_LOC = 0x2620;
    uint256 internal constant C_ALPHA_LOC = 0x2640;
    uint256 internal constant C_ETA_LOC = 0x2660;
    uint256 internal constant C_ETA_SQR_LOC = 0x2680;
    uint256 internal constant C_ETA_CUBE_LOC = 0x26a0;

    uint256 internal constant C_ZETA_LOC = 0x26c0;
    uint256 internal constant C_CURRENT_LOC = 0x26e0;
    uint256 internal constant C_V0_LOC = 0x2700;
    uint256 internal constant C_V1_LOC = 0x2720;
    uint256 internal constant C_V2_LOC = 0x2740;
    uint256 internal constant C_V3_LOC = 0x2760;
    uint256 internal constant C_V4_LOC = 0x2780;
    uint256 internal constant C_V5_LOC = 0x27a0;
    uint256 internal constant C_V6_LOC = 0x27c0;
    uint256 internal constant C_V7_LOC = 0x27e0;
    uint256 internal constant C_V8_LOC = 0x2800;
    uint256 internal constant C_V9_LOC = 0x2820;
    uint256 internal constant C_V10_LOC = 0x2840;
    uint256 internal constant C_V11_LOC = 0x2860;
    uint256 internal constant C_V12_LOC = 0x2880;
    uint256 internal constant C_V13_LOC = 0x28a0;
    uint256 internal constant C_V14_LOC = 0x28c0;
    uint256 internal constant C_V15_LOC = 0x28e0;
    uint256 internal constant C_V16_LOC = 0x2900;
    uint256 internal constant C_V17_LOC = 0x2920;
    uint256 internal constant C_V18_LOC = 0x2940;
    uint256 internal constant C_V19_LOC = 0x2960;
    uint256 internal constant C_V20_LOC = 0x2980;
    uint256 internal constant C_V21_LOC = 0x29a0;
    uint256 internal constant C_V22_LOC = 0x29c0;
    uint256 internal constant C_V23_LOC = 0x29e0;
    uint256 internal constant C_V24_LOC = 0x2a00;
    uint256 internal constant C_V25_LOC = 0x2a20;
    uint256 internal constant C_V26_LOC = 0x2a40;
    uint256 internal constant C_V27_LOC = 0x2a60;
    uint256 internal constant C_V28_LOC = 0x2a80;
    uint256 internal constant C_V29_LOC = 0x2aa0;
    uint256 internal constant C_V30_LOC = 0x2ac0;

    uint256 internal constant C_U_LOC = 0x2b00;

    // ### LOCAL VARIABLES MEMORY OFFSETS
    uint256 internal constant DELTA_NUMERATOR_LOC = 0x3000;
    uint256 internal constant DELTA_DENOMINATOR_LOC = 0x3020;
    uint256 internal constant ZETA_POW_N_LOC = 0x3040;
    uint256 internal constant PUBLIC_INPUT_DELTA_LOC = 0x3060;
    uint256 internal constant ZERO_POLY_LOC = 0x3080;
    uint256 internal constant L_START_LOC = 0x30a0;
    uint256 internal constant L_END_LOC = 0x30c0;
    uint256 internal constant R_ZERO_EVAL_LOC = 0x30e0;

    uint256 internal constant PLOOKUP_DELTA_NUMERATOR_LOC = 0x3100;
    uint256 internal constant PLOOKUP_DELTA_DENOMINATOR_LOC = 0x3120;
    uint256 internal constant PLOOKUP_DELTA_LOC = 0x3140;

    uint256 internal constant ACCUMULATOR_X_LOC = 0x3160;
    uint256 internal constant ACCUMULATOR_Y_LOC = 0x3180;
    uint256 internal constant ACCUMULATOR2_X_LOC = 0x31a0;
    uint256 internal constant ACCUMULATOR2_Y_LOC = 0x31c0;
    uint256 internal constant PAIRING_LHS_X_LOC = 0x31e0;
    uint256 internal constant PAIRING_LHS_Y_LOC = 0x3200;
    uint256 internal constant PAIRING_RHS_X_LOC = 0x3220;
    uint256 internal constant PAIRING_RHS_Y_LOC = 0x3240;

    // ### SUCCESS FLAG MEMORY LOCATIONS
    uint256 internal constant GRAND_PRODUCT_SUCCESS_FLAG = 0x3300;
    uint256 internal constant ARITHMETIC_TERM_SUCCESS_FLAG = 0x3020;
    uint256 internal constant BATCH_OPENING_SUCCESS_FLAG = 0x3340;
    uint256 internal constant OPENING_COMMITMENT_SUCCESS_FLAG = 0x3360;
    uint256 internal constant PAIRING_PREAMBLE_SUCCESS_FLAG = 0x3380;
    uint256 internal constant PAIRING_SUCCESS_FLAG = 0x33a0;
    uint256 internal constant RESULT_FLAG = 0x33c0;

    // misc stuff
    uint256 internal constant OMEGA_INVERSE_LOC = 0x3400;
    uint256 internal constant C_ALPHA_SQR_LOC = 0x3420;
    uint256 internal constant C_ALPHA_CUBE_LOC = 0x3440;
    uint256 internal constant C_ALPHA_QUAD_LOC = 0x3460;
    uint256 internal constant C_ALPHA_BASE_LOC = 0x3480;

    // ### RECURSION VARIABLE MEMORY LOCATIONS
    uint256 internal constant RECURSIVE_P1_X_LOC = 0x3500;
    uint256 internal constant RECURSIVE_P1_Y_LOC = 0x3520;
    uint256 internal constant RECURSIVE_P2_X_LOC = 0x3540;
    uint256 internal constant RECURSIVE_P2_Y_LOC = 0x3560;

    uint256 internal constant PUBLIC_INPUTS_HASH_LOCATION = 0x3580;

    // sub-identity storage
    uint256 internal constant PERMUTATION_IDENTITY = 0x3600;
    uint256 internal constant PLOOKUP_IDENTITY = 0x3620;
    uint256 internal constant ARITHMETIC_IDENTITY = 0x3640;
    uint256 internal constant SORT_IDENTITY = 0x3660;
    uint256 internal constant ELLIPTIC_IDENTITY = 0x3680;
    uint256 internal constant AUX_IDENTITY = 0x36a0;
    uint256 internal constant AUX_NON_NATIVE_FIELD_EVALUATION = 0x36c0;
    uint256 internal constant AUX_LIMB_ACCUMULATOR_EVALUATION = 0x36e0;
    uint256 internal constant AUX_RAM_CONSISTENCY_EVALUATION = 0x3700;
    uint256 internal constant AUX_ROM_CONSISTENCY_EVALUATION = 0x3720;
    uint256 internal constant AUX_MEMORY_EVALUATION = 0x3740;

    uint256 internal constant QUOTIENT_EVAL_LOC = 0x3760;
    uint256 internal constant ZERO_POLY_INVERSE_LOC = 0x3780;

    // when hashing public inputs we use memory at NU_CHALLENGE_INPUT_LOC_A, as the hash input size is unknown at compile time
    uint256 internal constant NU_CHALLENGE_INPUT_LOC_A = 0x37a0;
    uint256 internal constant NU_CHALLENGE_INPUT_LOC_B = 0x37c0;
    uint256 internal constant NU_CHALLENGE_INPUT_LOC_C = 0x37e0;

    bytes4 internal constant PUBLIC_INPUT_INVALID_BN128_G1_POINT_SELECTOR = 0xeba9f4a6;
    bytes4 internal constant PUBLIC_INPUT_GE_P_SELECTOR = 0x374a972f;
    bytes4 internal constant MOD_EXP_FAILURE_SELECTOR = 0xf894a7bc;
    bytes4 internal constant EC_SCALAR_MUL_FAILURE_SELECTOR = 0xf755f369;
    bytes4 internal constant PROOF_FAILURE_SELECTOR = 0x0711fcec;

    uint256 internal constant ETA_INPUT_LENGTH = 0xc0; // W1, W2, W3 = 6 * 0x20 bytes

    // We need to hash 41 field elements when generating the NU challenge
    // w1, w2, w3, w4, s, z, z_lookup, q1, q2, q3, q4, qm, qc, qarith (14)
    // qsort, qelliptic, qaux, sigma1, sigma2, sigma, sigma4, (7)
    // table1, table2, table3, table4, tabletype, id1, id2, id3, id4, (9)
    // w1_omega, w2_omega, w3_omega, w4_omega, s_omega, z_omega, z_lookup_omega, (7)
    // table1_omega, table2_omega, table3_omega, table4_omega (4)
    uint256 internal constant NU_INPUT_LENGTH = 0x520; // 0x520 = 41 * 0x20

    // There are ELEVEN G1 group elements added into the transcript in the `beta` round, that we need to skip over
    // W1, W2, W3, W4, S, Z, Z_LOOKUP, T1, T2, T3, T4
    uint256 internal constant NU_CALLDATA_SKIP_LENGTH = 0x2c0; // 11 * 0x40 = 0x2c0

    uint256 internal constant NEGATIVE_INVERSE_OF_2_MODULO_P =
        0x183227397098d014dc2822db40c0ac2e9419f4243cdcb848a1f0fac9f8000000;
    uint256 internal constant LIMB_SIZE = 0x100000000000000000; // 2<<68
    uint256 internal constant SUBLIMB_SHIFT = 0x4000; // 2<<14

    // y^2 = x^3 + ax + b
    // for Grumpkin, a = 0 and b = -17. We use b in a custom gate relation that evaluates elliptic curve arithmetic
    uint256 internal constant GRUMPKIN_CURVE_B_PARAMETER_NEGATED = 17;
    error PUBLIC_INPUT_COUNT_INVALID(uint256 expected, uint256 actual);
    error PUBLIC_INPUT_INVALID_BN128_G1_POINT();
    error PUBLIC_INPUT_GE_P();
    error MOD_EXP_FAILURE();
    error EC_SCALAR_MUL_FAILURE();
    error PROOF_FAILURE();

    function getVerificationKeyHashBaseDel() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseEnc() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseEncSub() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseAdd() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseVote() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseDecPercent() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseVecSub() public pure virtual returns (bytes32);

    // r_del w/ different anonymity set sizes
    function getVerificationKeyHashBaseDel5() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseDel10() public pure virtual returns (bytes32);

    function loadVerificationKeyBaseDel(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseEnc(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseEncSub(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseAdd(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseVote(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseDecPercent(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseVecSub(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;

    // r_del w/ different anonymity set sizes
    function loadVerificationKeyBaseDel5(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseDel10(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;

    /**
     * @notice Verify a Ultra Plonk proof
     * @param _proof - The serialized proof
     * @param _publicInputs - An array of the public inputs
     * @param selector - Which relation to verify (1 = Dec, 2 = Del, 3 = Enc)
     * @return True if proof is valid, reverts otherwise
     */
    function verify(bytes calldata _proof, bytes32[] calldata _publicInputs, uint8 selector) external view returns (bool) {
        
        if (selector == 2) {
            // anonymity set size of 20, r_delvecadd
            loadVerificationKeyBaseDel(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 3) {
            loadVerificationKeyBaseEnc(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 4) {
            // actually R_add + Merkle Tree Check, R_addmt
            loadVerificationKeyBaseAdd(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 6) {
            loadVerificationKeyBaseEncSub(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 7) {
            loadVerificationKeyBaseVote(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 8) {
            loadVerificationKeyBaseDecPercent(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 9) {
            loadVerificationKeyBaseVecSub(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 10) {
            loadVerificationKeyBaseDel5(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 11) {
            loadVerificationKeyBaseDel10(N_LOC, OMEGA_INVERSE_LOC);
        } else {
            revert("Invalid selector");
        }

        // loadVerificationKey(N_LOC, OMEGA_INVERSE_LOC);

        uint256 requiredPublicInputCount;
        assembly {
            requiredPublicInputCount := mload(NUM_INPUTS_LOC)
        }
        if (requiredPublicInputCount != _publicInputs.length) {
            revert PUBLIC_INPUT_COUNT_INVALID(requiredPublicInputCount, _publicInputs.length);
        }

        assembly {
            let q := 21888242871839275222246405745257275088696311157297823662689037894645226208583 // EC group order
            let p := 21888242871839275222246405745257275088548364400416034343698204186575808495617 // Prime field order

            /**
             * LOAD PROOF FROM CALLDATA
             */
            {
                let data_ptr := add(calldataload(0x04), 0x24)

                mstore(W1_Y_LOC, mod(calldataload(data_ptr), q))
                mstore(W1_X_LOC, mod(calldataload(add(data_ptr, 0x20)), q))

                mstore(W2_Y_LOC, mod(calldataload(add(data_ptr, 0x40)), q))
                mstore(W2_X_LOC, mod(calldataload(add(data_ptr, 0x60)), q))

                mstore(W3_Y_LOC, mod(calldataload(add(data_ptr, 0x80)), q))
                mstore(W3_X_LOC, mod(calldataload(add(data_ptr, 0xa0)), q))

                mstore(W4_Y_LOC, mod(calldataload(add(data_ptr, 0xc0)), q))
                mstore(W4_X_LOC, mod(calldataload(add(data_ptr, 0xe0)), q))

                mstore(S_Y_LOC, mod(calldataload(add(data_ptr, 0x100)), q))
                mstore(S_X_LOC, mod(calldataload(add(data_ptr, 0x120)), q))
                mstore(Z_Y_LOC, mod(calldataload(add(data_ptr, 0x140)), q))
                mstore(Z_X_LOC, mod(calldataload(add(data_ptr, 0x160)), q))
                mstore(Z_LOOKUP_Y_LOC, mod(calldataload(add(data_ptr, 0x180)), q))
                mstore(Z_LOOKUP_X_LOC, mod(calldataload(add(data_ptr, 0x1a0)), q))
                mstore(T1_Y_LOC, mod(calldataload(add(data_ptr, 0x1c0)), q))
                mstore(T1_X_LOC, mod(calldataload(add(data_ptr, 0x1e0)), q))

                mstore(T2_Y_LOC, mod(calldataload(add(data_ptr, 0x200)), q))
                mstore(T2_X_LOC, mod(calldataload(add(data_ptr, 0x220)), q))

                mstore(T3_Y_LOC, mod(calldataload(add(data_ptr, 0x240)), q))
                mstore(T3_X_LOC, mod(calldataload(add(data_ptr, 0x260)), q))

                mstore(T4_Y_LOC, mod(calldataload(add(data_ptr, 0x280)), q))
                mstore(T4_X_LOC, mod(calldataload(add(data_ptr, 0x2a0)), q))

                mstore(W1_EVAL_LOC, mod(calldataload(add(data_ptr, 0x2c0)), p))
                mstore(W2_EVAL_LOC, mod(calldataload(add(data_ptr, 0x2e0)), p))
                mstore(W3_EVAL_LOC, mod(calldataload(add(data_ptr, 0x300)), p))
                mstore(W4_EVAL_LOC, mod(calldataload(add(data_ptr, 0x320)), p))
                mstore(S_EVAL_LOC, mod(calldataload(add(data_ptr, 0x340)), p))
                mstore(Z_EVAL_LOC, mod(calldataload(add(data_ptr, 0x360)), p))
                mstore(Z_LOOKUP_EVAL_LOC, mod(calldataload(add(data_ptr, 0x380)), p))
                mstore(Q1_EVAL_LOC, mod(calldataload(add(data_ptr, 0x3a0)), p))
                mstore(Q2_EVAL_LOC, mod(calldataload(add(data_ptr, 0x3c0)), p))
                mstore(Q3_EVAL_LOC, mod(calldataload(add(data_ptr, 0x3e0)), p))
                mstore(Q4_EVAL_LOC, mod(calldataload(add(data_ptr, 0x400)), p))
                mstore(QM_EVAL_LOC, mod(calldataload(add(data_ptr, 0x420)), p))
                mstore(QC_EVAL_LOC, mod(calldataload(add(data_ptr, 0x440)), p))
                mstore(QARITH_EVAL_LOC, mod(calldataload(add(data_ptr, 0x460)), p))
                mstore(QSORT_EVAL_LOC, mod(calldataload(add(data_ptr, 0x480)), p))
                mstore(QELLIPTIC_EVAL_LOC, mod(calldataload(add(data_ptr, 0x4a0)), p))
                mstore(QAUX_EVAL_LOC, mod(calldataload(add(data_ptr, 0x4c0)), p))

                mstore(SIGMA1_EVAL_LOC, mod(calldataload(add(data_ptr, 0x4e0)), p))
                mstore(SIGMA2_EVAL_LOC, mod(calldataload(add(data_ptr, 0x500)), p))

                mstore(SIGMA3_EVAL_LOC, mod(calldataload(add(data_ptr, 0x520)), p))
                mstore(SIGMA4_EVAL_LOC, mod(calldataload(add(data_ptr, 0x540)), p))

                mstore(TABLE1_EVAL_LOC, mod(calldataload(add(data_ptr, 0x560)), p))
                mstore(TABLE2_EVAL_LOC, mod(calldataload(add(data_ptr, 0x580)), p))
                mstore(TABLE3_EVAL_LOC, mod(calldataload(add(data_ptr, 0x5a0)), p))
                mstore(TABLE4_EVAL_LOC, mod(calldataload(add(data_ptr, 0x5c0)), p))
                mstore(TABLE_TYPE_EVAL_LOC, mod(calldataload(add(data_ptr, 0x5e0)), p))

                mstore(ID1_EVAL_LOC, mod(calldataload(add(data_ptr, 0x600)), p))
                mstore(ID2_EVAL_LOC, mod(calldataload(add(data_ptr, 0x620)), p))
                mstore(ID3_EVAL_LOC, mod(calldataload(add(data_ptr, 0x640)), p))
                mstore(ID4_EVAL_LOC, mod(calldataload(add(data_ptr, 0x660)), p))

                mstore(W1_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x680)), p))
                mstore(W2_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x6a0)), p))
                mstore(W3_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x6c0)), p))
                mstore(W4_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x6e0)), p))
                mstore(S_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x700)), p))

                mstore(Z_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x720)), p))

                mstore(Z_LOOKUP_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x740)), p))
                mstore(TABLE1_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x760)), p))
                mstore(TABLE2_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x780)), p))
                mstore(TABLE3_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x7a0)), p))
                mstore(TABLE4_OMEGA_EVAL_LOC, mod(calldataload(add(data_ptr, 0x7c0)), p))

                mstore(PI_Z_Y_LOC, mod(calldataload(add(data_ptr, 0x7e0)), q))
                mstore(PI_Z_X_LOC, mod(calldataload(add(data_ptr, 0x800)), q))

                mstore(PI_Z_OMEGA_Y_LOC, mod(calldataload(add(data_ptr, 0x820)), q))
                mstore(PI_Z_OMEGA_X_LOC, mod(calldataload(add(data_ptr, 0x840)), q))
            }

            /**
             * LOAD RECURSIVE PROOF INTO MEMORY
             */
            {
                if mload(CONTAINS_RECURSIVE_PROOF_LOC) {
                    let public_inputs_ptr := add(calldataload(0x24), 0x24)
                    let index_counter := add(shl(5, mload(RECURSIVE_PROOF_PUBLIC_INPUT_INDICES_LOC)), public_inputs_ptr)

                    let x0 := calldataload(index_counter)
                    x0 := add(x0, shl(68, calldataload(add(index_counter, 0x20))))
                    x0 := add(x0, shl(136, calldataload(add(index_counter, 0x40))))
                    x0 := add(x0, shl(204, calldataload(add(index_counter, 0x60))))
                    let y0 := calldataload(add(index_counter, 0x80))
                    y0 := add(y0, shl(68, calldataload(add(index_counter, 0xa0))))
                    y0 := add(y0, shl(136, calldataload(add(index_counter, 0xc0))))
                    y0 := add(y0, shl(204, calldataload(add(index_counter, 0xe0))))
                    let x1 := calldataload(add(index_counter, 0x100))
                    x1 := add(x1, shl(68, calldataload(add(index_counter, 0x120))))
                    x1 := add(x1, shl(136, calldataload(add(index_counter, 0x140))))
                    x1 := add(x1, shl(204, calldataload(add(index_counter, 0x160))))
                    let y1 := calldataload(add(index_counter, 0x180))
                    y1 := add(y1, shl(68, calldataload(add(index_counter, 0x1a0))))
                    y1 := add(y1, shl(136, calldataload(add(index_counter, 0x1c0))))
                    y1 := add(y1, shl(204, calldataload(add(index_counter, 0x1e0))))
                    mstore(RECURSIVE_P1_X_LOC, x0)
                    mstore(RECURSIVE_P1_Y_LOC, y0)
                    mstore(RECURSIVE_P2_X_LOC, x1)
                    mstore(RECURSIVE_P2_Y_LOC, y1)

                    // validate these are valid bn128 G1 points
                    if iszero(and(and(lt(x0, q), lt(x1, q)), and(lt(y0, q), lt(y1, q)))) {
                        mstore(0x00, PUBLIC_INPUT_INVALID_BN128_G1_POINT_SELECTOR)
                        revert(0x00, 0x04)
                    }
                }
            }

            {
                /**
                 * Generate initial challenge
                 */
                mstore(0x00, shl(224, mload(N_LOC)))
                mstore(0x04, shl(224, mload(NUM_INPUTS_LOC)))
                let challenge := keccak256(0x00, 0x08)

                /**
                 * Generate eta challenge
                 */
                mstore(PUBLIC_INPUTS_HASH_LOCATION, challenge)
                // The public input location is stored at 0x24, we then add 0x24 to skip selector and the length of public inputs
                let public_inputs_start := add(calldataload(0x24), 0x24)
                // copy the public inputs over
                let public_input_size := mul(mload(NUM_INPUTS_LOC), 0x20)
                calldatacopy(add(PUBLIC_INPUTS_HASH_LOCATION, 0x20), public_inputs_start, public_input_size)

                // copy W1, W2, W3 into challenge. Each point is 0x40 bytes, so load 0xc0 = 3 * 0x40 bytes (ETA input length)
                let w_start := add(calldataload(0x04), 0x24)
                calldatacopy(add(add(PUBLIC_INPUTS_HASH_LOCATION, 0x20), public_input_size), w_start, ETA_INPUT_LENGTH)

                // Challenge is the old challenge + public inputs + W1, W2, W3 (0x20 + public_input_size + 0xc0)
                let challenge_bytes_size := add(0x20, add(public_input_size, ETA_INPUT_LENGTH))

                challenge := keccak256(PUBLIC_INPUTS_HASH_LOCATION, challenge_bytes_size)
                {
                    let eta := mod(challenge, p)
                    mstore(C_ETA_LOC, eta)
                    mstore(C_ETA_SQR_LOC, mulmod(eta, eta, p))
                    mstore(C_ETA_CUBE_LOC, mulmod(mload(C_ETA_SQR_LOC), eta, p))
                }

                /**
                 * Generate beta challenge
                 */
                mstore(0x00, challenge)
                mstore(0x20, mload(W4_Y_LOC))
                mstore(0x40, mload(W4_X_LOC))
                mstore(0x60, mload(S_Y_LOC))
                mstore(0x80, mload(S_X_LOC))
                challenge := keccak256(0x00, 0xa0)
                mstore(C_BETA_LOC, mod(challenge, p))

                /**
                 * Generate gamma challenge
                 */
                mstore(0x00, challenge)
                mstore8(0x20, 0x01)
                challenge := keccak256(0x00, 0x21)
                mstore(C_GAMMA_LOC, mod(challenge, p))

                /**
                 * Generate alpha challenge
                 */
                mstore(0x00, challenge)
                mstore(0x20, mload(Z_Y_LOC))
                mstore(0x40, mload(Z_X_LOC))
                mstore(0x60, mload(Z_LOOKUP_Y_LOC))
                mstore(0x80, mload(Z_LOOKUP_X_LOC))
                challenge := keccak256(0x00, 0xa0)
                mstore(C_ALPHA_LOC, mod(challenge, p))

                /**
                 * Compute and store some powers of alpha for future computations
                 */
                let alpha := mload(C_ALPHA_LOC)
                mstore(C_ALPHA_SQR_LOC, mulmod(alpha, alpha, p))
                mstore(C_ALPHA_CUBE_LOC, mulmod(mload(C_ALPHA_SQR_LOC), alpha, p))
                mstore(C_ALPHA_QUAD_LOC, mulmod(mload(C_ALPHA_CUBE_LOC), alpha, p))
                mstore(C_ALPHA_BASE_LOC, alpha)

                /**
                 * Generate zeta challenge
                 */
                mstore(0x00, challenge)
                mstore(0x20, mload(T1_Y_LOC))
                mstore(0x40, mload(T1_X_LOC))
                mstore(0x60, mload(T2_Y_LOC))
                mstore(0x80, mload(T2_X_LOC))
                mstore(0xa0, mload(T3_Y_LOC))
                mstore(0xc0, mload(T3_X_LOC))
                mstore(0xe0, mload(T4_Y_LOC))
                mstore(0x100, mload(T4_X_LOC))

                challenge := keccak256(0x00, 0x120)

                mstore(C_ZETA_LOC, mod(challenge, p))
                mstore(C_CURRENT_LOC, challenge)
            }

            /**
             * EVALUATE FIELD OPERATIONS
             */

            /**
             * COMPUTE PUBLIC INPUT DELTA
             * ΔPI = ∏ᵢ∈ℓ(wᵢ + β σ(i) + γ) / ∏ᵢ∈ℓ(wᵢ + β σ'(i) + γ)
             */
            {
                let beta := mload(C_BETA_LOC) // β
                let gamma := mload(C_GAMMA_LOC) // γ
                let work_root := mload(OMEGA_LOC) // ω
                let numerator_value := 1
                let denominator_value := 1

                let p_clone := p // move p to the front of the stack
                let valid_inputs := true

                // Load the starting point of the public inputs (jump over the selector and the length of public inputs [0x24])
                let public_inputs_ptr := add(calldataload(0x24), 0x24)

                // endpoint_ptr = public_inputs_ptr + num_inputs * 0x20. // every public input is 0x20 bytes
                let endpoint_ptr := add(public_inputs_ptr, mul(mload(NUM_INPUTS_LOC), 0x20))

                // root_1 = β * 0x05
                let root_1 := mulmod(beta, 0x05, p_clone) // k1.β
                // root_2 = β * 0x0c
                let root_2 := mulmod(beta, 0x0c, p_clone)
                // @note 0x05 + 0x07 == 0x0c == external coset generator

                for {} lt(public_inputs_ptr, endpoint_ptr) { public_inputs_ptr := add(public_inputs_ptr, 0x20) } {
                    /**
                     * input = public_input[i]
                     * valid_inputs &= input < p
                     * temp = input + gamma
                     * numerator_value *= (β.σ(i) + wᵢ + γ)  // σ(i) = 0x05.ωⁱ
                     * denominator_value *= (β.σ'(i) + wᵢ + γ) // σ'(i) = 0x0c.ωⁱ
                     * root_1 *= ω
                     * root_2 *= ω
                     */

                    let input := calldataload(public_inputs_ptr)
                    valid_inputs := and(valid_inputs, lt(input, p_clone))
                    let temp := addmod(input, gamma, p_clone)

                    numerator_value := mulmod(numerator_value, add(root_1, temp), p_clone)
                    denominator_value := mulmod(denominator_value, add(root_2, temp), p_clone)

                    root_1 := mulmod(root_1, work_root, p_clone)
                    root_2 := mulmod(root_2, work_root, p_clone)
                }

                // Revert if not all public inputs are field elements (i.e. < p)
                if iszero(valid_inputs) {
                    mstore(0x00, PUBLIC_INPUT_GE_P_SELECTOR)
                    revert(0x00, 0x04)
                }

                mstore(DELTA_NUMERATOR_LOC, numerator_value)
                mstore(DELTA_DENOMINATOR_LOC, denominator_value)
            }

            /**
             * Compute Plookup delta factor [γ(1 + β)]^{n-k}
             * k = num roots cut out of Z_H = 4
             */
            {
                let delta_base := mulmod(mload(C_GAMMA_LOC), addmod(mload(C_BETA_LOC), 1, p), p)
                let delta_numerator := delta_base
                {
                    let exponent := mload(N_LOC)
                    let count := 1
                    for {} lt(count, exponent) { count := add(count, count) } {
                        delta_numerator := mulmod(delta_numerator, delta_numerator, p)
                    }
                }
                mstore(PLOOKUP_DELTA_NUMERATOR_LOC, delta_numerator)

                let delta_denominator := mulmod(delta_base, delta_base, p)
                delta_denominator := mulmod(delta_denominator, delta_denominator, p)
                mstore(PLOOKUP_DELTA_DENOMINATOR_LOC, delta_denominator)
            }
            /**
             * Compute lagrange poly and vanishing poly fractions
             */
            {
                /**
                 * vanishing_numerator = zeta
                 * ZETA_POW_N = zeta^n
                 * vanishing_numerator -= 1
                 * accumulating_root = omega_inverse
                 * work_root = p - accumulating_root
                 * domain_inverse = domain_inverse
                 * vanishing_denominator = zeta + work_root
                 * work_root *= accumulating_root
                 * vanishing_denominator *= (zeta + work_root)
                 * work_root *= accumulating_root
                 * vanishing_denominator *= (zeta + work_root)
                 * vanishing_denominator *= (zeta + (zeta + accumulating_root))
                 * work_root = omega
                 * lagrange_numerator = vanishing_numerator * domain_inverse
                 * l_start_denominator = zeta - 1
                 * accumulating_root = work_root^2
                 * l_end_denominator = accumulating_root^2 * work_root * zeta - 1
                 * Note: l_end_denominator term contains a term \omega^5 to cut out 5 roots of unity from vanishing poly
                 */

                let zeta := mload(C_ZETA_LOC)

                // compute zeta^n, where n is a power of 2
                let vanishing_numerator := zeta
                {
                    // pow_small
                    let exponent := mload(N_LOC)
                    let count := 1
                    for {} lt(count, exponent) { count := add(count, count) } {
                        vanishing_numerator := mulmod(vanishing_numerator, vanishing_numerator, p)
                    }
                }
                mstore(ZETA_POW_N_LOC, vanishing_numerator)
                vanishing_numerator := addmod(vanishing_numerator, sub(p, 1), p)

                let accumulating_root := mload(OMEGA_INVERSE_LOC)
                let work_root := sub(p, accumulating_root)
                let domain_inverse := mload(DOMAIN_INVERSE_LOC)

                let vanishing_denominator := addmod(zeta, work_root, p)
                work_root := mulmod(work_root, accumulating_root, p)
                vanishing_denominator := mulmod(vanishing_denominator, addmod(zeta, work_root, p), p)
                work_root := mulmod(work_root, accumulating_root, p)
                vanishing_denominator := mulmod(vanishing_denominator, addmod(zeta, work_root, p), p)
                vanishing_denominator :=
                    mulmod(vanishing_denominator, addmod(zeta, mulmod(work_root, accumulating_root, p), p), p)

                work_root := mload(OMEGA_LOC)

                let lagrange_numerator := mulmod(vanishing_numerator, domain_inverse, p)
                let l_start_denominator := addmod(zeta, sub(p, 1), p)

                accumulating_root := mulmod(work_root, work_root, p)

                let l_end_denominator :=
                    addmod(
                        mulmod(mulmod(mulmod(accumulating_root, accumulating_root, p), work_root, p), zeta, p), sub(p, 1), p
                    )

                /**
                 * Compute inversions using Montgomery's batch inversion trick
                 */
                let accumulator := mload(DELTA_DENOMINATOR_LOC)
                let t0 := accumulator
                accumulator := mulmod(accumulator, vanishing_denominator, p)
                let t1 := accumulator
                accumulator := mulmod(accumulator, vanishing_numerator, p)
                let t2 := accumulator
                accumulator := mulmod(accumulator, l_start_denominator, p)
                let t3 := accumulator
                accumulator := mulmod(accumulator, mload(PLOOKUP_DELTA_DENOMINATOR_LOC), p)
                let t4 := accumulator
                {
                    mstore(0, 0x20)
                    mstore(0x20, 0x20)
                    mstore(0x40, 0x20)
                    mstore(0x60, mulmod(accumulator, l_end_denominator, p))
                    mstore(0x80, sub(p, 2))
                    mstore(0xa0, p)
                    if iszero(staticcall(gas(), 0x05, 0x00, 0xc0, 0x00, 0x20)) {
                        mstore(0x0, MOD_EXP_FAILURE_SELECTOR)
                        revert(0x00, 0x04)
                    }
                    accumulator := mload(0x00)
                }

                t4 := mulmod(accumulator, t4, p)
                accumulator := mulmod(accumulator, l_end_denominator, p)

                t3 := mulmod(accumulator, t3, p)
                accumulator := mulmod(accumulator, mload(PLOOKUP_DELTA_DENOMINATOR_LOC), p)

                t2 := mulmod(accumulator, t2, p)
                accumulator := mulmod(accumulator, l_start_denominator, p)

                t1 := mulmod(accumulator, t1, p)
                accumulator := mulmod(accumulator, vanishing_numerator, p)

                t0 := mulmod(accumulator, t0, p)
                accumulator := mulmod(accumulator, vanishing_denominator, p)

                accumulator := mulmod(mulmod(accumulator, accumulator, p), mload(DELTA_DENOMINATOR_LOC), p)

                mstore(PUBLIC_INPUT_DELTA_LOC, mulmod(mload(DELTA_NUMERATOR_LOC), accumulator, p))
                mstore(ZERO_POLY_LOC, mulmod(vanishing_numerator, t0, p))
                mstore(ZERO_POLY_INVERSE_LOC, mulmod(vanishing_denominator, t1, p))
                mstore(L_START_LOC, mulmod(lagrange_numerator, t2, p))
                mstore(PLOOKUP_DELTA_LOC, mulmod(mload(PLOOKUP_DELTA_NUMERATOR_LOC), t3, p))
                mstore(L_END_LOC, mulmod(lagrange_numerator, t4, p))
            }

            /**
             * UltraPlonk Widget Ordering:
             *
             * 1. Permutation widget
             * 2. Plookup widget
             * 3. Arithmetic widget
             * 4. Fixed base widget (?)
             * 5. GenPermSort widget
             * 6. Elliptic widget
             * 7. Auxiliary widget
             */

            /**
             * COMPUTE PERMUTATION WIDGET EVALUATION
             */
            {
                let alpha := mload(C_ALPHA_LOC)
                let beta := mload(C_BETA_LOC)
                let gamma := mload(C_GAMMA_LOC)

                /**
                 * t1 = (W1 + gamma + beta * ID1) * (W2 + gamma + beta * ID2)
                 * t2 = (W3 + gamma + beta * ID3) * (W4 + gamma + beta * ID4)
                 * result = alpha_base * z_eval * t1 * t2
                 * t1 = (W1 + gamma + beta * sigma_1_eval) * (W2 + gamma + beta * sigma_2_eval)
                 * t2 = (W2 + gamma + beta * sigma_3_eval) * (W3 + gamma + beta * sigma_4_eval)
                 * result -= (alpha_base * z_omega_eval * t1 * t2)
                 */
                let t1 :=
                    mulmod(
                        add(add(mload(W1_EVAL_LOC), gamma), mulmod(beta, mload(ID1_EVAL_LOC), p)),
                        add(add(mload(W2_EVAL_LOC), gamma), mulmod(beta, mload(ID2_EVAL_LOC), p)),
                        p
                    )
                let t2 :=
                    mulmod(
                        add(add(mload(W3_EVAL_LOC), gamma), mulmod(beta, mload(ID3_EVAL_LOC), p)),
                        add(add(mload(W4_EVAL_LOC), gamma), mulmod(beta, mload(ID4_EVAL_LOC), p)),
                        p
                    )
                let result := mulmod(mload(C_ALPHA_BASE_LOC), mulmod(mload(Z_EVAL_LOC), mulmod(t1, t2, p), p), p)
                t1 :=
                    mulmod(
                        add(add(mload(W1_EVAL_LOC), gamma), mulmod(beta, mload(SIGMA1_EVAL_LOC), p)),
                        add(add(mload(W2_EVAL_LOC), gamma), mulmod(beta, mload(SIGMA2_EVAL_LOC), p)),
                        p
                    )
                t2 :=
                    mulmod(
                        add(add(mload(W3_EVAL_LOC), gamma), mulmod(beta, mload(SIGMA3_EVAL_LOC), p)),
                        add(add(mload(W4_EVAL_LOC), gamma), mulmod(beta, mload(SIGMA4_EVAL_LOC), p)),
                        p
                    )
                result :=
                    addmod(
                        result,
                        sub(p, mulmod(mload(C_ALPHA_BASE_LOC), mulmod(mload(Z_OMEGA_EVAL_LOC), mulmod(t1, t2, p), p), p)),
                        p
                    )

                /**
                 * alpha_base *= alpha
                 * result += alpha_base . (L_{n-k}(ʓ) . (z(ʓ.ω) - ∆_{PI}))
                 * alpha_base *= alpha
                 * result += alpha_base . (L_1(ʓ)(Z(ʓ) - 1))
                 * alpha_Base *= alpha
                 */
                mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_LOC), p))
                result :=
                    addmod(
                        result,
                        mulmod(
                            mload(C_ALPHA_BASE_LOC),
                            mulmod(
                                mload(L_END_LOC),
                                addmod(mload(Z_OMEGA_EVAL_LOC), sub(p, mload(PUBLIC_INPUT_DELTA_LOC)), p),
                                p
                            ),
                            p
                        ),
                        p
                    )
                mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_LOC), p))
                mstore(
                    PERMUTATION_IDENTITY,
                    addmod(
                        result,
                        mulmod(
                            mload(C_ALPHA_BASE_LOC),
                            mulmod(mload(L_START_LOC), addmod(mload(Z_EVAL_LOC), sub(p, 1), p), p),
                            p
                        ),
                        p
                    )
                )
                mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_LOC), p))
            }

            /**
             * COMPUTE PLOOKUP WIDGET EVALUATION
             */
            {
                /**
                 * Goal: f = (w1(z) + q2.w1(zω)) + η(w2(z) + qm.w2(zω)) + η²(w3(z) + qc.w_3(zω)) + q3(z).η³
                 * f = η.q3(z)
                 * f += (w3(z) + qc.w_3(zω))
                 * f *= η
                 * f += (w2(z) + qm.w2(zω))
                 * f *= η
                 * f += (w1(z) + q2.w1(zω))
                 */
                let f := mulmod(mload(C_ETA_LOC), mload(Q3_EVAL_LOC), p)
                f :=
                    addmod(f, addmod(mload(W3_EVAL_LOC), mulmod(mload(QC_EVAL_LOC), mload(W3_OMEGA_EVAL_LOC), p), p), p)
                f := mulmod(f, mload(C_ETA_LOC), p)
                f :=
                    addmod(f, addmod(mload(W2_EVAL_LOC), mulmod(mload(QM_EVAL_LOC), mload(W2_OMEGA_EVAL_LOC), p), p), p)
                f := mulmod(f, mload(C_ETA_LOC), p)
                f :=
                    addmod(f, addmod(mload(W1_EVAL_LOC), mulmod(mload(Q2_EVAL_LOC), mload(W1_OMEGA_EVAL_LOC), p), p), p)

                // t(z) = table4(z).η³ + table3(z).η² + table2(z).η + table1(z)
                let t :=
                    addmod(
                        addmod(
                            addmod(
                                mulmod(mload(TABLE4_EVAL_LOC), mload(C_ETA_CUBE_LOC), p),
                                mulmod(mload(TABLE3_EVAL_LOC), mload(C_ETA_SQR_LOC), p),
                                p
                            ),
                            mulmod(mload(TABLE2_EVAL_LOC), mload(C_ETA_LOC), p),
                            p
                        ),
                        mload(TABLE1_EVAL_LOC),
                        p
                    )

                // t(zw) = table4(zw).η³ + table3(zw).η² + table2(zw).η + table1(zw)
                let t_omega :=
                    addmod(
                        addmod(
                            addmod(
                                mulmod(mload(TABLE4_OMEGA_EVAL_LOC), mload(C_ETA_CUBE_LOC), p),
                                mulmod(mload(TABLE3_OMEGA_EVAL_LOC), mload(C_ETA_SQR_LOC), p),
                                p
                            ),
                            mulmod(mload(TABLE2_OMEGA_EVAL_LOC), mload(C_ETA_LOC), p),
                            p
                        ),
                        mload(TABLE1_OMEGA_EVAL_LOC),
                        p
                    )

                /**
                 * Goal: numerator = (TABLE_TYPE_EVAL * f(z) + γ) * (t(z) + βt(zω) + γ(β + 1)) * (β + 1)
                 * gamma_beta_constant = γ(β + 1)
                 * numerator = f * TABLE_TYPE_EVAL + gamma
                 * temp0 = t(z) + t(zω) * β + gamma_beta_constant
                 * numerator *= temp0
                 * numerator *= (β + 1)
                 * temp0 = alpha * l_1
                 * numerator += temp0
                 * numerator *= z_lookup(z)
                 * numerator -= temp0
                 */
                let gamma_beta_constant := mulmod(mload(C_GAMMA_LOC), addmod(mload(C_BETA_LOC), 1, p), p)
                let numerator := addmod(mulmod(f, mload(TABLE_TYPE_EVAL_LOC), p), mload(C_GAMMA_LOC), p)
                let temp0 := addmod(addmod(t, mulmod(t_omega, mload(C_BETA_LOC), p), p), gamma_beta_constant, p)
                numerator := mulmod(numerator, temp0, p)
                numerator := mulmod(numerator, addmod(mload(C_BETA_LOC), 1, p), p)
                temp0 := mulmod(mload(C_ALPHA_LOC), mload(L_START_LOC), p)
                numerator := addmod(numerator, temp0, p)
                numerator := mulmod(numerator, mload(Z_LOOKUP_EVAL_LOC), p)
                numerator := addmod(numerator, sub(p, temp0), p)

                /**
                 * Goal: denominator = z_lookup(zω)*[s(z) + βs(zω) + γ(1 + β)] - [z_lookup(zω) - [γ(1 + β)]^{n-k}]*α²L_end(z)
                 * note: delta_factor = [γ(1 + β)]^{n-k}
                 * denominator = s(z) + βs(zω) + γ(β + 1)
                 * temp1 = α²L_end(z)
                 * denominator -= temp1
                 * denominator *= z_lookup(zω)
                 * denominator += temp1 * delta_factor
                 * PLOOKUP_IDENTITY = (numerator - denominator).alpha_base
                 * alpha_base *= alpha^3
                 */
                let denominator :=
                    addmod(
                        addmod(mload(S_EVAL_LOC), mulmod(mload(S_OMEGA_EVAL_LOC), mload(C_BETA_LOC), p), p),
                        gamma_beta_constant,
                        p
                    )
                let temp1 := mulmod(mload(C_ALPHA_SQR_LOC), mload(L_END_LOC), p)
                denominator := addmod(denominator, sub(p, temp1), p)
                denominator := mulmod(denominator, mload(Z_LOOKUP_OMEGA_EVAL_LOC), p)
                denominator := addmod(denominator, mulmod(temp1, mload(PLOOKUP_DELTA_LOC), p), p)

                mstore(PLOOKUP_IDENTITY, mulmod(addmod(numerator, sub(p, denominator), p), mload(C_ALPHA_BASE_LOC), p))

                // update alpha
                mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_CUBE_LOC), p))
            }

            /**
             * COMPUTE ARITHMETIC WIDGET EVALUATION
             */
            {
                /**
                 * The basic arithmetic gate identity in standard plonk is as follows.
                 * (w_1 . w_2 . q_m) + (w_1 . q_1) + (w_2 . q_2) + (w_3 . q_3) + (w_4 . q_4) + q_c = 0
                 * However, for Ultraplonk, we extend this to support "passing" wires between rows (shown without alpha scaling below):
                 * q_arith * ( ( (-1/2) * (q_arith - 3) * q_m * w_1 * w_2 + q_1 * w_1 + q_2 * w_2 + q_3 * w_3 + q_4 * w_4 + q_c ) +
                 * (q_arith - 1)*( α * (q_arith - 2) * (w_1 + w_4 - w_1_omega + q_m) + w_4_omega) ) = 0
                 *
                 * This formula results in several cases depending on q_arith:
                 * 1. q_arith == 0: Arithmetic gate is completely disabled
                 *
                 * 2. q_arith == 1: Everything in the minigate on the right is disabled. The equation is just a standard plonk equation
                 * with extra wires: q_m * w_1 * w_2 + q_1 * w_1 + q_2 * w_2 + q_3 * w_3 + q_4 * w_4 + q_c = 0
                 *
                 * 3. q_arith == 2: The (w_1 + w_4 - ...) term is disabled. THe equation is:
                 * (1/2) * q_m * w_1 * w_2 + q_1 * w_1 + q_2 * w_2 + q_3 * w_3 + q_4 * w_4 + q_c + w_4_omega = 0
                 * It allows defining w_4 at next index (w_4_omega) in terms of current wire values
                 *
                 * 4. q_arith == 3: The product of w_1 and w_2 is disabled, but a mini addition gate is enabled. α allows us to split
                 * the equation into two:
                 *
                 * q_1 * w_1 + q_2 * w_2 + q_3 * w_3 + q_4 * w_4 + q_c + 2 * w_4_omega = 0
                 * and
                 * w_1 + w_4 - w_1_omega + q_m = 0  (we are reusing q_m here)
                 *
                 * 5. q_arith > 3: The product of w_1 and w_2 is scaled by (q_arith - 3), while the w_4_omega term is scaled by (q_arith - 1).
                 * The equation can be split into two:
                 *
                 * (q_arith - 3)* q_m * w_1 * w_ 2 + q_1 * w_1 + q_2 * w_2 + q_3 * w_3 + q_4 * w_4 + q_c + (q_arith - 1) * w_4_omega = 0
                 * and
                 * w_1 + w_4 - w_1_omega + q_m = 0
                 *
                 * The problem that q_m is used both in both equations can be dealt with by appropriately changing selector values at
                 * the next gate. Then we can treat (q_arith - 1) as a simulated q_6 selector and scale q_m to handle (q_arith - 3) at
                 * product.
                 */

                let w1q1 := mulmod(mload(W1_EVAL_LOC), mload(Q1_EVAL_LOC), p)
                let w2q2 := mulmod(mload(W2_EVAL_LOC), mload(Q2_EVAL_LOC), p)
                let w3q3 := mulmod(mload(W3_EVAL_LOC), mload(Q3_EVAL_LOC), p)
                let w4q3 := mulmod(mload(W4_EVAL_LOC), mload(Q4_EVAL_LOC), p)

                // @todo - Add a explicit test that hits QARITH == 3
                // w1w2qm := (w_1 . w_2 . q_m . (QARITH_EVAL_LOC - 3)) / 2
                let w1w2qm :=
                    mulmod(
                        mulmod(
                            mulmod(mulmod(mload(W1_EVAL_LOC), mload(W2_EVAL_LOC), p), mload(QM_EVAL_LOC), p),
                            addmod(mload(QARITH_EVAL_LOC), sub(p, 3), p),
                            p
                        ),
                        NEGATIVE_INVERSE_OF_2_MODULO_P,
                        p
                    )

                // (w_1 . w_2 . q_m . (q_arith - 3)) / -2) + (w_1 . q_1) + (w_2 . q_2) + (w_3 . q_3) + (w_4 . q_4) + q_c
                let identity :=
                    addmod(
                        mload(QC_EVAL_LOC), addmod(w4q3, addmod(w3q3, addmod(w2q2, addmod(w1q1, w1w2qm, p), p), p), p), p
                    )

                // if q_arith == 3 we evaluate an additional mini addition gate (on top of the regular one), where:
                // w_1 + w_4 - w_1_omega + q_m = 0
                // we use this gate to save an addition gate when adding or subtracting non-native field elements
                // α * (q_arith - 2) * (w_1 + w_4 - w_1_omega + q_m)
                let extra_small_addition_gate_identity :=
                    mulmod(
                        mload(C_ALPHA_LOC),
                        mulmod(
                            addmod(mload(QARITH_EVAL_LOC), sub(p, 2), p),
                            addmod(
                                mload(QM_EVAL_LOC),
                                addmod(
                                    sub(p, mload(W1_OMEGA_EVAL_LOC)), addmod(mload(W1_EVAL_LOC), mload(W4_EVAL_LOC), p), p
                                ),
                                p
                            ),
                            p
                        ),
                        p
                    )

                // if q_arith == 2 OR q_arith == 3 we add the 4th wire of the NEXT gate into the arithmetic identity
                // N.B. if q_arith > 2, this wire value will be scaled by (q_arith - 1) relative to the other gate wires!
                // alpha_base * q_arith * (identity + (q_arith - 1) * (w_4_omega + extra_small_addition_gate_identity))
                mstore(
                    ARITHMETIC_IDENTITY,
                    mulmod(
                        mload(C_ALPHA_BASE_LOC),
                        mulmod(
                            mload(QARITH_EVAL_LOC),
                            addmod(
                                identity,
                                mulmod(
                                    addmod(mload(QARITH_EVAL_LOC), sub(p, 1), p),
                                    addmod(mload(W4_OMEGA_EVAL_LOC), extra_small_addition_gate_identity, p),
                                    p
                                ),
                                p
                            ),
                            p
                        ),
                        p
                    )
                )

                // update alpha
                mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_SQR_LOC), p))
            }

            /**
             * COMPUTE GENPERMSORT WIDGET EVALUATION
             */
            {
                /**
                 * D1 = (w2 - w1)
                 * D2 = (w3 - w2)
                 * D3 = (w4 - w3)
                 * D4 = (w1_omega - w4)
                 *
                 * α_a = alpha_base
                 * α_b = alpha_base * α
                 * α_c = alpha_base * α^2
                 * α_d = alpha_base * α^3
                 *
                 * range_accumulator = (
                 *   D1(D1 - 1)(D1 - 2)(D1 - 3).α_a +
                 *   D2(D2 - 1)(D2 - 2)(D2 - 3).α_b +
                 *   D3(D3 - 1)(D3 - 2)(D3 - 3).α_c +
                 *   D4(D4 - 1)(D4 - 2)(D4 - 3).α_d +
                 * ) . q_sort
                 */
                let minus_two := sub(p, 2)
                let minus_three := sub(p, 3)
                let d1 := addmod(mload(W2_EVAL_LOC), sub(p, mload(W1_EVAL_LOC)), p)
                let d2 := addmod(mload(W3_EVAL_LOC), sub(p, mload(W2_EVAL_LOC)), p)
                let d3 := addmod(mload(W4_EVAL_LOC), sub(p, mload(W3_EVAL_LOC)), p)
                let d4 := addmod(mload(W1_OMEGA_EVAL_LOC), sub(p, mload(W4_EVAL_LOC)), p)

                let range_accumulator :=
                    mulmod(
                        mulmod(
                            mulmod(addmod(mulmod(d1, d1, p), sub(p, d1), p), addmod(d1, minus_two, p), p),
                            addmod(d1, minus_three, p),
                            p
                        ),
                        mload(C_ALPHA_BASE_LOC),
                        p
                    )
                range_accumulator :=
                    addmod(
                        range_accumulator,
                        mulmod(
                            mulmod(
                                mulmod(addmod(mulmod(d2, d2, p), sub(p, d2), p), addmod(d2, minus_two, p), p),
                                addmod(d2, minus_three, p),
                                p
                            ),
                            mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_LOC), p),
                            p
                        ),
                        p
                    )
                range_accumulator :=
                    addmod(
                        range_accumulator,
                        mulmod(
                            mulmod(
                                mulmod(addmod(mulmod(d3, d3, p), sub(p, d3), p), addmod(d3, minus_two, p), p),
                                addmod(d3, minus_three, p),
                                p
                            ),
                            mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_SQR_LOC), p),
                            p
                        ),
                        p
                    )
                range_accumulator :=
                    addmod(
                        range_accumulator,
                        mulmod(
                            mulmod(
                                mulmod(addmod(mulmod(d4, d4, p), sub(p, d4), p), addmod(d4, minus_two, p), p),
                                addmod(d4, minus_three, p),
                                p
                            ),
                            mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_CUBE_LOC), p),
                            p
                        ),
                        p
                    )
                range_accumulator := mulmod(range_accumulator, mload(QSORT_EVAL_LOC), p)

                mstore(SORT_IDENTITY, range_accumulator)

                // update alpha
                mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_QUAD_LOC), p))
            }

            /**
             * COMPUTE ELLIPTIC WIDGET EVALUATION
             */
            {
                /**
                 * endo_term = (-x_2) * x_1 * (x_3 * 2 + x_1) * q_beta
                 * endo_sqr_term = x_2^2
                 * endo_sqr_term *= (x_3 - x_1)
                 * endo_sqr_term *= q_beta^2
                 * leftovers = x_2^2
                 * leftovers *= x_2
                 * leftovers += x_1^2 * (x_3 + x_1) @follow-up Invalid comment in BB widget
                 * leftovers -= (y_2^2 + y_1^2)
                 * sign_term = y_2 * y_1
                 * sign_term += sign_term
                 * sign_term *= q_sign
                 */
                // q_elliptic * (x3 + x2 + x1)(x2 - x1)(x2 - x1) - y2^2 - y1^2 + 2(y2y1)*q_sign = 0
                let x_diff := addmod(mload(X2_EVAL_LOC), sub(p, mload(X1_EVAL_LOC)), p)
                let y2_sqr := mulmod(mload(Y2_EVAL_LOC), mload(Y2_EVAL_LOC), p)
                let y1_sqr := mulmod(mload(Y1_EVAL_LOC), mload(Y1_EVAL_LOC), p)
                let y1y2 := mulmod(mulmod(mload(Y1_EVAL_LOC), mload(Y2_EVAL_LOC), p), mload(QSIGN_LOC), p)

                let x_add_identity :=
                    addmod(
                        mulmod(
                            addmod(mload(X3_EVAL_LOC), addmod(mload(X2_EVAL_LOC), mload(X1_EVAL_LOC), p), p),
                            mulmod(x_diff, x_diff, p),
                            p
                        ),
                        addmod(
                            sub(
                                p,
                                addmod(y2_sqr, y1_sqr, p)
                            ),
                            addmod(y1y2, y1y2, p),
                            p
                        ),
                        p
                    )
                x_add_identity :=
                    mulmod(
                        mulmod(
                            x_add_identity,
                            addmod(
                                1,
                                sub(p, mload(QM_EVAL_LOC)),
                                p
                            ),
                            p
                        ),
                        mload(C_ALPHA_BASE_LOC),
                        p
                    )

                // q_elliptic * (x3 + x2 + x1)(x2 - x1)(x2 - x1) - y2^2 - y1^2 + 2(y2y1)*q_sign = 0
                let y1_plus_y3 := addmod(
                    mload(Y1_EVAL_LOC),
                    mload(Y3_EVAL_LOC),
                    p
                )
                let y_diff := addmod(mulmod(mload(Y2_EVAL_LOC), mload(QSIGN_LOC), p), sub(p, mload(Y1_EVAL_LOC)), p)
                let y_add_identity :=
                    addmod(
                        mulmod(y1_plus_y3, x_diff, p),
                        mulmod(addmod(mload(X3_EVAL_LOC), sub(p, mload(X1_EVAL_LOC)), p), y_diff, p),
                        p
                    )
                y_add_identity :=
                    mulmod(
                        mulmod(y_add_identity, addmod(1, sub(p, mload(QM_EVAL_LOC)), p), p),
                        mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_LOC), p),
                        p
                    )

                // ELLIPTIC_IDENTITY = (x_identity + y_identity) * Q_ELLIPTIC_EVAL
                mstore(
                    ELLIPTIC_IDENTITY, mulmod(addmod(x_add_identity, y_add_identity, p), mload(QELLIPTIC_EVAL_LOC), p)
                )
            }
            {
                /**
                 * x_pow_4 = (y_1_sqr - curve_b) * x_1;
                 * y_1_sqr_mul_4 = y_1_sqr + y_1_sqr;
                 * y_1_sqr_mul_4 += y_1_sqr_mul_4;
                 * x_1_pow_4_mul_9 = x_pow_4;
                 * x_1_pow_4_mul_9 += x_1_pow_4_mul_9;
                 * x_1_pow_4_mul_9 += x_1_pow_4_mul_9;
                 * x_1_pow_4_mul_9 += x_1_pow_4_mul_9;
                 * x_1_pow_4_mul_9 += x_pow_4;
                 * x_1_sqr_mul_3 = x_1_sqr + x_1_sqr + x_1_sqr;
                 * x_double_identity = (x_3 + x_1 + x_1) * y_1_sqr_mul_4 - x_1_pow_4_mul_9;
                 * y_double_identity = x_1_sqr_mul_3 * (x_1 - x_3) - (y_1 + y_1) * (y_1 + y_3);
                 */
                // (x3 + x1 + x1) (4y1*y1) - 9 * x1 * x1 * x1 * x1 = 0
                let x1_sqr := mulmod(mload(X1_EVAL_LOC), mload(X1_EVAL_LOC), p)
                let y1_sqr := mulmod(mload(Y1_EVAL_LOC), mload(Y1_EVAL_LOC), p)
                let x_pow_4 := mulmod(addmod(y1_sqr, GRUMPKIN_CURVE_B_PARAMETER_NEGATED, p), mload(X1_EVAL_LOC), p)
                let y1_sqr_mul_4 := mulmod(y1_sqr, 4, p)
                let x1_pow_4_mul_9 := mulmod(x_pow_4, 9, p)
                let x1_sqr_mul_3 := mulmod(x1_sqr, 3, p)
                let x_double_identity :=
                    addmod(
                        mulmod(
                            addmod(mload(X3_EVAL_LOC), addmod(mload(X1_EVAL_LOC), mload(X1_EVAL_LOC), p), p),
                            y1_sqr_mul_4,
                            p
                        ),
                        sub(p, x1_pow_4_mul_9),
                        p
                    )
                // (y1 + y1) (2y1) - (3 * x1 * x1)(x1 - x3) = 0
                let y_double_identity :=
                    addmod(
                        mulmod(x1_sqr_mul_3, addmod(mload(X1_EVAL_LOC), sub(p, mload(X3_EVAL_LOC)), p), p),
                        sub(
                            p,
                            mulmod(
                                addmod(mload(Y1_EVAL_LOC), mload(Y1_EVAL_LOC), p),
                                addmod(mload(Y1_EVAL_LOC), mload(Y3_EVAL_LOC), p),
                                p
                            )
                        ),
                        p
                    )
                x_double_identity := mulmod(x_double_identity, mload(C_ALPHA_BASE_LOC), p)
                y_double_identity :=
                    mulmod(y_double_identity, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_LOC), p), p)
                x_double_identity := mulmod(x_double_identity, mload(QM_EVAL_LOC), p)
                y_double_identity := mulmod(y_double_identity, mload(QM_EVAL_LOC), p)
                // ELLIPTIC_IDENTITY += (x_double_identity + y_double_identity) * Q_DOUBLE_EVAL
                mstore(
                    ELLIPTIC_IDENTITY,
                    addmod(
                        mload(ELLIPTIC_IDENTITY),
                        mulmod(addmod(x_double_identity, y_double_identity, p), mload(QELLIPTIC_EVAL_LOC), p),
                        p
                    )
                )

                // update alpha
                mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_QUAD_LOC), p))
            }

            /**
             * COMPUTE AUXILIARY WIDGET EVALUATION
             */
            {
                {
                    /**
                     * Non native field arithmetic gate 2
                     *             _                                                                               _
                     *            /   _                   _                               _       14                \
                     * q_2 . q_4 |   (w_1 . w_2) + (w_1 . w_2) + (w_1 . w_4 + w_2 . w_3 - w_3) . 2    - w_3 - w_4   |
                     *            \_                                                                               _/
                     *
                     * limb_subproduct = w_1 . w_2_omega + w_1_omega . w_2
                     * non_native_field_gate_2 = w_1 * w_4 + w_4 * w_3 - w_3_omega
                     * non_native_field_gate_2 = non_native_field_gate_2 * limb_size
                     * non_native_field_gate_2 -= w_4_omega
                     * non_native_field_gate_2 += limb_subproduct
                     * non_native_field_gate_2 *= q_4
                     * limb_subproduct *= limb_size
                     * limb_subproduct += w_1_omega * w_2_omega
                     * non_native_field_gate_1 = (limb_subproduct + w_3 + w_4) * q_3
                     * non_native_field_gate_3 = (limb_subproduct + w_4 - (w_3_omega + w_4_omega)) * q_m
                     * non_native_field_identity = (non_native_field_gate_1 + non_native_field_gate_2 + non_native_field_gate_3) * q_2
                     */

                    let limb_subproduct :=
                        addmod(
                            mulmod(mload(W1_EVAL_LOC), mload(W2_OMEGA_EVAL_LOC), p),
                            mulmod(mload(W1_OMEGA_EVAL_LOC), mload(W2_EVAL_LOC), p),
                            p
                        )

                    let non_native_field_gate_2 :=
                        addmod(
                            addmod(
                                mulmod(mload(W1_EVAL_LOC), mload(W4_EVAL_LOC), p),
                                mulmod(mload(W2_EVAL_LOC), mload(W3_EVAL_LOC), p),
                                p
                            ),
                            sub(p, mload(W3_OMEGA_EVAL_LOC)),
                            p
                        )
                    non_native_field_gate_2 := mulmod(non_native_field_gate_2, LIMB_SIZE, p)
                    non_native_field_gate_2 := addmod(non_native_field_gate_2, sub(p, mload(W4_OMEGA_EVAL_LOC)), p)
                    non_native_field_gate_2 := addmod(non_native_field_gate_2, limb_subproduct, p)
                    non_native_field_gate_2 := mulmod(non_native_field_gate_2, mload(Q4_EVAL_LOC), p)
                    limb_subproduct := mulmod(limb_subproduct, LIMB_SIZE, p)
                    limb_subproduct :=
                        addmod(limb_subproduct, mulmod(mload(W1_OMEGA_EVAL_LOC), mload(W2_OMEGA_EVAL_LOC), p), p)
                    let non_native_field_gate_1 :=
                        mulmod(
                            addmod(limb_subproduct, sub(p, addmod(mload(W3_EVAL_LOC), mload(W4_EVAL_LOC), p)), p),
                            mload(Q3_EVAL_LOC),
                            p
                        )
                    let non_native_field_gate_3 :=
                        mulmod(
                            addmod(
                                addmod(limb_subproduct, mload(W4_EVAL_LOC), p),
                                sub(p, addmod(mload(W3_OMEGA_EVAL_LOC), mload(W4_OMEGA_EVAL_LOC), p)),
                                p
                            ),
                            mload(QM_EVAL_LOC),
                            p
                        )
                    let non_native_field_identity :=
                        mulmod(
                            addmod(addmod(non_native_field_gate_1, non_native_field_gate_2, p), non_native_field_gate_3, p),
                            mload(Q2_EVAL_LOC),
                            p
                        )

                    mstore(AUX_NON_NATIVE_FIELD_EVALUATION, non_native_field_identity)
                }

                {
                    /**
                     * limb_accumulator_1 = w_2_omega;
                     * limb_accumulator_1 *= SUBLIMB_SHIFT;
                     * limb_accumulator_1 += w_1_omega;
                     * limb_accumulator_1 *= SUBLIMB_SHIFT;
                     * limb_accumulator_1 += w_3;
                     * limb_accumulator_1 *= SUBLIMB_SHIFT;
                     * limb_accumulator_1 += w_2;
                     * limb_accumulator_1 *= SUBLIMB_SHIFT;
                     * limb_accumulator_1 += w_1;
                     * limb_accumulator_1 -= w_4;
                     * limb_accumulator_1 *= q_4;
                     */
                    let limb_accumulator_1 := mulmod(mload(W2_OMEGA_EVAL_LOC), SUBLIMB_SHIFT, p)
                    limb_accumulator_1 := addmod(limb_accumulator_1, mload(W1_OMEGA_EVAL_LOC), p)
                    limb_accumulator_1 := mulmod(limb_accumulator_1, SUBLIMB_SHIFT, p)
                    limb_accumulator_1 := addmod(limb_accumulator_1, mload(W3_EVAL_LOC), p)
                    limb_accumulator_1 := mulmod(limb_accumulator_1, SUBLIMB_SHIFT, p)
                    limb_accumulator_1 := addmod(limb_accumulator_1, mload(W2_EVAL_LOC), p)
                    limb_accumulator_1 := mulmod(limb_accumulator_1, SUBLIMB_SHIFT, p)
                    limb_accumulator_1 := addmod(limb_accumulator_1, mload(W1_EVAL_LOC), p)
                    limb_accumulator_1 := addmod(limb_accumulator_1, sub(p, mload(W4_EVAL_LOC)), p)
                    limb_accumulator_1 := mulmod(limb_accumulator_1, mload(Q4_EVAL_LOC), p)

                    /**
                     * limb_accumulator_2 = w_3_omega;
                     * limb_accumulator_2 *= SUBLIMB_SHIFT;
                     * limb_accumulator_2 += w_2_omega;
                     * limb_accumulator_2 *= SUBLIMB_SHIFT;
                     * limb_accumulator_2 += w_1_omega;
                     * limb_accumulator_2 *= SUBLIMB_SHIFT;
                     * limb_accumulator_2 += w_4;
                     * limb_accumulator_2 *= SUBLIMB_SHIFT;
                     * limb_accumulator_2 += w_3;
                     * limb_accumulator_2 -= w_4_omega;
                     * limb_accumulator_2 *= q_m;
                     */
                    let limb_accumulator_2 := mulmod(mload(W3_OMEGA_EVAL_LOC), SUBLIMB_SHIFT, p)
                    limb_accumulator_2 := addmod(limb_accumulator_2, mload(W2_OMEGA_EVAL_LOC), p)
                    limb_accumulator_2 := mulmod(limb_accumulator_2, SUBLIMB_SHIFT, p)
                    limb_accumulator_2 := addmod(limb_accumulator_2, mload(W1_OMEGA_EVAL_LOC), p)
                    limb_accumulator_2 := mulmod(limb_accumulator_2, SUBLIMB_SHIFT, p)
                    limb_accumulator_2 := addmod(limb_accumulator_2, mload(W4_EVAL_LOC), p)
                    limb_accumulator_2 := mulmod(limb_accumulator_2, SUBLIMB_SHIFT, p)
                    limb_accumulator_2 := addmod(limb_accumulator_2, mload(W3_EVAL_LOC), p)
                    limb_accumulator_2 := addmod(limb_accumulator_2, sub(p, mload(W4_OMEGA_EVAL_LOC)), p)
                    limb_accumulator_2 := mulmod(limb_accumulator_2, mload(QM_EVAL_LOC), p)

                    mstore(
                        AUX_LIMB_ACCUMULATOR_EVALUATION,
                        mulmod(addmod(limb_accumulator_1, limb_accumulator_2, p), mload(Q3_EVAL_LOC), p)
                    )
                }

                {
                    /**
                     * memory_record_check = w_3;
                     * memory_record_check *= eta;
                     * memory_record_check += w_2;
                     * memory_record_check *= eta;
                     * memory_record_check += w_1;
                     * memory_record_check *= eta;
                     * memory_record_check += q_c;
                     *
                     * partial_record_check = memory_record_check;
                     *
                     * memory_record_check -= w_4;
                     */

                    let memory_record_check := mulmod(mload(W3_EVAL_LOC), mload(C_ETA_LOC), p)
                    memory_record_check := addmod(memory_record_check, mload(W2_EVAL_LOC), p)
                    memory_record_check := mulmod(memory_record_check, mload(C_ETA_LOC), p)
                    memory_record_check := addmod(memory_record_check, mload(W1_EVAL_LOC), p)
                    memory_record_check := mulmod(memory_record_check, mload(C_ETA_LOC), p)
                    memory_record_check := addmod(memory_record_check, mload(QC_EVAL_LOC), p)

                    let partial_record_check := memory_record_check
                    memory_record_check := addmod(memory_record_check, sub(p, mload(W4_EVAL_LOC)), p)

                    mstore(AUX_MEMORY_EVALUATION, memory_record_check)

                    // index_delta = w_1_omega - w_1
                    let index_delta := addmod(mload(W1_OMEGA_EVAL_LOC), sub(p, mload(W1_EVAL_LOC)), p)
                    // record_delta = w_4_omega - w_4
                    let record_delta := addmod(mload(W4_OMEGA_EVAL_LOC), sub(p, mload(W4_EVAL_LOC)), p)
                    // index_is_monotonically_increasing = index_delta * (index_delta - 1)
                    let index_is_monotonically_increasing := mulmod(index_delta, addmod(index_delta, sub(p, 1), p), p)

                    // adjacent_values_match_if_adjacent_indices_match = record_delta * (1 - index_delta)
                    let adjacent_values_match_if_adjacent_indices_match :=
                        mulmod(record_delta, addmod(1, sub(p, index_delta), p), p)

                    // AUX_ROM_CONSISTENCY_EVALUATION = ((adjacent_values_match_if_adjacent_indices_match * alpha) + index_is_monotonically_increasing) * alpha + partial_record_check
                    mstore(
                        AUX_ROM_CONSISTENCY_EVALUATION,
                        addmod(
                            mulmod(
                                addmod(
                                    mulmod(adjacent_values_match_if_adjacent_indices_match, mload(C_ALPHA_LOC), p),
                                    index_is_monotonically_increasing,
                                    p
                                ),
                                mload(C_ALPHA_LOC),
                                p
                            ),
                            memory_record_check,
                            p
                        )
                    )

                    {
                        /**
                         * next_gate_access_type = w_3_omega;
                         * next_gate_access_type *= eta;
                         * next_gate_access_type += w_2_omega;
                         * next_gate_access_type *= eta;
                         * next_gate_access_type += w_1_omega;
                         * next_gate_access_type *= eta;
                         * next_gate_access_type = w_4_omega - next_gate_access_type;
                         */
                        let next_gate_access_type := mulmod(mload(W3_OMEGA_EVAL_LOC), mload(C_ETA_LOC), p)
                        next_gate_access_type := addmod(next_gate_access_type, mload(W2_OMEGA_EVAL_LOC), p)
                        next_gate_access_type := mulmod(next_gate_access_type, mload(C_ETA_LOC), p)
                        next_gate_access_type := addmod(next_gate_access_type, mload(W1_OMEGA_EVAL_LOC), p)
                        next_gate_access_type := mulmod(next_gate_access_type, mload(C_ETA_LOC), p)
                        next_gate_access_type := addmod(mload(W4_OMEGA_EVAL_LOC), sub(p, next_gate_access_type), p)

                        // value_delta = w_3_omega - w_3
                        let value_delta := addmod(mload(W3_OMEGA_EVAL_LOC), sub(p, mload(W3_EVAL_LOC)), p)
                        //  adjacent_values_match_if_adjacent_indices_match_and_next_access_is_a_read_operation = (1 - index_delta) * value_delta * (1 - next_gate_access_type);

                        let adjacent_values_match_if_adjacent_indices_match_and_next_access_is_a_read_operation :=
                            mulmod(
                                addmod(1, sub(p, index_delta), p),
                                mulmod(value_delta, addmod(1, sub(p, next_gate_access_type), p), p),
                                p
                            )

                        // AUX_RAM_CONSISTENCY_EVALUATION

                        /**
                         * access_type = w_4 - partial_record_check
                         * access_check = access_type^2 - access_type
                         * next_gate_access_type_is_boolean = next_gate_access_type^2 - next_gate_access_type
                         * RAM_consistency_check_identity = adjacent_values_match_if_adjacent_indices_match_and_next_access_is_a_read_operation;
                         * RAM_consistency_check_identity *= alpha;
                         * RAM_consistency_check_identity += index_is_monotonically_increasing;
                         * RAM_consistency_check_identity *= alpha;
                         * RAM_consistency_check_identity += next_gate_access_type_is_boolean;
                         * RAM_consistency_check_identity *= alpha;
                         * RAM_consistency_check_identity += access_check;
                         */

                        let access_type := addmod(mload(W4_EVAL_LOC), sub(p, partial_record_check), p)
                        let access_check := mulmod(access_type, addmod(access_type, sub(p, 1), p), p)
                        let next_gate_access_type_is_boolean :=
                            mulmod(next_gate_access_type, addmod(next_gate_access_type, sub(p, 1), p), p)
                        let RAM_cci :=
                            mulmod(
                                adjacent_values_match_if_adjacent_indices_match_and_next_access_is_a_read_operation,
                                mload(C_ALPHA_LOC),
                                p
                            )
                        RAM_cci := addmod(RAM_cci, index_is_monotonically_increasing, p)
                        RAM_cci := mulmod(RAM_cci, mload(C_ALPHA_LOC), p)
                        RAM_cci := addmod(RAM_cci, next_gate_access_type_is_boolean, p)
                        RAM_cci := mulmod(RAM_cci, mload(C_ALPHA_LOC), p)
                        RAM_cci := addmod(RAM_cci, access_check, p)

                        mstore(AUX_RAM_CONSISTENCY_EVALUATION, RAM_cci)
                    }

                    {
                        // timestamp_delta = w_2_omega - w_2
                        let timestamp_delta := addmod(mload(W2_OMEGA_EVAL_LOC), sub(p, mload(W2_EVAL_LOC)), p)

                        // RAM_timestamp_check_identity = (1 - index_delta) * timestamp_delta - w_3
                        let RAM_timestamp_check_identity :=
                            addmod(
                                mulmod(timestamp_delta, addmod(1, sub(p, index_delta), p), p), sub(p, mload(W3_EVAL_LOC)), p
                            )

                        /**
                         * memory_identity = ROM_consistency_check_identity * q_2;
                         * memory_identity += RAM_timestamp_check_identity * q_4;
                         * memory_identity += memory_record_check * q_m;
                         * memory_identity *= q_1;
                         * memory_identity += (RAM_consistency_check_identity * q_arith);
                         *
                         * auxiliary_identity = memory_identity + non_native_field_identity + limb_accumulator_identity;
                         * auxiliary_identity *= q_aux;
                         * auxiliary_identity *= alpha_base;
                         */
                        let memory_identity := mulmod(mload(AUX_ROM_CONSISTENCY_EVALUATION), mload(Q2_EVAL_LOC), p)
                        memory_identity :=
                            addmod(memory_identity, mulmod(RAM_timestamp_check_identity, mload(Q4_EVAL_LOC), p), p)
                        memory_identity :=
                            addmod(memory_identity, mulmod(mload(AUX_MEMORY_EVALUATION), mload(QM_EVAL_LOC), p), p)
                        memory_identity := mulmod(memory_identity, mload(Q1_EVAL_LOC), p)
                        memory_identity :=
                            addmod(
                                memory_identity, mulmod(mload(AUX_RAM_CONSISTENCY_EVALUATION), mload(QARITH_EVAL_LOC), p), p
                            )

                        let auxiliary_identity := addmod(memory_identity, mload(AUX_NON_NATIVE_FIELD_EVALUATION), p)
                        auxiliary_identity := addmod(auxiliary_identity, mload(AUX_LIMB_ACCUMULATOR_EVALUATION), p)
                        auxiliary_identity := mulmod(auxiliary_identity, mload(QAUX_EVAL_LOC), p)
                        auxiliary_identity := mulmod(auxiliary_identity, mload(C_ALPHA_BASE_LOC), p)

                        mstore(AUX_IDENTITY, auxiliary_identity)

                        // update alpha
                        mstore(C_ALPHA_BASE_LOC, mulmod(mload(C_ALPHA_BASE_LOC), mload(C_ALPHA_CUBE_LOC), p))
                    }
                }
            }

            {
                /**
                 * quotient = ARITHMETIC_IDENTITY
                 * quotient += PERMUTATION_IDENTITY
                 * quotient += PLOOKUP_IDENTITY
                 * quotient += SORT_IDENTITY
                 * quotient += ELLIPTIC_IDENTITY
                 * quotient += AUX_IDENTITY
                 * quotient *= ZERO_POLY_INVERSE
                 */
                mstore(
                    QUOTIENT_EVAL_LOC,
                    mulmod(
                        addmod(
                            addmod(
                                addmod(
                                    addmod(
                                        addmod(mload(PERMUTATION_IDENTITY), mload(PLOOKUP_IDENTITY), p),
                                        mload(ARITHMETIC_IDENTITY),
                                        p
                                    ),
                                    mload(SORT_IDENTITY),
                                    p
                                ),
                                mload(ELLIPTIC_IDENTITY),
                                p
                            ),
                            mload(AUX_IDENTITY),
                            p
                        ),
                        mload(ZERO_POLY_INVERSE_LOC),
                        p
                    )
                )
            }

            /**
             * GENERATE NU AND SEPARATOR CHALLENGES
             */
            {
                let current_challenge := mload(C_CURRENT_LOC)
                // get a calldata pointer that points to the start of the data we want to copy
                let calldata_ptr := add(calldataload(0x04), 0x24)

                calldata_ptr := add(calldata_ptr, NU_CALLDATA_SKIP_LENGTH)

                mstore(NU_CHALLENGE_INPUT_LOC_A, current_challenge)
                mstore(NU_CHALLENGE_INPUT_LOC_B, mload(QUOTIENT_EVAL_LOC))
                calldatacopy(NU_CHALLENGE_INPUT_LOC_C, calldata_ptr, NU_INPUT_LENGTH)

                // hash length = (0x20 + num field elements), we include the previous challenge in the hash
                let challenge := keccak256(NU_CHALLENGE_INPUT_LOC_A, add(NU_INPUT_LENGTH, 0x40))

                mstore(C_V0_LOC, mod(challenge, p))
                // We need THIRTY-ONE independent nu challenges!
                mstore(0x00, challenge)
                mstore8(0x20, 0x01)
                mstore(C_V1_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x02)
                mstore(C_V2_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x03)
                mstore(C_V3_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x04)
                mstore(C_V4_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x05)
                mstore(C_V5_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x06)
                mstore(C_V6_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x07)
                mstore(C_V7_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x08)
                mstore(C_V8_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x09)
                mstore(C_V9_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x0a)
                mstore(C_V10_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x0b)
                mstore(C_V11_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x0c)
                mstore(C_V12_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x0d)
                mstore(C_V13_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x0e)
                mstore(C_V14_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x0f)
                mstore(C_V15_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x10)
                mstore(C_V16_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x11)
                mstore(C_V17_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x12)
                mstore(C_V18_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x13)
                mstore(C_V19_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x14)
                mstore(C_V20_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x15)
                mstore(C_V21_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x16)
                mstore(C_V22_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x17)
                mstore(C_V23_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x18)
                mstore(C_V24_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x19)
                mstore(C_V25_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x1a)
                mstore(C_V26_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x1b)
                mstore(C_V27_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x1c)
                mstore(C_V28_LOC, mod(keccak256(0x00, 0x21), p))
                mstore8(0x20, 0x1d)
                mstore(C_V29_LOC, mod(keccak256(0x00, 0x21), p))

                // @follow-up - Why are both v29 and v30 using appending 0x1d to the prior challenge and hashing, should it not change?
                mstore8(0x20, 0x1d)
                challenge := keccak256(0x00, 0x21)
                mstore(C_V30_LOC, mod(challenge, p))

                // separator
                mstore(0x00, challenge)
                mstore(0x20, mload(PI_Z_Y_LOC))
                mstore(0x40, mload(PI_Z_X_LOC))
                mstore(0x60, mload(PI_Z_OMEGA_Y_LOC))
                mstore(0x80, mload(PI_Z_OMEGA_X_LOC))

                mstore(C_U_LOC, mod(keccak256(0x00, 0xa0), p))
            }

            let success := 0
            // VALIDATE T1
            {
                let x := mload(T1_X_LOC)
                let y := mload(T1_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q))
                mstore(ACCUMULATOR_X_LOC, x)
                mstore(add(ACCUMULATOR_X_LOC, 0x20), y)
            }
            // VALIDATE T2
            {
                let x := mload(T2_X_LOC) // 0x1400
                let y := mload(T2_Y_LOC) // 0x1420
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(ZETA_POW_N_LOC))
            // accumulator_2 = [T2].zeta^n
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = [T1] + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE T3
            {
                let x := mload(T3_X_LOC)
                let y := mload(T3_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(mload(ZETA_POW_N_LOC), mload(ZETA_POW_N_LOC), p))
            // accumulator_2 = [T3].zeta^{2n}
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE T4
            {
                let x := mload(T4_X_LOC)
                let y := mload(T4_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(mulmod(mload(ZETA_POW_N_LOC), mload(ZETA_POW_N_LOC), p), mload(ZETA_POW_N_LOC), p))
            // accumulator_2 = [T4].zeta^{3n}
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE W1
            {
                let x := mload(W1_X_LOC)
                let y := mload(W1_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V0_LOC), p))
            // accumulator_2 = v0.(u + 1).[W1]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE W2
            {
                let x := mload(W2_X_LOC)
                let y := mload(W2_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V1_LOC), p))
            // accumulator_2 = v1.(u + 1).[W2]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE W3
            {
                let x := mload(W3_X_LOC)
                let y := mload(W3_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V2_LOC), p))
            // accumulator_2 = v2.(u + 1).[W3]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE W4
            {
                let x := mload(W4_X_LOC)
                let y := mload(W4_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V3_LOC), p))
            // accumulator_2 = v3.(u + 1).[W4]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE S
            {
                let x := mload(S_X_LOC)
                let y := mload(S_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V4_LOC), p))
            // accumulator_2 = v4.(u + 1).[S]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE Z
            {
                let x := mload(Z_X_LOC)
                let y := mload(Z_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V5_LOC), p))
            // accumulator_2 = v5.(u + 1).[Z]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE Z_LOOKUP
            {
                let x := mload(Z_LOOKUP_X_LOC)
                let y := mload(Z_LOOKUP_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V6_LOC), p))
            // accumulator_2 = v6.(u + 1).[Z_LOOKUP]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE Q1
            {
                let x := mload(Q1_X_LOC)
                let y := mload(Q1_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V7_LOC))
            // accumulator_2 = v7.[Q1]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE Q2
            {
                let x := mload(Q2_X_LOC)
                let y := mload(Q2_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V8_LOC))
            // accumulator_2 = v8.[Q2]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE Q3
            {
                let x := mload(Q3_X_LOC)
                let y := mload(Q3_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V9_LOC))
            // accumulator_2 = v9.[Q3]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE Q4
            {
                let x := mload(Q4_X_LOC)
                let y := mload(Q4_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V10_LOC))
            // accumulator_2 = v10.[Q4]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE QM
            {
                let x := mload(QM_X_LOC)
                let y := mload(QM_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V11_LOC))
            // accumulator_2 = v11.[Q;]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE QC
            {
                let x := mload(QC_X_LOC)
                let y := mload(QC_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V12_LOC))
            // accumulator_2 = v12.[QC]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE QARITH
            {
                let x := mload(QARITH_X_LOC)
                let y := mload(QARITH_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V13_LOC))
            // accumulator_2 = v13.[QARITH]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE QSORT
            {
                let x := mload(QSORT_X_LOC)
                let y := mload(QSORT_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V14_LOC))
            // accumulator_2 = v14.[QSORT]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE QELLIPTIC
            {
                let x := mload(QELLIPTIC_X_LOC)
                let y := mload(QELLIPTIC_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V15_LOC))
            // accumulator_2 = v15.[QELLIPTIC]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE QAUX
            {
                let x := mload(QAUX_X_LOC)
                let y := mload(QAUX_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V16_LOC))
            // accumulator_2 = v15.[Q_AUX]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE SIGMA1
            {
                let x := mload(SIGMA1_X_LOC)
                let y := mload(SIGMA1_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V17_LOC))
            // accumulator_2 = v17.[sigma1]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE SIGMA2
            {
                let x := mload(SIGMA2_X_LOC)
                let y := mload(SIGMA2_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V18_LOC))
            // accumulator_2 = v18.[sigma2]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE SIGMA3
            {
                let x := mload(SIGMA3_X_LOC)
                let y := mload(SIGMA3_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V19_LOC))
            // accumulator_2 = v19.[sigma3]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE SIGMA4
            {
                let x := mload(SIGMA4_X_LOC)
                let y := mload(SIGMA4_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V20_LOC))
            // accumulator_2 = v20.[sigma4]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE TABLE1
            {
                let x := mload(TABLE1_X_LOC)
                let y := mload(TABLE1_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V21_LOC), p))
            // accumulator_2 = u.[table1]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE TABLE2
            {
                let x := mload(TABLE2_X_LOC)
                let y := mload(TABLE2_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V22_LOC), p))
            // accumulator_2 = u.[table2]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE TABLE3
            {
                let x := mload(TABLE3_X_LOC)
                let y := mload(TABLE3_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V23_LOC), p))
            // accumulator_2 = u.[table3]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE TABLE4
            {
                let x := mload(TABLE4_X_LOC)
                let y := mload(TABLE4_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mulmod(addmod(mload(C_U_LOC), 0x1, p), mload(C_V24_LOC), p))
            // accumulator_2 = u.[table4]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE TABLE_TYPE
            {
                let x := mload(TABLE_TYPE_X_LOC)
                let y := mload(TABLE_TYPE_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V25_LOC))
            // accumulator_2 = v25.[TableType]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE ID1
            {
                let x := mload(ID1_X_LOC)
                let y := mload(ID1_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V26_LOC))
            // accumulator_2 = v26.[ID1]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE ID2
            {
                let x := mload(ID2_X_LOC)
                let y := mload(ID2_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V27_LOC))
            // accumulator_2 = v27.[ID2]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE ID3
            {
                let x := mload(ID3_X_LOC)
                let y := mload(ID3_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V28_LOC))
            // accumulator_2 = v28.[ID3]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            // VALIDATE ID4
            {
                let x := mload(ID4_X_LOC)
                let y := mload(ID4_Y_LOC)
                let xx := mulmod(x, x, q)
                // validate on curve
                success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                mstore(0x00, x)
                mstore(0x20, y)
            }
            mstore(0x40, mload(C_V29_LOC))
            // accumulator_2 = v29.[ID4]
            success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
            // accumulator = accumulator + accumulator_2
            success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

            /**
             * COMPUTE BATCH EVALUATION SCALAR MULTIPLIER
             */
            {
                /**
                 * batch_evaluation = v0 * (w_1_omega * u + w_1_eval)
                 * batch_evaluation += v1 * (w_2_omega * u + w_2_eval)
                 * batch_evaluation += v2 * (w_3_omega * u + w_3_eval)
                 * batch_evaluation += v3 * (w_4_omega * u + w_4_eval)
                 * batch_evaluation += v4 * (s_omega_eval * u + s_eval)
                 * batch_evaluation += v5 * (z_omega_eval * u + z_eval)
                 * batch_evaluation += v6 * (z_lookup_omega_eval * u + z_lookup_eval)
                 */
                let batch_evaluation :=
                    mulmod(
                        mload(C_V0_LOC),
                        addmod(mulmod(mload(W1_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(W1_EVAL_LOC), p),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V1_LOC),
                            addmod(mulmod(mload(W2_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(W2_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V2_LOC),
                            addmod(mulmod(mload(W3_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(W3_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V3_LOC),
                            addmod(mulmod(mload(W4_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(W4_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V4_LOC),
                            addmod(mulmod(mload(S_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(S_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V5_LOC),
                            addmod(mulmod(mload(Z_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(Z_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V6_LOC),
                            addmod(mulmod(mload(Z_LOOKUP_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(Z_LOOKUP_EVAL_LOC), p),
                            p
                        ),
                        p
                    )

                /**
                 * batch_evaluation += v7 * Q1_EVAL
                 * batch_evaluation += v8 * Q2_EVAL
                 * batch_evaluation += v9 * Q3_EVAL
                 * batch_evaluation += v10 * Q4_EVAL
                 * batch_evaluation += v11 * QM_EVAL
                 * batch_evaluation += v12 * QC_EVAL
                 * batch_evaluation += v13 * QARITH_EVAL
                 * batch_evaluation += v14 * QSORT_EVAL_LOC
                 * batch_evaluation += v15 * QELLIPTIC_EVAL_LOC
                 * batch_evaluation += v16 * QAUX_EVAL_LOC
                 * batch_evaluation += v17 * SIGMA1_EVAL_LOC
                 * batch_evaluation += v18 * SIGMA2_EVAL_LOC
                 * batch_evaluation += v19 * SIGMA3_EVAL_LOC
                 * batch_evaluation += v20 * SIGMA4_EVAL_LOC
                 */
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V7_LOC), mload(Q1_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V8_LOC), mload(Q2_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V9_LOC), mload(Q3_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V10_LOC), mload(Q4_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V11_LOC), mload(QM_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V12_LOC), mload(QC_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V13_LOC), mload(QARITH_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V14_LOC), mload(QSORT_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V15_LOC), mload(QELLIPTIC_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V16_LOC), mload(QAUX_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V17_LOC), mload(SIGMA1_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V18_LOC), mload(SIGMA2_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V19_LOC), mload(SIGMA3_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V20_LOC), mload(SIGMA4_EVAL_LOC), p), p)

                /**
                 * batch_evaluation += v21 * (table1(zw) * u + table1(z))
                 * batch_evaluation += v22 * (table2(zw) * u + table2(z))
                 * batch_evaluation += v23 * (table3(zw) * u + table3(z))
                 * batch_evaluation += v24 * (table4(zw) * u + table4(z))
                 * batch_evaluation += v25 * table_type_eval
                 * batch_evaluation += v26 * id1_eval
                 * batch_evaluation += v27 * id2_eval
                 * batch_evaluation += v28 * id3_eval
                 * batch_evaluation += v29 * id4_eval
                 * batch_evaluation += quotient_eval
                 */
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V21_LOC),
                            addmod(mulmod(mload(TABLE1_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(TABLE1_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V22_LOC),
                            addmod(mulmod(mload(TABLE2_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(TABLE2_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V23_LOC),
                            addmod(mulmod(mload(TABLE3_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(TABLE3_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation :=
                    addmod(
                        batch_evaluation,
                        mulmod(
                            mload(C_V24_LOC),
                            addmod(mulmod(mload(TABLE4_OMEGA_EVAL_LOC), mload(C_U_LOC), p), mload(TABLE4_EVAL_LOC), p),
                            p
                        ),
                        p
                    )
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V25_LOC), mload(TABLE_TYPE_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V26_LOC), mload(ID1_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V27_LOC), mload(ID2_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V28_LOC), mload(ID3_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mulmod(mload(C_V29_LOC), mload(ID4_EVAL_LOC), p), p)
                batch_evaluation := addmod(batch_evaluation, mload(QUOTIENT_EVAL_LOC), p)

                mstore(0x00, 0x01) // [1].x
                mstore(0x20, 0x02) // [1].y
                mstore(0x40, sub(p, batch_evaluation))
                // accumulator_2 = -[1].(batch_evaluation)
                success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
                // accumulator = accumulator + accumulator_2
                success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

                mstore(OPENING_COMMITMENT_SUCCESS_FLAG, success)
            }

            /**
             * PERFORM PAIRING PREAMBLE
             */
            {
                let u := mload(C_U_LOC)
                let zeta := mload(C_ZETA_LOC)
                // VALIDATE PI_Z
                {
                    let x := mload(PI_Z_X_LOC)
                    let y := mload(PI_Z_Y_LOC)
                    let xx := mulmod(x, x, q)
                    // validate on curve
                    success := eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q))
                    mstore(0x00, x)
                    mstore(0x20, y)
                }
                // compute zeta.[PI_Z] and add into accumulator
                mstore(0x40, zeta)
                success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
                // accumulator = accumulator + accumulator_2
                success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, ACCUMULATOR_X_LOC, 0x40))

                // VALIDATE PI_Z_OMEGA
                {
                    let x := mload(PI_Z_OMEGA_X_LOC)
                    let y := mload(PI_Z_OMEGA_Y_LOC)
                    let xx := mulmod(x, x, q)
                    // validate on curve
                    success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                    mstore(0x00, x)
                    mstore(0x20, y)
                }
                mstore(0x40, mulmod(mulmod(u, zeta, p), mload(OMEGA_LOC), p))
                // accumulator_2 = u.zeta.omega.[PI_Z_OMEGA]
                success := and(success, staticcall(gas(), 7, 0x00, 0x60, ACCUMULATOR2_X_LOC, 0x40))
                // PAIRING_RHS = accumulator + accumulator_2
                success := and(success, staticcall(gas(), 6, ACCUMULATOR_X_LOC, 0x80, PAIRING_RHS_X_LOC, 0x40))

                mstore(0x00, mload(PI_Z_X_LOC))
                mstore(0x20, mload(PI_Z_Y_LOC))
                mstore(0x40, mload(PI_Z_OMEGA_X_LOC))
                mstore(0x60, mload(PI_Z_OMEGA_Y_LOC))
                mstore(0x80, u)
                success := and(success, staticcall(gas(), 7, 0x40, 0x60, 0x40, 0x40))
                // PAIRING_LHS = [PI_Z] + [PI_Z_OMEGA] * u
                success := and(success, staticcall(gas(), 6, 0x00, 0x80, PAIRING_LHS_X_LOC, 0x40))
                // negate lhs y-coordinate
                mstore(PAIRING_LHS_Y_LOC, sub(q, mload(PAIRING_LHS_Y_LOC)))

                if mload(CONTAINS_RECURSIVE_PROOF_LOC) {
                    // VALIDATE RECURSIVE P1
                    {
                        let x := mload(RECURSIVE_P1_X_LOC)
                        let y := mload(RECURSIVE_P1_Y_LOC)
                        let xx := mulmod(x, x, q)
                        // validate on curve
                        success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                        mstore(0x00, x)
                        mstore(0x20, y)
                    }

                    // compute u.u.[recursive_p1] and write into 0x60
                    mstore(0x40, mulmod(u, u, p))
                    success := and(success, staticcall(gas(), 7, 0x00, 0x60, 0x60, 0x40))
                    // VALIDATE RECURSIVE P2
                    {
                        let x := mload(RECURSIVE_P2_X_LOC)
                        let y := mload(RECURSIVE_P2_Y_LOC)
                        let xx := mulmod(x, x, q)
                        // validate on curve
                        success := and(success, eq(mulmod(y, y, q), addmod(mulmod(x, xx, q), 3, q)))
                        mstore(0x00, x)
                        mstore(0x20, y)
                    }
                    // compute u.u.[recursive_p2] and write into 0x00
                    // 0x40 still contains u*u
                    success := and(success, staticcall(gas(), 7, 0x00, 0x60, 0x00, 0x40))

                    // compute u.u.[recursiveP1] + rhs and write into rhs
                    mstore(0xa0, mload(PAIRING_RHS_X_LOC))
                    mstore(0xc0, mload(PAIRING_RHS_Y_LOC))
                    success := and(success, staticcall(gas(), 6, 0x60, 0x80, PAIRING_RHS_X_LOC, 0x40))

                    // compute u.u.[recursiveP2] + lhs and write into lhs
                    mstore(0x40, mload(PAIRING_LHS_X_LOC))
                    mstore(0x60, mload(PAIRING_LHS_Y_LOC))
                    success := and(success, staticcall(gas(), 6, 0x00, 0x80, PAIRING_LHS_X_LOC, 0x40))
                }

                if iszero(success) {
                    mstore(0x0, EC_SCALAR_MUL_FAILURE_SELECTOR)
                    revert(0x00, 0x04)
                }
                mstore(PAIRING_PREAMBLE_SUCCESS_FLAG, success)
            }

            /**
             * PERFORM PAIRING
             */
            {
                // rhs paired with [1]_2
                // lhs paired with [x]_2

                mstore(0x00, mload(PAIRING_RHS_X_LOC))
                mstore(0x20, mload(PAIRING_RHS_Y_LOC))
                mstore(0x40, 0x198e9393920d483a7260bfb731fb5d25f1aa493335a9e71297e485b7aef312c2) // this is [1]_2
                mstore(0x60, 0x1800deef121f1e76426a00665e5c4479674322d4f75edadd46debd5cd992f6ed)
                mstore(0x80, 0x090689d0585ff075ec9e99ad690c3395bc4b313370b38ef355acdadcd122975b)
                mstore(0xa0, 0x12c85ea5db8c6deb4aab71808dcb408fe3d1e7690c43d37b4ce6cc0166fa7daa)

                mstore(0xc0, mload(PAIRING_LHS_X_LOC))
                mstore(0xe0, mload(PAIRING_LHS_Y_LOC))
                mstore(0x100, mload(G2X_X0_LOC))
                mstore(0x120, mload(G2X_X1_LOC))
                mstore(0x140, mload(G2X_Y0_LOC))
                mstore(0x160, mload(G2X_Y1_LOC))

                success := staticcall(gas(), 8, 0x00, 0x180, 0x00, 0x20)
                mstore(PAIRING_SUCCESS_FLAG, success)
                mstore(RESULT_FLAG, mload(0x00))
            }
            if iszero(
                and(
                    and(and(mload(PAIRING_SUCCESS_FLAG), mload(RESULT_FLAG)), mload(PAIRING_PREAMBLE_SUCCESS_FLAG)),
                    mload(OPENING_COMMITMENT_SUCCESS_FLAG)
                )
            ) {
                mstore(0x0, PROOF_FAILURE_SELECTOR)
                revert(0x00, 0x04)
            }
            {
                mstore(0x00, 0x01)
                return(0x00, 0x20) // Proof succeeded!
            }
        }
    }
}

contract UltraVerifier is BaseUltraVerifier {

    // vk hashes
    function getVerificationKeyHashBaseDel() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashDel();
    }
    
    function getVerificationKeyHashBaseEnc() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashEnc();
    }

    function getVerificationKeyHashBaseEncSub() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashEncSub();
    }

    function getVerificationKeyHashBaseAdd() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashAdd();
    }

    function getVerificationKeyHashBaseVote() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashVote();
    }

    function getVerificationKeyHashBaseDecPercent() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashDecPercent();
    }

    function getVerificationKeyHashBaseVecSub() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashVecSub();
    }

    function getVerificationKeyHashBaseDel5() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashDel5();
    }

    function getVerificationKeyHashBaseDel10() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashDel10();
    }

    // vks

    function loadVerificationKeyBaseDel(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyDel(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseEnc(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyEnc(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseEncSub(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyEncSub(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseAdd(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyAdd(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseVote(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyVote(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseDecPercent(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyDecPercent(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseVecSub(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyVecSub(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseDel5(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyDel5(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseDel10(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyDel10(vk, _omegaInverseLoc);
    }  
}