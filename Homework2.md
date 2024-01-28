# Homework 2

This week focuses on more advanced Solidity coding, covering fallback function vulnerabilities and upgradable contracts.

### Exercise 1 - Ethernaut fallback challenge (5 points)
As discussed in class, fallback and receive functions are helpful to catch unexpected behaviour. However, these functions can also be exploited (depending on how they are coded) to forcefully take control of the control. Complete challenge 1 on the [Ethernaut website](https://ethernaut.openzeppelin.com/).

A reminder in case you do not remember the demonstration in class, Ethernaut deploys an instance of the contract they show you and in this case, you have take ownership of the contract and drain it. Once you have drained the contract, you can submit the instance and it will let you know if it was successful.

How you interact with the deployed instance is completely up to you. You may write a script, use Cast in the command line, or perform the RPCs directly in the web console of your browser.

For this exercise, please submit your script, command line calls or a screenshot of web console.

### Exercise 2 - A coinflip game and its upgrade (7 + 7 + 1 points)
##### Part A - Designing the coin flip game (7 points)

Coin flips have traditionally been the first game of choice for many protocols. It is a simple guessing game with only two outcomes - heads or tails, usually represented by 1 or 0. For our game, we are putting a new spin on it - players must guess ten flips and win if they guess ALL 10 correctly. The users will input 10 guess and our contract will randomly generate 10 flips and if they match, the player wins.

In Solidity, there was no true randomness until the creation of [Verifiably Random Functions (VRFs)](https://chain.link/education-hub/verifiable-random-function-vrf). This requires off chain computation so we will be using a simple algorithm for the time being.

For this exercise, a skeleton has been provided to help you get warmed up. Please follow the following steps:
1. Fork the [Coinflip repository](https://github.com/Dauphine-Digital-Economics/Coinflip) to your own Github account.
1. Navigate to your instance of Coinflip and clone it to your local machine. Open it with VSCode.
1. Where you see a TODO, you must fill in the correct code.
1. Once you have filled in the contract completely, test it by running:
```
forge test
```
1. Once all of your tests are passing, push your code into your own Github.
1. Submit the Github link to the professor via email. Make sure the repository is public and accessible.

##### Part B - Upgradeable Proxy Models
##### Upgrading the game (7 points)

Contracts require upgrades for different reasons - one of which can be updating the mechanism of a function. For our upgrade, we will be using the UUPS model. Refer to lecture 3 if you have forgotten the architecture.

You will be resposible for writing the full suite of smart contracts, guided by the following instructions:
1. Create a new repository on your github account called Upgradeable-Coinflip and clone the empty repository to your local machine.
1. Open yout command line / terminal (windows users remember wsl), and navigate to your local clone and initialize a new forge project with
```
forge init --no-git
```
1. Delete the script folder as we will not use it
1. Open the test folder, delete the Counters test and replace it with the provided [test file](https://github.com/Dauphine-Digital-Economics/Upgradable-Coinflip/blob/main/CoinflipUpgrade.t.sol).
1. In your src folder, we will have 3 files:
    - **Coinflip.sol** - V1 of the coinflip
    - **CoinflipV2.sol** - V2 of the coinflip with an updated seedRotation function
    - **Proxy.sol** - The UUPS proxy

      **Note** - please ensure that you name the files exactly as given or you have to change the import statements in the given test file.
1. For Proxy.sol, simply paste in the given code from openzeppelin
```
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract UUPSProxy is ERC1967Proxy {
    constructor(address _implementation, bytes memory _data)
        ERC1967Proxy(_implementation, _data)
    {}
}
```
1. For Coinflip.sol, paste in your solution for the previous exercise.
1. For CoinflipV2.sol, we will be changing the *seedRotation()* function but for now, just copy your solution once again into CoinflipV2 as well.
1. If you recall, the UUPS model requires all implementation contracts to adhere to certain standards in order for them to safely handle the upgrade logic. Thankfully, we can just grab this logic from Openzeppelin's contract wizard.
    - Go to the [Contracts Wizard](https://docs.openzeppelin.com/contracts/5.x/wizard).
    - Select "Custom" for the type of contract and under settings, select ownable under access control and UUPS under upgradability. The wizard will then generate some code.
    - Take the code that the wizard generated and integrate it into both of the V1 and V2 Coinflip contracts. This means add in the import statements, make sure your coinflip contracts are inheriting the necessary security parent contracts and add in the additional functions.

        **Note** - You will notice here that the Wizard provides a constructor with a *disableInitializers()* function and created an *initialize()* function. The reasoning is explained [here](https://docs.openzeppelin.com/upgrades-plugins/1.x/proxies#the-constructor-caveat). You must move the original constructor into the *initialize()* function and use the Wizard's constructor.
1. Run **forge test** and 2 out of 3 tests should pass.
1. All that is left is to change the *seedRotation()* function.
    - Accept the owner's NewSeed input and check if the character length is 10 or more like before.
    - Now add in a rotational logic. Imagine that the end and the beginning are connected. If we rotate the string once, the last character will become the first character. For the rotation logic, rotate the NewSeed 5 times and return the result.
    - If you have correctly implemented the rotational logic, all 3 tests should pass.

##### Proxy Comparison (1 point)
Once you have completed your Upgradeable game, please create a README.md file and in a few sentences, explain the difference between the Transparent Proxy Model and UUPS Proxy Model.