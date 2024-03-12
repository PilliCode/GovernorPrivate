import logo from './logo.svg';
import './App.css';
import * as React from 'react';
import { Routes, Route, BrowserRouter } from 'react-router-dom';

import NounsPage from './pages/NounsPage';
import CreateProposal from './pages/CreateProposal';
import ContractSetupPage from './pages/ContractSetupPage';
import {Proposal} from './components/Proposal';
import WelcomePage from './pages/WelcomePage';

function App() {
  return (
    <div className="App">
      <Routes >
        <Route path ="/" element={< WelcomePage/>} />
        <Route path ="/setup" element={< ContractSetupPage/>} />
        <Route path ="/proposal-create" element={<CreateProposal/>} />
        <Route path ="/nouns" element={<NounsPage/>} />
        <Route path="/proposal/:proposalId" element={<Proposal/>} />
      </Routes>
    </div>
  );
}

export default App;
