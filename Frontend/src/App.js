import { PetraWalletAdapter } from '@aptos-labs/wallet-adapter-petra';
import { AptosWalletAdapterProvider } from '@aptos-labs/wallet-adapter-react';
import Competitions from './Competitions';  

function App() {
    return (
        <AptosWalletAdapterProvider wallets={[new PetraWalletAdapter()]} autoConnect={true}>
            <Competitions /> 
        </AptosWalletAdapterProvider>
    );
}

export default App;
