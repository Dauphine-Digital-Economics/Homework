# Homework 4 - NFTs for Space

- Deadline for submission: 1 March 2026, 23:59.
- Submission type: Group
- Description: Analysis of the Space political economy and application of Blockchain on its supply chain.
- Remarks: 
The space industry is different from commercial industries due to the associated geopolitical influences. This homework aims to clarify the economic and political pressures of the space industry and re-imagine a data driven, Blockchain enabled, supply chain. 

### Exercise 1 - Market Research of the Space Industry (10 points)

Produce a research paper which discusses the present and future of the European Space strategy. Minimum 3000 words. Paper will be graded on quality of research and your overall cohesive understanding of the Space industry. **Optional:** If you know how to use Latex to write research papers, it would be highly appreciated but not obligated.

Review sources from international organisations (eg. ESA, OECD) and national space agencies (eg. CNES, DLR) then write a well researched paper discussing the following sections:

1. Section 1 - Current state of the European space strategy
   Analyse and detail the current European space landscape from an economic an geopolitical perspective. Specifically, compare and contrast the strategies adopted by France and Germany respectively.
1. Section 2 - Supply chain self sufficiency
   Take a look at the Chinese space strategy - one of complete self sufficiency. This can be clearly seen in that China is able to maintain its own Space Station, Tiangong, along with all of its repair and crew needs. Clarify how China is able to achieve this level of self sufficiency by looking at its space semiconductor supply chain. Quantify these values by comparing them to equivalent global or European values.
1. Section 3 - What's next for Europe?
   Based on your research from the previous sections, what should the future of European Space component supply chain look like? Both as the EU bloc on the world stage, as well as domestically between EU member states. At a more fine grain level, some recommendations on the future space policies for the major contributors (Lecture 10 - France, Germany, Italy, UK).

**Note:** As a research paper, the quality and relevance of the citations will be checked. In the Space industry especially, published data should be treated with some level of suspicion due to the industry being closely tied to national defense. Therefore, try to corroborate numbers with a few sources and cite margins of error if necessary.

### Exercise 2 - Supply Chain Tokenomics (10 points)

Review the challenges presented in Lecture 10. The aim of this exercise is to design an NFT digital twin which solves some of the supply chain challenges in New Space.

Please produce two documents, the first a technical specification of your NFT, detailing the global variables, special functions it supports and how to handles data storage. The second document should clarify the design choices of your technical specification from a tokenomics (users, incentives and basic economic sanity - Lecture 5), and architectural perspective (latency, security - Lecture 3).

##### Technical Specification: Designing an incentivised Space Digital Twin

In the design of your digital twin, first consider what supply chain challenges you want to address. A functionality does not have to fully solve the challenges we discussed, a small improvement to current practices is sufficient.

Your Specification should contain the following elements:
- One Solidity file of the NFT digital twin itself
- Architectural diagram which addresses:
    - The hardware and network setup.
    - Data storage setup, detailing what is stored on- and off-chain.
    - EVM and Consensus Mechanism considerations - recall from Lecture 3, there are different consensus mechanisms depending on speed and reliability needs, and nodes in a network have different roles.
- One or two data models and API calls which meaningfully pulls data from onchain and offchain locations and creates a model which assists in the challenges that you are addressing

##### Design motivations and scalability
The purpose of this document is to explain the design decisions you made in the Technical Specification and chart a path from idea to implementation. The sections to address are:

1. Section 1: Design Motivation
   - How was the specific hardware setup and consensus mechanism chosen to support your solution?
   - What data is store onchain vs offchain? What led to this design choice?
   - What output does your data model produce which supports the challenges that you are addressing?
1. Section 2: Tokenomics (Lecture 5)
   - Who are the users? Provide a user persona for each.
   - What purpose/utility does your NFT serve? In terms of benefits beyond the current way of work.
   - User behaviours that you want to motivate along the supply chain? Which kind of incentive mechanisms can you add to your network to motivate these behaviours? For example, trust is a huge issue in the space industry and manifests in different forms of paranoia or reluctance to open source currently.
1. Section 3: Scalability
   - How would an initial pilot look like? Recall the trust issue, then think about a small set of participants.
   - What would ideal adoption look like? 
   - Does your Blockchain architecture support this scaling process? What changes and pressures do you foresee as more participants join the network and data grows?

### Bonus Exercise -  Demonstrate your NFT digital twin (3 points)

According to what you described in Exercise 2, please implement your tokens on the Sepolia test network. Feel free to use the [OpenZeppelin Wizard](https://wizard.openzeppelin.com/#erc721), or any other templating tool, and then add the functions you mentioned in your Specs.

Once the smart contract is compiled without errors, deploy the NFT contract in the Sepolia network and perform a few transactions which demonstrates the different use cases you mentioned in your paper. In your submission, please state the contract address and include screenshots of appropriate batches of transactions. Each batch should represent a feature of your digital twin. Provide a brief description wth each screenshot.
