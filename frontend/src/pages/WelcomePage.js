import * as React from "react";
import NavBar from "../components/NavBar";
import "./WelcomePage.css";
import "./ContractSetupPage.css";
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
import { backend_ip } from "../util/const";
import axios from "axios";
import { useState } from "react";


export default function WelcomePage() {
  const [addInfo, setAddInfo] = useState("");
  const navigate = useNavigate();

  function enterAndNav() {
    axios
      .get(backend_ip + "/enter")
      .then((response) => {
        // If the response indicates success, allow the user to proceed
        console.log(response.data);
        if (response.data === "Welcome to the website!") {
          navigate("/nouns");
        } else {
          setAddInfo(
            "Site currently in use. Wait a few minutes and try again!"
          );
        }
      })
      .catch((error) => {
        // If the response indicates redirection, display a message and redirect the user
        if (error.response.status == 302) {
          document.getElementById("message").textContent =
            "Please wait for an available slot.";
          setTimeout(function () {
            window.location = error.response.headers.Location;
          }, 3000);
        }
      });
  }
  console.log("Test 2");
  return (
    <div className="defaultbackground">
      <NavBar />
      <Container maxW={"60vw"} className="defaultcontainer">
        <Card marginTop={"2vh"}>
          <Center>
            <HStack marginTop={"4vh"}>
              <h1 id="registeryourdao">Welcome to Governor Private Bravo!</h1>
            </HStack>
          </Center>
          {/* <VStack> */}
          <HStack marginLeft={"4vw"} marginTop={"4vh"}>
            <WarningIcon color boxSize={8} />
            <div id="connectwallet">What is it?</div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"4vh"}
            marginBottom={"5vh"}
            marginRight={"4vh"}
          >
            <div>
              Governor Private Bravo is an adapted version of Compound's
              Governor Bravo which allows for private delegation and public
              voting on DAOs (Decentralized Autonamous Organizations). This
              governance structure is designed to bring representative democracy
              onto the blockchain. We outline our protocol in detail on our
              website.{" "}
            </div>
          </HStack>
          <HStack marginLeft={"4vw"} marginTop={"2vh"}>
            <WarningIcon color boxSize={8} />
            <div id="connectwallet">How to use it</div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"4vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 1. Choose a DAO name and paste in the given token address
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"2vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 2. Create a proposal with the supplied inputs. The example
              proposal transfers 100 Private Governance Tokens (PGTs) into your
              account.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"2vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 3. Delegate or Register as Delegate. Your default account is
              the address 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266. In order
              for this accounts tokens to be used you must eithero register this
              account as a delegate or delegate your voting power to one of the
              other initialized delegate accounts. If you delegate your voting
              power to another account you can not delegate with that account.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"2vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 4. Initialize the election. This takes a snapshot of the
              voting powers when the button is pressed so that users can not
              circumvent the voting process via delegation or token transfers.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"2vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 5. Public Voting. Vote with any of the given accounts (this
              would not be possible in industry but is allowed for the purposes
              of the demo). All accounts are initialized with 1000 tokens except
              for the default account which has 76,000. Continue voting with
              different accounts until sufficient time has passed for the tally
              to expire and the ability to decrypt becomes available. Note if
              you wish to vote with your default account you must register it as
              a delegate. If you delegate the voting power of that account you
              will be unable to vote with it.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"2vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 6. Decrypt. Send a request to the tally to decrypt the vote
              and post the percentages.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"2vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 7. Execute. If the proposal is successful you can execute the
              proposed command onchain and you will know it has worked if your
              token balance has increased by 100.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"2vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Step 8. Repeat steps 2-8 in different orders, with different
              delegation statuses, and different accounts.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"4vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>Things to note:</div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"1vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Time moves forward based on executed transactions. To advance time
              you must execute a transaction. For example after creating a
              proposal to move out of the pending state you will want to
              delegate in order to move it to the awaiting initialization state.{" "}
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"1vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Everything is on a local ethereum testnet not on the real
              blockchain
            </div>
          </HStack>
          <HStack
            marginLeft={"4vw"}
            marginTop={"1vh"}
            marginRight={"4vh"}
            textAlign={"start"}
          >
            <div>
              Some of the steps will take around a minute and a half to
              complete. The backend is generating zero knowledge proofs and
              setting up the all of the demo accounts. Unless an error pops up
              it is likely working just give it some time to finish!
            </div>
          </HStack>
          <Center>
            <Button
              marginTop={"4vh"}
              marginBottom={"4vh"}
              onClick={enterAndNav}
            >
              Experience Governance
            </Button>
          </Center>
          <Center marginBottom={"4vh"} textColor={"red"}>
            <div>{addInfo}</div>
          </Center>
        </Card>
      </Container>
    </div>
  );
}
