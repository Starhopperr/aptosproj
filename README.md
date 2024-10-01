Aman Shukla # Tokenized Educational Competitions: Host Competitions with Token Rewards

## Vision

**Tokenized Educational Competitions** is a decentralized platform that brings a new dimension to student and academic competitions by leveraging blockchain technology. The vision is to empower educational institutions and competition organizers to host academic, sports, or skill-based contests with real cryptocurrency rewards for winners. This not only incentivizes participation but also ensures transparency in reward distribution.

By using the Aptos blockchain, our platform offers immutable, trustless competition hosting, where prize pools are managed through smart contracts and rewards are distributed automatically to winners. This creates a fair and transparent system that eliminates middlemen and ensures that all participants have an equal chance to claim the prizes they’ve earned.

## Features

### 🏆 **Decentralized Competition Hosting**
- Educational institutions or competition organizers can host tokenized competitions.
- Prize pools are set up and managed via the blockchain, eliminating the need for third-party management.

### 💰 **Prize Pool in Tokens**
- The prize pool is stored in AptosCoin (APT), and is transparently managed through the smart contract.
- Participants can view the prize pool, ensuring trust and motivation.

### 🥇 **Automatic Winner Declaration**
- Once a competition is concluded, the organizer can declare a winner by providing their wallet address.
- The prize pool is automatically transferred to the winner's wallet upon declaration.

### 🔒 **Secure & Transparent**
- All prize pools and transactions are secured by the Aptos blockchain.
- Immutable records of winners and prize distribution, ensuring transparency in competition outcomes.

### 🚀 **Blockchain-Powered**
- Built on the Aptos blockchain using Move smart contracts, providing fast, secure, and low-cost transactions.
  
## Move Smart Contract

The core of the platform is a Move-based smart contract that allows organizers to initialize competitions, deposit prize pools, and declare winners. Below is an overview of the main functions:

```move
module educational_competition::competition {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Competition has key {
        prize_pool: u64,
        winner: address,
    }

    const E_NOT_INITIALIZED: u64 = 1;
    const E_ALREADY_INITIALIZED: u64 = 2;
    const E_NOT_ENOUGH_BALANCE: u64 = 3;
    const E_NOT_AUTHORIZED: u64 = 4;

    public fun initialize_competition(account: &signer, initial_prize: u64) {
        let account_addr = signer::address_of(account);
        assert!(!exists<Competition>(account_addr), E_ALREADY_INITIALIZED);
        assert!(coin::balance<AptosCoin>(account_addr) >= initial_prize, E_NOT_ENOUGH_BALANCE);

        coin::transfer<AptosCoin>(account, @educational_competition, initial_prize);

        move_to(account, Competition {
            prize_pool: initial_prize,
            winner: @0x0,
        });
    }

    public entry fun declare_winner(account: &signer, winner_address: address) acquires Competition {
        let account_addr = signer::address_of(account);
        assert!(exists<Competition>(account_addr), E_NOT_INITIALIZED);
        assert!(account_addr == @educational_competition, E_NOT_AUTHORIZED);

        let competition = borrow_global_mut<Competition>(account_addr);
        competition.winner = winner_address;

        coin::transfer<AptosCoin>(&account, winner_address, competition.prize_pool);
        competition.prize_pool = 0;
    }
}
```

## How It Works

1. **Create a Competition:**
   - An organizer (educational institution or competition holder) can initialize a new competition by setting up a prize pool in AptosCoin.
   
2. **Declare the Winner:**
   - After the competition, the organizer declares the winner by providing their wallet address.
   - The smart contract automatically transfers the prize pool to the winner’s wallet.

3. **Blockchain Transparency:**
   - All prize pools, competition details, and winner information are stored immutably on the Aptos blockchain.

## Technology Stack

- **Backend:** Aptos Blockchain, Move Smart Contracts
- **Frontend:** React.js (optional for user interaction)
- **Token:** AptosCoin (APT) as the reward token

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/educational-competitions.git
   ```

2. Install dependencies (for a Node.js backend):
   ```bash
   npm install
   ```

3. Deploy the Move smart contract to Aptos testnet or mainnet:
   ```bash
   aptos move publish --account-name <your-account-name>
   ```

4. Set up the frontend (React.js) for user interactions and competition management.

## Contact

For questions or contributions, feel free to contact:

- **Email:** yourname@example.com
- **GitHub:** [your-github-username](https://github.com/Starhopperr)

##Deployment:
Contact address:
Transaction Hash: 
