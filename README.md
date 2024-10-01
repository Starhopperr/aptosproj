# Tokenized Educational Competitions on Aptos

## Project Vision
The **Tokenized Educational Competitions** project is a decentralized platform for hosting and participating in educational competitions on the **Aptos blockchain**. The platform allows users to join competitions, earn tokens based on their performance, and track achievements using **Non-Fungible Tokens (NFTs)**. The **React** frontend offers a user-friendly interface, while the **Petra Wallet** ensures secure user authentication and transaction signing.

## Features
- **Decentralized Competition Hosting**: Organize and manage educational competitions on the blockchain.
- **Token Rewards**: Participants earn tokens based on their performance in each competition.
- **Achievement NFTs**: Top performers receive NFTs to certify their accomplishments.
- **Aptos Move Smart Contracts**: Secure and transparent management of competitions and rewards using the Aptos Move language.
- **Petra Wallet Integration**: Seamless login and transaction management for users.

## Tech Stack
- **Frontend**: React.js
- **Blockchain**: Aptos (Move Language)
- **Wallet**: Petra Wallet

## How It Works
1. **Create a Competition**: Organizers can set up educational competitions, define rules, and allocate rewards.
2. **Participation**: Users join competitions and submit their answers or solutions through the platform.
3. **Token Rewards**: Based on performance, users are awarded tokens that are stored in their wallets.
4. **Achievement NFTs**: Top performers receive NFTs that serve as immutable proof of their accomplishments.
5. **Petra Wallet**: Users connect via Petra Wallet to authenticate, manage tokens, and receive NFTs.

## Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/)
- [React](https://reactjs.org/)
- [Aptos CLI](https://aptos.dev/cli-tools/aptos-cli-tool/)
- [Petra Wallet](https://petra.app/)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/aptos-tokenized-competitions.git
   cd aptos-tokenized-competitions
   ```

2. Install frontend dependencies:
   ```bash
   npm install
   ```

3. Set up the Aptos environment:
   - Install Aptos CLI:  
     ```bash
     curl -sSf https://aptos.dev/cli-tools/install | sh
     ```
   - Create an Aptos account:
     ```bash
     aptos init
     ```
   - Fund the account using the Aptos faucet (Devnet):
     ```bash
     aptos account fund-with-faucet --account your_account_address
     ```

4. Deploy the Move smart contract:
   - Navigate to the `move` folder in your project.
   - Build and deploy the contract:
     ```bash
     aptos move compile
     aptos move publish --profile devnet
     ```

5. Run the React frontend:
   ```bash
   npm start
   ```

6. Ensure **Petra Wallet** is installed and connected to interact with the DApp.

### Deployment

1. **Deploy on Aptos Devnet/Testnet**:
   - **Build the Move contract**:
     ```bash
     aptos move compile
     ```
   - **Deploy the contract**:
     ```bash
     aptos move publish --profile devnet
     ```
   - The contract will be deployed on Aptos Devnet/Testnet. Make sure to copy the contract address for frontend integration.
   
2. **Frontend Deployment**:
   - Deploy the React app using services like Netlify or Vercel.
   - Update the contract address and Aptos network configurations in the frontend code.

### Usage
- Visit the frontend URL (e.g., `http://localhost:3000` or deployed link).
- Connect your **Petra Wallet**.
- Users can participate in competitions, earn tokens, and receive NFTs for high performance.

## Aptos CLI Commands
- **Check account balance**:
  ```bash
  aptos account balance --profile devnet
  ```
- **Deploy Move contract**:
  ```bash
  aptos move publish --profile devnet
  ```
- **Fund account with Devnet faucet**:
  ```bash
  aptos account fund-with-faucet --account your_account_address
  ```

## Deployment Information
- **Smart Contract Address**: `https://explorer.aptoslabs.com/txn/0x60632de695dfffbda9e3f07b545a1f1fa62c8b147f0060a158f2a7e4010cbe60?network=devnet`
- **Transaction**: `0x60632de695dfffbda9e3f07b545a1f1fa62c8b147f0060a158f2a7e4010cbe60`
- **Aptos Devnet URL**: `https://fullnode.devnet.aptoslabs.com`

- ![image](https://github.com/user-attachments/assets/ad7e5f9c-79e1-4ba5-9b4e-1aa6f6cc6254)


## Contact Information
For any questions or support, feel free to reach out:

- **Name**: Mainak Sarkar
- **Email**: your.email@example.com
- **LinkedIn**: `https://www.linkedin.com/in/your-linkedin/`
- **GitHub**: `https://github.com/Starhopperr`

## Future Scope
Potential future enhancements for the platform include:
1. **Custom Competitions**: Allow users to create their own custom competitions with unique rules.
2. **Leaderboard**: Implement a leaderboard for users to track their performance over time.
3. **Tokenized Learning Modules**: Offer educational modules that can be unlocked with tokens.
4. **Cross-chain Integration**: Expand the platform to work across different blockchains.
5. **Mobile Application**: Develop a mobile version of the DApp for easier access.
6. **Gamification**: Introduce badges and levels to encourage participation and competition.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
