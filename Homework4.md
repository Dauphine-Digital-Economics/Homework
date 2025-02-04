# Homework 4 - NFTs for Space

The focus this week is on applying NFTs to a real world use case: the component-for-space supply chain. This homework is writing , research and Token design heavy. Due to the work load, this homework will be done in teams of 3 and one team of 4 (we have 13 students in this class). All team members will receive the same grade. Please organize yourselves into teams. The due date for this homework is 19 February 2025.

Please note, this Homework may be graded by a panel and therefore taking longer to return.

### Bonus point for Homework 4 - NFT Paris Week (1 point)
Attend the main event or a side event during NFT Paris week. Take a picture of the event (you do not need to include any faces) and write a few sentences on your experience and something interesting you learned from someone at the event.

To get a free ticket, please select a "General Admission" ticket on the NFT Paris [website](https://www.nftparis.xyz/ticket-pages/tickets-choice) and enter in the promo-code "STDAUPHINE".

### Bonus homework exemption - Hackathon
You may have your lowest homework grade excluded from the final calculation if you attend and submit a project to any Web3 Hackathon. You do not have to win the competition but you must show some concrete proof that you submitted a full project. 

If you decide to participate in a Hackathon, please let me know before lectures finish (aka. Before 7 March 2025).

Some current Hackathons, but you can attend any, even one organised by the student club:
* [Paris Blockchain Week](https://www.parisblockchainweek.com/hackathon-2025)
* [NFT Paris Hackathon](https://www.nftparis.xyz/dev-application) - This one is small and perhaps not well organized.
* [Safe Agentathon](https://safe-agents.devfolio.co/overview) - For the AI enthusiasts amongst us. Short closing date to get this bonus completed.

### Exercise 1 - Market Research of the Space Industry (6 points)

The Space industry is heavily dependent on US components. Over time, France has encouraged the development of their own, self-sufficient space strategy, becoming the most dominant player in Europe. However it is expected that New Space will bring about changes in these established processes with the preferred usage of non-qualified Automotive components and mindset shift from reliability to acceptable risk. What opportunities and challenges are present? 

Review Lecture 8 and write a short paper discussing:

1. France's past and current Space strategy (CNES) and how the French government supports the Defense and Aerospace sectors. Contrast this briefly with the German strategy (DLR). What were their respective origins and goals vs. current projects and initiatives? 
1. How did CNES/France achieve their dominance?
1. Describe current trends and characteristics of the New Space market and their component supply chain.
1. Comparing the traditional, HiRel, supply chain against the New Space supply chain you described above, how are manufacturers, distributors and space agencies adapting to the new era, specifically in terms of supply chain logistics of non-qualified New Space components? 

**Hint**: Manufacturers are offering components which sit somewhere in between both worlds and the European Space Agency (ESA) pushed out new standards, eg. [ECSS-Q-ST-60-13C](https://ecss.nl/standard/ecss-q-st-60-13c-rev-1-commercial-electrical-electronic-and-electromechanical-eee-components-12-may-2022/), to accommodate New Space.
1. Conclude on your perspective of the future of the Space industry - would they collaborate more closely with the Automotive industry, would New Space crash, or something else happens? 

Minimum 3000 words. Paper will be graded on quality of research and your overall cohesive understanding of the Space industry.

### Exercise 2 - Supply Chain Tokenomics (10 points)

From the previous exercise, you should have a good idea of the challenges within the supply chain of non-qualified components. There needs to be a balance between the speed and availability offer by New space and the reliability that is valued in Traditional Space. 

In this exercise, you will produce a detailed token design white paper which builds upon the demo you saw in class, and describes a well-incentivized supply chain for non-qualified New Space components. Please structure your whitepaper into the following chapters.

**Optional note:** If you know how to use Latex to write research papers, it would be highly appreciated but not obligated.

Your whitepaper should be minimum 10 pages in length, size 11 font, including any diagrams or tables **but excluding** the table of content, citations, appendix and the EIPs required in Chapter 3. Essentially, Chapter 1 and 2, aka. the writing, should be minimum 10 pages.

##### Chapter 1: Current landscape and evaluation of Web3-Digitalisation potential
Review Challenges 1 - 4 presented in lecture 8. For each challenge, present an actual solution/approach that a Space company (can be traditional or new space) is using to address the challenge. Note, sometimes there is no solution and companies are choosing to completely circumvent the challenge and accept consequences. In this case, what are these consequences and what is the acceptable limit? Mention some strength and weaknesses of these existing approaches. Then, propose *at least 2 Web3 digital solutions* and evaluate their potential. Here, you can use 1 solution mentioned on slide 19 but they all have their own drawbacks and you must also come up with at least 1 of your own Web3 solutions. 

When evaluating the impact of a Web3 solution, consider what the current practices are, how easy it is to implement the proposed solution and is a Web3 solution really needed? It is acceptable to conclude that Blockchain is completely unable to address any challenge as long as your conclusion is well justified.

##### Chapter 2: Designing an incentivized token economy
Regardless of your conclusion from the previous chapter, assume that we are going ahead with implementing the NFT presented in class as the digital twin to a component. A quick summary if you do not remember the demo: the NFT provides real time updates of a component's movement along the supply chain and stores the relevant documentation that is gathered from production to purchase.

In this chapter, we will try to design a token economy around this NFT which addresses 1 or more of the previously mentioned challenges. You could simply use the solutions you proposed in the previous chapter as inspiration or come up with a new system. **Please follow the design process presented in lecture 4. Also attach [this excel table](https://docs.google.com/spreadsheets/d/1FwTcMnhViKDZVVAlvwqCTkcUlFmFae_rJ1Uf_PkFVLM/edit?usp=sharing) summary as an appendix.**

Some points to consider as inspiration:

* **Initial Set Up** - The initial pilot will most likely be launched in co-operation with a national space agency like CNES or DLR. Private or public blockchain? Do we need an additional governance/staking/reward/stable token? How much to set up the hardware? Who has the administrative rights?
* **Community participants** - Which players are initially involved in this pilot? Manufacturers, fabrication labs, test houses, etc.
* **Tokenomics** - What value do each of the tokens hold? What action does this value incentivize for each participant?
* **Monetary Policy** - How is the value of the token guaranteed? Supply mechanisms? Burn and mint schedules? How do we initially distribute the token to the participants? How can participants on- and off-ramp from this initiative? Scalability outlook of the future?
* **Reward or incentive levers** - Are there additional features to this system which increases loyalty and ease of use? For example: Staking rewards, Airdrops, etc.

Describe clearly the players along this supply chain and what they would be motivated by. Then propose your system. An example system which you may not use, the national agency (CNES/DLR) issues some ERC20 tokens to manufacturers to perform a test and publish the result on the corresponding NFT. The ERC20 token is backed by an approved budget from the ESA (so off-chain collaterized).

**Please note**, you do not necessarily have to use the NFT format presented in the lecture, but keep its core functionality. There are multiple other NFT standards. The important criteria is that the standard you chose is fitting the use case you describe. It is not advisable to introduce too many tokens (I suggest max 2 in addition to the existing NFT) since this is a pilot and we want to keep it simple, but also because the next chapter is a description of each token.

##### Chapter 3 - Technical Specification of Tokens
For EACH of your proposed tokens create a simplified Technical Specification in accordance to the EIP format. As an example template, [ERC20](https://eips.ethereum.org/EIPS/eip-20) and [ERC721](https://eips.ethereum.org/EIPS/eip-721) standards. You only need to include up to the *Specification* section, testing/implementation/references not necessary. This section does not count towards the minimum page requirement.

### Exercise 3 -  Demonstrate your custom tokens(4 points)

According to what you described in Exercise 2, Chapter 3, please implement your tokens in code. Feel free to use the OpenZeppelin Wizard and then add the functions you mentioned in your Specs.

Once the smart contract is compiled without errors, you can also do some testing and scripting if you like, deploy the NFT contract and perform a few transactions which demonstrates the different use cases you mentioned in your paper. In your submission, please state the contract address and include screenshots of appropriate batches of transactions. Each batch should represent a use case walkthrough. Provide a brief description of each batch and what use case they represent.