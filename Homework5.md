# Homework 5 - NFT DAO and SDLC

We will create a Decentralized Autonomous Organisation (DAO )through a simplified Software Development Lifecycle (SDLC). This project will be done as a class effort and you wil be graded on a team score and an overall class score. The repositroy where all collaboration and coding work will happen is the class Github.

Please read the section relevant to your role below. However, reading other sections will help you gain a wider perspective of the project as a whole so your are able to anticipate their work and minimise merge conflicts.

**Easter Egg!** Each team may ask the professor to perform one task. DevOps team gets two requests due to the higher task load. To prevent requests like "do my work for me", the professor reserves the right to execute the request in a manner that is helpful but still encourages learning and self exploration.

### Developer Operations

DevOps concerns the successful delivery of a software project through all the stages of SDLC. For this project, the role will also contain a small amount of project management. Your task is to manage the two development teams to design something cohesive and manage the testing and deployment of the project.

##### Design and Team Management

Each project starts with a general design stage where technical, personnel and financial considerations are made. We can disregard the financial considerations for this homework since we are not constrained by budget. For the personnel considerations, you must make the best decision for your two teams in terms of skills, the wants and skill level of the developers, weighed against to the difficulty of the tasks. The initial suggested team composition is based on the past performances in the homeworks but you are free to reassign members to different teams as the workload demands or they may petition you for a change. The technical tasks described in the sections below may not be changed.

The technical considerations are incredibly important at the start of any software project. For DAOs, the governance process that is implemented must match the token type. For example, implementing an ERC 721 NFT is very limiting if you are doing onchain voting because they cannot be divided into smaller quantities and easily distributed. You can use mixed token or voting strategies to get around this limitation, but an NFT token must be used in some way.

You must organise a design meeting with the class to discuss the design considerations. You may do this synchronously via a in person or online meeting or asynchronously via a poll on Snapshot or have everyone submit their thoughts and opinions to you. **Whatever the method, you must produce a design document, named "design.md" in the root folder of the class repository which details the decisions you came to and the reasoning behind these decisions.**

To help you structure your document, design.md can contain the following sections

* Technical Specifications (You may ask the two development teams to fill in this section or do it yourself)
  * Chosen token standard
  * Chosen governance process model
* Development Process
  * Collaboration methods - git branch, PRs, team communication tools
  * Stages of SDLC and deadlines for each stage - design, coding, testng, final deployment

##### Testing and Deployment

You are responsible for testing of the work produced by the two teams as well as the project's final deployment onto the Celo Alfajores Blockchain. The methodology of how you achieve this process is up to you. In earlier times, teams use to follow the [Waterfall metholodgy](https://www.forbes.com/advisor/business/agile-vs-waterfall-methodology/#:~:text=The%20main%20difference%20is%20that,different%20phases%20of%20the%20project.) but Agile methodology is the most prevalent today. Given the two week submission deadline, it is wise to adopt an Agile way of working.

Consider this scenario, you have the initial design meeting, wait for the two teams to finish their work, you write some tests and realise things don't work and now you need to ask the developers to fix their work, all the while, the two week deadline is approaching. This linear way of working involves a lot of waiting. You could alternatively agree at the design meeting that each team will write smart contracts with specific function names and expected function behaviour, producing certain specific results. While the developers are writing their code, you can write the tests at the same time, ready for immediate testing upon code completion and final deployment.

Please write **3** tests:
1. Unit test - function from the token team's contract
2. Unit test - function from the governance team's contract
3. Non-functional test - simulate a user action or do a gas test (Hardhat has a [gas reporter](https://hardhat.org/hardhat-runner/docs/guides/test-contracts))

**In addition to providing the test scripts and deployment to Celo Alfajores, the DevOps team must also deliver a README.md file** README files are the lifeblood of open source development. Seasoned developers will sometimes completely disregard a project if there is no README file present. An example of a good README file, see [this](https://github.com/PatrickAlphaC/dao-template) DAO project.

To reduce the amount of work, follow this simple README structure:
* Project Description - tiny summary (50 words or less) of the DAO and its token and governance model.
* Installation and Execution
  * How to download and install the project (at the very least need npm and hardhat)
  * Tests available (tiny 20 word description of each of the three tests) and how to run test (very easy, it's npx hardhat test)
  * Address of DAO on Alfajores

### Governance Token

Tokens in DAOs may have one or more uses. Most simply, it is used as a representation of voting power. Some organisations also have additional offerings for their tokens such as allowing it to be traded on an exchange or yield farming programs that allows the generation of interest returns. You are resposible for the lifecycle of the token and how it is used. This begins with how the token is created and how interested members can get a share of this token. More importantly, who controls this process. Hint, the Openzeppelin "Ownable" contract is one of the most widely used contracts.

The example DAO project on our class Github shows the use of an ERC20 token as the governance token used for voting. Your job is to use a NFT token instead. This will change voting dynamics and how your tokens are minted, distributed and tracked. Thinking about what token you will be designing and how voting power is associated with the token. Some viable examples:

* ERC721 with Vote functionalities - The oldest form of NFT tokens.
* ERC1155 - New token standard not covered in class but allows a mix of fungible and non-fungible tokens. They allow innovations like fractional NFTs.
* More than one token - you may use a combination of tokens for different areas of the governance process, eg. NFT allows voting rights to certain categories of proposals but use normal ERC20 token to vote.

Whatever the option, it is clear that the token strategy must align with the Governance Model implementation. You must discuss this with the Governance Model team on how your tokens are counted as votes. Ask the DevOps team for management or any other strategy which enables a cohesive technical strategy.

### Governance Model

The governance model determines how proposals are made and votes are casted. In certain DAOs, especially ones dealing in stablecoins, proposals have different urgency and consequences. Remember in Lecture 7 where MakerDAO allowed the community to vote on Black Thursday victim compensation, resulting in a $28 Million, 3 year lawsuit? Governance strategies involve thinking about regulations of who can vote, how votes are casted and counted, time periods of the voting process and tools used to cast the vote.

Let's simply allow everyone to vote, your job is to design a simple onchain voting system so that you can:

1. Cast a proposal
2. Allow people with the correct tokens to vote on the proposal
3. Decide what the voting mechanism is (Simple transfer of a quanity of tokens, voting power calculation, time controlled, etc)
4. Set a quorum to decide how a proposal passes or fails
5. Update the state of the proposal (No need for execution, a simple get proposal status function is enough)

##### Governance contract overall structure

You can fit everything into one smart contract or separate each component into multiple contract for readability. The two components necessary are:

1. Core Governance Contract - manages the full proposal lifecycle.
  * Proposal Creation - how can people create a proposal? Who can create a proposal?
  * Proposal Voting - managed by the Voting Contract but must be called in the Governance Contract
  * Quorum - How is the success of a proposal determined?
  * Status - How can people check the status of a certain proposal amoungst a multitude of proposals?
2. Voting Contract - how are votes cast? Is it a simple yes or no or voters can deposit a certain amount of tokens? This contract requires close discussion with the Token team.

##### The Proposal struct

Your proposal will be stored onchain as a global proposal struct. Think about what needs to be in this Solidity Struct. The eact parameters depends on th voting mechanism but some absolute necessities to get you started:

* ProposalId - So that you have a way of referencing the proposal, but think about how this ID will be generated. Openzeppelin uses a hash function, you can do something simpler
*  Proposal state - Failed, Passed or In Progress?
*  Description - what is actually being proposed
