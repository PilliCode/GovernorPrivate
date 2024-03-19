import * as React from "react";
import NavBar from "../components/NavBar";
import "./Proposal.css";

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
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalHeader,
  ModalOverlay,
  Radio,
  RadioGroup,
  Select,
  Stack,
  StackDivider,
  Tab,
  TabList,
  TabPanel,
  TabPanels,
  Tabs,
  Tag,
  Text,
  VStack,
  useDisclosure,
} from "@chakra-ui/react";
import {
  CheckCircleIcon,
  CheckIcon,
  WarningIcon,
  WarningTwoIcon,
} from "@chakra-ui/icons";
import { useNavigate, useParams } from "react-router-dom";
import { useState } from "react";
import {
  abi,
  comp_abi,
  comp_contractAddress,
  contractAddress,
  defaultAccount,
} from "../util/const";
import { ethers } from "ethers";
import { useEffect } from "react";
// import { Tooltip, buttonBaseClasses } from "@mui/material";
import { DecryptTally, ElectionStartReq, VoteReq } from "../util/requests";
import { Bar, BarChart, XAxis, YAxis, Tooltip } from "recharts";

const provider = new ethers.providers.JsonRpcProvider("http://foundry:8545");

var GovBravo = new ethers.Contract(contractAddress, abi, provider.getSigner());

const CustomTooltip = ({ active, payload, label }) => {
  if (active && payload && payload.length) {
    return (
      <div id="custom-tip">
        <p className="recharts-tooltip-label">{label} votes</p>
        <p className="recharts-tooltip-item">{`${payload[0].name} : ${payload[0].value}%`}</p>
      </div>
    );
  } return null;
};

export function Proposal() {
  const { proposalId } = useParams();
  const [proposal, setProposal] = useState(null);
  const [votes, setVotes] = useState(null);
  const [counts, setCounts] = useState({ for: 0, against: 0, abstain: 0 });

  const [userVoted, setUserVoted] = useState(null);

  //   const [proposalStarted, setProposalStarted] = useState(false);
  const [proposalStatus, setProposalStatus] = useState("Pending");
  const [voteLoading, setVoteLoading] = useState(false);

  const navigate = useNavigate();
  const { isOpen, onOpen, onClose } = useDisclosure();
  const [vote, setVote] = useState(null);
  const [voteFailed, setVoteFailed] = useState(false);

  let modal;
  const [selectedAccount, setSelectedAccount] = useState('');  
  const handleChange = (event) => {
    setSelectedAccount(event.target.value);
    setVoteFailed(false);
  };
  useEffect(() => {
    console.log("got here");
    getProposal();
    getVotes();
    getProposalStatus();
  }, [proposalId]);

  if (!proposal) {
    return <div>Loading Proposal...</div>;
  }
  let delegates = ["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266","0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc", "0x976EA74026E726554dB657fA54763abd0C3a0aa9", "0x14dC79964da2C08b23698B3D3cc7Ca32193d9955",
  "0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f", "0xa0Ee7A142d267C1f36714E4a8F75612F20a79720", "0xBcd4042DE499D14e55001CcbB24a551F3b954096",
  "0x71bE63f3384f5fb98995898A86B02Fb2426c5788", "0xFABB0ac9d68B0B445fB7357272Ff202C5651694a", "0x1CBd3b2770909D4e10f157cABC84C7264073C9Ec",
  "0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097", "0xcd3B766CCDd6AE721141F452C550Ca635964ce71", "0x2546BcD3c84621e976D8185a91A922aE77ECEc30", 
  "0xbDA5747bFD65F08deb54cb465eB87D40e51B197E", "0xdD2FD4581271e230360230F9337D5c0430Bf44C0", "0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199", 
  "0x09DB0a93B389bEF724429898f539AEB7ac2Dd55f", "0x02484cb50AAC86Eae85610D6f4Bf026f30f6627D", "0x08135Da0A343E492FA2d4282F2AE34c6c5CC1BbE", 
  "0x5E661B79FE2D3F6cE70F5AAC07d8Cd9abb2743F1"]


  async function VoteOnchain() {
    setVoteLoading(true);
    const inputElement = document.getElementById("description");
    const msg = inputElement.value;
    let response = await VoteReq(selectedAccount, proposalId, vote, msg);
    if (response == "failure"){
      setVoteFailed(true);
    }else{
      window.location.reload();
    }
    setVoteLoading(false);

  }
  if (isOpen) {
    modal = (
      <Modal isCentered id="modal" isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
          <Center>
            <ModalHeader>Voting</ModalHeader>
          </Center>
          <ModalCloseButton />
          <Divider></Divider>
          <ModalBody>
            <VStack>
              {voteFailed ? (<p id="votefailed">Error: Could not vote with this account it is likely not an active delegate or delegate already voted</p>) : (<></>)}
              <Select
              name={"user"}
              value={selectedAccount}
              onChange={handleChange}
              placeholder="Select account to vote with"
            >
            {delegates.map((option, index) => (
                    <option key={index} value={option}>{option}</option>
                  ))}
            </Select>
              <VStack>
                <h1>Vote</h1>

                <RadioGroup onChange={setVote} value={vote}>
                  <Stack direction="row">
                    <Radio value="0">For</Radio>
                    <Radio value="1">Against</Radio>
                    <Radio value="2">Abstain</Radio>
                  </Stack>
                </RadioGroup>
                <Input
                  id="description"
                  height={"10vh"}
                  placeholder="Voter Message"
                ></Input>
                {voteLoading ? (
                  <>
                    <CircularProgress
                      marginTop={"2vh"}
                      marginBottom={"1vh"}
                      isIndeterminate
                    ></CircularProgress>
                    <Button
                      isDisabled
                      variant={"outline"}
                      width={"22vw"}
                      marginTop={"1vh"}
                      marginBottom={"1vh"}
                      id="someoneelse"
                    >
                      Submitting
                    </Button>
                  </>
                ) : (
                  <Button
                    onClick={VoteOnchain}
                    variant={"outline"}
                    width={"22vw"}
                    marginTop={"1vh"}
                    marginBottom={"1vh"}
                    id="someoneelse"
                  >
                    Submit
                  </Button>
                )}
              </VStack>
            </VStack>
          </ModalBody>
        </ModalContent>
      </Modal>
    );
  }
  return (
    <div className="defaultbackground">
      <NavBar />
      {modal}
      <Container maxW={"60vw"} className="defaultcontainer">
        <Card>
          <VStack marginTop={"3vh"} marginLeft={"2vw"} alignItems={"start"}>
            {proposalStatus == "Pending" ? (
              <Tag color="purple">Pending</Tag>
            ) : proposalStatus == "Awaiting init" ? (
              <Tag color="green">Awaiting Initialization</Tag>
            ) : proposalStatus == "Active" ? (
              <Tag color="green">Active</Tag>
            ) : proposalStatus == "Awaiting decrypt" ? (
              <Tag color="green">Awaiting Decrypt</Tag>
            ) : proposalStatus == "Succeeded" ? (
              <Tag color="green">Succeeded</Tag>
            ) : proposalStatus == "Defeated" ? (
              <Tag color="red">Defeated</Tag>
            ) : (
              <Tag color="blue">Executed</Tag>
            )}
            <HStack>
              <div id="nounify">{proposal.title}</div>
              <div id="spacer"></div>
              {proposalStatus == "Pending" ? (
                <Button
                  isDisabled={true}
                  variant={"outline"}
                  backgroundColor={"black"}
                  color={"white"}
                >
                  Voting Period Has Not Started{" "}
                </Button>
              ) : proposalStatus == "Awaiting init" ? (
                <Button
                  onClick={ElectionStart}
                  variant={"outline"}
                  backgroundColor={"black"}
                  color={"white"}
                >
                  Initiate Election{" "}
                </Button>
              ) : proposalStatus == "Active" ? (
                <Button
                  onClick={onOpen}
                  variant={"outline"}
                  backgroundColor={"black"}
                  color={"white"}
                >
                  Vote on-chain{" "}
                </Button>
              ) 
              
              : proposalStatus == "Awaiting decrypt" ? (
                <Decrypt></Decrypt>
              ) : proposalStatus == "Succeeded" ? (
                <Button
                  onClick={executeProposal}
                  variant={"outline"}
                  backgroundColor={"black"}
                  color={"white"}
                >
                  Execute{" "}
                </Button>
              ) :
              proposalStatus == "Defeated" ? (
                <Button
                  isDisabled={true}
                  variant={"outline"}
                  backgroundColor={"black"}
                  color={"white"}
                >
                  Defeated{" "}
                </Button>
              ) : (
                <Button
                  isDisabled={true}
                  variant={"outline"}
                  backgroundColor={"black"}
                  color={"white"}
                >
                  Executed{" "}
                </Button>
              )}
            </HStack>
            <Divider marginLeft={"-2vw"} width={"60vw"}></Divider>
            <CardFooter>
              <HStack>
                <img
                  id="nounsimg"
                  src={`${process.env.PUBLIC_URL}/nounsicon2.png`}
                ></img>
                <p>
                  by {proposal.proposer} * Proposal ID: {proposal.id} * Start block: {proposal.startBlock} * End block: {proposal.endBlock}
                </p>
              </HStack>
            </CardFooter>
          </VStack>
        </Card>
        <HStack alignItems={"start"}>
          <VStack width={"38vw"} marginTop={"2vh"}>
            <OverviewCard></OverviewCard>
            <DetailsCard></DetailsCard>
          </VStack>
          <VStack width={"19.5vw"} marginTop={"2vh"}>
            <VotesCard></VotesCard>
            <StatusCard></StatusCard>
          </VStack>
        </HStack>
      </Container>
    </div>
  );

  async function ElectionStart() {
    await ElectionStartReq(defaultAccount, proposalId);
    setProposalStatus("Active");
    // setProposalStarted(true);
  }

  async function getProposal() {
    const filter = GovBravo.filters.ElectionSetup();
    const logs = await GovBravo.queryFilter(filter);
    const log = logs.find((log) => log.args.id.eq(proposalId)); // Assuming 'id' is the name of the parameter

    if (logs.length > 0) {
      const parsedProposal = {
        id: log.args.id.toString(),
        proposer: log.args.proposer,
        startBlock: Number(log.args.startBlock),
        endBlock: Number(log.args.endBlock),
        description: log.args.description,
        title: log.args.title,
      };

      const start_filter = GovBravo.filters.ElectionStart();
      const start_logs = await GovBravo.queryFilter(start_filter);
      const proposal_start_log = start_logs.find((log) =>
        log.args.id.eq(proposalId)
      ); 
      setProposal(parsedProposal);
      // loop through emit logs and get the most recent nouns prposals add them to the UI
    }
  }
  async function getVotes() {
    // first check if this has already been decrypted
    const dec_filter = GovBravo.filters.DecryptTally(proposalId);
    let dec_logs = await GovBravo.queryFilter(dec_filter);
    let votes = [];
    let voted = false;
    let counts = {
      for: 0,
      against: 0,
      abstain: 0,
    };
// if decrypted
    if (dec_logs.length > 0) {
      counts = {
        for: dec_logs[0].args.forVote/100,
        against: dec_logs[0].args.againstVote/100,
        abstain: dec_logs[0].args.abstainVote/100,
      };
    }

    const filter = GovBravo.filters.Vote();
    const vote_logs = await GovBravo.queryFilter(filter);

    vote_logs.forEach((log) => {
      if (log.args.proposalId.eq(proposalId)) {
        votes.push({
          id: log.args.proposalId,
          proposer: log.args.proposer,
          support: log.args.support,
          message: log.args.message,
        });

        // if not decrypted
        if (dec_logs.length == 0) {
          if (log.args.support == 0) counts.for++;
          if (log.args.support == 1) counts.against++;
          if (log.args.support == 2) counts.abstain++;
        }

        if (
          log.args.proposer.toString().toLowerCase() ==
          defaultAccount.toLowerCase()
        ) {
          voted = true;
        }
      }
    });
    setCounts(counts);
    setUserVoted(voted);
    setVotes(votes);
  }
  function Decrypt() {
    const [loading, setLoading] = useState(false);

    async function DecryptClick() {
      setLoading(true);
      await DecryptTally(defaultAccount, proposalId);
      setLoading(false);
      window.location.reload();
    }

    if (!loading) {
      return (
        <Button
          onClick={DecryptClick}
          variant={"outline"}
          backgroundColor={"black"}
          color={"white"}
        >
          Decrypt{" "}
        </Button>
      );
    }
    return (
      <>
        <Button
          onClick={DecryptClick}
          variant={"outline"}
          backgroundColor={"black"}
          color={"white"}
        >
          Decrypt{" "}
        </Button>
        <Modal isCentered id="modal" isOpen={"true"}>
          <ModalOverlay />
          <ModalContent>
            <ModalHeader>Tally Decryption</ModalHeader>
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
                  <Text>Decrypting tally...</Text>
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
  }

  async function executeProposal() {
    let number = ethers.BigNumber.from(proposalId);
    const overrides = {
      gasLimit: ethers.utils.hexlify(1000000), // Example: Setting gas limit to 1,000,000
    };
    const data = await GovBravo.connect(
      provider.getSigner(defaultAccount)
    ).exec(number, overrides);
    console.log(data);
    setProposalStatus("Executed");
  }

  async function getProposalStatus() {
    // if election has not been started ie election start emit doesnt exist
    // this will make the status unstarted if unstarted then the button
    // that should be rendered is Election start
    let number = ethers.BigNumber.from(proposalId);
    const data = Number(
      await GovBravo.connect(provider.getSigner(defaultAccount)).state(number)
    );
    if (data == 0) setProposalStatus("Pending");
    else if (data == 1) setProposalStatus("Awaiting init");
    else if (data == 2) setProposalStatus("Active");
    else if (data == 3) setProposalStatus("Awaiting decrypt");
    else if (data == 4) setProposalStatus("Canceled");
    else if (data == 5) setProposalStatus("Defeated");
    else if (data == 6) setProposalStatus("Succeeded");
    else if (data == 7) setProposalStatus("Queued");
    else if (data == 8) setProposalStatus("Expired");
    else if (data == 9) setProposalStatus("Executed");
  }

  function DetailsCard() {
    return (
      <Card alignItems={"start"}>
        <CardHeader>
          <h1 id="cardheader">Details</h1>
        </CardHeader>
        <Divider color={"lightgray"}></Divider>
        <Center marginTop={"4vh"}>
          <VStack>
            <img src={`${process.env.PUBLIC_URL}/nounsicon.jpg`}></img>
            <p>{proposal.description}</p>
            <p>
              Ethereum Singapore Meetup, established in 2016 with over 9,000
              members aim to unite and energize the local community in Singapore
              with ETH Singapore 2023 | Infinite Garden City. The event bring
              together developers, creators, and newcomers to nurture future
              talent within the Ethereum space.
            </p>
          </VStack>
        </Center>
      </Card>
    );
  }

  function OverviewCard() {
    if (!votes) {
      return (
        <Card alignItems={"start"}>
          <CardHeader>
            {proposalStatus == "Succeeded" || proposalStatus == "Defeated" || proposalStatus == "Executed" ? (
              <h1 id="cardheader">Decrypted Overview</h1>
            ) : (
              <h1 id="cardheader">Encrypted Overview</h1>
            )}
          </CardHeader>
          <Divider color={"lightgray"}></Divider>
          <Center marginTop={"4vh"}>
            <VStack>
              {/* <h1>Info Not Yet Available</h1> */}
              <img src={`${process.env.PUBLIC_URL}/novotesyet.png`}></img>
            </VStack>
          </Center>
        </Card>
      );
    }
    return (
      <Card alignItems={"start"}>
        <CardHeader width={"38vw"}>
        {proposalStatus == "Succeeded" || proposalStatus == "Defeated" || proposalStatus == "Executed" ? (
            <>
              <h1 id="cardheader">Decrypted Overview</h1>
              <p>Votes shown are the true decrypted tally percentages</p>
              <p>May not add up to 100% due to rounding</p>

            </>
          ) : (
            <>
              <h1 id="cardheader">Encrypted Overview</h1>
              <p>
                Votes shown are delegate votes not the true decrypted tally{" "}
              </p>
            </>
          )}{" "}
        </CardHeader>
        <Divider color={"lightgray"}></Divider>
        <Center marginTop={"4vh"}>
          <Stack divider={<StackDivider />} spacing="4">
            <BarGraph></BarGraph>
          </Stack>
        </Center>
      </Card>
    );
  }
  function VotesCard() {
    return (
      <Card alignItems={"start"}>
        <CardHeader>
          <h1 id="cardheader">Votes</h1>
        </CardHeader>
        <Divider color={"lightgray"}></Divider>
        <Tabs width={"19.5vw"} isFitted position="relative">
          <TabList defaultIndex={1}>
            <Tab>For</Tab>
            <Tab>Against</Tab>
            <Tab>Abstain</Tab>
          </TabList>
          <TabPanels>
            <TabPanel>
              <Stack divider={<StackDivider />} spacing="4">
                {votes != null &&
                  votes
                    .filter((vote) => vote.support == 0)
                    .map((vote, index) => (
                      <HStack id="proposalstack">
                        <img
                          id="nounsimgvote"
                          src={`${process.env.PUBLIC_URL}/nounsicon2.png`}
                        ></img>
                        <VStack>
                          <p id="votetext">{vote.proposer}</p>

                          <p id="votemsg"> Msg: {vote.message}</p>
                        </VStack>
                      </HStack>
                    ))}
              </Stack>
            </TabPanel>
            <TabPanel>
              <Stack divider={<StackDivider />} spacing="4">
                {votes != null &&
                  votes
                    .filter((vote) => vote.support == 1)
                    .map((vote, index) => (
                      <HStack id="proposalstack">
                        <img
                          id="nounsimgvote"
                          src={`${process.env.PUBLIC_URL}/nounsicon2.png`}
                        ></img>
                        <VStack>
                          <p id="votetext">{vote.proposer}</p>

                          <p id="votemsg"> Msg: {vote.message}</p>
                        </VStack>
                      </HStack>
                    ))}
              </Stack>
            </TabPanel>
            <TabPanel>
              <Stack divider={<StackDivider />} spacing="4">
                {votes != null &&
                  votes
                    .filter((vote) => vote.support == 2)
                    .map((vote, index) => (
                      <HStack id="proposalstack">
                        <img
                          id="nounsimgvote"
                          src={`${process.env.PUBLIC_URL}/nounsicon2.png`}
                        ></img>
                        <VStack>
                          <p id="votetext">{vote.proposer}</p>

                          <p id="votemsg"> Msg: {vote.message}</p>
                        </VStack>
                      </HStack>
                    ))}
              </Stack>
            </TabPanel>
          </TabPanels>
        </Tabs>
      </Card>
    );
  }
  function BarGraph() {
    const votes = [
      {
        name: "For",
        value: Number(counts.for),
      },
      {
        name: "Against",
        value: Number(counts.against),
      },
      {
        name: "Abstain",
        value: Number(counts.abstain),
      },
    ];
    console.log("votes: ", votes);
    return (
      <Center marginTop={"4vh"}>
        <VStack width={"38vw"}>
          <BarChart width={300} height={500} data={votes}>
            <XAxis dataKey="name" />
            {proposalStatus == "Pending" || proposalStatus == "Awaiting init" || proposalStatus == "Active" || proposalStatus == "Awaiting decrypt" ? 
            (            
              <Tooltip/>
            ) : (            
              <Tooltip content={<CustomTooltip />} />
            )}
            <Bar dataKey="value" fill="#8884d8" />
          </BarChart>
        </VStack>
      </Center>
      //   </Card>
    );
  }
  
  function StatusCard() {
    return (
      <Card alignItems={"start"} width={"19.5vw"}>
        <CardHeader>
          <h1 id="cardheader">Status</h1>
        </CardHeader>
        <Divider color={"lightgray"}></Divider>
        <Center marginTop={"4vh"} marginLeft={"2vw"} marginBottom={"4vh"}>
          {/* <VStack> */}
            {/* <p>Proposal Status: </p> */}
            <Tag color="blue" size={"lg"}>{proposalStatus}</Tag>

          {/* </VStack> */}
        </Center>
      </Card>
    );
  }
  
}


