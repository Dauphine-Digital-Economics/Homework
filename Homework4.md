# Homework 4 - NFTs and designing the future of blockchain

We will focus on applying NFTs to real world use cases. From the guest lecture with Boonty, you will be extending their product offering with a NFT reward of your design. Then we will apply the latest advancement in Ethereum, account abstraction, to make user onboarding for Boonty clients as seamless as possible.

### Bonus point exercise - NFT Paris Week (1 point)
Attend the main event or a side event during NFT Paris week. Take a picture of the event (you do not need to include any faces) and write a few sentences on your experiences and something interesting you learned from someone at the event.

### Exercise 1 - Design your own NFT reward (8 + 2 points)
##### Part A - Create your own NFT (8 points)
Boonty, as a B2B Web2.5 company, provides their clients the ability to offer both traditional rewards like a coupon, and Web 3 rewards to their respective consumers. Imagine an NFT reward which a business can offer to their consumers. For example, what would you want from a business you frequently use? Early access to this year's latest fashion trend from H&M, limited edition character skins in your favourite game, etc.

Write your own smart contract (no code help this time!) that mints dynamic NFTs(dNFTs). The base NFT will evolve as users become more loyal. This means, your contract must be able to:
* Mint the token to the user's wallet address when a user or the company calls the mint function, Don't worry about account abstraction at this point.
* NFT performs the correct reward action - gating access to exclusive party, giving some additional tokens, whatever you imagined.
* Have meanginful evolve function that ONLY authorized addresses can call, giving the specified consumer better rewards. Check Openzeppelin for identity and role control based extensions, or you can write your own.

As discussed in class, there are many NFT extensions available. You are free to add any additional extensions or create your own. 

##### Part B - Documentation Generators (2 points)
Make sure you have thoroughly commented your NFT contract according to the Natspec format. Then, find a way to automatically turn your comments into documentation. Your documentation should allow the reader to very easily understand the unique qualities of your NFT.

Hint: perhaps you will find [this](https://www.youtube.com/watch?v=uD6P5Hn7fLE) video useful, but there are other softwares out there which can generate prettier documentation.

### Exercise 2 - Writing Technical Specifications (10 points)

It would be tedious if users had to first get a wallet, fund it with enough gas, then mint your NFT as a reward. Therefore, we will be adding EIP-4337 functionality to your proposed NFT. Then, you will generate a Technical Specification for Boonty to explain to them and their investors what they need to do in order to implement this upgrade and what benefits this upgrade will bring. **Note: You do not need to write any real or in depth code for this exercise!** You may choose to include an interface or some pseudo code.

To get started, look at how EIPs are written. They follow a very specific structure. Hint, your proposals for the class presentation also follows a simplified form of this. Since this exercise heavily involves [EIP-4337](https://eips.ethereum.org/EIPS/eip-4337), perhap you want to use it as a template.

Following the section in the specification, think about what diagrams you want to produce and what skeleton contracts/functions you want to show in your Specification. Please make sure to include an architectural diagram that clearly shows how your NFT contract interacts with the account abstraction contracts.