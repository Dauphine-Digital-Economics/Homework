# Homework 3 - Analyzing DeFi

In this homework, we further develop our programming skills by deploying to Sepolia testnet and using an oracle to provide our coinflip contract with a truly random number. This serves to give you an idea of the service providers and user experience in the area of data availability in blockchain. 

In the second part, we dive into examining tokenomics of a selected chain using the incentive mechanism presented in Lecture 4. Afterwards, we take a step back and examine community and financial metrics to evaluate chains and their supporting ecosystems. 

Note: You will need Sepolia and Link tokens for this homework. Please make sure you request from the relevant faucets!

### Exercise 1 - VRF Oracle (3 + 6 + 1 + 1 points)

True randomness does not exist onchain because any hashing alogorithm or block characteristic can be brute forced. In order to obtain a truly random number, we will use Chainlink's Verifiable Random Function oracles.

##### Part A - Exploring direct funding VRF (3 points)
The direct funding method is a request-receive type of oracle that serves a random number upon request. You do not need to worry about implementing this method as it is provided to you in the coinflip-VRF repository. Go ahead and fork / clone the repo. Open the *VRFv2DirectFundingConsumer.sol* contract and look at the available functions. Refer to the [documentation](https://docs.chain.link/vrf/v2/direct-funding) to understand how each function executes.

It is very difficult to simulate the entire workflow and would require you to deploy 4 additional contracts. You are optionally welcome to try by following [this](https://docs.chain.link/vrf/v2/direct-funding/examples/test-locally) guide. Since all these contracts are already deployed to known addresses on Sepolia, it is preferable that we only deploy the *VRFv2DirectFundingConsumer.sol* contract to the Sepolia testnet as well.

In order to deploy a contract, use the following command:
```
forge create --rpc-url NODE_URL --private-key YOUR_PRIVATE_KEY --etherscan-api-key YOUR_ETHERSCAN_KEY --verify src/VRFv2DirectFundingConsumer.sol:VRFv2DirectFundingConsumer
```
Notice that an Etherscan key is required to verify your contract, so go ahead and sign up for an Etherscan account and create a new API key. Verification provides an additional assurance that the bytecode does indeed decompile to the written Solidity code. Look for the green checkmark on Etherscan if you are exploring unknown contracts.

After successfully deploying, forge will provide you with the URL to your contract on Etherscan. Go ahead and go to your contract. The URL should look something like: https://sepolia.etherscan.io/address/CONTRACT_ADDRESS. Scroll to the transactions tab and you should see only one transaction - the deployment of this contract.

In order to request a number, the contract must be funded as each request costs a certain amount of LINK tokens. You should have already requested LINK tokens from a faucet to your Metamask wallet. Open your wallet and click on the send button. In the send to field, copy and paste in the address of the contract you just deployed. Under the asset field, make sure you chose LINK and not another token. Go ahead and send over 3 LINK tokens.

Now that our contract is on testnet and funded, we can make a request for a random number. For this we can use Cast. Type in the following command and replace the capitalized fields with the necessary information:
```
cast send --rpc-url NODE_URL --private-key YOUR_PRIVATE_KEY CONTRACT_ADDRESS "FUNCTION_SIGNATURE"
```
Forge will tell you if this was successful or not. If it was successful, go back to Etherscan, scroll down and click on the events tab. Refer to lecture 3 to understand how events are structured. **You must submit a screenshot of the events tab showing, in decimal format, the random number that you received from the oracle.**

##### Part B - Adding a VRF oracle to coinflip (6 points)
We will now modify our Coinflip contract to using a VRF contract instead of using a seed phrase. The focus of this exercise is to get use to working on testnet, debugging through transaction traces and events, and deeply understanding how contracts interact with each other and the current gas economy of Ethereum and the user and developer experience.

Open the Coinflip.sol contract and follow the function descriptions provided. You will notice that they are not as detailed as the TODOs in the last homework and there are no test cases. To ease the process, the contract is modified to take in only ONE guess, either a 1 or a 0, from players instead of the 10 in a row from last homework.

Hint: Look at lecture 3 to refresh on functions which allow interaction and payments between contracts. Also remember how ERC20 contracts work in terms of keeping track of balances and transfers from Lecture 4.

##### Part C - Contrast data serving methods (1 point)
There is an alternative form of VRF called the *subscription method*. Do some research and write a few sentences on the difference between subscription and direct funding and which use cases are suitable for each method.

##### Part D - Reflect on the currect state of Blockchain (1 point)
Notice how much gas is used per random number request, how much you have to fund the initial contracts and reflect on the speed at which your Metamask wallet estimated these costs and performed the transaction. If you were running this crypto coinflip game, what costs do the business incur and what is the user experience? Then, in a few sentences, draw your own conclusion on the current technical challenges in blockchain and what needs to be improved in the future of blockchain.

It is important to remember that this is only the technical aspect and we will examine the question of blockchain's future from other perspectives as well throughout this course.

### Exercise 2 - MakerDAO 2.0 Tokenomics (3 + 3 + 3 points)
After the black swan event know as Black Thursday, Maker made several changes to its mechanics, the SAI was rebranded to the DAI and the tokenomics of the MKR native token was reimagined. In this exercise, we will analyze MakerDAO 2.0 today.

**Note:** The word count proposed in the exercises are recommendations. Please respect minimum word count given (points deducted if less than) but if you feel very passionate about the subject, you can write as much as you want.

##### Part A - Meta assessment of DeFi projects through aggregators (3 points)
MakerDAO is a protocol that offers CDPs - Collaterized Debt Positions. There are many other DeFi protocols such as Liquity, Curve Finance, Davos, Ramp all offering slightly different CDP products, for example, different LT, interest rates, liquidation mechanics, etc. 

Use aggregators to get a overview of the market and current top players. Look on [DeFilama](https://defillama.com/) and Dune Analytics.

Defilama is a proprietary dashboard showing the most prominent financial metrics for DeFi projects. To get started, navigate around the left hand side of the website and click on:
* DeFi/Category/CDP - MakerkDAO is a CDP, who are the competitors?
* Stables - DAI is a stablecoin, how is it performing?
* Yield - Does staking DAI return a profit?
* Liquidations - There is profit to be made liquidating vaults (ETH penalty, favourable trade prices).

Dune Analytics is a highly customisable database where users write SQL queries to get extremely specific data. Once you have a general idea of where MakerDAO stands from DeFilama, hop over to Dune Analytics and search for some custom dashboards that others have made about MakerDAO or create your own! Start with [this](https://dune.com/steakhouse/makerdao) insightful dashboard.

Write 300 - 500 words, including some graphs which you got from BOTH of the aggregators, to describe the current state of the CDP market and MakerDAOs position amongst its competitors. Make sure you include at least 2 metrics from lecture 5.

##### Part B - Examining MKR tokenomics (3 points)

Using the incentivisation mechanic we learned in Lecture 4, please map out the incentive mechanisms of the current MKR token. To get you started, think about how the MKR token, not the DAI stablecoin, plays a role in the MakerDAO community, supports the stability of the DAI stablecoin algorithmically, specifically after Black Thursday, and any other utility it has as the native token of MakerDAO 2.0.

[Download](https://docs.google.com/spreadsheets/d/1FwTcMnhViKDZVVAlvwqCTkcUlFmFae_rJ1Uf_PkFVLM/edit?usp=sharing) the excel sheet of the incentive mechanism, fill it in and upload it to your own Github repo as part of your homework submission.

##### Part C - Personal reflection on the current and future state of MakerDAO (3 points)

Write a 200 - 300 word reflection on your own assessment of MakerDAO 2.0 and its future. Some points to consider:

* Do you believe the current model will prevent Black Thursday from happening again?
* Given the current state of its utility/native token, MKR, is the MKR community adequately incentivized to maintain stability and security of the protocol?
* What is the endgame of MakerDAO? Does it make sense? - Hint: They have Endgame documentation.
* How will the evolution of technology, for example AI, MEV, affect the future of blockchain and MarkerDAO?
