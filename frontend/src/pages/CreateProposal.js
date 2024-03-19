import * as React from "react";
import NavBar from "../components/NavBar";
import "./CreateProposal.css";
import { ethers } from "ethers";

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
  CardHeader,
  Center,
  CircularProgress,
  CloseButton,
  Container,
  Divider,
  HStack,
  Input,
  Radio,
  RadioGroup,
  Select,
  Tab,
  TabList,
  TabPanel,
  TabPanels,
  Tabs,
  VStack,
  useDisclosure,
} from "@chakra-ui/react";
import {
  CheckCircleIcon,
  CheckIcon,
  WarningIcon,
  WarningTwoIcon,
} from "@chakra-ui/icons";
import { useNavigate } from "react-router-dom";
import { EmojiPeople } from "@mui/icons-material";
import {
  abi,
  comp_abi,
  comp_contractAddress,
  contractAddress,
  defaultAccount,
} from "../util/const";
import { useState } from "react";
import { ElectionSetup } from "../util/requests";

const provider = new ethers.providers.JsonRpcProvider("http://10.112.63.196:8545");
var GovBravo = new ethers.Contract(contractAddress, abi, provider.getSigner());

var Comp = new ethers.Contract(
  comp_contractAddress,
  comp_abi,
  provider.getSigner()
);

export default function CreateProposal() {
  const [userForm, setUserForm] = useState({
    desc: "",
    title: "",
    targets: "",
    values: "",
    signatures: "",
    calldata: "",
    votingDelay: "",
    votingPeriod: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setUserForm((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  return (
    <div className="defaultbackground">
      <NavBar />
      <Container maxW={"60vw"} className="defaultcontainer">
        <Center>
          <HStack>
            <img id="nounsiconcreateproposal" src="nounsicon2.png"></img>
            <h1>{localStorage.getItem("dao_name")} DAO</h1>
          </HStack>
        </Center>
        <Card marginTop={"2vh"}>
          <HStack marginLeft={"4vw"} marginTop={"4vh"} marginBottom={"4vh"}>
            <CheckCircleIcon color={"purple"} boxSize={8} />
            <div id="connectwallet">Connect your wallet & sign in </div>
          </HStack>
        </Card>
        <Card marginTop={"2vh"}>
          {/* <VStack> */}
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <CheckCircleIcon color boxSize={8} />
            <div id="connectwallet">Proposal details</div>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <p>
              Give your proposal a title and a description. They will be public
              when your proposal goes live! 
            </p>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
          <p>
              For testing paste the information after "Example:"
            </p>

          </HStack>

          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <h1>Title</h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
            <h1 id="exampletext">
              The title of your proposal
            </h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            <Input
              name={"title"}
              value={userForm.title}
              onChange={handleChange}
              width={"50vw"}
            ></Input>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <h1>Description</h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
            <h1 id="exampletext">
              The description of your proposal
            </h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            <Input
              name={"desc"}
              value={userForm.desc}
              onChange={handleChange}
              width={"50vw"}
              height={"15vh"}
            ></Input>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <h1>Targets </h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
            <h1 id="exampletext">
              The target contract addresses to be executed. Example: 0xe7f1725e7734ce288f8367e1bb143e90bb3f0512
            </h1>
          </HStack>

          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            <Input
              name={"targets"}
              placeholder="Example: 0xe7f1725e7734ce288f8367e1bb143e90bb3f0512"
              value={userForm.targets}
              onChange={handleChange}
              width={"50vw"}
              height={"5vh"}
            ></Input>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <h1>Values</h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
            <h1 id="exampletext">
              The amount of eth to send for each function call, this will usually be 0 unless the contract is payable. Each should be coma
              seperated. Example: 0
            </h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            <Input
              name={"values"}
              value={userForm.values}
              placeholder="Example: 0"
              onChange={handleChange}
              width={"50vw"}
              height={"5vh"}
            ></Input>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <h1>Call Data</h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
            <h1 id="exampletext">
              The hashed call data of each function call. This can be generated in js via ethers function Contract.interface.encodeFunctionData(). Example: 0x23b872dd00000000000000000000000070997970c51812dc3a010c7d01b50e0d17dc79c8000000000000000000000000f39fd6e51aad88f6f4ce6ab8827279cfffb922660000000000000000000000000000000000000000000000056bc75e2d63100000
            </h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            <Input
              name={"calldata"}
              placeholder="Example: 0x23b872dd00000000000000000000000070997970c51812dc3a010c7d01b50e0d17dc79c8000000000000000000000000f39fd6e51aad88f6f4ce6ab8827279cfffb922660000000000000000000000000000000000000000000000056bc75e2d63100000"
              value={userForm.calldata}
              onChange={handleChange}
              width={"50vw"}
              height={"5vh"}
            ></Input>
          </HStack>

          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <h1>Voting Delay</h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
            <h1 id="exampletext">
              The number of blocks that users must wait until the proposal can be initiated
            </h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            {/* <h1>Buffer Period</h1> */}
            <Select
              name={"votingDelay"}
              value={userForm.votingDelay}
              onChange={handleChange}
              width={"50vw"}
              placeholder="Select voting delay in blocks"
            >
              <option value="1">1 block</option>
              <option value="2">2 blocks</option>
              <option value="3">3 blocks</option>
            </Select>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <h1>Voting Period</h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"1vh"}>
            <h1 id="exampletext">
              The number of blocks that the proposal will remain active
            </h1>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"} marginBottom={"4vh"}>
            {/* <h1>Buffer Period</h1> */}
            <Select
              name={"votingPeriod"}
              value={userForm.votingPeriod}
              onChange={handleChange}
              width={"50vw"}
              placeholder="Select voting period in blocks"
            >
              {/* <option value="1">1 block</option> */}
              <option value="3">3 blocks</option>
              <option value="4">4 blocks</option>
              <option value="5">5 blocks</option>
              <option value="6">6 blocks</option>

            </Select>
          </HStack>
        </Card>
        <Card marginTop={"2vh"} height={"fit-content"}>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <CheckCircleIcon color boxSize={8} />
            <div id="connectwallet">Preview your proposal</div>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"6vh"}>
            <p>
              You have completed all steps successfully. Now is the time to
              review your proposal and submit it.
            </p>
          </HStack>
          <Center>
            <Card marginTop={"4vh"}>
              <CardHeader>
                <>{userForm.title}</>
              </CardHeader>
              <CardBody>
                {/* <HStack> */}
                <p>Proposed by: 0xf0593AD36F0aB78D30ed9eF3302b95C29Ca585f8 </p>
                <p id="proposalseperator">Description: {userForm.desc}</p>
                <p id="proposalseperator">
                  Voting Delay: {userForm.votingDelay} block(s)
                </p>
                <p id="proposalseperator">
                  Voting Period: {userForm.votingPeriod} block(s)
                </p>
                <p id="proposalseperator">Targets: {userForm.targets}</p>
                <p id="proposalseperator">Values: {userForm.values}</p>
                <p id="proposalseperator">Call Data: {userForm.calldata}</p>
                
              </CardBody>
            </Card>
          </Center>
          <SubmitOnChain />
        </Card>
      </Container>
    </div>
  );
  function SubmitOnChain() {
    const navigate = useNavigate();

    const [loaded, setLoaded] = useState(false);

    async function ProposeOnChain() {
      const balance = await Comp.connect(
        provider.getSigner("0x70997970C51812dc3A010C7d01b50e0d17dc79C8")
      ).approve(contractAddress, ethers.utils.parseUnits("100", 18));

      await ElectionSetup(
        userForm.title,
        userForm.desc,
        userForm.votingDelay,
        userForm.votingPeriod,
        userForm.targets,
        userForm.values,
        userForm.signatures,
        userForm.calldata
      );
      setLoaded(true);
    }
    if (!loaded) {
      return (
        <>
          <VStack marginTop={"6vh"}>
            <Button
              // marginTop={"4vh"}
              width={"12vw"}
              variant={"outline"}
              backgroundColor={"black"}
              color={"white"}
              onClick={ProposeOnChain}
              marginBottom={"2vh"}

            >
              Submit Onchain
            </Button>
          </VStack>
        </>
      );
    } else {
      return (
        <>
          <VStack marginTop={"4vh"}>
            <p>Successfully added proposal {userForm.title} on chain</p>
            <Button
              marginTop={"2vh"}
              onClick={() => navigate("/nouns")}
              variant={"outline"}
              backgroundColor={"white"}
              color={"black"}
              width={"12vw"}
              marginBottom={"2vh"}
            >
              View Proposal
            </Button>
          </VStack>
        </>
      );
    }
  }
}
