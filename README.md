# NFT Diplomas: Issue NFTs as Verifiable Diplomas

## Vision

NFT Diplomas revolutionize the way academic achievements are verified and shared. By issuing diplomas as NFTs on the Aptos blockchain, we ensure that graduate credentials are verifiable, secure, and immutable. This modern approach removes the hassle of traditional diploma verification processes and provides a decentralized method to preserve educational achievements for both institutions and graduates.

With NFT Diplomas, universities can issue unique, cryptographically secured diplomas that students can store in their wallets and share with potential employers, while offering an easy way for employers to validate the authenticity of academic records.

## Features

### 🎓 **Diploma as NFTs**
- Issue unique, verifiable diplomas as NFTs using the **Aptos** blockchain.
- Diplomas are immutable and secured by blockchain technology.

### 🔐 **Verified and Secure**
- Each diploma issued is cryptographically signed by the university, ensuring trust and authenticity.
- Graduates can store their diplomas in their Aptos-compatible wallet (e.g., Martian Wallet).

### 🌍 **Easy Verification**
- Employers and other entities can easily verify the authenticity of a graduate’s diploma on the Aptos blockchain without intermediaries.

### 🏛️ **University Issuance**
- Universities act as the "issuer" of diplomas and can mint these NFT diplomas using their private key.
  
### 👨‍🎓 **Graduate Benefits**
- Graduates receive their diplomas as NFTs directly in their wallets.
- Diplomas are permanent, unchangeable, and fully transferable as proofs of their academic achievements.

### 🚀 **Full-Stack Implementation**
- Built with a **React** frontend for user interactions.
- **Node.js** backend for handling diploma issuance requests and interacting with the blockchain.
- **Move** smart contracts on Aptos to handle the minting and validation of NFT diplomas.

## Move Smart Contract
The smart contract for diploma issuance is written in Aptos' **Move** language and enables the minting of NFTs for each issued diploma.

## How It Works

1. **Connect a Wallet:** Universities and students can connect their Aptos-compatible wallets.
2. **Mint NFT Diploma:** The university uses the platform to mint an NFT diploma for the student.
3. **View Diploma:** The diploma is issued to the student’s wallet, and they can view it via any Aptos blockchain explorer.
4. **Verify:** Employers can verify the diploma by checking its existence and validity on the blockchain.

## Technology Stack

- **Frontend:** React.js
- **Backend:** Node.js, Express
- **Blockchain:** Aptos (Move language)
- **Wallet Integration:** Martian Wallet (or other Aptos wallets)

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/nft-diplomas.git
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Deploy the smart contract to Aptos testnet or mainnet using:
   ```bash
   aptos move publish --account-name <your-account-name>
   ```

## Contact

For any queries or contributions, feel free to reach out:

- **Email:** mainak2ms@gmail.com
- **GitHub:** https://github.com/Starhopperr
