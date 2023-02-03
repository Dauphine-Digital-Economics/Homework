# Homework 2

This week focuses on solidity coding and laying the foundations of a simple dApp. These exercises familiarizes you with solidity concepts and gas costs should not be taken into consideration.

### Challenge Set 1 - Binary to Decimal Converter

Converting a binary number to decimal is rather simple - each digit represents a power of two which either gets added into the total if the digit is 1 or not if the digit is 0. If you do recall, review Lecture 3, slide 6. In the challenge set, we will use two different ways to do this conversion.

##### Exercise 1 - String Conversion

Write a function that intakes a binary number as a string and returns a decimal integer. For the sake of simplicity, let's assume that the string binary input is a positive (unsigned) binary number.

The function should take in a string, split it into an Array, and then evaluate each index for "1" or "0". You may use the strings library if it makes things easier for you.

###### Exercise 2 - Masking and Bitwise Operations

Masking is an incredibly useful concept that is applied widely in many areas of technology. One of the most common use is [Subnet Masking](https://avinetworks.com/glossary/subnet-mask/). This is how IP addresses are assigned globally. For this exercise, we will use a bit-shifted mask to grab each bit. Your function should take in an uint8 and return an array of integers, that when added together, will give you the number you originally input to the function.

For example, if the input is 13, then the resulting array should be [1,0,4,12].

###### Boolean Algebra

Solidity is able to perform operations on bits. If we think of 1 as true and 0 as false, we can derive the following truth table when comparing two bits (A, B):

AND (&) - Both A and B have to true (1) to be true.
OR (|) - When A is true or B is true, the whole statement is true
NOT (!) - flips the bit.

A mask uses all zeros except the relevant portion which is a one. If we perform an AND operation on the original binary number and the mask, every bit in the binary number will become 0 except for the relevant portion.

###### A bit shifted mask

To see a pratical operation, lets say we had the variable x = 13 which is 1101 in binary. We have a mask = 1 or 0001 in binary. What happens when we write 
```
uint x = 13;    //1101 
uint mask = 1;  //0001
uint result = x & mask   //result = ???
````

The result would be 1! this is because:

<img width="132" alt="image" src="https://user-images.githubusercontent.com/121296124/216631408-a71e6153-5d7b-45f0-9a17-a71b67b1af8a.png">

A bit shift means move everthing to the left or right by one bit.
```
uint x = 1        //0001
uint y = x << 1   // y = ???
```
Try to put this into a function and run it. You will see the result is 2. This is because we shifted one bit to the left and 0010 is 2 in binary.

###### Putting it all together

Now that you have a way to expose 1 bit at a time and solidity gives you the decimal representation of the result already, all you need to do is shift the mask 1 bit at a time to the left until the end of the binary number, since the input is uint8, you have to shift 8 times. During each loop iteration, add the number onto the array that you will return at the end.

### Challenge Set 2 - A simple game dApp

We are going to create a gambling game which has a game engine that uses the concept of random numbers and Bitwise Operations as the core and a contract which interacts with the front end. Don't worry these contracts will only have 1 function each.

##### The smart contracts

For our first contract, start a file called "Engine.sol". Inside this contract we will have 1 function which takes two uint numbers and performs a bitwise operation on these numbers. It can simply be a AND operation like the mask in the previous challenge or you can make it a bit fancy (NOT, XOR, OR).

For the second contract, let's call it "Game.sol". It should inherit from Engine. It will have one function which takes in the user input, generate two random numbers (use [this](https://www.geeksforgeeks.org/random-number-generator-in-solidity-using-keccak256/) method), calls the function you wrote in the first contract, compare the function result and user input and finally return a boolean - true if the user guessed correct and false if the user guess wrong.

##### The front end
Since this is not a web development development course, it is enough to create a button element that, when pressed, pops up a notification of if the user guessed correctly or not. Hint: use alert(); for simple notifications. However, if you would like to to give your website a web3 game feel, you are free to add any additional visual elements. The important thing is that you are able to connect the front end to the smart contract.
