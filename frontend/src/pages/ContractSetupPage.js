import * as React from "react";
import NavBar from "../components/NavBar";
import "./CreateProposal.css";
import "./ContractSetupPage.css";
import { ethers } from "ethers";
import {
  contractAddress,
  abi,
  defaultAccount,
  timelock,
  token,
} from "../util/const";
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
  Progress,
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
  InfoIcon,
  WarningIcon,
  WarningTwoIcon,
} from "@chakra-ui/icons";
import { useNavigate } from "react-router-dom";
import { EmojiPeople } from "@mui/icons-material";
import { useState, useEffect } from "react";
import { SetupDelegates, TrustedAuthSetup } from "../util/requests";
// import { InitializeContract } from "../util/onchain";

const provider = new ethers.providers.JsonRpcProvider("http://foundry:8545");
// const provider = new ethers.providers.JsonRpcProvider("http://foundry:8545");

var GovBravo = new ethers.Contract(contractAddress, abi, provider.getSigner());

export default function ContractSetupPage() {
  const navigate = useNavigate();
  const [data, setData] = useState(null);
  const [keys, setKeys] = useState(null);
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  const [daoName, setDAOName] = useState(""); // State to store input value
  const handleDAONameChange = (event) => {
    setDAOName(event.target.value);
  };
  const [loading, setLoading] = useState(false); // State to store input value

  const [tokenAddr, setTokenAddr] = useState(""); // State to store input value
  const handleTokenAddrChange = (event) => {
    setTokenAddr(event.target.value);
  };

  function SubmitOnChain() {
    async function handleClick() {
      // Trusted auth creates keys and deploys on chain
      setLoading(true)
      setData("Deploying Contracts");
      localStorage.setItem("dao_name", daoName);

      const response = await TrustedAuthSetup(daoName,tokenAddr);
      console.log(response);

      const logs = await provider.getLogs({
        address: contractAddress, // Replace with your governor contract address
      });

      if (logs.length > 0) {
        setData("Successfully deployed contract");
      }
      setData("Setting up delegate accounts");
      const r = await SetupDelegates();
      setData("Successful initialization");
      setLoading(false)
    }
    if (loading){
      return (
        <>
          <VStack marginBottom={"5vh"}>
            {data ? <div id="connectwallet">{data}</div> : <div></div>}
            <CircularProgress marginTop={"2vh"} isIndeterminate  />             
          </VStack>
        </>
      );
    }
    if (!loading){
      return (
        <>
          <VStack>
            {data ? <div id="connectwallet">{data}</div> : <div></div>}
            <HStack>
              {data == "Successful initialization"? (
                
                <Button
                  onClick={() => navigate("/nouns")}
                  marginTop={"5vh"}
                  marginBottom={"2vh"}
                  width={"15vw"}
                  variant={"outline"}
                  backgroundColor={"white"}
                  color={"black"}
                >
                  Continue
                </Button>
              ) : (
                <Button
                  onClick={handleClick}
                  marginTop={"5vh"}
                  marginBottom={"2vh"}
                  width={"15vw"}
                  variant={"outline"}
                  backgroundColor={"black"}
                  color={"white"}
                >
                  Register Dao
                </Button>
              )}
            </HStack>
          </VStack>
        </>
      );
    }
  }
  return (
    <div className="defaultbackground">
      <NavBar />
      <Container maxW={"60vw"} className="defaultcontainer">
      <Card marginTop={"2vh"}>
        <Center>
          <HStack marginTop={"4vh"}>
            <h1 id="registeryourdao">Register Your DAO</h1>
          </HStack>
        </Center>
          {/* <VStack> */}
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <WarningIcon color boxSize={8} />
            <div id="connectwallet">Name your DAO</div>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"} marginBottom={"5vh"}>
            <Input
              width={"50vw"}
              value={daoName}
              onChange={handleDAONameChange}
            ></Input>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            <WarningIcon color boxSize={8} />
            <div id="connectwallet">Token Address</div>

          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
          <div>Example: 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512</div>

          </HStack>

          <HStack marginLeft={"4vw"} marginTop={"4vh"} marginBottom={"5vh"}>
            <Input 
              width={"50vw"} 
              value={tokenAddr}
              onChange={handleTokenAddrChange}></Input>
          </HStack>
          <Center>
            <SubmitOnChain></SubmitOnChain>
          </Center>
        </Card>
      </Container>
    </div>
  );
}
