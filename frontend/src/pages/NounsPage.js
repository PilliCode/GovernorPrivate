import * as React from "react";
import { useState } from "react";
import { ethers } from "ethers";
import {
  contractAddress,
  abi,
  defaultAccount,
  timelock,
  token,
  comp_contractAddress,
  comp_abi,
  tokenrecip,
} from "../util/const";
import "./NounsPage.css";
import {
  Alert,
  AlertDescription,
  AlertIcon,
  AlertTitle,
  Box,
  Button,
  Card,
  CardBody,
  CardFooter,
  Center,
  CircularProgress,
  CloseButton,
  Container,
  Divider,
  Flex,
  HStack,
  Input,
  InputGroup,
  InputLeftElement,
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalHeader,
  ModalOverlay,
  Select,
  Spacer,
  Stack,
  StackDivider,
  Tag,
  Text,
  VStack,
  useDisclosure,
} from "@chakra-ui/react";
import NavBar from "../components/NavBar";
import { useNavigate } from "react-router-dom";
import {
  DelegateRegistration,
  DelegateUnregistration,
  DelegateReq,
  UndelegateReq,
} from "../util/requests";
import { useEffect } from "react";

const provider = new ethers.providers.JsonRpcProvider("http://10.112.63.196:8545");

var GovBravo = new ethers.Contract(contractAddress, abi, provider.getSigner());
var Comp = new ethers.Contract(
  comp_contractAddress,
  comp_abi,
  provider.getSigner()
);

export default function NounsPage() {
  const navigate = useNavigate();
  const [proposalsPassed, setProposalsPassed] = useState(0);
  const [proposalsFailed, setProposalsFailed] = useState(0);
  const [proposals, setProposals] = useState([]);
  const [delegated, setDelegated] = useState(false);
  const [delegateStatus, setDelegateStatus] = useState(false);

  const [bal, setBal] = useState(0);
  const [currentBlock, setCurrentBlock] = useState(null);

  const [delegatedAddr, setDelegatedAddr] = useState(() => {
    const storedData = localStorage.getItem("registered_delegate");
    return storedData ? JSON.parse(storedData) : null;
  });

  useEffect(() => {
    window.scrollTo(0, 0);
    findRecentLog();
    get_delegate_status();
    get_bal();
    getProposals();
    get_block();
    //   }
  }, []);

  async function get_block() {
    const num = await provider.getBlockNumber();
    console.log(num);
    setCurrentBlock(num);
  }

  async function get_bal() {
    const balance = await Comp.connect(
      provider.getSigner(defaultAccount)
    ).balanceOf(defaultAccount);
    setBal(ethers.utils.formatUnits(balance));
    const num = ethers.utils.parseUnits("100", 18);
    console.log(num);

    // const approveData = Comp.interface.encodeFunctionData("approve", [
    //   "0xc5a5c42992decbae36851359345fe25997f5c42d",
    //   num,
    // ]);
    // Encode `transferFrom` function call data
    const transferFromData = Comp.interface.encodeFunctionData("transferFrom", [
      "0x70997970C51812dc3A010C7d01b50e0d17dc79C8",
      "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266",
      ethers.utils.parseUnits("100", 18),
    ]);

    // const data = Comp.interface.encodeFunctionData("transfer", ["0x70997970C51812dc3A010C7d01b50e0d17dc79C8", num]);
    // const data = Comp.interface.encodeFunctionData("balanceOf", ["0x70997970C51812dc3A010C7d01b50e0d17dc79C8"]);
    // console.log("Encoded approve:", approveData);
    console.log("Encoded transf:", transferFromData);
    // const calld = Comp.interface._encodeParams(["address","uint256"], ["0x70997970C51812dc3A010C7d01b50e0d17dc79C8", num]);
    // console.log(calld)
    // console.log(calld.length)
  }

  async function get_delegate_status() {
    const isLocked = await Comp.connect(
      provider.getSigner(defaultAccount)
    ).isLocked(defaultAccount);

    const isActive = await GovBravo.connect(
      provider.getSigner(defaultAccount)
    ).is_active(defaultAccount);

    console.log(isLocked);
    console.log(isActive);

    let _delegateStatus = "";
    if (!isLocked) _delegateStatus = "undelegated";
    else if (isActive) _delegateStatus = "delegate";
    else _delegateStatus = "delegated";

    if (_delegateStatus == "delegated") {
      setDelegated(true);
    }
    setDelegateStatus(_delegateStatus);
  }

  const findRecentLog = async () => {
    const emitTopic1 = ethers.utils.id(
      "RegisterDelegate(address,uint256,bool,bool,uint256)"
    ); // Replace with the correct topic
    const emitTopic2 = ethers.utils.id(
      "UnregisterDelegate(address,bool,bool,uint256,uint256)"
    ); // Replace with the correct topic
    // const uni = new ethers.Contract(contractAddress, "/Users/pillicruz-dejesus/gov_private_bravo/gov_foundry/out/GovernorBravoDelegate.sol/GovernorBravoDelegate.json", provider)
    // uni.filters
    // const addr = ethers.utils.id(ethers.utils.getAddress(defaultAccount));
    try {
      const filter1 = {
        address: contractAddress,
        topics: [emitTopic1, ethers.utils.hexZeroPad(defaultAccount, 32)],
        fromBlock: 0,
      };
      const filter2 = {
        address: contractAddress,
        topics: [emitTopic2, ethers.utils.hexZeroPad(defaultAccount, 32)],
        fromBlock: 0,
      };

      const registered_emit = await provider.getLogs(filter1);
      const unregistered_emit = await provider.getLogs(filter2);
      console.log(registered_emit);
      console.log(unregistered_emit);

      if (registered_emit.length === 0 && unregistered_emit.length === 0) {
        console.log("No logs found for both events.");
        setRegistered(false);
        localStorage.setItem("registered_delegate", false);
      }

      const mostRecentRegistered =
        registered_emit.length > 0
          ? registered_emit[registered_emit.length - 1]
          : null;
      const mostRecentUnregistered =
        unregistered_emit.length > 0
          ? unregistered_emit[unregistered_emit.length - 1]
          : null;

      if (!mostRecentRegistered && mostRecentUnregistered) {
        console.log(
          "Unregister happened most recently:",
          mostRecentUnregistered
        );
        setRegistered(false);
        localStorage.setItem("registered_delegate", false);
      } else if (mostRecentRegistered && !mostRecentUnregistered) {
        console.log("Register happened most recently:", mostRecentRegistered);
        setRegistered(true);
        localStorage.setItem("registered_delegate", true);
      } else if (mostRecentRegistered && mostRecentUnregistered) {
        // Compare timestamps (blockNumber) to determine which happened most recently
        const blockNumber1 = mostRecentRegistered.blockNumber;
        const blockNumber2 = mostRecentUnregistered.blockNumber;

        if (blockNumber1 > blockNumber2) {
          console.log("Event 1 happened most recently:", mostRecentRegistered);
          setRegistered(true);
          localStorage.setItem("registered_delegate", true);
        } else if (blockNumber1 < blockNumber2) {
          console.log(
            "Event 2 happened most recently:",
            mostRecentUnregistered
          );
          setRegistered(false);
          localStorage.setItem("registered_delegate", false);
        } else {
          console.log("Both events happened at the same block.");
          setRegistered(false);
          localStorage.setItem("registered_delegate", false);
        }
      }
    } catch (error) {
      console.error("Error:", error);
    }
  };

  const [registered, setRegistered] = useState(findRecentLog);

  function UnregisterAsDelegate() {
    const { isOpen, onOpen, onClose } = useDisclosure();
    const [delegateUnregistrationText, setDelegateUnregistrationText] =
      useState(null);

    const {
      isOpen: is2ndOpen,
      onOpen: on2ndOpen,
      onClose: on2ndClose,
    } = useDisclosure();
    function openAndClose() {
      onClose();
      on2ndOpen();
    }
    const [loading, setLoading] = useState(false);

    async function UnregisterBackendAndChain() {
      setLoading(true);
      let r = await DelegateUnregistration(defaultAccount);
      setLoading(false);

      // if (receipt.status === 1) {
      //             console.log("Transaction succeeded!");
      //             setDelegateUnregistrationText(
      //               "Successfully Unregistered on chain"
      //             );
      //           } else {
      //             console.log("Transaction failed!");
      //           }
      setRegistered(false);
      window.location.reload();
    }
    if (loading) {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Unregister As Delegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Undelegate Registration</ModalHeader>
              <ModalCloseButton />
              <Center>
                <Text width={"20vw"}>
                  If you would like to unregister this address as a delegate
                  click unregister{" "}
                </Text>
              </Center>

              <Divider marginTop={"2vh"}></Divider>
              <ModalBody>
                <VStack>
                  <Center>
                    <Text>Unregistering as a delegate...</Text>
                  </Center>
                  <CircularProgress
                    marginTop={"2vh"}
                    marginBottom={"2vh"}
                    isIndeterminate
                  />
                </VStack>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    } else {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Unregister As Delegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Undelegate Registration</ModalHeader>
              <ModalCloseButton />
              <Center>
                <Text width={"20vw"}>
                  If you would like to unregister this address as a delegate
                  click unregister{" "}
                </Text>
              </Center>

              <Divider marginTop={"2vh"}></Divider>
              <ModalBody>
                <VStack>
                  <Text width={"20vw"}>{delegateUnregistrationText}</Text>

                  <Center>
                    <HStack>
                      <Button
                        onClick={UnregisterBackendAndChain}
                        marginTop={"2vh"}
                        marginBottom={"2vh"}
                      >
                        Unregister
                      </Button>
                      <Button
                        // onClick={() => navigate("/my-voting-power-redelegate")}
                        marginTop={"2vh"}
                        marginBottom={"2vh"}
                      >
                        Cancel
                      </Button>
                    </HStack>
                  </Center>
                </VStack>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    }
  }

  function RegisterAsDelegate() {
    const [delegateRegistrationText, setDelegateRegistrationText] =
      useState(null);

    const { isOpen, onOpen, onClose } = useDisclosure();
    const {
      isOpen: is2ndOpen,
      onOpen: on2ndOpen,
      onClose: on2ndClose,
    } = useDisclosure();
    function openAndClose() {
      onClose();
      on2ndOpen();
    }
    const [loading, setLoading] = useState(false);

    async function RegisterBackendAndChain() {
      setLoading(true);
      await DelegateRegistration(defaultAccount);
      setRegistered(true);
      setLoading(false);
      window.location.reload();

      // setDelegateStatus("delegate")
    }
    if (loading) {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Register As Delegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Delegate Registration</ModalHeader>
              <ModalCloseButton />
              {/* <Center>
                <Text width={"20vw"}>
                  If you would like to register this address as a delegate click
                  register{" "}
                </Text>
              </Center> */}

              <Divider marginTop={"2vh"}></Divider>
              <ModalBody>
                <VStack>
                  <Center>
                    <Text>Registering as a delegate...</Text>
                  </Center>
                  <CircularProgress
                    marginTop={"2vh"}
                    marginBottom={"2vh"}
                    isIndeterminate
                  />
                </VStack>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    } else {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Register As Delegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Delegate Registration</ModalHeader>
              <ModalCloseButton />
              <Center>
                <Text width={"20vw"}>
                  If you would like to register this address as a delegate click
                  register{" "}
                </Text>
              </Center>

              <Divider marginTop={"2vh"}></Divider>
              <ModalBody>
                <VStack>
                  <Text width={"20vw"}>{delegateRegistrationText}</Text>
                  <Center>
                    <HStack>
                      <Button
                        onClick={RegisterBackendAndChain}
                        marginTop={"2vh"}
                        marginBottom={"2vh"}
                      >
                        Register
                      </Button>
                      <Button
                        // onClick={() => navigate("/my-voting-power-redelegate")}
                        marginTop={"2vh"}
                        marginBottom={"2vh"}
                      >
                        Cancel
                      </Button>
                    </HStack>
                  </Center>
                </VStack>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    }
  }

  function Delegate() {
    const [anonymitySize, setAnonymitySize] = useState(null);
    const [delegateText, setDelegateText] = useState(null);
    const { isOpen, onOpen, onClose } = useDisclosure();
    const [selectedDelegate, setSelectedDelegate] = useState(null);  

    const {
      isOpen: is2ndOpen,
      onOpen: on2ndOpen,
      onClose: on2ndClose,
    } = useDisclosure();
    function openAndClose() {
      onClose();
      on2ndOpen();
    }

    const handleSelectChange = (event) => {
      setAnonymitySize(event.target.value);
    };

    const handleAddrChange = (event) => {
      setSelectedDelegate(event.target.value);
    };

    const [loading, setLoading] = useState(false);

    let delegates = [
      "0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc",
      "0x976EA74026E726554dB657fA54763abd0C3a0aa9",
      "0x14dC79964da2C08b23698B3D3cc7Ca32193d9955",
      "0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f",
      "0xa0Ee7A142d267C1f36714E4a8F75612F20a79720",
      "0xBcd4042DE499D14e55001CcbB24a551F3b954096",
      "0x71bE63f3384f5fb98995898A86B02Fb2426c5788",
      "0xFABB0ac9d68B0B445fB7357272Ff202C5651694a",
      "0x1CBd3b2770909D4e10f157cABC84C7264073C9Ec",
      "0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097",
      "0xcd3B766CCDd6AE721141F452C550Ca635964ce71",
      "0x2546BcD3c84621e976D8185a91A922aE77ECEc30",
      "0xbDA5747bFD65F08deb54cb465eB87D40e51B197E",
      "0xdD2FD4581271e230360230F9337D5c0430Bf44C0",
      "0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199",
      "0x09DB0a93B389bEF724429898f539AEB7ac2Dd55f",
      "0x02484cb50AAC86Eae85610D6f4Bf026f30f6627D",
      "0x08135Da0A343E492FA2d4282F2AE34c6c5CC1BbE",
      "0x5E661B79FE2D3F6cE70F5AAC07d8Cd9abb2743F1",
    ];

    async function DelegateOnChain() {
      setLoading(true);
      // const inputElement = document.getElementById("delegateAddr");
      // const delegateAddr = inputElement.value;
      if (anonymitySize == null || selectedDelegate == null) {
        setLoading(false);
        return;
      }
      await DelegateReq(defaultAccount, selectedDelegate, anonymitySize);
      setDelegatedAddr(selectedDelegate);
      setDelegated(true);
      setLoading(false);
      window.location.reload();
    }
    if (loading) {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Delegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Delegate voting power</ModalHeader>
              <ModalCloseButton />
              <Divider></Divider>
              <ModalBody>
                <VStack>
                  <CircularProgress marginTop={"2vh"} isIndeterminate />
                  <Center>
                    <Text
                      marginTop={"2vh"}
                      marginLeft={"0.2vw"}
                      alignSelf={"start"}
                      mb="8px"
                    >
                      Delegating...
                    </Text>
                  </Center>
                </VStack>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    } else {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Delegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Delegate voting power</ModalHeader>
              <ModalCloseButton />
              <Divider></Divider>

              <ModalBody>
              <Center>
                <VStack width={"20vw"}>
                  <Text
                    marginTop={"2vh"}
                    marginLeft={"0.2vw"}
                    alignSelf={"start"}
                    mb="8px"
                    >
                    Delegate Addresss
                  </Text>
                  {/* <Input
                    id="delegateAddr"
                    placeholder="Enter Delegate address"
                  /> */}
                  <Select
                    name={"user"}
                    value={selectedDelegate}
                    onChange={handleAddrChange}
                    placeholder="Select delegate address"
                    >
                    {delegates.map((option, index) => (
                      <option key={index} value={option}>
                        {option}
                      </option>
                    ))}
                  </Select>
                  <Text
                    marginTop={"2vh"}
                    marginLeft={"0.2vw"}
                    alignSelf={"start"}
                    mb="8px"
                    >
                    Anonymity set
                  </Text>
                  <Text
                    // marginTop={"2vh"}
                    marginLeft={"0.2vw"}
                    alignSelf={"start"}
                    fontSize={"sm"}
                    mb="8px"
                    >
                    How many delegates you want to hide your delegation amongst.
                    The larger the anonymity set the longer it takes to
                    delegate.
                  </Text>
                  <Select
                    marginTop={"1vh"}
                    name={"anonymitySetSize"}
                    value={anonymitySize}
                    onChange={handleSelectChange}
                    placeholder="Select anonymity set size"
                    >
                    <option value="5">5 delegates</option>
                    <option value="10">10 delegates</option>
                    <option value="20">20 delegates</option>
                  </Select>
                  <Center>
                    <Button
                      onClick={DelegateOnChain}
                      marginTop={"2vh"}
                      marginBottom={"2vh"}
                      >
                      Delegate Voting Power
                    </Button>
                  </Center>
                </VStack>
                      </Center>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    }
  }
  function Undelegate() {
    const { isOpen, onOpen, onClose } = useDisclosure();
    const {
      isOpen: is2ndOpen,
      onOpen: on2ndOpen,
      onClose: on2ndClose,
    } = useDisclosure();
    function openAndClose() {
      onClose();
      on2ndOpen();
    }
    const [loading, setLoading] = useState(false);

    // const inputElement = document.getElementById('delegateAddr');
    //   const delegateAddr = inputElement.value;
    //   console.log("Chose delegate " + delegateAddr)
    async function UndelegateOnChain() {
      setLoading(true);
      await UndelegateReq(defaultAccount);
      setDelegated(false);
      setLoading(false);
      window.location.reload();
    }
    if (loading) {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Undelegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Undelegate your voting power</ModalHeader>
              <ModalCloseButton />
              <Divider></Divider>
              <ModalBody>
                <VStack>
                  <CircularProgress marginTop={"2vh"} isIndeterminate />
                  <Text
                    marginTop={"2vh"}
                    marginLeft={"7vw"}
                    alignSelf={"start"}
                    mb="8px"
                    fontSize={"large"}
                  >
                    Undelegating...
                  </Text>
                </VStack>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    } else {
      return (
        <>
          <Button onClick={onOpen} id="button">
            Undelegate
          </Button>
          <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent>
              <ModalHeader>Undelegate from current delegate</ModalHeader>
              <ModalCloseButton />
              <Divider></Divider>
              <ModalBody>
                <VStack>
                  <Text
                    marginTop={"2vh"}
                    marginLeft={"0.2vw"}
                    alignSelf={"start"}
                    mb="8px"
                  >
                    Undelegate your voting power
                  </Text>
                  {/* <Text
                  marginTop={"2vh"}
                  marginLeft={"0.2vw"}
                  alignSelf={"start"}
                  mb="8px"
                >
                  Delegate Addresss
                </Text> */}

                  {/* <Input placeholder="Enter Delegate address" /> */}
                  {/* <CheckWallet></CheckWallet> */}
                  <Divider></Divider>
                  <Center>
                    <Button
                      onClick={UndelegateOnChain}
                      marginTop={"2vh"}
                      marginBottom={"2vh"}
                    >
                      Undelegate Voting Power
                    </Button>
                  </Center>
                </VStack>
              </ModalBody>
            </ModalContent>
          </Modal>
        </>
      );
    }
  }
  return (
    <div className="defaultbackground">
      <NavBar />
      <Container maxW={"60vw"} className="defaultcontainer">
        <Card id="nounsinfocard">
          <CardBody>
            <HStack spacing="10px">
              <img id="nounsicon" src="nounsicon.jpg"></img>
              <h1>{localStorage.getItem("dao_name")} DAO</h1>
              <div id="spacing"></div>
              <VStack>
                <Text width={"8vw"} fontWeight={"bold"}>
                  Your Token Balance
                </Text>
                <Text width={"8vw"} fontWeight={"bold"} color={"purple"}>
                  {bal} PGTs
                </Text>
              </VStack>
              <Button onClick={() => navigate("/proposal-create")}>
                Create Proposal
              </Button>
              {/* <Button onClick={() => navigate("my-voting-power")}>
                My Voting Power
              </Button> */}
              {/* <Button onClick={() => navigate("my-voting-power")}>
                Register as Delegate
              </Button> */}
              {delegateStatus == "delegate" ? (
                <>
                  {registered ? (
                    <UnregisterAsDelegate></UnregisterAsDelegate>
                  ) : (
                    <RegisterAsDelegate></RegisterAsDelegate>
                  )}
                </>
              ) : delegateStatus == "delegated" ? (
                <>
                  {" "}
                  {delegated ? (
                    <Undelegate></Undelegate>
                  ) : (
                    <Delegate></Delegate>
                  )}
                </>
              ) : (
                <>
                  {registered ? (
                    <UnregisterAsDelegate></UnregisterAsDelegate>
                  ) : (
                    <RegisterAsDelegate></RegisterAsDelegate>
                  )}
                  {delegated ? (
                    <Undelegate></Undelegate>
                  ) : (
                    <Delegate></Delegate>
                  )}
                </>
              )}

              {/* <Button onClick={() => navigate("my-voting-power")}>Delegate</Button> */}
            </HStack>
            <HStack id="description" spacing="10px">
              <p>
                Nouns are an experimental attempt to improve the formation of
                on-chain avatar communities. We just upgraded their delegation to be private.
              </p>
            </HStack>
            <HStack id="tags" spacing="10px">
              <Tag size="lg" colorScheme="gray" borderRadius="full">
                Ethereum
              </Tag>
              <Tag size="lg" colorScheme="purple" borderRadius="full">
                ERC20
              </Tag>
              <Tag size="lg" colorScheme="purple" borderRadius="full">
                Private Delegation
              </Tag>
            </HStack>
          </CardBody>
          <CardFooter>
            <p>Contract Parameters</p>
          </CardFooter>
        </Card>
        <Card id="nounsnumberscard">
          <HStack id="stack" spacing="10px">
          <VStack id="col" spacing="0px">
              <h1>{proposals.length}</h1>
              <p>Proposals</p>
            </VStack>
            {/* <VStack id="col" spacing="0px">
              <h1>395</h1>
              <p>Delegates</p>
            </VStack> */}
            <VStack id="col" spacing="0px">
              <h1>25</h1>
              <p>Token Holders</p>
            </VStack>
          </HStack>
        </Card>
        <Card id="nounsproposals">
          <CardBody>
            <Stack divider={<StackDivider />} spacing="4">
            <HStack id="stack" spacing="10px">
                <h1>Proposals</h1>
                <div id="spacing"></div>
                <p>{proposalsPassed}</p>
                <p id="passed">Passed</p>
                <p>{proposalsFailed}</p>
                <p id="failed">Failed</p>
              </HStack>
              <Flex id="firstflex">
                <div>Proposal</div>
                <Spacer />
                <div id="proposal">Votes for</div>
                <div id="proposal">Votes against</div>
                <div id="proposal">Votes abstain </div>
              </Flex>
              <ProposalList></ProposalList>
              {/* <TemplateActive></TemplateActive>
              <TemplateExecuted></TemplateExecuted>
              <TemplatePending></TemplatePending>
              <TemplatePending></TemplatePending>
              <TemplatePending></TemplatePending>
              <TemplatePending></TemplatePending> */}
            </Stack>
          </CardBody>
        </Card>
      </Container>
    </div>
  );

  function ProposalList() {
    return (
      // <div style={{ maxHeight: '400px', overflowY: 'scroll' }}>
      // <Stack >

      <Stack divider={<StackDivider />} spacing="4">
        {proposals
          .sort((a, b) => b.endBlock - a.endBlock)
          .map((proposal, index) => (
            <a href={"/proposal/" + proposal.id}>
              <HStack id="proposalstack">
                <img id="nounsicon" src="nounsicon.jpg"></img>
                <VStack id="verticalstack">
                  <p>{proposal.title} </p>
                  <HStack>
                    {proposal.status === "Pending" ? (
                      <Tag color="purple">Pending</Tag>
                    ) : proposal.status === "Awaiting init" ? (
                      <Tag color="purple">Awaiting Init</Tag>
                    ) : proposal.status === "Active" ? (
                      <Tag color="green">Active</Tag>
                    ) : proposal.status === "Awaiting decrypt" ? (
                      <Tag color="green">Awaiting Decrypt</Tag>
                    ) : proposal.status === "Succeeded" ? (
                      <Tag color="green">Succeeded</Tag>
                    ) : proposal.status === "Executed" ? (
                      <Tag color="blue">Executed</Tag>
                    ) : (
                      <Tag color="red">Defeated</Tag>
                    )}
                    <p>Begins on block: {proposal.startBlock}</p>
                    <p>Ends on block: {proposal.endBlock}</p>
                  </HStack>
                </VStack>
                <HStack id="proposalspacer"></HStack>
                {proposal.for === 0 && proposal.against === 0 && proposal.abstain === 0 ?(
                 <HStack>
                 <p id="votesfor0">{proposal.for}%</p>
                 <p id="votesagainst0">{proposal.against}%</p>
                 <p id="votestotal0">{proposal.abstain}%</p>
               </HStack>
                ):(                <HStack>
                  <p id="votesfor">{proposal.for}%</p>
                  <p id="votesagainst">{proposal.against}%</p>
                  <p id="votestotal">{proposal.abstain}%</p>
                </HStack>)}

                
                
              </HStack>
            </a>
            // <li key={index}>
            //   <p>ID: {proposal.id}</p>
            //   <p>Proposer: {proposal.proposer}</p>
            //   <p>Start Block: {proposal.startBlock}</p>
            //   <p>End Block: {proposal.endBlock}</p>
            //   <p>Description: {proposal.description}</p>
            // </li>
          ))}
      </Stack>
    );
  }
  
  async function getProposals() {
    const filter = GovBravo.filters.ElectionSetup();
    const logs = await GovBravo.queryFilter(filter);
    console.log(logs);
    let parsedProposals = [];
    let passed = 0
    let failed = 0
    for (const log of logs) {
      // Decode the log to get the event data
      let id = Number(log.args.id)
      let status = await getProposalStatus(id);
      const dec_filter = GovBravo.filters.DecryptTally(id);
      let dec_logs = await GovBravo.queryFilter(dec_filter);
      // Create an object from the outputs (assuming your event has 'value' and 'from' fields)
      let parsedProposal = {}
      if (dec_logs.length > 0){
        parsedProposal = {
          id: log.args.id.toString(),
          proposer: log.args.proposer,
          startBlock: log.args.startBlock.toString(),
          endBlock: log.args.endBlock.toString(),
          description: log.args.description,
          title: log.args.title,
          status: status,
          for: dec_logs[0].args.forVote/100,
          against:  dec_logs[0].args.againstVote/100,
          abstain: dec_logs[0].args.abstainVote/100
        };
      }else{
         parsedProposal = {
          id: log.args.id.toString(),
          proposer: log.args.proposer,
          startBlock: log.args.startBlock.toString(),
          endBlock: log.args.endBlock.toString(),
          description: log.args.description,
          title: log.args.title,
          status: status,
          for: 0,
          against:  0,
          abstain: 0
        };
      }
      parsedProposals.push(parsedProposal);
      async function getProposalStatus(proposalId) {
        // if election has not been started ie election start emit doesnt exist
        // this will make the status unstarted if unstarted then the button
        // that should be rendered is Election start
        let number = ethers.BigNumber.from(proposalId);
        const data = Number(
          await GovBravo.connect(provider.getSigner(defaultAccount)).state(number)
        );
        console.log(data)
        if (data == 0) return "Pending";
        else if (data == 1) return "Awaiting init";
        else if (data == 2) return "Active";
        else if (data == 3) return "Awaiting decrypt";
        else if (data == 4) {
          failed = failed+1
          return "Canceled";
        }
        else if (data == 5) {
          failed = failed+1
          return "Defeated";
        }
        else if (data == 6) {
          passed = passed + 1
          return "Succeeded";
        } 
        else if (data == 7) {
          passed = passed + 1
          return "Queued";
        } 
        else if (data == 8) {
          failed = failed+1
          return "Expired";
        }
        else if (data == 9) {
          passed = passed + 1
          return "Executed";
        } 
      }
    }

    // const finalProps = parsedProposals.map((product) => ({
    //   ...product,
    //   status: getProposalStatus(product.id),
    // }));

    setProposals(parsedProposals);
    setProposalsPassed(passed)
    setProposalsFailed(failed)
    // loop through emit logs and get the most recent nouns prposals add them to the UI
  }

}

