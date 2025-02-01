# Homework 3 - Analyzing DeFi

In this homework, we upgrade our Coinfip game with an oracle to provide our smart contracts a truly random number. This serves to give you an idea of the service providers and user experience in the area of data availability in blockchain. 

In the second part, we dive into examining tokenomics of a selected chain using the incentive mechanism presented in Lecture 4. Afterwards, we take a step back and examine community and financial metrics to evaluate chains and their supporting ecosystems. 

Note: You will need Sepolia and Link tokens for this homework. Please make sure you request from the relevant faucets!

### Exercise 1 - VRF Oracle (5 + 6 + 1 points)

True randomness does not exist onchain because any hashing algorithm or block characteristic can be brute forced. In order to obtain a truly random number, we will use Chainlink's Verifiable Random Function oracles.

##### Part A - Exploring direct funding VRF (4 points)
The direct funding method is a request-receive type of oracle that serves a random number upon request. You do not need to worry about implementing this method as it is provided to you in the coinflip-VRF repository. Go ahead and fork / clone the repo. Open the *DirectFundingConsumer.sol* contract and look at the available functions. Refer to the [documentation](https://docs.chain.link/vrf/v2-5/overview/direct-funding) to understand how each function executes.

It is very difficult to simulate the entire workflow locally on your computer and would require you to deploy 4 additional contracts. Since all these contracts are already deployed to known addresses on Sepolia, it is preferable that we deploy the *DirectFundingConsumer.sol* contract to the Sepolia testnet as well.

After successfully deploying, forge will provide you with the URL to your contract on Etherscan. Go ahead and go to your contract. The URL should look something like: https://sepolia.etherscan.io/address/CONTRACT_ADDRESS.

In order to request a number, the contract must be funded as each request costs a certain amount of LINK tokens. You should have already requested LINK tokens from the Chainlink faucet to your Metamask wallet. Open your wallet, select the Link token and click on the send button. In the send to field, copy and paste in the address of the contract you just deployed. Under the asset field, chose LINK and send over 3 LINK tokens. You will then need to pay a network fee and confirm the transaction. If everything was successful, your metamask wallet will show a transaction and the smart contract on Etherscan will record a token transfer transaction.

Now that our contract is on testnet and funded, we can make a request for a random number. For this we can use Cast. Type in the following command and replace the capitalized fields with the necessary information:
```
cast send --rpc-url NODE_URL --private-key YOUR_PRIVATE_KEY CONTRACT_ADDRESS "FUNCTION_SIGNATURE" INPUT_VALUE
```
Forge will tell you if this was successful or not. If it was successful, go back to Etherscan, scroll down and click on the events tab. You may have to wait for a few minutes, but you should have a *RequestSet* and a *Request Fulfilled* event. Refer to lecture 3 to understand how events are structured and refer to the *DirectFundingConsumer.sol* code to understand the structure of the two events.

* **1 point** - Two screenshots showing the two events on Etherscan. One with Hex values and one with number values.
* **1 point** - What were the 2 random numbers the oracle generated for you?
* **3 points** - *RequestSent* returns 2 fields and *RequestFulfilled* returns 6 fields. Explain what information each of these fields conveys. 1 point for *RequestSent* and 2 points for *RequestFulfilled*.

##### Part B - Adding a VRF oracle to coinflip (6 points)
We will now modify our Coinflip contract to using a VRF contract instead of using a seed phrase. The focus of this exercise is to get use to working on testnet, debugging through transaction traces and events, and deeply understanding how contracts interact with each other and the current gas economy of Ethereum.

Open the Coinflip.sol contract and follow the function descriptions provided. You will notice that they are not as detailed as the TODOs in the last homework and there are no test cases. The contract is modified to take in THREE guesses, either a 1 or a 0, from players instead of the 10 in a row from last homework.

Since there was no easy way to simulate the random number request process locally, testing becomes difficult. It is not possible to write local tests and testing through sending transactions can be tedious and time consuming. Therefore, try to think about how you did the request in Part A and how that translates to a smart contract taking this action. If you make an error or you want to try one function at a time, remember that any deployment is final and to update your contract logic, you have to deploy again.

##### Part C - Contrast data serving methods (1 point)
There is an alternative form of VRF called the *subscription method*. Do some research and write a few sentences on the difference between subscription and direct funding and which use cases are suitable for each method.

### Exercise 2 - MakerDAO 2.0 Tokenomics (3 + 3 + 2 points)
After the black swan event know as Black Thursday, Maker made several changes to its mechanics, the SAI was rebranded to the DAI and the tokenomics of the MKR native token was re-imagined. In this exercise, we will analyze MakerDAO 2.0 today.

**Note:** The word count proposed in the exercises are recommendations. Please respect minimum word count given (points deducted if less than) but if you feel very passionate about the subject, you can write as much as you want.

##### Part A - Meta assessment of DeFi projects through aggregators (3 points)
MakerDAO is a protocol that offers CDPs - Collaterized Debt Positions. There are many other DeFi protocols such as Liquity, Curve Finance, Davos, Ramp all offering slightly different CDP products, for example, different LT, interest rates, liquidation mechanics, etc. 

Use aggregators to get a overview of the market and current top players. Look on [DeFilama](https://defillama.com/) and Dune Analytics.

Defilama is a proprietary dashboard showing the most prominent financial metrics for DeFi projects. To get started, navigate around the left hand side of the website and click on:
* DeFi/Category/CDP - MakerkDAO is a CDP, who are the competitors?
* Stables - DAI is a stablecoin, how is it performing?
* Yield - Does staking DAI return a profit?
* Liquidations - There is profit to be made liquidating vaults (ETH penalty, favourable trade prices).

Dune Analytics is a highly customisable database where users write SQL queries to get extremely specific data. Once you have a general idea of where MakerDAO stands from DeFilama, hop over to Dune Analytics and search for some custom dashboards that others have made about MakerDAO or create your own! Start with [this](https://dune.com/steakhouse/makerdao) insightful dashboard. Note: Maker has rebranded to Sky.

Write 500 words, including some graphs which you got from BOTH of the aggregators, to describe the current state of the CDP market and MakerDAOs position amongst its competitors. Make sure you include at least 2 metrics from lecture 5.

##### Part B - Examining MKR tokenomics (3 points)

We discussed Token evaluation methods in Lecture 4. MKR is a public token on the market so it is easier to measure its value. However, please consider some of the other evaluation metrics we discussed as well.

A good place to check market values is CoinMarketCap. Take a look at the [MKR token](https://coinmarketcap.com/currencies/maker/) from Black Thursday onwards. Describe the change in the value of the MKR token. What changes were implemented to bring about the change that you observed? Write around 300 words on this subject.

Additionally, include a table detailing the utility of the MKR token before and after Black Thursday.

##### Part C - Personal reflection on the current and future state of MakerDAO (2 points)

Write a 200 - 300 word reflection on your own assessment of MakerDAO and its future. Some points to consider:

* Maker is rebranding to Sky, what does this entail?
* What is the tokenomics of SKY and why was this change implemented?
* More generally, how will the evolution of technology, for example AI, quantum computing, affect the future of blockchain?
