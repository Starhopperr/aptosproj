import React from 'react';
import { AptosWalletAdapterProvider } from "@aptos-labs/wallet-adapter-react";
import { WellDoneWallet } from "@welldone-wallet/aptos-wallet-adapter";
import competition from '../../../sources';

const wallets = [new WellDoneWallet()];

function App() {
  return (
    <AptosWalletAdapterProvider plugins={wallets} autoConnect={true}>
      <competition/>
    </AptosWalletAdapterProvider>
  );
}

export default App;