# Homework 1 - Open Source and Solidity fundamentals

### Exercise 1 - Open Source Communities (4 + 2 + 4 points)
##### Part A - GitHub Contributions (3 + 1 points)

The [class directory](https://dauphine-digital-economics.github.io/Class-Directory/) is a demonstration of a simply constructed front end that is visual enough to showcase our work as  developers. You will update the Class Directory with your own information and act as a reviewer for your classmates. (3 points).

##### 1. Fork the class website into your own Github account

To prevent clashing code edits, the first thing you must do is fork the class-directory repository into your individual private accounts. You can do this very easily by being logged into your personal account then pressing the fork button on the class directory. Now you can start working on the homework in your own repository. For more information on forks, see [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo).  

**Note:** The main branch is protected against accidental changes. There are many ways to protect a branch, see [here](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository) if you are interested.

##### 2. Navigate to your card and update it

Now that you are in your own repository, you can edit it directly online or clone it to your local machine. Cloning it locally is preferred for easy testing and verification that your changes are correct. Once you have a local folder, try clicking on the index.html file and your default browser will load the page. Under the "Meet the Class" section, you can hover over the cards and find your name.

While Cyberpunk NFTs are cool, we would like to showcase you. Therefore, please add a high quality picture of yourself into the img folder and then change the relevant <img> tag to display your image. Check that your name is spelled correctly, add a description of who you are and finally, make the button point to your own Linkedin profile.

**Note:** In the spirit of cyber anonymity, if you are uncomfortable displaying your personal information (name, picture, Linkedin), you are welcome to use any picture, alias, URL you see fit.


##### 3. Open a Pull Request(PR)
Open a pull request by navigating to the Class-Directory repository, click on th Pull-Request tab and open a new PR. You can also do this via command line, documentation [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

After you have opened a PR, set one, or more, of your classmates as the reviewer and also set "Dauphine-Digital-Economics" as a reviewer. Your PR will not be able to merge if you do not get at least 2 approvals.

##### 4. Comment and Review a classmate
If your were set as a reviewer, review their code, leave a comment and approve the PR. If you were not set as a reviewer, navigate to any PR and leave a comment. Indicate in your homework submission where you approved or commented.

Note: After you have create the PR, please send a PM on Discord with your GitHub handle so you can be added as a collaborator of the project. Otherwise, your review will not count towards the branch protection requirement.

##### 5. Connecting frontend to Smart Contracts
The Directory is made from pure HTML, CSS and JS. Today, there are many frameworks which simplify many tasks of web development. This course does not cover frontend development but it is good to have some awareness of how to connect frontends to contract logic. For this exercise, the relevant code is in *index.js*.

Press the "Check MetaMask Balance" button with your Metamask connected. How much Wei does it say you have and is this correct? Give a short reason for your belief. (1 point)

##### Part B - Open Source Licensing (1 + 1 points)
The SPDX is an initiative maintained by the Linux Foundation, write a short paragraph explaining what this initiative is. (1 point)

For the below two scenarios, state which type of license you would use from the [SPDX list](https://spdx.org/licenses/) and a short justification why. (1 point)

1. You are starting a new DeFi project which uses a novel way of rewarding investors who lock their tokens in your staking contract.
2. Google Cloud Web3 is developing an enterprise grade software which allows other companies to build their own custom blockchain. Google would like to open source certain libraries for the community to maintain while keeping the core technology proprietary.

##### Part C - Open Source Community Metrics (1 + 3 points)
Write a short response, around 300 words, which 1) explains what a VM is (1 point) and 2) Compares the communities developing on the EVM vs SVM stack. (3 points)

Check out the [Developer Report](https://www.developerreport.com/) by Electric Capital and list a few metrics presented in class or any that you find interesting. Compare and contrast these metrics and draw a conclusion on the health of these communities.

### Exercise 2 - Solidity programming (3 + 5 + 2 points)

Throughout this course, your code will not only be graded on functionality, but also cleanliness, efficiency and security. Please follow the coding conventions we discussed in class!

Converting a binary number to decimal is rather simple - each digit represents a power of two which either gets added into the total if the digit is 1 or not if the digit is 0. If you do not recall, review Lecture 2, slide 22. In the challenge set, we will use two different ways to do this conversion.

##### Part A - String Conversion (3 points)

Write a function that intakes a **binary** number as a string and returns a **decimal** integer. For the sake of simplicity, let's assume that the string binary input is a positive (unsigned) binary number.

The function should take in a string, split it into an Array, and then evaluate each index for "1" or "0". You may use the strings library if it makes things easier for you.

###### Part B - Masking and Bitwise Operations (5 points)

Masking is an incredibly useful concept that is applied widely in many areas of technology. One of the most common use case is Subnet Masking. To understand subnet masking, we must first understand how IP addresses are assigned. 

Global, or public, IP addresses are location based - Meaning each region gets a fixed number. Usually, your ISP (Internet Service Provider) buys a range of IPs in bulk and assigns to its users. To further assign locally, the ISP can dynamically make available certain addresses or assign a static one for a short period of time. It is easy to region lock content based on the IP address because regions share a common portion of the address.

In order to figure out the region, possibly down to the exact location, we need an easy way to rip out portions of the IP. This is done by subnet masking. The masking is done by zeroing all unnecessary portions of the IP and then bit shifting the result to the correct location.

###### Boolean Algebra

Solidity is able to perform operations on bits. If we think of 1 as true and 0 as false, we can derive the following truth table when comparing two bits (A, B):

* AND (&) - Both A and B have to be true (1) to be true.
* OR (|) - When A is true or B is true, the whole statement is true
* NOT (!) - flips the bit.

A mask uses all zeros except the relevant portion which is a one. If we perform an AND operation on the original binary number and the mask, every bit in the binary number will become 0 except for the relevant portion.

###### A bit shifted mask

For this exercise, we will use a bit-shifted mask to grab each bit. Your function should take in an **uint8** (what implications does this have for your code?) and return an array of integers, that when added together, will give you the number you originally input to the function.

For example, if the input is 13, then the resulting array should be [1,0,4,8].

To see a practical operation, lets say we had the variable x = 13 which is 1101 in binary. We have a mask = 1 or 0001 in binary. What happens when we write 
```
uint x = 13;    //1101 
uint mask = 1;  //0001
uint result = x & mask   //result = ???
```

The result would be 1! this is because:

<img width="132" alt="image" src="https://user-images.githubusercontent.com/121296124/216631408-a71e6153-5d7b-45f0-9a17-a71b67b1af8a.png">

A bit shift means move everything to the left or right by one bit.
```
uint x = 1        //0001
uint y = x << 1   // y = ???
```
Try to put this into a function and run it. You will see the result is 2. This is because we shifted one bit to the left and 0010 is 2 in binary.

###### Putting it all together

Now that you have a way to expose 1 bit at a time and solidity gives you the decimal representation of the result already, all you need to do is shift the mask 1 bit at a time to the left until the end of the binary number. Hint: since the number is restricted to uint8, you only need to shift a set number of times.

##### Part C - RPC with Foundry Cast (1 + 1 points)

Deploy the contract that you wrote for part A onto the Sepolia net with Foundry Cast. Submit a screenshot of the completion message which **shows the contract address** that your contract was deployed to. (1 point)

**Hint: ** If you forgot the deploy command, forge init creates a README which contains the most essential commands. Alternatively, refer to the Foundry documentation.

Find a partner, include his / her name in your submission, and make a Cast call to *their* contract. Take a screenshot of your request and the response that you received. Based on the response, do you believe they have correctly coded their contract? (1 point)