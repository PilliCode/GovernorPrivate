import { backend_ip, defaultAccount, trusted_auth_ip } from "./const";
import axios from "axios";
import { ethers } from "ethers";

// trusted auth decrypts the tally and posts it on chain
export async function DecryptTally(user_addr, proposal_id) {
  const response = await axios.post(trusted_auth_ip + "/decrypt_tally",  {
    user_addr: user_addr,
    id: Number(proposal_id)});
  return response.data;
}

export async function SendBackend(decrypted_data) {
  const response = await axios.post(backend_ip + "/save_tally", {
    id: String(decrypted_data.id),
    votes_for: String(decrypted_data.votes_for),
    votes_against: String(decrypted_data.votes_against),
    votes_abstain: String(decrypted_data.votes_abstain),
  });
  return response.data;
}

export async function ElectionSetup(title, description, votingDelay, votingPeriod, targets, values, signatures, callData) {
  const response = await axios.post(backend_ip + "/election_setup", {
    user_addr: defaultAccount,
    title: String(title),
    description: String(description),
    voting_delay: Number(votingDelay),
    voting_period: Number(votingPeriod),
    targets: [String(targets)],
    values: [String(values)],
    signatures: [String(signatures)],
    call_datas: [String(callData)],
  });
  return response.data;
}

export async function ElectionStartReq(account, proposalID) {
  const response = await axios.post(backend_ip + "/election_start", {
    user_addr: account,
    id: Number(proposalID)
  });
  return response.data;
}

export async function DelegateReq(userAddr, delegateAddr, anonymitySize) {
  const response = await axios.post(backend_ip + "/delegate", {
    user_addr: String(userAddr),
    delegate_addr: String(delegateAddr),
    anoymity_size: Number(anonymitySize),
  });
  return response.data;
}

export async function UndelegateReq(userAddr) {
  const response = await axios.post(backend_ip + "/undelegate", {
    user_addr: String(userAddr),
  });
  return response.data;
}

export async function DelegateRegistration(userAddr) {
  const response = await axios.post(backend_ip + "/delegate_registration", {
    addr: String(userAddr),
  });
  return response.data;
}

export async function DelegateUnregistration(userAddr) {
  const response = await axios.post(backend_ip + "/delegate_unregistration", {
    addr: String(userAddr),
  });
  return response.data;
}

export async function SetupDelegates() {
  const response = await axios.get(backend_ip + "/setup_delegates");
  return response.data;
}

export async function TrustedAuthSetup(daoName, tokenAddr) {
  const response = await axios.post(trusted_auth_ip + "/trusted_auth_setup", {
    dao_name: daoName,
    token_addr: tokenAddr
  });
  return response.data;
}

export async function VoteReq(userAddr, id, vote, message){
  const response = await axios.post(backend_ip + "/private_vote", {
    user_addr: userAddr,
    id: Number(id),
    vote: Number(vote),
    message: String(message)
  })
  return response.data;
}