# Homework 1 - Open Source and Solidity fundamentals

Deadline for submission: 25 January 2026, 23:59.
Submission type: Individual
Remarks: Try to limit the use of AI in this foundational homework. Excessive reliance on AI at this stage would limit the acquisition of coding skills for later projects that are more complex.  

### Exercise 1 - Open Source Communities (2 + 1 points)

The [class directory](https://dauphine-digital-economics.github.io/Class-Directory/) is a demonstration of a simply constructed front end that is visual enough to showcase our work as  developers. You will update the Class Directory with your own information and act as a reviewer for your classmates. (2 points)

##### 1. Fork the class website into your own Github account

To prevent clashing code edits, the first thing you must do is fork the class-directory repository into your individual private accounts. You can do this very easily by being logged into your personal account then pressing the fork button in the class directory repo. Now you can start working on the homework in your own repository. For more information on forks, see [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo).  

**Note:** The main branch is protected against accidental changes. There are many ways to protect a branch, see [here](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository) if you are interested.

##### 2. Navigate to your card and update it

Now that you are in your own repository, you can edit it directly online or clone it to your local machine. Cloning it locally is preferred for easy testing and verification that your changes are correct. Once you have a local folder, try clicking on the index.html file and your default browser will load the page. Under the "Meet the Class" section, you can hover over the cards and find your name.

While Cyberpunk NFTs are cool, we would like to showcase you. Therefore, please add a high quality picture of yourself into the img folder and then change the relevant <img> tag to display your image. Check that your name is spelled correctly, add a description of who you are and finally, make the button point to your own Linkedin profile.

**Note:** In the spirit of cyber anonymity, if you are uncomfortable displaying your personal information (name, picture, Linkedin), you are welcome to use any picture, alias, URL you see fit.


##### 3. Open a Pull Request(PR)
Open a pull request by navigating to the Class-Directory repository, click on the Pull-Request tab and open a new PR. You can also do this via command line, documentation [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

After you have opened a PR, set one, or more, of your classmates as the reviewer and also set "Dauphine-Digital-Economics" as a reviewer. Your PR will not be able to merge if you do not get at least 2 approvals.

##### 4. Comment and Review a classmate
If your were set as a reviewer, review their code, leave a comment and approve the PR. If you were never set as a reviewer, navigate to any PR and leave a comment. Indicate in your homework submission where you approved or commented.

Note: After you have create the PR, please send a PM on Discord with your GitHub handle so you can be added as a collaborator of the project. Otherwise, your review will not count towards the branch protection requirement.

##### 5. Connecting frontend to Smart Contracts
The Directory is made from pure HTML, CSS and JS. Today, there are many frameworks which simplify many tasks of web development. This course does not cover frontend development but it is good to have some awareness of how to connect frontends to contract logic. For this exercise, the relevant code is in *index.js*.

Press the "Check MetaMask Balance" button with your Metamask connected. How much Wei does it say you have and is this correct? Give a short reason for your belief. (1 point)

### Exercise 2 - Solidity programming (3 + 4 points)
##### Part A - SHA cryptography

Public Key Cryptography (PKC), or asymmetric cryptography, is the core of enabling the Web3 tenet of radical transparency through anonymity - identity is hidden behind wallet addresses while details of any transaction is publicly viewable. Blockchains verify the origin of transactions to a wallet address through PKC. This exercise will walk you through the process by which transactions are signed and verified.

Clone, or open in Remix, the contract file "RSA.sol". RSA is a well established method which uses prime numbers to encrypt and decrypt messages. By modern standards, RSA has become somewhat insecure and newer standards, such as ECDSA, are preferred. However, it is sufficient for illustrative purposes.

Raw transactions, a simple wallet operation or full smart contracts, are data structures created by the EVM. These transactions are first hashed into a compact format, or message digest, before signing. In the first function "hash", we will employ a simple hashing algorithm - add the decimal encoding of each character of the input data together and apply a modulo to it. Use the provided "MOD" variable to modulate the sum.

Next we will sign the transaction using our *private* key. The RSA algorithm is:
```
// e = encryption prime
// n = modulo
signed = (raw^e) % n;
```
A "signed transaction", by blockchain definition, consists of this signed hash, the users *public* key, and hashed transaction or digest. In order for a node in the network to verify that the transaction was indeed submitted by a certain address, the following decryption algorithm is applied:

```
// d = decryption prime
// n = modulo
digest = (signed^d) % n;
```
All that remains is to compare if the decrypted result is the same as the digest. Follow the comments in the .sol file to implement this workflow. (2 points).

Next, briefly understand how Github uses RSA and SSH to verify the identity of your local computer. You will notice that there is a difference in how public and private keys are used. Briefly explain the difference and under which circumstance each method is appropriate. (1 point)

###### Part B - Masking and Bitwise Operations (4 points)

**Note:** Use "IP.sol" for this exercise. Do not change the given code. You only need to modify the IP function. While the exercise looks long, the function can be completed in ~40 lines of code. Most of which is copy/pasted. The key lies in the bit-shift calculations.

Masking is an incredibly useful concept that is applied widely in many areas of technology. One of the most common use case is Subnet Masking, used to locate every device connected to the internet. 

Global, or public, IP addresses are location based - Meaning each region gets a fixed number. Usually, your ISP (Internet Service Provider) buys a range of IPs in bulk and assigns to its users. To further assign locally, the ISP can dynamically make available certain addresses or assign a static one for a short period of time. It is easy to region lock content on the internet based on the IP address because regions share a common portion of the address.

In order to figure out the region, possibly down to the exact location, we need an easy way to rip out portions of the IP. This is done by subnet masking. The masking is done by zeroing all unnecessary portions of the IP and then bit shifting the result to the correct location.

###### Boolean Algebra

Solidity is able to perform operations on bits. If we think of 1 as true and 0 as false, we can derive the following truth table when comparing two bits (A, B):

* AND (&) - Both A and B have to be true (1) to be true.
* OR (|) - When A is true or B is true, the whole statement is true
* NOT (!) - flips the bit.

A mask uses all zeros except the relevant portion which is a one. If we perform an AND operation on the original binary number and the mask, every bit in the binary number will become 0 except for the relevant portion.

To see a practical operation, lets say we had the variable x = 13 which is 1101 in binary. We have a mask = 1 or 0001 in binary. What happens when we write 
```
uint x = 13;    //1101 
uint mask = 1;  //0001
uint result = x & mask;   //result = ???
```

The result would be 1! This is because:

<img width="132" alt="image" src="https://user-images.githubusercontent.com/121296124/216631408-a71e6153-5d7b-45f0-9a17-a71b67b1af8a.png">

In this example, we have "grabbed" the last bit of the 1101, which is 1.

###### IP address structure
IP addresses are structured into four segments of 8 bits, for a total of 32 bits. Take for example, the static localhost of every computer is 127.0.0.1, translated into binary would be:
127 -> 01111111
0 -> 00000000
0 -> 00000000
1 -> 00000001

The function input for the above IP would therefore be "01111111000000000000000000000001".

In our example, we will assume that the first 8 bits represent the country, the next 8 bits represent the ISP, the following 8 bits the institution, and final 8 bits the device type.

###### A bit shifted mask
A mask can be created to grab 8 bits at a time. Imagine that we want to grab the last 8 bits to decode the device, what would the mask look like? The example provided in the [Boolean Algebra](#boolean-algebra) section shows the last 1 bit being grabbed.

Now to grab the other 8-bit sections, we have to shift the mask. A bit shift means move everything to the left or right by a certain number of bits, with the space that was vacated filled by zeros. The below shows an example of a single left shift.
```
uint x = 1;        //0001
uint y = x << 1;   // y = ???
```
Try to put this into a function and run it. You will see the result is 2. This is because we shifted one bit to the left, and the "left behind" space got filled by a zero. 0010 is 2 in binary.

**Hint for this section:** The mask will always have eight "1"s and the rest "0"s. Think about what the mask looks like from binary to decimal and then create the mask as a uint.

###### Putting it all together

Now that you are able to grab the four sections of the IP address, grab each section separately and read their value and corresponding information on the mapping. Note here, since your input is a single number with 32 bits, after applying the mask, you will get the relevant section and a lot of zeros. Find a way to trim off all the unnecessary zeros, so that Solidity can interpret only the necessary section as the correct integer.

Below shows a successful implementation.

A user input of "11000100001011110101100101111100", should give:
Country -> 11000100 -> 196 -> Singapore
ISP -> 00101111 -> 47 -> Telkom
Institute -> 01011001 -> 89 -> University
Device -> 01111100 -> 124 -> Windows

Take a screenshot of a similar result. You may also use your own inputs. (4 points)


##### Exercise 3 - Blockchain Networking (10 points)

Based on the observations you noted down during the game simulation, write a reflection on the various network topologies and consensus mechanisms. Address the following points in your reflection:
1. Describe the kind of nodes in this network? Were all your peers honest and reliable? What information did you use to arrive at this conclusion?
2. Describe the different network topologies and consensus mechanisms simulated in class. Were there any similarities to how real blockchains operate?
3. Conclude with some key parameters and their impact on the performance of Blockchain networks and efficiency in reaching consensus. If you were a consultant to a blockchain protocol, which initial questions would you ask to base your recommendations of network and consensus mechanism on? **Note:** as the conclusion, the parameters and questions should be based on personal observations made during the class simulation and not generic statements.

There is no maximum length for the reflection but please respect a minimum of 500 words. Please include a formatted bibliography in any citation style.