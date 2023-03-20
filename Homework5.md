# Homework 5 - NFT DAO and SDLC

We will create a Decentralized Autonomous Organisation (DAO )through a simplified Software Development Lifecycle (SDLC). This project will be done as a class effort and you wil be graded on a team score and an overall class score. The repositroy where all collaboration and coding work will happen is the class Github. We will have the following teams:

* Developer Operations Team - Cédric, Yichen, Yanming
* Governance Token Team - Aizhan, Laetitia, Margot
* Governance Model Team - Léa, Valentin, Jiawei

Please read the section relevant to your role below. However, reading other sections will help you gain a wider perspective of the project as a whole so your are able to anticipate their work and minimise merge conflicts.

**Easter Egg!** Each team may ask the professor to perform one task. DevOps team gets two requests due to the higher task load. To prevent requests like "do my work for me", the professor reserves the right to execute the request in a manner that is helpful but still encourages learning and self exploration.

### Developer Operations

DevOps concerns the successful delivery of a software project through all the stages of SDLC. For this project, the role will also contain a small amount of project management. Your task is to manage the two development teams to design something cohesive and manage the testing and deployment of the project.

##### Design and Team Management

Each project starts with a general design stage where technical, personnel and financial considerations are made. We can disregard the financial considerations for this homework since we are not constrained by budget. For the personnel considerations, you must make the best decision for your two teams in terms of skills, the wants and skill level of the developers, weighed against to the difficulty of the tasks. The initial suggested team composition is based on the past performances in the homeworks but you are free to reassign teams members or they may petition you for a change. The technical tasks described in the sections below may not be changed.

The technical considerations are incredibly important at the start of any software project. For DAOs, the governance process that is implemented must match the token type. For example, implementing an ERC 721 NFT is very limiting if you are doing onchain voting because they cannot be divided into smaller quantities and easily distributed. They may be suitable for offchain voting since you can have a different token offchain and only a few people pushing the aggregated proposal results onchain but that will create a lot of integration work for the governance team. Of course, you can simply choose to put all the capable developers into the governance team in this scenario, it is a balance between technical design and developer skill.

You must organise a design meeting with the class to discuss the design considerations. You may do this synchronously via a in person or online meeting or asynchronously via a poll on Snapshot or have everyone submit their thoughts and opinions to you. **Whatever the method, you must produce a design document, named "design.md" in the root folder of the class repository which details the decisions you came to and the reasoning behind these decisions.**

To help you structure your document, design.md can contain the following sections

* Technical Specifications
  * Chosen token standard
  * Chosen governance process model
* Development Process
  * Collaboration methods - git branch, PRs, team communication tools
  * Stages of SDLC and deadlines for each stage - design, coding, testng, final deployment

##### Testing and Deployment

You are responsible for testing of the work produced by the two teams as well as the project's final deployment onto the Celo Alfajores Blockchain. The methodology of how you achieve this process is up to you. In earlier times, teams use to follow the [Waterfall metholodgy](https://www.forbes.com/advisor/business/agile-vs-waterfall-methodology/#:~:text=The%20main%20difference%20is%20that,different%20phases%20of%20the%20project.) but Agile methodology is the most prevalent today. Given the two week submission deadline, it is wise to adopt an Agile way of working.

Consider this scenario, you have the initial design meeting, wait for the two teams to finish their work, you write some tests and realise things don't work and now you need to ask the developers to fix their work, all the while, the two week deadline is approaching. This linear way of working involves a lot of waiting. You could alternatively agree at the design meeting that each team will write smart contracts with specific function names and expected function behaviour, producing certain specific results. While the developers are writing their code, you can write the tests at the same time, ready for immediate testing upon code completion and final deployment.

Please write **3** tests:
1. Unit test - function from the token contract
2. Unit test - function from the governance contract
3. Function test - test a user action (Example: submitting a proposal or voting on a proposal or dsitrbuting voting tokens)

**In addition to providing the test scripts and deployment to Celo Alfajores, the DevOps team must also deliver a README.md file** README files are the lifeblood of open source development. Seasoned developers will sometimes completely disregard a project if there is no README file present. An example of a good README file, see [this](https://github.com/PatrickAlphaC/dao-template) DAO project.

To reduce the amount of work, follow this simple README structure:
* Project Description - tiny summary (50 words or less) of the DAO and its token and governance model.
* Installation and Execution
  * How to download and install the project (at the very least need npm and hardhat)
  * Tests available (tiny 20 word description of each of the three tests) and how to run test (very easy, it's npx hardhat test)
  * How to deploy and interact with DAO

### Governance Token

Tokens in DAOs may have one or more uses. Most simply, it is used as a representation of voting power. Some organisations also have additional offerings for their tokens such as allowing it to be traded on an exchange or yield farming programs that allows the generation of interest returns. You are resposible for the lifecycle of the token and how it is used. This begins with how the token is created and how interested members can get a share of this token. More importantly, who controls this process. Hint, the Openzeppelin "Ownable" contract is one of the most widely used contracts.

The example DAO project on our class Github shows the use of an ERC20 token as the governance token used for voting. Your job is to use a NFT token instead. This will change voting dynamics and how your tokens are minted, distributed and tracked. Thinking about what token you will be designing. Some viable examples:

* ERC721 with Vote functionalities - The oldest form of NFT tokens.
* ERC1155 - New token standard not covered in class but allows a mix of fungible and non-fuungible tokens. They allow innovations lie fractional NFTs.
* More than one token - you may use a combination of tokens for different areas of the governance process, eg. NFT allows voting rights to certain categories of proposals but use normal ERC20 token to vote.

From the last option, it is clear that the token strategy must align with the Governance Model implementation. You may discuss this with the Governance Model team, ask the DevOps team for direction or any other strategy which enables a cohesive technical strategy.

### Governance Model

The governance model determines how proposals are made and votes are casted. In certain DAOs, especially ones dealing in stablecoins, proposals have different urgency and consequences. Remember in Lecture 7 where MakerDAO allowed the community to vote on Black Thursday victim compensation, resulting in a $28 Million, 3 year lawsuit? Governance strategies involve thinking about regulating who can vote, how votes are cast, time periods of the voting process and tools used to cast the vote.

Let's simply allow everyone to vote, the biggest considerations here will be Vote platform, time locks and proposal structures.

##### Voting Platforms

You can chose to do everything onchain and in code. This will mean a rather large smart contract detailing vote parameters like time frame and quorum limits. you may generate this with the OpenZeppelin Contracts Wizard and add in custom functionality to make it work with Token team's token. The example in the class Github is an onchain voting example.

Alternatively, you choose an offchain voting tool like Snapshot. The project will then change significantly and become integration heavy. You will need to figure out how to use Token team's custom token with Snapshot for example. This will also increase DevOps team job of writing a functional test since they now need to figure out how to incorporate something offchain into their javascript code. If you read the DevOps section, you will notice that they have the power to reassign team members, so consider carefully how your choices impact other teams.

##### Governance contract elements

Timelocks and the proposal structure are components which should be matched to specific purpose of the DAO. For example, if you chose to implement a very long timelock, then the decisions you your making cannot ever be urgent decisions like the stablecoin market is crashing, do we do an emergency shutdown. Or if you chose a simple token amount voting method where the proposal with highest token amount wins, remember there are flashloan attacks where someone can borrow a few million of your token, vote, and then dump everything once the voting period has ended. You do not have to prevent every attack vector, but you should note your thought process and choices in the design.md document that DevOps team is respnsible for. 
