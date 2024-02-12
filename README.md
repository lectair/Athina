# Athina
Athina is a blockchain DAO written in Solidity that allows the direct voting of representatives or political parties, enhancing transparency and truly democratizing elections.

## Description
Athina is a decentralized application (DApp) built on the Ethereum blockchain and written in Solidity that allows the direct voting of representatives or political parties, enhancing transparency and truly democratizing elections. It allows managers to register voters, authorize them to participate in elections, register candidates, and cast votes for their preferred candidates.

## Features
- **Managers:** The contract owner can add or remove managers, including itself if there's at least another registered manager.
- **Voter Registration:** Users can register as voters to participate in elections.
- **Authorization:** The managers can authorize voters to participate in elections.
- **Candidate Registration:** The managers can register candidates for election. Each candidate has a name, description and image value, as well as vote count if being in an election.
- **Voting:** Authorized voters can cast their votes for their preferred candidates.
- **Election Management:** The managers can start, end, and manage the status of elections.
- **Deadlines:** Elections have customizable deadlines.
- **Double Round:** Elections have a customizable parameter to allow double rounds or not.
- **IPFS Database:** The contract owner can start, end, and manage the status of elections.
- **(TO-DO) Biometric Authorization:** Managers, candidates and voters can log in via biometrics. Connect a USB fingerprint scanner and receive a token to be able to interact with the contract.
- **(TO-DO) Frontend Web/Mobile App:** Interact seamlessly with the contract in your preferred platform.

## Smart Contracts
### ElectionManager.sol
- Manages the overall election process, including election status and deadlines.
- Provides functions for managing the election name and status.

### Voting.sol
- Manages the voter registration, authorization, candidate registration, and voting processes.
- Includes modifiers to ensure only registered voters can participate and that elections are in progress.

### CandidateRegistry.sol
- Handles the registration and retrieval of candidate information.

## Usage
1. Deploy the smart contracts to an Ethereum network.
2. Interact with the deployed contracts using a web3-enabled Ethereum wallet or development environment.
3. Register voters, authorize them to participate in elections, register candidates, and conduct elections.

## Setup
1. Install Node.js and npm.
2. Install dependencies: `npm install`.
3. Compile the smart contracts: `npx hardhat compile`.
4. Deploy the contracts to a local or testnet Ethereum network using Hardhat.

## Development
- **Technology Stack:** Solidity, Ethereum, Hardhat, IPFS
- **Dependencies:** IPFSClient (for storing candidate information)

## Contributing
Contributions to the project are welcome! Please follow the guidelines outlined in the CONTRIBUTING.md file.

## License
This project is open-source and is unlicensed for the moment.
