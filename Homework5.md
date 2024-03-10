# Homework 5 - SDLC of Onchain DAO

The class will code a Decentralized Autonomous Organisation (DAO) and thoroughly test its functionality. This homework will be done as a class effort and you will be graded on a team score (10 points) and an overall class score (10 points). For this homework, please only submit ONE (1) repository of a fully working DAO. Submitting more than 1 repository will incur -2 points from the class score. In order to assess individual effort, your contribution is evaluated through online presence - that means, through commits, PRs, issues, or any other **visible and trackable Github activity**. Additionally, each team must submit, via email, a short written description of your contract functionalities as well as how the work was divided amongst the team members. This does not need to be elaborate, just enough to provide a hint of what to look for on Github.

In summary, I expect ONLY ONE repository link sent to me by a member of the DevOps team, as well as 3 separate written descriptions via email.

Please read the section relevant to your role below. However, reading other sections will help you gain a wider perspective of the project as a whole so your are able to anticipate their work and minimise merge conflicts.

The teams are divided as follows:
* DevOps Team - Calida, Stellan, Yuren, Yunjie
* Token Team - Hortense, Nathan, Matthieu
* Governance Team - Anthony, Maximo, Eduardo, Nicolas

### Development Operations

DevOps concerns the successful delivery of a software project through all the stages of SDLC. Your task is to manage the Token and Governance teams to design something cohesive, manage the testing and deployment of the project, and ensure smooth collaboration on Github (ie. resolve merge conflicts, can be very difficult!). I expect the final repository link to come from a member of this team.

##### Design and Team Management

As the managers of this project, it is your responsibility to see the project from inception to a safe product launch. This means implementing the full SDLC, from planning to audit. The other two teams are only concerned with coding, therefore, the DevOps team must manage all communication, starting from technical planning, keeping coding teams on track and testing and auditing the code they produce.

The nature of this project is highly inter-dependent because the Governance Team must use the token designed by the Token team. It is beneficial to agree on the technical architecture before starting the coding. However, you are free to manage the teams as you see fit. 

Technical hints: 
1. In order to ensure that the contracts of both teams can actually work with each other, agree early which functions are expected to be called cross contract and name them correctly
1. Branches are helpful in dividing work streams. Decide on the branch rules - everyone working on one branch? Constant changes, very unstable. Each person working on a separate branch? A lot of merging to manage.
1. Regardless of the branch strategy, you are responsible for the main branch and final state of the project. There are branch management options in Github. You can see in Homework 1, there was branch protection imposed on main, but the consequence is that many PRs had to be manually approved.
1. Merge conflicts cost a lot of valuable time to resolve. Try to encourage small commits of small increments from your teams - fixing a conflict in one file is much easier than a propagated error across multiple files. In bigger projects, this can extend to thousands of files! 

After initial project planning, **please submit a design document, named "design.md" in the *root* folder of the final repository**

The design file must contain the following sections

* Short technical specification and diagram show contract and function interaction (You may ask the two development teams to fill in this section or do it yourself)
  * Chosen token standard
  * Chosen governance process model
* Reflection
  * What was the motivation in the chosen token and governance model?
  * Did you encounter any technical difficulties like merge conflicts?
  * Did you encounter any interpersonal difficulties while managing the two teams?

##### Testing and Deployment

You are responsible for testing of the work produced by the two teams as well as the project's final deployment onto the Sepolia testnet. You have a 1 week deadline so it is imperative that you time manage both teams and leave enough time for you to write the tests for each team. Alternatively, you may find some method to write tests at the same time as they code.

For EACH team (token + governance), please provide the following tests:
1. Unit test - at least 2, testing the highest impact, most frequently used functions
2. Integration test - at least 1 test encompassing multiple function calls
3. Forge special test - at least 1 fuzz or invariance test
4. Project overview tests - a test coverage and gas report

**In addition to providing the test scripts and deploying to Sepolia, the DevOps team must also deliver a README.md file** README files are the lifeblood of open source development. Seasoned developers will sometimes completely disregard a project if there is no README file present. An example of a good README file, see [this](https://github.com/PatrickAlphaC/dao-template) DAO project.

At minimum, your README should contain these sections:
1. Project Description - tiny summary (100 words or less) of the DAO and its token and governance model.
1. Installation and Execution
  * How to download and install the project (at the very least need npm and hardhat)
  * Tests available (tiny 20 word description of each of the tests) and how to run test (forge test with relevant flags)
1. Address of contracts on Sepolia.

##### Smart Contract Audit
Round off your project with an audit. It is not enough to produce reports which uncovers various vulnerabilities but also understand from a business perspective, which vulnerabilities to address based on a balance of business impact and user experience. **Please create an audit folder in the root of the project** and provide the following documents:

1. A dynamic scan report (Solidity Scan class example)
1. A static scan report (Slither class example)
1. A recommendation.md that:
  1. An overall evaluation of how secure and gas efficient the project is currently
  1. Recommended top 3 priority issues to address (you do not need to fix any discovered vulnerabilities)
  1. Some data supporting why they are the top priority. Here, you can do some research on how damaging (in dollar value) each vulnerability is, how long it takes to fix, etc. Then argue from a business perspective why they are top priority

To summarize, your submission consists of:
1. The link to the repo
1. design.md
1. README.md
1. Audit folder consisting of the scan reports and recommendations
1. Test folder including gas and test coverage report

### Token

The example DAO project on our class Github shows the use of an ERC20 token as the governance token used for voting. This token, contains check point and delegation capabilities. Your job is to custom design or use an ERC standard **that is NOT purely a ERC20 or ERC721**, and provide it with whatever functionality the governance team needs for their governance model. You must include at least ONE new ERC standard in your token design! Hint: The governance team is not allowed to use a simple 1 to 1 token weighting or multisig wallets so plan accordingly.

Consider the following points:
1. Does the token standard match the governance model? (For example, ERC5805 builds in delegation and weighting). 
1. Tokens can have multiple utilities - perhaps it is a symbol of membership and vote eligibility. You can also chose to have multi token types.
1. How to prevent common attacks like double counting and token flashloans?


### Governance Model

The governance model determines how proposals are made and votes are casted. In certain DAOs, especially ones dealing in stablecoins, proposals have different urgency and consequences. Remember in Lecture 5 where MakerDAO allowed the community to vote on Black Thursday victim compensation, resulting in a $28 Million, 3 year lawsuit? Governance strategies involve thinking about regulations of who can vote, how votes are casted and counted to ensure fair representation of all interests, time periods of the voting process and vote execution.

The governance lifecycle roughly covers the following points:

1. Create a proposal
1. Allow members with the correct tokens to vote on the proposal - a function for members to check eligibility
1. Enforce a delay period time lock of any duration before votes can be cast
1. Select the voting strategy - you are not allowed to use a simple 1 to 1 (lecture example) or multisig wallets. You may choose a method presented in class (conviction, quadratic voting) or come up with your own
1. Decide on the vote options, scale of 1 - 10 or yes/no/abstain or any other, for the proposal and what constitutes as a quorum (proposal success/fail)
1. Impose a voting period and continuously track the state of the proposal
1. Execute successful proposals after queue period time lock

##### Technical considerations

You can fit everything into one smart contract or separate each component into multiple contract for readability. The Core Governance Contract manages the full proposal lifecycle as described above. For readability, have 1 main public function for each step. Have as many private helper functions as you see fit.

Your governance contract(s) must use the token standard developed by the token team.

A reminder, as mentioned in class, copying code is a double edge sword that requires you to spend time understanding the code. In certain occasions, it may be simpler to write custom code.

##### Onchain execution

Your proposal will be stored onchain as a global proposal struct. Think about what needs to be in this proposal struct. The exact parameters depends on the voting mechanism but some absolute necessities to get you started:

* ProposalId - a way of referencing the proposal without passing its full contents. Think about how this ID will be generated. Openzeppelin uses a hash function, you can do something simpler
* Proposal state - Failed, Passed, Queued, In Progress, etc
* Description - short string or link to longer proposal description
* Calldata - the bytecode encompassing the onchain execution