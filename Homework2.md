# Homework 2

This week focuses on more advanced Solidity coding, covering fallback function vulnerabilities and upgradable contracts.

### Exercise 1 - Function Encoding (1,5 + 0,5 points)
From the example on slide 10 and 11 of Lecture 3, what would be the output for the second example (HelloWorld(uint[], bool))?

You can calculate the function selector with the provided algorithm on slide 11. For the memory location, you can make it up but remember to observe left and right zero padding for all inputs. (1,5 points)

What would the encodePacked function call give you? (0,5 points)

### Exercise 2 - An upgradeable Coinflip (5 + 5 + 2 points)

##### Part A - Designing the coin flip game (5 points)

Coin flips have traditionally been the first game of choice for many protocols. It is a simple guessing game with only two outcomes - heads or tails, usually represented by 1 or 0. For our game, we are putting a new spin on it - players must guess ten flips and win if they guess ALL 10 correctly. The users will input 10 guesses and our contract will randomly generate 10 flips and if they match, the player wins.

In Solidity, there was no true randomness until the creation of [Verifiably Random Functions (VRFs)](https://chain.link/education-hub/verifiable-random-function-vrf). This requires off chain computation so we will be using a simple algorithm for the time being.

For this exercise, a skeleton has been provided to help you get warmed up. Please follow the below steps:
1. Fork the [Coinflip repository](https://github.com/Dauphine-Digital-Economics/Coinflip) to your own Github account.
1. Navigate to your instance of Coinflip and clone it to your local machine. Open it with VSCode.
1. Where you see a TODO, you must replace with the correct code.
1. Once you have filled in the contract completely, test it by running:
```
forge test
```
  * Hint: Adding verbosity of the test output can help you debug. Simply add the -vvv flag after the command. 

Note:  Once all of your tests are passing, push your code into your own Github. Make sure the repository is accessible for grading.

##### Part B - Upgradeable Proxy Models (5 + 2 points)
##### Upgrading the game (5 points)

Contracts require upgrades for different reasons - one of which can be updating the mechanism of a function. For our upgrade, we will be using the UUPS model. Refer to lecture 3 if you have forgotten the architecture.

You will be responsible for writing the full suite of smart contracts, guided by the following instructions:
1. For the Upgradable-Coinflip repo and clone it to your local machine.
1. Delete the script folder as we will not use it
1. Open the test folder, delete the Counters test and replace it with the provided test file.
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
    - Go to the Contracts Wizard and select the "Custom" tab. On the left, select ownable under access control and UUPS under upgradability. The wizard will then generate some code.
    - Take the code that the wizard generated and integrate it into both of the V1 and V2 Coinflip contracts. This means add in the import statements, make sure your coinflip contracts are inheriting the necessary security parent contracts and their additional functions.
    - Since there are some new import statements, remember to install the dependencies with *forge install*.

        **Note** - You will notice here that the Wizard provides a constructor with a *disableInitializers()* function and created an *initialize()* function. The reasoning is explained [here](https://docs.openzeppelin.com/upgrades-plugins/1.x/proxies#the-constructor-caveat). You must move the original constructor into the *initialize()* function and use the Wizard's constructor. Also take note how the contract owner is handled.
1. Run **forge test** and 2 out of 3 tests should pass.
1. All that is left is to change the *seedRotation()* function.
    - The function takes in a NewSeed, along with a uint to represent the number of rotations
    - Now to add in the rotational logic, imagine that the end and the beginning are connected. If we rotate the string once, the first character will become the last character. 
         
    - If you have correctly implemented the rotational logic, all 3 tests should pass.

##### Part C - Upgrade mechanism (2 points)
There are other types of contract mechanisms besides the 2 presented in class. Chose a more different mechanism, briefly describe how it works and how it compares to the transparent and UUPS models.

### Exercise 3 - Solidity Scripting (3 + 3 points)
##### Part A - Token creation (3 points)

Copy the upgradeable coinflip project into another new project and call it Coinflip-Reward.

Your coinflip game is now paying out a reward - ERC20 Dauphine tokens with the symbol (DAU). Go ahead and create this token (remember this takes less than 30s if you get the inputs correct). And then add to both your V1 and V2 contracts a function which mints and transfers 5 dauphine tokens every time a user wins to their given wallet address. Call this the RewardUser function. The RewardUser function should be called in the UserInput function when the user guesses correctly and wins. What new parameters do UserInput need for this additional feature?

It would be useful to do some thinking on how the token contract is deployed, who the owner of the token contract is and how to access the contract to call its functions. The two choices of deployment are:
1. Have foundry deploy it with a certain wallet address
2. Have your coinflip smart contract deploy it, in which case the deployer and owner is the smart contract address.

One of these options will be easier to work with.

##### Part B - Simulating  (3 points)

Write a script which runs through the following scenario:
1. A user plays on V1 and wins once (show in logs he has 5 dauphine tokens)
2. Upgrade to v2. Check tests to get an idea how to do this.
3. User plays on V2 and wins again (show now he has 10 dauphine tokens)
4. User transfers some dauphine tokens to their friend, another wallet address on anvil. (show the balances of both wallet addresses).

To keep things simple, you can hardcode the getFlips() function to return something predictable so you can always win. You may also remove the onlyOwner constraint on the mint function of your ERC20 token unless you really want to dive deep into delegatecall.

There is no need to deploy on chain. Simulate the users and transactions through Anvil.
