import { useState, useEffect } from 'react';
import { useWallet } from '@aptos-labs/wallet-adapter-react';
import axios from 'axios';

const Competitions = () => {
    const { account, connected, signAndSubmitTransaction } = useWallet();
    const [competitions, setCompetitions] = useState([]);
    const [prizePool, setPrizePool] = useState('');
    const [winnerAddress, setWinnerAddress] = useState('');

    useEffect(() => {
        if (connected) {
            fetchCompetitions();
        }
    }, [connected]);

    const fetchCompetitions = async () => {
        try {
            const response = await axios.get(`/api/competitions?address=${account.address}`);
            setCompetitions(response.data);
        } catch (error) {
            console.error("Error fetching competitions:", error);
        }
    };

    const initializeCompetition = async () => {
        try {
            const response = await axios.post('http://localhost:5000/api/initialize', {
                account: account.address,
                prize_pool: prizePool,
            });
            console.log("Competition initialized:", response.data);
            fetchCompetitions();
        } catch (error) {
            console.error("Error initializing competition:", error);
        }
    };

    const declareWinner = async () => {
        try {
            const response = await axios.post('http://localhost:5000/api/declare_winner', {
                account: account.address,
                winner_address: winnerAddress,
            });
            console.log("Winner declared:", response.data);
            fetchCompetitions();
        } catch (error) {
            console.error("Error declaring winner:", error);
        }
    };

    return (
        <div>
            <h1>Your Competitions</h1>
            {competitions.map((comp, index) => (
                <div key={index}>
                    <h3>Prize Pool: {comp.prize_pool}</h3>
                    <p>Winner: {comp.winner}</p>
                </div>
            ))}
            
            <h2>Initialize New Competition</h2>
            <input
                type="text"
                placeholder="Prize Pool (APT)"
                value={prizePool}
                onChange={(e) => setPrizePool(e.target.value)}
            />
            <button onClick={initializeCompetition}>Initialize Competition</button>

            <h2>Declare Winner</h2>
            <input
                type="text"
                placeholder="Winner Wallet Address"
                value={winnerAddress}
                onChange={(e) => setWinnerAddress(e.target.value)}
            />
            <button onClick={declareWinner}>Declare Winner</button>
        </div>
    );
};

export default Competitions;
