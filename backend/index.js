const express = require('express');
const cors = require('cors');
const axios = require('axios');
const app = express();

app.use(cors());
app.use(express.json());

const APTOS_API_URL = 'https://fullnode.testnet.aptoslabs.com/v1';

app.post('/api/initialize', async (req, res) => {
    const { account, prize_pool } = req.body;
    // Initialize competition (calls Aptos API, make sure you replace with actual contract call)
    try {
        const response = await axios.post(`${APTOS_API_URL}/transactions`, {
            // construct the Aptos transaction here
        });
        res.status(200).send(response.data);
    } catch (error) {
        console.error('Error initializing competition:', error);
        res.status(500).send('Failed to initialize competition');
    }
});

app.post('/api/declare_winner', async (req, res) => {
    const { account, winner_address } = req.body;
    // Declare the winner (calls Aptos API)
    try {
        const response = await axios.post(`${APTOS_API_URL}/transactions`, {
            // construct the Aptos transaction for declaring the winner here
        });
        res.status(200).send(response.data);
    } catch (error) {
        console.error('Error declaring winner:', error);
        res.status(500).send('Failed to declare winner');
    }
});

app.listen(5000, () => {
    console.log('Backend server is running on port 5000');
});
