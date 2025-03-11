# Homework 5 - SDLC of Onchain DAO

The last homework of the course will simulate the full software development lifecycle - from planning to release. Each team will code a Decentralized Autonomous Organisation (DAO) and thoroughly test and audit their work. As the capstone project for this course, the scope is relatively complex but there are bonus points which allows groups to earn potentially 7 points above 20 in this homework. The due date of this homework is 30 April 2025.

A summary of all possible bonus points:
1. Gas section snapshot - 1 point
1. Community incentive mechanism - 1 or 2 points depending on complexity
1. Token standard selection - 1 point
1. Voting mechanism of sufficient complexity - 2 points
1. Multi-sig proposal execution - 1 point

For this homework, please only submit **ONE repository** of the code and all documentation. Submitting more than 1 repository OR submitting code which does not compile successfully will incur -2 points from the overall score. Normally, all team members receive the same score, but individual scores may be given if Github shows a great difference in the work load of every member. In order to as accurately as possible assess individual effort, contribution will be evaluated through Github records - that means, through commits, PRs, issues, or any other visible and trackable Github activity. Team are welcome to optionally submit a small written explanation of work distribution for maximum clarity. 

I suggest that each team divides themselves amongst the roles described below. There is also a suggestion of the number of people per role but you may do as you like.

### Development Operations (2 people)

DevOps concerns the successful delivery of a software project through all the stages of SDLC. Your task is to manage the Token and Governance teams to design something cohesive, manage the testing and deployment of the project, and ensure smooth collaboration on Github (ie. resolve merge conflicts, can be very difficult!).

##### Design and Team Management

As the managers of this project, it is your responsibility to see the project from inception to a safe product launch. This means implementing the full SDLC, from planning to audit. The other two roles are only concerned with coding, therefore, the DevOps team must manage all communication, starting from technical planning, keeping coding teams on track and testing and auditing the code they produce.

**A time management tip:** Auditing can only be done after coding is complete so plan to complete the coding a few days before the deadline. 

Optional Github hints: 
1. In order to ensure that the contracts of both teams can actually work with each other, agree early which functions are expected to be called cross contract and name them correctly
1. Branches are helpful in dividing work streams. Decide on the branch rules - everyone working on one branch? Constant changes, very unstable. Each person working on a separate branch? A lot of merging to manage.
1. Regardless of the branch strategy, you are responsible for the main branch and final state of the project. There are branch management options in Github. You can see in Homework 1, there was branch protection imposed on main, but the consequence is that many PRs had to be manually approved.
1. Merge conflicts cost a lot of valuable time to resolve. Try to encourage small commits of small increments from your teams - fixing a conflict in one file is much easier than a propagated error across multiple files. In bigger projects, this can extend to thousands of files! 

After initial project planning, the operational managers are responsible for the general state of the repository since there is only testing code to write, the following documentation is additionally expected from this role:
1. A README.md document which shortly describes the project, its tests and documentation
1. A Design.md document which serves as the technical planning documentation, listing the technical design choices such as ERC standards used, voting strategies etc.
1. An audit folder containing the static, dynamic scans and audit recommendations
1. A Gas report
1. **One or two bonus points: community incentives**

You will find a more detailed description of what is expected below.

##### Testing, Deployment and README

You are responsible for testing of the work produced by the two teams as well as the project's final deployment onto the Sepolia testnet. 

For EACH role (token + governance), please provide the following tests:
1. Unit test - at least 2, testing the highest impact, most frequently used functions
2. Integration test - at least 1 test encompassing multi-function or cross contract calls
3. Forge special test - at least 1 fuzz or invariance test

**In addition to providing the test scripts and deploying to Sepolia, the DevOps team must also deliver a README.md file** README files are the lifeblood of open source development. Seasoned developers will sometimes completely disregard a project if there is no README file present. An example of a good README file, see [this](https://github.com/PatrickAlphaC/dao-template) DAO project.

At minimum, your README should contain these sections:
1. Project Description - tiny summary (100 words or less) of the DAO and its token and governance model.
1. Installation and Execution
  * How to download and install the project (at the very least need npm and hardhat)
  * Tests available (tiny 20 word description of each of the tests)
1. Address of contracts on Sepolia.

The Design.md file must contain the following sections:

* Short technical specification and diagram show contract and function interaction (You may ask the two development teams to fill in this section or do it yourself)
  * Chosen token standard - the token design has a bonus point here.
  * Chosen governance process model
* Reflection
  * What was the motivation in the chosen token and governance model? Eg. Better engagement? simple voting?
  * Did you encounter any technical difficulties like merge conflicts?
  * Did you encounter any interpersonal difficulties while managing the two development streams?

##### Smart Contract Audit
Round off your project with an audit. It is not enough to produce reports which uncovers various vulnerabilities but also understand from a business perspective, which vulnerabilities to address based on a balance of business impact and user experience. A reminder from Lecture 10:

1. Dynamic scans are user simulation testing, contracts must be deployed. (Solidity Scan class example)
1. Static scanning follows the code to check for possible memory corruption and logic attacks. Direct integration in Xcode. (Slither class example)
1. A recommendation.md that:
  1. An overall evaluation of how secure the project is
  1. Recommend any top 3 priority issues to address (you do not need to fix any discovered vulnerabilities)
  1. Some data supporting why they are the top priority. Here, you can do some research on how damaging (in dollar value) each vulnerability is, how long it takes to fix, etc. Then argue from a business perspective why they are top priority.

##### Gas Reporting
As in Lecture 11, forge can generate Gas Reports. Generate a snap shot and check the current eth gas prices and make an assessment of the cost of voting and how much incentive is needed before an average user would be willing to spend that amount. **One bonus point: take a Gas Section Snapshot over an integration test of your end to end governance process from token mint to proposal execution to argue your point better**

##### Bonus: Community Incentive
At the beginning of this course and in the first group presentation, we explored how to attract contributions to a project. Implement any mechanism you see fit and describe this mechanism in community_incentive.md

As an example:
* Adding some open issues with the tag "good first issue" is worth 1 point since this is simple.
* Integrating OnlyDust into your repository and have a team member apply to solve this issue is considered complex and worth 2 points. 

### Token Design (1 person)

The example DAO project on our class Github shows the use of an ERC20 token as the governance token used for voting. This token, contains check point and delegation capabilities. Your job is to custom design or use an existing ERC standard and provide it with whatever functionality the governance team needs for their governance model. **One bonus point if you implement a non ERC20 or ERC721 standard, and sufficiently argue why the chosen token standard is appropriate for your DAO.**

Consider the following points:
1. Does the token determine vote eligibility? Or does the governance model determine eligibility another way? 
1. The token can be delegated **only once**. Therefore, your delegate function must enforce this. Also if someone has voted with their tokens already, they may not delegate the tokens which contribute to the vote.
1. The token must have a built in, simplified rage quit mechanism. This means, if *eligible* members (Lecture 9, Slide 26) initiates this action, just burn all the tokens they own, including any they delegated. This mechanism is strongly tied to time management of a proposal so be sure to work closely with the governance designers.
1. Please include at minimum 1 line of Yul/assembly.


### Governance Design (2 people)

As describe in Lecture 9, governance design concerns the full voting lifecycle, broadly divided into 3 topics - vote weighting, vote strategy and proposal execution, which in this homework will be strictly on chain. PLease discuss with the token designer so that they can fully implement their requirements as well.

The governance lifecycle roughly covers the following points:

1. Allow eligible members to create a proposal - how do you define eligibility?
1. Allow members with the correct tokens to vote on the proposal - How are the tokens weighted?
1. Enforce a delay period time lock of any duration before votes can be cast
1. Select the voting strategy - you are not allowed to use a simple 1 to 1 (lecture example). You may choose a method presented in class (conviction, quadratic voting) or come up with your own. **Two bonus points for complex mechanisms. Eg. Quadratic is simple because it is purely mathematical, conviction is considered complex because there is a time element included in the calculation. Incorporating any element such as time, transaction history, user behaviour is considered complex.**
1. Decide on the success criteria for a proposal. Eg. scale of 1 - 10, or yes/no/abstain, etc.
1. Impose a voting period and continuously track the state of the proposal. Eg. One week and proposal status becomes automatically closed.
1. Execute successful proposals after queue period time lock. **One bonus point for multi-sig executions. This means the execution can only be called if x-of-n members agree. Similar to multi-sig wallet example in Lecture 9, slide 13, but simpler to achieve with just a function modifier.**
1. Please include at minimum 1 line of Yul/assembly.

##### Technical considerations

You can fit everything into one smart contract or separate each component into multiple contract for readability. The Core Governance Contract manages the full proposal lifecycle as described above. For readability, have 1 main public function for each step. Have as many private helper functions as you see fit.

Your governance contract(s) must incorporate the token standard developed by the token designer.

A reminder, as mentioned in class, copying code is a double edge sword that requires you to spend time understanding the code. In certain occasions, it may be simpler to write custom code.

##### Onchain execution

Your proposal will be stored onchain as a global proposal struct. Think about what needs to be in this proposal struct. The exact parameters depends on the voting mechanism but some absolute necessities to get you started:

* ProposalId - a way of referencing the proposal without passing its full contents. Think about how this ID will be generated. Openzeppelin uses a hash function, you can do something simpler
* Proposal state - Failed, Passed, Queued, In Progress, etc. This is needed for actions like rage quitting.
* Description - short string or link to longer proposal description
* Calldata - the bytecode encompassing the onchain execution (The most important)
