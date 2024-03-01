// Verification Key Hash: fd804a482c7fbac3c2109023fc23fc7785ad8c13f177e3ae32eb0604798651f0
// SPDX-License-Identifier: Apache-2.0
// Copyright 2022 Aztec
pragma solidity >=0.8.4;

library UltraVerificationKey {
    function verificationKeyHashDec() internal pure returns(bytes32) {
        return 0x2705b12498736ce87f90684a574f8477e22f8789b59f122ad083ce683a641626;
    }

    function verificationKeyHashEnc() internal pure returns(bytes32) {
        return 0x832e9eca80a7ea4c356d7ef7c0240549edfb68fc6b6571155af4662e8d46c56d;
    }

    function verificationKeyHashDel() internal pure returns(bytes32) {
        return 0x3727766a7da232a8ba1de983f8a8301eb227440fcd891ce616b709e9a2b60a07;
    }

    function verificationKeyHashEncSub() internal pure returns(bytes32) {
        return 0xd343a8d342cbd23cd5c2f9f55814ed19e83840d282a7fe715e480b04ac08d5cd;
    }

    function verificationKeyHashSub() internal pure returns(bytes32) {
        return 0xcc378139ea8f1ba6f2fe3cc70ab94e7f659254f8a6d867b4760ef5083a9cc032;
    }

    function verificationKeyHashAdd() internal pure returns(bytes32) {
        return 0x8e168437630d665211b3961d38d440c2c27425f1aa5df58ceef70f2c871bb6f4;
    }

    function verificationKeyHashVote() internal pure returns(bytes32) {
        return 0x9061047e5e763bb1192d8a81f08631a029d2c7d2c278bc3ebebc14719c9b986b;
    }

    function verificationKeyHashVecAdd() internal pure returns(bytes32) {
        return 0x1e5aa66af76b2fbe187018cab8c762ae4486e8e480e7ad468ab98cbbc31b1413;
    }


    function loadVerificationKeyDec(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000010000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x000000000000000000000000000000000000000000000000000000000000000f) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x00eeb2cb5981ed45649abebde081dcff16c8601de4347e7dd1628ba2daac43b7) // vk.work_root
            mstore(add(_vk, 0x60), 0x30641e0e92bebef818268d663bcad6dbcfd6c0149170f6d7d350b1b1fa6c1001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x2397a3f2a554c710f0356bdf4634fa121b4d49d5c238a000d5f5843f849eca03) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x19067dc160b52c729249939b28e165cf4c192f9b84539e0f4bfce28d868ec242) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x0a2ea0375e1e387af358e692997cda97610260ace9c5cbde30f8c77670839b7f) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x1c3f37d58fea86e9121fe289828b2a20e4cd9e27e7db07ce77caf0e90d012a0c) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x26ba70acb9d0e807dc0092c9996bd8fe215a17e870d56ea737283350c4e2851a) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x02f5a0470b7ccefd9d11d0afcf323bc397133e7f89267f8b2edd98dc0f873ea3) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x0e69dcb6f2298a72c0a6ac79ba4722d5626a0492ae3c016fad8de3cce04094e6) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x12c431268489ee0bc8f51b5478ce9d127faa44a7839f63f2a65eb60e70134770) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x0c80f6742cae538886f867c719a1f612d15242d0bf60a59c1a10a7ba399983fe) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x2d137a8c0620f0b311e4da8beaca00e7162153eb76700a7564d409e3469d734f) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x29d49a46d269d04090f8a734c21d105712dfe235b2face32781f3457d3d9fd00) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x03b99a50a8ef99ea9ab086eeda3ea7e7f476968f4e50e4bca7482984eecabacb) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x1ae43b87da0998552f0b0b91e62ef710ed2b7cb7695beca5abb44ea944a8dd2e) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x0f1febb91e7a70794bc0021686017290b15e0190509c4ff1bd93821854125c60) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x267c51393730a531077816e9cbc47afa4982ea9ea26f94189561b739cc8a69e7) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x0ac3598a83a1b747f29b3eccd46ed7208c8abd8a58e32757a7e09434d24a692b) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x21245d6c0a4d2ff12b21a825f39f30e8f8cf9b259448d111183e975828539576) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x16a409532c8a1693536e93b6ce9920bfc2e6796e8dfe404675a0cdf6ee77ee7a) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x2f213c7a4c064a63d6a07366df0ea85aef9ad2125a188c3e656f95471e416a0a) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x067a270bed55e72ffb3cfa39af3e5b8bcb4961d72bb301978af13c4ddc73e5df) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x08176086883e08445db816556441a30362ac453acd846e4c86f88d1ec89d739c) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x110f4f4d0544fb38f9df85fa20267a7a489de496300f68a0cac4df400237a9e4) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x1e1b42ce668f9c994b5a23a3b109493ba7a9e7ec12499a330715a641dc4a63a4) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x1f105506a3a8bdaa5e3b9116ec59f4cadfe9333563282342f3a96eae60bf42d5) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x2f4ea9c0ba1db836082ecfef1d482bcd83a7b44f931322c4ed3362e88d9bb0d5) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x199f804bd16cb86b026782e61f5851c1a5a7495b7a25c7b67e0dab0a71348f75) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x2dd1606de4fd6603f7e1558c0e7942875ad4525b360168e3456e8dc18a62fda5) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x0af3500836230a780c3d0ad4b8a245de36e10175c9f1c8ae4f237fe5c1d2d5b7) // vk.SIGMA4.y
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
            mstore(add(_vk, 0x540), 0x26e369ea08f322b927ed812cb10d1e95884f2e30fe2dabecacaf74c0dc266e87) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x1a022ff3f93ef3bf5d0a9bab976254fdeb5f7c2da35cba28aa58e2369518abcf) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x1fab75c2075c475428a668c455e3cfbc6f40091ae186f52f0938529246e21e21) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x0e4f15b97ee09a99a6fcf2785c1119cce8e6176198e6167c74eebb12d33c6bbc) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x04cb549e1700ee6e76f393d318014a0efb332def1b4a676ce82af54e38ee60ca) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x23358abb93fd0ef6ed78bdc85bcf9fa48501b00b8aba92d4c7e3e663458d053f) // vk.ID3.y
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

    function loadVerificationKeyEnc(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000008000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000008) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x2d1ba66f5941dc91017171fa69ec2bd0022a2a2d4115a009a93458fd4e26ecfb) // vk.work_root
            mstore(add(_vk, 0x60), 0x3063edaa444bddc677fcd515f614555a777997e0a9287d1e62bf6dd004d82001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x2704e5525eab66e966af315db1c5741f11220d1bafe21dfad2d5465a485204f8) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x0d8893fa371d2f4ac4ddbae4fad5973495bac5775f3d3e1af9cddff3119c9379) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x15aa93addc63c035b4ae211edb7014613426f72906c1c55c16aa1ea3bf39454d) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x2364bbece71d5716ada75cca5b3f1f61eec9781083616c38cf1ebed8d760dfac) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x0a1c12d87a276820c9ed60ce990bdc6aad1834ef816ebdc4fa32d2d99acac818) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x15faad45cb04cc61e1030c6d7dba84702ec5456091ce8c436661a11b4b30c6c8) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x2a1a4064bc6ef924bed1e22784c9d45441b37b332af09988d2f7be7c008be355) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x29b121efdfb14341241f24629e5f0940311477193ffd0718d7fbf983920862f0) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x086ca2543b847fb0b843cde300d3363eddaa58088ff2b700f2aefb0d30b66d58) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x1be8d540fe41e6038cb8d005882724c2f3956120ca7f081d86986b865899689a) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x0293b5165edc85e8a6795ad9a16cdefd38159246b96c89fffa523c78771b6949) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x0c90171032920171de961844438c2934d92dda8029bcaeb79593276309b3f37a) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x11e72db17db429605c66d5d08ef015947c7bdaa2875da860e74e542985126822) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x0bb5f95c29191a75d0ef2c75f0ffe41ae041c928cad8926fb6acebfb24a5a491) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x17de1ad04387d41136801f4a1b8ed7ac6147858366cce063f6820f5229cc10ca) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x2af0a108ed7faa4f4e968b871de1d39983518b22bcd43ff0c98bf36892763dd9) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x21959276775cd4749236c8bf773a9b2403cecb45fbf70e6439f73d75442e8850) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x017714509f01d1a9ee7ebaf4d50745e33a14150b4fe9850a27e44de56d88cb14) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x2e76c4474fcb457db84fb273ccc10a4647a1a37444369f2f275bb74540f5e2d0) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x209035caddd02a78acd0ed617a85d782533bd142c6cad8e3338f3142b919c3a4) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x23bf3b0a7e7bb58f3193b83614e491c1077ba2579ab55348bd064a49227093d3) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x00854c1fad33dcecd21ebf97eafbf019b1675b3bd27fb9653657460485e308da) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x14fefb3b1e4318595777cf1a6c5562cbf7b5a95b170a01a8f5333889a67f758b) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x10fc96780185f4abb409df4e2dc4d377efed620167c252d24b27983e0a063dd2) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x001082c3f7d7deb21e8bc2b3db2c79102b2f0b2378debb5f1de5c71e064a1793) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x26aae10f99b1766e80e7500b2b57bd9f9809f547cd1206299027d64bc44284e2) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x10482377b8f629df482ed7a180bf0b801e43103c4d4180e05172168ada71e9e0) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x1357ed8156ca0e00b3fba5b9d7a2d7454640076cc85c71a0fe95501fc82b584a) // vk.SIGMA4.y
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
            mstore(add(_vk, 0x540), 0x0f65cf80dd13d33496e4b617116d7f443989e84fb42125f50a27f6d54f1b890e) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x2be334867042e60e8b92d1b9a82c0b8a9f6b86a8eca3cfe0987bcf21e19a6260) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x1b747cf0d3358db50939890755f86b7ce6d5e7728e21ab6196793cd837ec9870) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x2f26d701b722179fdaf52e48b4a90b8e04ddb79a0317755c792b7a90659f2ba2) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x09d79475eee7189147d213612c56c7123e1ba6fd04d70c09324a0714d2a7f6b6) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x293acaa242dbe287012bce62aecde7b9f789be145ba21c565ed5b5a681878a20) // vk.ID3.y
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
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000090) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x2260e724844bca5251829353968e4915305258418357473a5c1d597f613f6cbd) // vk.work_root
            mstore(add(_vk, 0x60), 0x3064486657634403844b0eac78ca882cfd284341fcb0615a15cfcd17b14d8201) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x04e084db2d154eaeb804b550fafca277fc0a2b0b651a9d192699b59eda52fd96) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x1a0088a1a752565db4b51953c6f84e6dd7dae15d031ca7c89cbacff4123b7666) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x0eacd4a6aa3407a96127255b90f5ae7c98ee07d91468b01bb3f5c9650754f1ba) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x0eab60c1b0c1a91752cd4a13669b0895b59928110f75942a1d1b0c6c00222502) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x0747192ece738380648efb339bcf907a5dd0123db88edc878f7f86c9801eba31) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x07dd81853d06291a3f2ea9c8f3c8557a0a32c4bf06933ad44f68906b1bb72778) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x0982fbf779d405b37c5c3ff61d938388fd26b1d4a9b30399deba97acc0fe8065) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x17acf6728bc954c3ea853da13fa99993c608b392f65c6428fa5ca949eb3469e2) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x18dda080b47ec77905bcf59916e817f012bdecc27d825727d47908c5552d7b81) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x2dd642b4fe71522757ef37bc9dbe44e1dad6c65c36d4f296456acd313deca080) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x210983021d949e6d152ba59ee28b8d2300b5f2cb975511650d2b0b80c211c986) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x130fba6f09f74bd65abeab756923ed4fbf8b3ab93ab509e0c833032bb33c5185) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x1e4d850e019d39367dd508524cd954da09a6cc309d861419d69232be0011bfc2) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x082d3ec130f93e4a541526239d8c9e1cfcad4d6b7f4a4dd7f2dc3e52fb923c67) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x1b8766f07bb622a4c9267404ad44647aedb08462dc7a4e21315ed235ff81d92c) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x1e9dfd842a09db8ae0e5fa0ab6a171269ab4c67f59426eb529ff683b8514a4c4) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x0346eb76deee9a3ae7b350f402a778b1d6d269fccd2036db0ec5fe39439b1e9a) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x12b9c69aa4d51eb3920484e5f218388542023c239f7cb66db4175af241497622) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x1a78811645b84bbd89672882483e957625cf3aec430bbb2096c060a3b45fe470) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x1e083a3d76abacbf139701a1d2fc905090056fde016569cfb325b37e997c6845) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x1843d869f6174e9dcd9546eba22aaea8296e79e23c3bd6b6e207422e15588ae3) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x279f2f98d5133f46a3576e28c350a3f54516d76c01be8f54d564ed3ed172bdfc) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x15a07d87b0ca2731707730dcb214f30a0d51f025707953e47d2389d53e4fe090) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x2a2d65cc4538283d3bd6f298a8481563e8d53b5f158d5564a08071f08997dcbc) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x0bf0ec1c8155508e5d60c1134e0d3d3c5b8e09df5770f3fb07df596f8e8e6a5e) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x2ca4df988320e66a423a8f8b91151e88c4f9040cd496ad65eb1aeb2e6e59a783) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x2486cf730cc0d13aba3073816078331e0901bf906c1df5087b76ec55eff50991) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x1dbf9c008ee5989004a0f82458b245442a16f77036e27baa740b8d5489b15414) // vk.SIGMA4.y
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
            mstore(add(_vk, 0x540), 0x20697de6c5b8f3c59660b49a8432b7048344a1ea33c451cdcc6083a1294c5177) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x129e4cea8bc589303899857d2de5f5aeb136f89c282d7157261f2ddeb5203143) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x116ebaee63f2add333ebf3a5abbd3b28c59d8bcf59e4cae71982e3c6b3c9a7ea) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x0fbeea6e1c2dd93da0dd1b7f4e83ea3314ada447c0262924b2f6ba75d5014e1f) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x15d4b07982642468d21109a15b0cd671f6e6569b1dfdab61eac650fa1eaa24de) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x0c09b5e003a13df988f4122288735f940c15d9ef7ea28b2109b5bd00c1892e6e) // vk.ID3.y
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
            mstore(add(_vk, 0x80), 0x1b8ad6da19b6f0c67a9fff95a9cfb2c8ba4d7fcf19c16a14e1369b671d4ae0ba) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x2d19c2c607d3f450cb7403996bb520ace1562bcf0ab27e41a980f46d97b219d6) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x15c779102682f0a08157e625143d0a4364d94aa954243589d3ab312e43f67e67) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x20ea5770e91d5fdeb29a8af88197b9cf8fd124387f69446c39c768b47e165fe1) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x0dae1e167435f514e0a046b7fe9ac45128edaf1f90739a0b7d0ccf99b561e9ef) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x22e473fcf21d0a14654357d85b05fa5536c310c8e48c6ef4c799580b21247977) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x094ecec2cc345cfbb94d9742c01871265fe55ae2a4c50ca3f45fc97464e3d526) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x21e26cf685653dfdaa2cc47d5f5a7cd1ca8d18512e4576218b314972835344e9) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x2f2bf655cfc62dac692f0a89d8afefbf3affa124c22f9fcba839c190746602b8) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x1e34c759c725a0a07bdbe2528fb73cd9e9cfa70fe921dfca1ede67f91b929cff) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x1b5e6b96a45fa4a84245b4524fe9a9d86e0678c052c5cfbe9c5e87122a61730f) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x0edd2fc201f255ba20361045f6caa99b17a291c6ba77b632763d2e04c6ce3659) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x28dfe8a94686b4a411095f3a5a1808b423bd2ea320edf1f2053486c86441937d) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x2dde694c2ed4bda5e0868b34a178f94cb07e5cd8718754cc6d8c64255e89744e) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x212cbe7bff2a75e5891302b32859684b8b18b7ff444d6bc8983a3bb9f3056a8c) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x11a3b3686168e3cefbb1c9c86ce1da04e18050063b128f0a34b0e4ca79f0371d) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x267302f63d129c05fe1ddc1449ce3483d5ff1b943384a3173a40e7395310f526) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x09e8592d07b97663aaf2956e5ee136274e9ce0118f09deb4daab83fad76e78f3) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x01aeeaa2478912af12266b5910ceb966d73be7a982cf4a35e94e64921eedf7e5) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2f612b9bb2a6c45fa28795f7849e8dbd7e24dca8350195f14c4e609201be4889) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x098b66bae727210fee6be3f2146c27ec0d8bea965345e865c38d2fca79848252) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x0ce0e0063b8b98b6e0d96e934336d34d6c0cfe577160e8082ac363c73d006353) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x1afea918f6b4c4bdbd000ec9f75a80bfada4721c488fd8796cdfad80c678be49) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x0f1d86ad57ff08bc603fa159133bc237d4cad4fc1f6392e458c6a7b8a6a1b2a0) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x250063b9541bb78b88a21ae5c964e6e1ac77726f96d82950513dd3a470a247fc) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x17b6663b6846ca328fa372230ec5c061dbf87b199b8eea9990b491367690e046) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x0b8f924ec37594a09d0f2546134e3ecfe84b383dcfb354c9a910f2c8edf45970) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x16a70c23566a8c76e7d386c0293a7e8b566f9636125eb8169675ed990d5f4d41) // vk.SIGMA4.y
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
            mstore(add(_vk, 0x540), 0x300791e060046ba5733ece2d171190a90e1e2a6f46fd01f87ebd5b2275251273) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x105a218e3cd61d2879f8cbc6130ce964ce69d4723649f34dddc6335169b86204) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x1f427e762d363aa4891fc13fa905a3c96e6d4553f85f57b5c50fd49b8ab7eeb2) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x12e1a3bd50dcfc0e9fee0a1a1ddb78f0e85ff6562c4b263b06640baaaf2d81ff) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x0569e6ca662c97e67d80e4eafc07fd6f1ddc4dc235380629c8f95c2cd7dfb0fc) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x2826fc7c69e32be1ed52f093b23831180d309a7387646add6800b63ecede2ebe) // vk.ID3.y
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

     function loadVerificationKeySub(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000000040) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000000) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x1418144d5b080fcac24cdb7649bdadf246a6cb2426e324bedb94fb05118f023a) // vk.work_root
            mstore(add(_vk, 0x60), 0x2fa2bd3915acd9a9116f049fa77b52fbb39318a757d28acefed26dbda0400001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x0ee3cc41825485d57dd4012a39dd24dc8f65ea1d6c13e791c4da0674949d1c3d) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x182abbb7a94df2940e0dc18df1ae9f6f9c37428f7580eeb30647a1ef1d03be4e) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x109a4e55d19075414d768611a3c31e185c4b8e69d8c7e160c8a533b8fe8f2c30) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x01b32f2d000141d0aa42f4385315f1394da12bce8f79b6da2c7317992ed38349) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x12d41814d84ce73e037f1d8068a00039f750937b8d48cdd0eca9d45f1389511c) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x1c9d165f78305a2a24448a02e4b9d08abbca30dad4ea112ef1e755d55157f8ff) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x01920f38ec29ba1e87be0315338e86ea317d8503996d0f3998ff47fa1a796def) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x2e9eeaddddfb1993fcc95df001767bce6db6e3c3319f602f2214aca3b3d2a41f) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x0cbb72e78746296a14069a6bdf99aef32e00876dfead5580b0005e570f01e806) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x11d49fb44c8c00fdbbbf32db232f0033f8780bfb6df557ce6684c13827d8de7f) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x0eee464ac2e4dd4a9eab903c6a285f2f6a0ec45e52051d9dd8c8b7c805888a43) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x239c6662a687f4de7c9ba3dac0cdd29a5ea2f60096b7ad2b2182f96dc06f8853) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x022e710c52068a6faa8d5bc024e6d98f7f2ffd2e9742c2b2b6b88a991f24b55e) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x14edd32c06c1b7d21c4e19d13d8261761abf9a210784d1fa6037ca3544e11dfb) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x277d1e4445ea7e1e963af02318d3ee6886d7fc5665a57e41cdd0ae6d4be7a5d2) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x1ca461c591b66df8bf3d5b6eafee647c75c11092b1ac69c95421fbe3de313e9b) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x2af923bf4bea5148f0437ed512153cd1e969293d440e631d611f4733050be472) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x205566a04f236fad80df1d94eb8d07461f4d6e518d7c72d8044defd653fd8906) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x052e66fe2ec34fd2a0ff028d50126099b5f5d6a8818d15da15e2ab9b68e5878c) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x138fa6b6f11f940b734af569f0d897428ee7efbfa3a4f04ecf8f41694d086bad) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x188fccdc646d2d417dc11adb99e88488da8dc67c866b5b657f7a0b6c1fd2aeb2) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x1a5696ac185f27fd11cdf9c8317c97ca889e6bb4c22c33c4fa9cf0c1044cdccb) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x1f1776fb557cf4e19f6d77a8be3c12d9d993e90844536844d1b944da411ad603) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x1b3efb0a7d0b415d692154954141ddd18e412188b9b48c91af4708deb1bce69b) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x206a67b711fe252a04e5288dc0a30439c214e488073fc2549975c6d2e2b5981b) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x10dec39010e0d9ca947a89bbfc467486e624c617ad54772af42ed540cb28da77) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x1782349a998bdd9317197d10b9fa2d56b38bca2162e349acc41ec2d98f8f098e) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x13e4b95378b0d33d7d8b365a5e321aeae17a804aa92ec197ac0331c8ed74bdcf) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x0fbd3508db14753ba04366123914f19e1241e4fe8daaa9bc4a3434765dc38287) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x2286f6028252d1ef6c510d36127ccb45fa3037fbe597163cbb087b04e06510c9) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x1d10b2e7041abbf77830ebb28524ce527c2a17b9f41aa9f0fae126f970527702) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x13bf063e05b26e4e0cabcb2b1ce31429f0b77ed04332ad008b2335c7b32fdf49) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x007a80a0f9d660266c927006d39ad8cb6bd6ce0f611ee528618b857fed070e16) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x2a57f21130a12be4b352e88e3cafb14158fcb02b6fb211565131b33d258d4f56) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x1118d84874cb5d8c476e16dc99b7bacfbde496afc80c7417bbefd5ee0f999a52) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x0e48eb07b6fda71e59ead38c9b98762c09f3a6278aa85ee34f1670c2b2514693) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x13e5b74caef7f1ce9041059b6799b46a28cf7cfaac15ceb2598e319a1c1d8380) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x03a80605a1fad1ed9aebeb3f6710846b07d68b877e7e1efe9da7d3929f0714d6) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x0f337904e69b7222f27cd9db4608fb6af4cb6d7ca39e92107b56508497cbf7c1) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x21a8e52dc0ea9f59956a92a2072a0f8917057b42661ce2212ac6d162197a6118) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x25b7f2e1d11dedcfe92cc0d5ffc538639ff5deb23d0bbedea02f3ecbb7fa43fd) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x111b38923fa8f0d964bc4722a659b8f0e130097622838ff16a0c7a2518644422) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x0dd91f1d7af64efec8dd2a974764188ddc56cbac0ba685f9d7d8840664378a32) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x01a7dbe005fba856476cd8b0e40303129a09b46939df7c1312d87a571ba18ef8) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x26177cf2b2a13d3a035cdc7567a8a676d80396ec1d3213ee78ce6a0b763d698f) // vk.work_root_inverse
        }
    }
    function loadVerificationKeyAdd(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000000040) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000000) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x1418144d5b080fcac24cdb7649bdadf246a6cb2426e324bedb94fb05118f023a) // vk.work_root
            mstore(add(_vk, 0x60), 0x2fa2bd3915acd9a9116f049fa77b52fbb39318a757d28acefed26dbda0400001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x19424d8b0151b6eb913809b08322bcd25e9431c909730154cc9abd288e403ec9) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x20067ae56a0549c38b97b1b1afa1f22b0fb241c0594046168f9803d1c3af51c9) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x13049725e7487a72bf39e43a5c8d9594ad5b75bcbc14432570affcc49df587e2) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x2df24c259e9a1b5cbf27d941e970cb6feec27640fedb0e1573f40fa1acea3cb0) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x0f8e12393ba4fb7733d20cbbaaeb7daecf7fd2005b7c68e7a7c116494354e067) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x1a9694d3706cc28ecb5974f0802e3f4e12570766125dc8a533fd5474ddfaff8a) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x01920f38ec29ba1e87be0315338e86ea317d8503996d0f3998ff47fa1a796def) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x2e9eeaddddfb1993fcc95df001767bce6db6e3c3319f602f2214aca3b3d2a41f) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x2d3822a3db05d6f981c0c25a234de79ec7a0f6c45f276a62e03780c76cfa491b) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x0121a19e4f1e63cab3020431b50cf199812159c5fb0b5456d352ea0d116eb505) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x28f21ea4e1fa9abb05fea0c4e99dacb6077a9b346e2a16780b7e373c5214f179) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x2b9b3ac74096c1f7182c875d6b5d3d459487d2599e3af26e59f060731b0dfdef) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x0478c04bbc696d216388012098db931deb166926d7b76b7d6cf56ea53a0b4dd1) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x3053f3d28918c1e03a00924c8df50408ce6d1b159bc1d1ad4448f7ebc3a41956) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x277d1e4445ea7e1e963af02318d3ee6886d7fc5665a57e41cdd0ae6d4be7a5d2) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x1ca461c591b66df8bf3d5b6eafee647c75c11092b1ac69c95421fbe3de313e9b) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x2af923bf4bea5148f0437ed512153cd1e969293d440e631d611f4733050be472) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x205566a04f236fad80df1d94eb8d07461f4d6e518d7c72d8044defd653fd8906) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x052e66fe2ec34fd2a0ff028d50126099b5f5d6a8818d15da15e2ab9b68e5878c) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x138fa6b6f11f940b734af569f0d897428ee7efbfa3a4f04ecf8f41694d086bad) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x17466c3dd52be02d48ded96edaa24790ca47964e70b04df00543cadefa09d854) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x1d52fc80de66f21078f5c96c595f2ed400e93905a7ce77ab33cb80d9dcf21b51) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x0429837353b17e8420f6c206dc1814c8f8bb76529ae8a7f61e864c60b7f3e377) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x2f59b5d8795cbb7c033b7a8bf56893b797a22f87d1c090419039ea6731809ede) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x27ecf5d7f56b7487a5b8a52bd154437af513aedaeaa21dbfbddce6633987b586) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x2290535db48dd31b3a73273f47dc80e983ec02f61b6709ab01a0dea7f721f574) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x016255578d1dc77ff2b066858e5b6a3ed8dba908114cc0eb9ed7402a8780d12c) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x0cd06bfc7403696be5b21655948067852d329a78e3133971e11a1cb613db88d2) // vk.SIGMA4.y
            mstore(add(_vk, 0x400), 0x0fbd3508db14753ba04366123914f19e1241e4fe8daaa9bc4a3434765dc38287) // vk.TABLE1.x
            mstore(add(_vk, 0x420), 0x2286f6028252d1ef6c510d36127ccb45fa3037fbe597163cbb087b04e06510c9) // vk.TABLE1.y
            mstore(add(_vk, 0x440), 0x1d10b2e7041abbf77830ebb28524ce527c2a17b9f41aa9f0fae126f970527702) // vk.TABLE2.x
            mstore(add(_vk, 0x460), 0x13bf063e05b26e4e0cabcb2b1ce31429f0b77ed04332ad008b2335c7b32fdf49) // vk.TABLE2.y
            mstore(add(_vk, 0x480), 0x007a80a0f9d660266c927006d39ad8cb6bd6ce0f611ee528618b857fed070e16) // vk.TABLE3.x
            mstore(add(_vk, 0x4a0), 0x2a57f21130a12be4b352e88e3cafb14158fcb02b6fb211565131b33d258d4f56) // vk.TABLE3.y
            mstore(add(_vk, 0x4c0), 0x1118d84874cb5d8c476e16dc99b7bacfbde496afc80c7417bbefd5ee0f999a52) // vk.TABLE4.x
            mstore(add(_vk, 0x4e0), 0x0e48eb07b6fda71e59ead38c9b98762c09f3a6278aa85ee34f1670c2b2514693) // vk.TABLE4.y
            mstore(add(_vk, 0x500), 0x13e5b74caef7f1ce9041059b6799b46a28cf7cfaac15ceb2598e319a1c1d8380) // vk.TABLE_TYPE.x
            mstore(add(_vk, 0x520), 0x03a80605a1fad1ed9aebeb3f6710846b07d68b877e7e1efe9da7d3929f0714d6) // vk.TABLE_TYPE.y
            mstore(add(_vk, 0x540), 0x141b7b1f9f73260c4433fe9813b647cc45b22ef7104daa0e5c4e19886af27d0a) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x23d68330ff5f083131271da84ff57a6f95316c11c63ce8b2af5a421920d9ce67) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x1fd40b31b21db004ef341a32ce5b48d177fadb669d4a3330e0fdc1dd89f27535) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x0111c24c0cc10327ae6d9678d70372a7757fda91c8f09cc8bbd5ea4a1b2d94d4) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x0a29bda61f408385d81bc00c3ae272e8f23934ba2e2affb16f0581259b8ffa4b) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x075001dbf2095dff48d12ae9ef87c5df464b950edc5b9d1b50d4db1d7ca8743f) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x2eea648c8732596b1314fe2a4d2f05363f0c994e91cecad25835338edee2294f) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x0ab49886c2b94bd0bd3f6ed1dbbe2cb2671d2ae51d31c1210433c3972bb64578) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x26177cf2b2a13d3a035cdc7567a8a676d80396ec1d3213ee78ce6a0b763d698f) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyVote(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000020000) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000028) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x1bf82deba7d74902c3708cc6e70e61f30512eca95655210e276e5858ce8f58e5) // vk.work_root
            mstore(add(_vk, 0x60), 0x30643640b9f82f90e83b698e5ea6179c7c05542e859533b48b9953a2f5360801) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x0a9b8e52bab853a27fea91fc0b70c93eb95d8d7c7babf4020743b5095eebfc84) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x02f389b5411c40e329ca66922f00b2fb082af557451d85dc266a27e0aea02074) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x23483c027642dbcf69d8dc4c066e6ba221bcb512d84797fe92ab5cba5b0a7654) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x2ac50e6c7609a96238f6c829c02dad4f5ce8b8d19c54fa045a54e9ae8d6eb124) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x2be0c8006c2974c036b9c53612ef07505fe58918814844382f5145f366fb7b04) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x137c6e3933b8cc0aa76b8ac7800b5c16118cb4b313630821a13cbc52bc2c3674) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x052c2667779674d3632099650676540a2e026b71721a5be5ece37c88d2ef10fb) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x1bdaab39063dfffee1b39e9b962083351f7224cc28a5efda9ae6c9336f0964e4) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x1c1d4907f4ab2000911b505ea631577a4c54792f9b7f3793d30e3b54b6f40575) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x1cd02c6f74146dfe22fd28fd18080406a723eb0b7f1eb169e037c7075859a821) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x2ac4b6a6327bfc53ba8c5eed44d74dadfc1757415558857ab3db618c2f16dbb2) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x04296b27ad248e934eb2c3733c811e4ff0f0fd514a5a9a5f1c8c04c2d7c9e6db) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x2a9d8399719fcf2d55adde5ce11c62cdf18e0cfeab103013ec8060181889485b) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x1d874345fe2cf130de268b910610bb58e82e8ce9fb3f18ef7e8fad05ba6cec36) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x18999065091f925f0584050baedcc88a6aeacdee05de25e89bfbd556323c3f6a) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x0a838b39e43cf14ec300c95a1fbc0d0039a1f1421f974f5691c0230c4d826c35) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x28b955aac4c043cbcfde06eee59b44363f96fe0a6fa93b0b36ef07fbe285d4c7) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x16e1bbb0a7728dcb7696fdf3361b39510c6a4f83cc2159f5fc65ceb2be0599f9) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x1414af76247139fa9e8fef8b393a3e03227ee3a6fedb1e55f5db82cb2352782a) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2c7895a68d2fab5b2bce4d7703daebf9011e63d675bc6898c7f06087d6d83d99) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x189e946384a6e559c206a029124e4d2d41e36b9e7fc79aba82e49e4416f03715) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x1a862b5af004545481fd523b70cd28e1fc09e2be8c53d0094e31155cccce1cdc) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x26c03ddac381ec51a355265c67e7391c9c8c8e0edcc397529e39ba4fb9be32d0) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x09a4353093917f364fcc64c5bffab3372300b53960554dd3cb29de58bcf9934c) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x161dd107ccc4e52ade851c866de9fc55c9888a51a7d3362c6b40d0c108ee93bc) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x293d4de5dab8093034278d8f673d757ca78473684aeeef6337d1811c870982a9) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x0ff89b4c3f854c8814c276d84161137f8f2fdf4366ac4b2f20467bf4becf3efe) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x1c355f4687168058f55389a9c2bce21b7b9ddb111bf15b9c6c0478d4f140de9f) // vk.SIGMA4.y
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
            mstore(add(_vk, 0x540), 0x1ec35e7bcc8e5b5d8273e1613c91e44249253be14324f665aff95b6f50651517) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x228c764e338110f4a4fd75297958ddac7938a3a256d932965bc23ad98be3376b) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x04178f9ca977cd9630c06e2174c136bb221c4847a4bd1af35775f46ed38d2514) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x2d6ef43af7de086e42b8873e558ba908e8173b527bd141465d7423d79b177c78) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x2b54d8e42b738f5e74a2398a759a2fdda26b3f756e5e7e04e03c3df2a62f1384) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x2f63f9314c5b9b253feb3f616487080e2c8ff43e8fa1414e92f73ab4ca13a148) // vk.ID3.y
            mstore(add(_vk, 0x600), 0x1dee2d9afe2c649f16ce02d7a6ac0b51404fccbf6a742db3a5ff4c505667a4cb) // vk.ID4.x
            mstore(add(_vk, 0x620), 0x1a0e16f5b602fa3ca1e1b1b8c588ac6b94214387719a9bbdbe9ca0f55355996d) // vk.ID4.y
            mstore(add(_vk, 0x640), 0x00) // vk.contains_recursive_proof
            mstore(add(_vk, 0x660), 0) // vk.recursive_proof_public_input_indices
            mstore(add(_vk, 0x680), 0x260e01b251f6f1c7e7ff4e580791dee8ea51d87a358e038b4efe30fac09383c1) // vk.g2_x.X.c1 
            mstore(add(_vk, 0x6a0), 0x0118c4d5b837bcc2bc89b5b398b5974e9f5944073b32078b7e231fec938883b0) // vk.g2_x.X.c0 
            mstore(add(_vk, 0x6c0), 0x04fc6369f7110fe3d25156c1bb9a72859cf2a04641f99ba4ee413c80da6a5fe4) // vk.g2_x.Y.c1 
            mstore(add(_vk, 0x6e0), 0x22febda3c0c0632a56475b4214e5615e11e6dd3f96e6cea2854a87d4dacc5e55) // vk.g2_x.Y.c0 
            mstore(_omegaInverseLoc, 0x244cf010c43ca87237d8b00bf9dd50c4c01c7f086bd4e8c920e75251d96f0d22) // vk.work_root_inverse
        }
    }

    function loadVerificationKeyVecAdd(uint256 _vk, uint256 _omegaInverseLoc) internal pure {
        assembly {
            mstore(add(_vk, 0x00), 0x0000000000000000000000000000000000000000000000000000000000000800) // vk.circuit_size
            mstore(add(_vk, 0x20), 0x00000000000000000000000000000000000000000000000000000000000000f0) // vk.num_inputs
            mstore(add(_vk, 0x40), 0x027a358499c5042bb4027fd7a5355d71b8c12c177494f0cad00a58f9769a2ee2) // vk.work_root
            mstore(add(_vk, 0x60), 0x305e41e912d579f5b3193badcab128321c8ee1cb70aa396331b979553d820001) // vk.domain_inverse
            mstore(add(_vk, 0x80), 0x2871aec927bf3cede72cd4a38174c5b25478c2e67c897056c4d840465929f3b7) // vk.Q1.x
            mstore(add(_vk, 0xa0), 0x277be628cb2ddcb0bb3434aae729a64064f8e00f4ada18a18feb7caa0d928f34) // vk.Q1.y
            mstore(add(_vk, 0xc0), 0x215b85f76a467b9223f48f596c414b267fe97942d054cc07958e1791f0aace02) // vk.Q2.x
            mstore(add(_vk, 0xe0), 0x0f8fba31546c8043a03d746f44267631552f9c875cbc154d20b3c47b86f97b44) // vk.Q2.y
            mstore(add(_vk, 0x100), 0x0e5cadab0cffa253bf53bef446f7d77a7f88bc46a9a0aebf12ea682c3377e422) // vk.Q3.x
            mstore(add(_vk, 0x120), 0x27fc89806fe1a0703211dd2731498b2b6226e25e84aa41007d03a5b70456a0bc) // vk.Q3.y
            mstore(add(_vk, 0x140), 0x094ecec2cc345cfbb94d9742c01871265fe55ae2a4c50ca3f45fc97464e3d526) // vk.Q4.x
            mstore(add(_vk, 0x160), 0x21e26cf685653dfdaa2cc47d5f5a7cd1ca8d18512e4576218b314972835344e9) // vk.Q4.y
            mstore(add(_vk, 0x180), 0x039fd265a38d5eadcefcef41e84bfd6737dfb7b1f2c4518340bc80d4d9001f01) // vk.Q_M.x
            mstore(add(_vk, 0x1a0), 0x2fb82813a79265aa05df288b2b8926439a470e04c40ae84370f08fdfeec27d8b) // vk.Q_M.y
            mstore(add(_vk, 0x1c0), 0x1aba8f0c3a9987880c47cd5f15ca67f38bd2bb653328ecae9183aa3fd2b89a5c) // vk.Q_C.x
            mstore(add(_vk, 0x1e0), 0x291d393b5fb201511ababf944677434d97449e16381931c5230c1f0f55e93489) // vk.Q_C.y
            mstore(add(_vk, 0x200), 0x21826e8a0ed0ef0e68fa8062355a943ed0fada819746322f3e40926f26e31582) // vk.Q_ARITHMETIC.x
            mstore(add(_vk, 0x220), 0x254db4861a8eed20156fcfacd635412401718f18829624f28f17a66f0e23e9ee) // vk.Q_ARITHMETIC.y
            mstore(add(_vk, 0x240), 0x212cbe7bff2a75e5891302b32859684b8b18b7ff444d6bc8983a3bb9f3056a8c) // vk.QSORT.x
            mstore(add(_vk, 0x260), 0x11a3b3686168e3cefbb1c9c86ce1da04e18050063b128f0a34b0e4ca79f0371d) // vk.QSORT.y
            mstore(add(_vk, 0x280), 0x267302f63d129c05fe1ddc1449ce3483d5ff1b943384a3173a40e7395310f526) // vk.Q_ELLIPTIC.x
            mstore(add(_vk, 0x2a0), 0x09e8592d07b97663aaf2956e5ee136274e9ce0118f09deb4daab83fad76e78f3) // vk.Q_ELLIPTIC.y
            mstore(add(_vk, 0x2c0), 0x01aeeaa2478912af12266b5910ceb966d73be7a982cf4a35e94e64921eedf7e5) // vk.Q_AUX.x
            mstore(add(_vk, 0x2e0), 0x2f612b9bb2a6c45fa28795f7849e8dbd7e24dca8350195f14c4e609201be4889) // vk.Q_AUX.y
            mstore(add(_vk, 0x300), 0x21f17f6018195858a1be8b0b63c1b680d1b6da6ccaa5260b42ddbe0ab6de4f2c) // vk.SIGMA1.x
            mstore(add(_vk, 0x320), 0x04ab915babc39ee7252a9cac4662a1eac36af95c8ca604fe451fd38dacdf7643) // vk.SIGMA1.y
            mstore(add(_vk, 0x340), 0x0f0d3995219b2d1b5c7ae64c0186169e054dd6a0f7c650eecff8c3b12dee675d) // vk.SIGMA2.x
            mstore(add(_vk, 0x360), 0x2f1d811a0e27ef330bae384f36a11428899ab6652a9899fcaba1c4bd79aff6ec) // vk.SIGMA2.y
            mstore(add(_vk, 0x380), 0x0fddb4a05a56b046f938f3e26f4952140bfe4174eddb4d3a92ade9915a50903d) // vk.SIGMA3.x
            mstore(add(_vk, 0x3a0), 0x058f7663397da2d1b5bb572a4e036c42cb9d0011b7a8a1979943f9e99ede83da) // vk.SIGMA3.y
            mstore(add(_vk, 0x3c0), 0x1a8bb0a1e3e4442707b8a816955511c4a0ed7ec5f793a99729fab479cfbacfb6) // vk.SIGMA4.x
            mstore(add(_vk, 0x3e0), 0x2c738ca3e57ed1f79ba1413f7fdc3ab12a16878ee56a892727214a40ffe99c27) // vk.SIGMA4.y
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
            mstore(add(_vk, 0x540), 0x17fba0911d3955e856694171f9fba0cfb26eec26c96e434eac48e9185c80979a) // vk.ID1.x
            mstore(add(_vk, 0x560), 0x12de102897756fc6b04aa7d0b5caebeb1e8a6c84f96fb561ef61509cc5b8e4c8) // vk.ID1.y
            mstore(add(_vk, 0x580), 0x16ac7d94467a5b223f52c09be8b4cefaac447296f1ab7155bd782a7bf22b8f7c) // vk.ID2.x
            mstore(add(_vk, 0x5a0), 0x231460d72c685d8306e98aad7ab61a447476b74a8cf9556c6c29f01e1bcce7d4) // vk.ID2.y
            mstore(add(_vk, 0x5c0), 0x11d5c2914ff54cf5787d2c4973649a532471f97a6d6819c75758ce6ebc4a095c) // vk.ID3.x
            mstore(add(_vk, 0x5e0), 0x14cad4d20158b89a5d51b4c7fb52f2f97f2ca08fd976b98daaf5f389bb7d844c) // vk.ID3.y
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

    function getVerificationKeyHashBaseDec() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseDel() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseEnc() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseEncSub() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseAdd() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseSub() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseVote() public pure virtual returns (bytes32);
    function getVerificationKeyHashBaseVecAdd() public pure virtual returns (bytes32);
    
    function loadVerificationKeyBaseDec(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseDel(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseEnc(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseEncSub(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseAdd(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseSub(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseVote(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;
    function loadVerificationKeyBaseVecAdd(uint256 _vk, uint256 _omegaInverseLoc) internal pure virtual;

    /**
     * @notice Verify a Ultra Plonk proof
     * @param _proof - The serialized proof
     * @param _publicInputs - An array of the public inputs
     * @param selector - Which relation to verify (1 = Dec, 2 = Del, 3 = Enc)
     * @return True if proof is valid, reverts otherwise
     */
    function verify(bytes calldata _proof, bytes32[] calldata _publicInputs, uint8 selector) external view returns (bool) {
        
        if (selector == 1) {
            loadVerificationKeyBaseDec(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 2) {
            loadVerificationKeyBaseDel(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 3) {
            loadVerificationKeyBaseEnc(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 4) {
            loadVerificationKeyBaseAdd(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 5) {
            loadVerificationKeyBaseSub(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 6) {
            loadVerificationKeyBaseEncSub(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 7) {
            loadVerificationKeyBaseVote(N_LOC, OMEGA_INVERSE_LOC);
        } else if (selector == 8) {
            loadVerificationKeyBaseVecAdd(N_LOC, OMEGA_INVERSE_LOC);
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
    function getVerificationKeyHashBaseDec() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashDec();
    }

    function getVerificationKeyHashBaseDel() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashDel();
    }
    
    function getVerificationKeyHashBaseEnc() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashEnc();
    }

    function getVerificationKeyHashBaseEncSub() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashEncSub();
    }

    function getVerificationKeyHashBaseSub() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashSub();
    }

    function getVerificationKeyHashBaseAdd() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashAdd();
    }

    function getVerificationKeyHashBaseVote() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashVote();
    }

    function getVerificationKeyHashBaseVecAdd() public pure override(BaseUltraVerifier) returns (bytes32) {
        return UltraVerificationKey.verificationKeyHashVote();
    }

    // vks

    function loadVerificationKeyBaseDec(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyDec(vk, _omegaInverseLoc);
    }

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

    function loadVerificationKeyBaseSub(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeySub(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseVote(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyVote(vk, _omegaInverseLoc);
    }

    function loadVerificationKeyBaseVecAdd(uint256 vk, uint256 _omegaInverseLoc) internal pure virtual override(BaseUltraVerifier) {
        UltraVerificationKey.loadVerificationKeyVecAdd(vk, _omegaInverseLoc);
    }
}
