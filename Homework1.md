# Homework 1 - Git and Solidity fundamentals

### Excerise 1 - Update class directory using Github pull request (5 points)

The [class directory](https://dauphine-digital-economics.github.io/Class-Directory/) is a demonstration of a simply constructed front end that is visual enough to showcase our work and be an easy reference or presentation. It is made from pure HTML, CSS and JS. Today, there are many frameworks which simplify many tasks of web development. If you would like to dive deeper into web development, it is better to start with an in-demand framework such as [React](https://reactjs.org/) or [Flutter](https://flutter.dev/) for mobile-first development.

This course does not cover frontend development but it is good to have some awareness of how to connect frontends to contract logic. Take a look at the JS to see how it is done.

The aim of this exercise is to familarize you with open source collaboration methodology. In Web3 innovation, time is of the essence. If you wait for documentation to be relesed, someone who can read code has already started building the use case. Furthermore, most discussions, bugs an issues are raised on Github directly. For this exercise, you will be updating the class directory through a PR.

##### 1. Fork the class website into your own Github account

To prevent clashing code edits, the first thing you must do is fork the class-directory repository into your individual private accounts. You can do this very easily by being logged into your personal account then pressing the fork button on the class directory. Now you can start working on the homework in your own repository. For more information on forks, see [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo).  

The main branch will be protected against accidents by being locked for the duration of the week. There are many ways to protect a branch, see [here](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository) if you are interested.

##### 2. Navigate to your card and update it

Now that you are in your own repository, you can edit it directly online or clone it to your local machine. Cloning it locally is preferred for easy tsting. Once you have a local folder, try clicking on the index.html file and your default browser will load the page. Under the "Meet the Class" section, you can hover over the cards and find your name.

While Cyberpunk NFTs are cool, we would like to showcase you. Therefore, please add a high quality picture of yourself into the img folder and then change the relevant <img> tag to display your image. The images are loaded in a Bootstrap 4 [Grid system](https://getbootstrap.com/docs/4.4/layout/grid/), which gives it a lot of auto resizing capabilities. Check that your name is spelled correctly, add a description of who you are and finally, modify the link on the button to point to your own Linkedin profile.

**Note:** In the spirit of cyber anonymity, if you are uncomfortable displaying your personal information (name, picture, Linkedin), you are welcome to use any picture or alias you see fit.


##### 3. Open a Pull Request(PR)
Open a pull request by navigating to the Class-Directory repository, click on th Pull-Request tab and open a new PR. You can also do this via command line, documentation [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

After you have opened a PR, set one, or more, of your classmates as the reviewer and also set "Dauphine-Digital-Economics" as a reviewer. Your PR will not be able to merged if you do not get at least 1 approval from a classmate.

##### 4. Comment and Review a classmate
If your were set as a reviewer, review their code, leave a comment and approve the PR. If you were not set as a reviewer, navigate to any PR and leave a comment.

### Exercise 2 - Binary to Decimal Converter

Converting a binary number to decimal is rather simple - each digit represents a power of two which either gets added into the total if the digit is 1 or not if the digit is 0. If you do not recall, review Lecture 2, slide 6. In the challenge set, we will use two different ways to do this conversion.

##### Part A - String Conversion (5 points)

Write a function that intakes a **binary** number as a string and returns a **decimal** integer. For the sake of simplicity, let's assume that the string binary input is a positive (unsigned) binary number.

The function should take in a string, split it into an Array, and then evaluate each index for "1" or "0". You may use the strings library if it makes things easier for you.

###### Part B - Masking and Bitwise Operations (10 points)

Masking is an incredibly useful concept that is applied widely in many areas of technology. One of the most common use case is Subnet Masking. To understand subnet masking, we must first understand how IP addresses are assigned. 

Global, or public, IP addresses are location based - Meaning each region gets a fixed number. Usually, your ISP (Internet Service Provider) buys a range of IPs in bulk and assigns to its users. To further assign locally, the ISP can dynamically make availble certain addresses or assign a static one for a short period of time. It is easy to region lock content based on the IP address because regions share a common portion of the address.

In order to figure out the region, possibly down to the exact location, we need an easy way to rip out portions of the IP. This is done by subnet masking. The masking is done by zeroing all unnnecassry portions of the ip and then bit shifting the result to the correct location.

###### Boolean Algebra

Solidity is able to perform operations on bits. If we think of 1 as true and 0 as false, we can derive the following truth table when comparing two bits (A, B):

* AND (&) - Both A and B have to be true (1) to be true.
* OR (|) - When A is true or B is true, the whole statement is true
* NOT (!) - flips the bit.

A mask uses all zeros except the relevant portion which is a one. If we perform an AND operation on the original binary number and the mask, every bit in the binary number will become 0 except for the relevant portion.

###### A bit shifted mask

For this exercise, we will use a bit-shifted mask to grab each bit. Your function should take in an **uint8** (what implications does this have for your code?) and return an array of integers, that when added together, will give you the number you originally input to the function.

For example, if the input is 13, then the resulting array should be [1,0,4,8].

To see a pratical operation, lets say we had the variable x = 13 which is 1101 in binary. We have a mask = 1 or 0001 in binary. What happens when we write 
```
uint x = 13;    //1101 
uint mask = 1;  //0001
uint result = x & mask   //result = ???
```

The result would be 1! this is because:

<img width="132" alt="image" src="https://user-images.githubusercontent.com/121296124/216631408-a71e6153-5d7b-45f0-9a17-a71b67b1af8a.png">

A bit shift means move everthing to the left or right by one bit.
```
uint x = 1        //0001
uint y = x << 1   // y = ???
```
Try to put this into a function and run it. You will see the result is 2. This is because we shifted one bit to the left and 0010 is 2 in binary.

###### Putting it all together

Now that you have a way to expose 1 bit at a time and solidity gives you the decimal representation of the result already, all you need to do is shift the mask 1 bit at a time to the left until the end of the binary number. Hint: since the number is restricted to uint8, you only need to shift a set number of times.