# Homework 4 - Hardhat Deployments and DAO Proposal

As we begin the second half of the course, we will shift away from theory and into real world web3 applications. This homework is divided into 2 parts - technical and community. 

For the technical aspect, you will learn to deploy onto testnet of chains as the first step of truly showcasing your work onchain. For the community aspect, you will be publishing a governance proposal on a real DAO platform and have the chance to earn your first real crypto tokens. A big thank you to [impactMarket](https://www.impactmarket.com/)!

## Hardhat Challenge Set

Hardhat offers a vastly different user experience than Remix. A nice UI (User Interface) does not necessarily mean a better experience. Seasoned developers often find that commands can be far more precisely controlled and manipulated than a GUI element like a button, which executes actions that are not immediately visible. 

Consider this (unfortunately) common scenario, known as a phising attempt. You receive an email saying, very ironically, that your wallet has been hacked. It provides a link to change your seed phrase in order to "secure" your wallet. You click the link and enter your wallet seed phrase and click the submit button. It displays a message saying your seed phrase has been changed. You go back to your wallet and suddenly find that all your crypto tokens are gone. You realise that this button submits to malicious smart contracts that drain wallets. Have you checked what each button in Remix does?

Hardhat starts as a blank slate. It does not know how to perform any function. Every function (known as "Tasks" in Hardhat), from compiling, testing, deploying, is written by either you or a member of the open source community. You can view the code and control the parameters of execution for each task.

### Challenge 1 - Test and Deploy

As shown in class, deploy your Homework2 Game.sol and Engine.sol in Hardhat. The process is summarized in Slide 4. Don't forget to install the toolbox so you get some free, and very essential, Tasks. See the example project for additional help if you need.

Writing tests is incredibly important. There are different categories of testing like Unit Test, Perfomance Test, Security Test, etc. For this homework, learn how to write a simple Hardhat test. Hint: import the package called Chai. Perform the following steps:

1. Fork the example Hardhat [project](https://github.com/Dauphine-Digital-Economics/Hardhat-Gambling) into your own Github
2. Git clone your forked project onto your local machine
3. Remove the Game and Engine files in the Contracts folder and replace them with your own Game and Engine files from Homework2.
4. Ascertain that you can deploy it on your command line (Terminal for MacOS or WSL for Windows). A successful deployment should print out the address of where it was deployed.
5. Write 1 or 2 tests for each of your Solidity files. Remember, to test something, you need to have an expectation of the correct outcome so you may need to reduce randomness in your Game.sol file to something you can predict the outcome of.

### Challenge 2 - Celo Alfajores Deployment

Now that you have successfully deployed on a local, simulated blockchain, we are going to deploy on Celo Alfajores. Remember, **your final project requires deployment on Celo Alfajores.** We will need to first configure MetaMask to use the Alfajores network and then tell Hardhat about our Metamask account so the Smart Contracts have an owner.

##### Configure Alfajores on Metamask

1. Chose an account. You can use the existing one you have or create a brand new one.
2. Click on the network button next to your account button and select "add network"
3. Select "Add a netork manually" and input the fields using parameters you find on [this](https://docs.celo.org/wallet/metamask/setup) page under "Alfajores"
      * Mainnet is Celo's Mainnet. Alfajores is for dApp and Smart Contract testing and Baklava is for Validator testing.
4. After you have added the network, request some funds from the Celo [faucet](https://faucet.celo.org/).
5. Wait a few minutes and confirm that you see 5 CELO in your Metamask wallet.

##### Configure Hardhat and deploy your game on Alfajores

Before we begin, please be aware that Hardhat requires your **private** key in order to use that account to deploy smart contracts. **Never, under any circumstance, publically reveal your private keys!!!** Github is a public platform where every person or bot can view your code. Publishing a private key on Github is like publishing your bank account password on Twitter. There are many bots out there that is dedicated to scanning Github files for accidentally pushed private keys.

1. install dotenv as a node package with
```
npm install dotenv
```
2. Open the .gitignore file
   * .gitignore is a way to ensure that the file or folder specified does not get pushed online. Use .gitignore for folders with thousands of files or files containing sensitive information.
   * Add a comment that says Metamask private key then list the .env file. It should look like
   ```
   # Metamask private key
   .env
   ```
   * Save and close the file.
3. Create a new .env file and type in : PRIVATE_KEY="[insert private key here]"
   * In order to find the private key of your Metamask account, clikc the three vertical buttons under the account button. Select Account Details and then click on the "export private key" button. You will need your Metamask password.
4. Head over to hardh.config.js to tell Hardhat where to find Alfajores and the private key.
   * Since we are using dotenv, Hardhat must know about it. At the top of your file, insert this require statement.
   ```
   require("dotenv").config({ path: ".env" });
   ```
   * Now add in the network details. If you are brave, try reading up [Hardhat live deployments](https://hardhat.org/tutorial/deploying-to-a-live-network) and [this](https://docs.celo.org/blog/tutorials/hardhat-and-celo-the-ultimate-guide-to-deploy-celo-dapps-using-hardhat) Celo tutorial for extra help. If you do not want to deep dive into code, add in this code after line 4:
   ```
   networks:{
    alfajores: {
    url: "https://alfajores-forno.celo-testnet.org",
    accounts: [process.env.PRIVATE_KEY],
    chainId: 44787,
    }
   }
   ```
   * Deploy your script with:
   ```
   npx hardhat run scripts/deploy.js --network alfajores
   ```
If you were successful, you should see the address the contracts were deployed at and if you head over to your Metamask account, you should notice that your 5 CELO has reduced slightly. This is the fee associated with deployment onchain.

**Optional bonus**: Check with your classmates and see what it cost to deploy their smart contracts. Was it the same? Why do you think it was or was not the same? Write your thoughts in a README.md file.

## Impact Market DAO proposal

As part of your impactMarket discovery, we are inviting you to present a proposal to the DAO. The aim of this proposal is to incentivize token (PACT) holders to interact with the DAO. 

Token (PACT) holders can be divided into three categories:

1. Donors, people who donate to impactMarket and receive PACT as a reward for their donations 
2. UBI Communities (Beneficiaries & Community Managers), those receiving PACT through actions undertaken (like Learn & Earn) 
    * Using native tokens to incentivize community is an area of Community Management in Web3. Common ways to earn tokens are Ambassador programs, social media Moderators, documentation writing and translation, and Learn and Earn as in the case of impactMarket.
    * Optional: research some different offerings of various chains and the actvities they incentivize.
3. Investors, those who invested in the token (PACT) through buying or trading it directly from Centralised or Decentralised Exchanges. 

You have the freedom to choose which category you would like to incentivize. Each category contains different personas who have different needs and motivations. Given your chosen category, reflect on what appeals to a person in this category. For example, people in improvished communities generally have lower literary rates as compared to a trader. For impoverished communities, using the PACT token in a way that immediately impacts their lives, like buying bread, is of much higher value than investing it in an Exchange. However, PACT tokens cannot directly be traded for bread, so you must do some research into how the PACT tokens is traded until it finally becomes a tangible good. Hint: PACT uses Celo stablecoins to ease the on and off ramping process. On and off ramps are services which allow conversion between fiat currencies, like USD and EUR, to cryptocurrencies.

Incentives can come from different dimensions where you could incentivize donors to increase their donation through a mechanism of your choice, or encourage UBI communities to use their PACT to increase visibility or services or burn PACT to increase token value for investors (Supply Tokenomics). 

An example proposal, impactMarket is soon to launch a micro-lending service for our UBI Communities. In order to encourage both categories to participate in the DAO and increase the utility of PACT, beneficiaries will only be able to request a loan by depositing PACT as collateral. In the case they wouldn’t have enough PACT to support the amount they would like to borrow, PACT holders (donors) would be invited to add the remaining collateral through crowd collateral. This mechanism would incentivize both categories not only to hold their PACT but to create utility for the token - a great proposal for all three categories of token holders. 

In summary, the steps you should take in order to come up with a great proposal:

1. Research how PACT tokens are currently used - their utility use cases
2. Research how impactMarket interacts with its communities on the ground
3. Reflect on the social and economic driving factors for one or multiple categories of people involved

Remember that a DAO can only survive when there is demand and utility for a token. It is therefore important to take this aspect into consideration when setting up the proposal. Your proposal does not have to be as complex as the example provided, but it should be clear how people will be incentivized to use or trade PACT, increasing its utility.

### Proposal Structure

impactMarket is using [Commonwealth](https://commonwealth.im/impactmarket/proposals) as a governance platform. You may look at some past proposals to give you an idea but some of them are very sparely written, so look at a few of them to compare. This will also give you an idea of what activities impactMarket is engaging in - you will see a lot of new community proposals.

A proposal structure is what needs to be included in the body of each proposal to be considered and voted on by the DAO. This ensures all proposals provide the information necessary for the community to make a decision. Some Web3 communities have extremely strict guidelines and may even include bots which auto removes proposals which do not meet all requirements.

A proposal structure looks like a fill-in-the-blank document. For impactMarket, you may connect your wallet (add the Celo network to your MetaMask, see last section of this homework) and click new proposal to see the format. It includes things like Title, Summary, the team involved (you can choose the type of department that will need to work on such ideas), and Financial Implications. 

**Title**: The primary focus of the proposal

**Short description**: In one or two sentences, explain the purpose of this proposal and what it seeks to achieve. 

**Scope/longer description**: This is the meat of the proposal, where you’ll describe what you’re planning to do. Use this space to provide research, background information, and external links, too.

**Metrics or Key Performance Indicators**: Some contributors will want to see the numbers on what success would look like. Add those in here.

Submit the proposal with the structure described above as homework. Do not post it on the impactMarket platform. The proposals set from this class will be presented to the impactMarket team who will then choose one proposal as the “winner”. The impactMarket team will not have any personal information and please do not put any personally identifying or sensitive data in your proposal either. 

### For the winning proposal

The author of the winning proposal will be informed by the professor of their status and may chose to accept or decline reward. In the case of a decline, the next best proposal will be selected. Once the winner has accepted, their reward will be:

1. A community call to present his / her proposal to the impactMarket community on Discord (date to be defined together). This will help you gain experience and exposure in the web3 world.
2. Receive 20,000 PACT for his/her contribution to the DAO, enabling him/her to become an active member of the community, by voting on the proposal.
    * You may also take this opportunity to do some real crypto trading, yield farming, etc. The tokens are yours to do as you please.
    * Please note that any tax obligations to French authorities is your responsibility!

##### Add Celo Mainnet and Receive PACT tokens on Metamask

PACT is a token on the Celo Blockchain. Thus, in order to receive your token you need to add the Celo network to your Metamask. Next to your profile image, click the network button to see a list of networks. At the bottom, click add a network. You will then be directed to a new tab, where you wil need to add the celo network manually. This button is also at the bottom of the page. Click on it and fill in the following values to add the Celo Mainnet:

**Network Name**: Celo (Mainnet)
**New RPC URL**: https://forno.celo.org
**Chain ID**: 42220

Now you are ready to receive PACT tokens!
