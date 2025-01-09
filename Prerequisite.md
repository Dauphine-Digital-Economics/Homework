# Prerequisite - Class tooling and development environment Setup

Before class starts, please set up the necessary software for the course. The chosen platforms and softwares are common tools for communication, voting and development in the web3 industry.

### Part 1 - Class Tooling

##### Discord

Discord serves as the exchange platform for almost all projects. The first step to evaluating any web3 project is having a measurement of its community. In this course, Discord will be used for announcements and other casual communications outside of formal emails where you will receive feedback and grades. Please join the class Discord [here](https://discord.gg/GHN9VUBvGd).

As a coding focused course, a lot of technical challenges arise in the homework. Do not hesitate to ask for help either privately or on the #help channel.

##### MetaMask Setup

In blockchain, every action is recorded as a transaction. Crypto trades, buying and selling NFTs are common financial use cases but technical actions like deploying a smart contract are also a paid transaction. Therefore, we need to get a wallet to store our tokens, get some test tokens and set up the correct network.

MetaMask is an integrated wallet and a provider, which means we can see our token balances *and* submit smart contract transactions to the chain. A quality of MetaMask is that it is designed to be device first and not user first. This means that for every browser or device you install the MetaMask extension or app, you will receive a new Secret Recovery Phrase and set a new password. Keep the Recovery phrases safe and never share it under any condition to prevent the [loss of funds](https://www.cnbc.com/2017/12/20/man-lost-127-million-worth-of-bitcoins-and-city-wont-let-him-look.html).

After a MetaMask wallet has been installed, experiment with setting up different accounts and networks. We will be using the Sepolia network for this course. Go ahead and enable testnet networks in your MetaMask. For a wallet to interact with a chain, it needs to be able to connect to RPC services. These are servers which runs the communication protocol between user and chain. There are many RPC services out there, but a currently working one is Blast. Configure your Sepolia testnet as shown below:

Once the RPC connection has been setup, it's time to get some tokens. Use [Google's Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia) to get some tokens. Note however, only a small amount, called a "drip", is given out each day to prevent spam bots. Therefore, you have to request tokens over multiple days to get a good amount. In general 0,25 - 0,5 SepoliaETH is enough for this course.


##### Snapshot
Now that we have a working wallet with some tokens, we will set up the voting mechanic used for presentations. Snapshot is an off-chain (aka: no additional gas fee cost when voting) voting mechanism that can allow DAOs and protocol to get a feel of the community sentiment before making an official onchain proposal. We will be using the demo version of this platform to vote on the grade for the weekly presentations. The DAO is set up so that only authors can post proposals. Therefore, if it is your week to present, please send your wallet address to the professor privately over the class Discord. For the rest of the class, when you are voting, please include some comment reasoning for your grade.

Given the anonymous nature of these votes and the dangers of collusion in small communities, the following veto rules are in place:
1. You cannot vote for yourself. If there are more than n-3 amount of votes for any presentation, votes do not count for that presentation.
2. If the general consensus is far from the professor assessment AND there are no comments attached to the vote explaining the grade, votes are vetoed.

For further instructions around weekly presentations, please refer to the Presentations repository.

To start, please join and bookmark the DAO [here](https://testnet.v1.snapshot.box/#/dauphine-solidity.eth/). To join and vote, you must have a MetaMask wallet because all activities are signed with your wallet's public key. You will see there is a proposal already up asking about your sentiment towards this course. **One bonus point will be added to your homework 1 for participating in this preliminary proposal.** Once you have voted, please privately let the professor know your wallet address.

### Part 2 - Development Environment Setup

##### VSCode IDE Installation

The IDE we will be using in this course is [VSCode](https://code.visualstudio.com/Download). It is a lightweight version of the popular Microsoft Visual Studio software. Web3 favours VSCode as the IDE of choice and therefore, many custom extensions have been developed specifically for web3 development.

One such extension is the Solidity Syntax Highlighter. A syntax hightlighter is what gives code colour and makes logic blocks visually distinguishable. Without going into too many details, all programming languages are created with the CPU instruction set structure and coding practices in mind. Therefore, good syntax highlighters help you clearly see variables, functions and other logical building blocks in your code. Please click on the Marketplace tab after installing VSCode and search for the **Solidity + Yul Semantic Syntax** extension and install it in your VSCode.

<img width="702" alt="Syntax Highlighter" src="https://github.com/Dauphine-Digital-Economics/Homework/assets/121296124/6b669d61-2896-4b5a-9aa6-627e8628f89f">


##### Github online and local setup

Github is a cloud hosting platform for Git repositories. **Git** is the actual technology powering open source through version control and contribution techniques. There are other enterprise solutions to Git outside of Github like Gitlab, SVN, Bitbucket and more. These solutions tend to add in enterprise features such as deployment pipelines and project management features. Ever since Github was acquired by Microsoft in 2018, Github has also gained many new enterprise features as well as a gamification aspect with badges.

##### Git - Online setup

At the start of the course, it is totally possible to use Github solely through their online interface. If you have not yet, create your own Github account and then star the [class repository](https://github.com/Dauphine-Digital-Economics) in order to receive updates directly in your email. The updates are sent to the email you registered your account with so please sign up using your Dauphine email.

As time goes on and your projects become more complex, you will need to move Git capabilities to your local machine. This can be achieved either through a chosen IDE, for example VSCode has integrated [Github extensions](https://code.visualstudio.com/docs/sourcecontrol/github), which you may use to push your code.

Alternatively, you can go completely old school and use the command line interface (CLI). This course encourages CLI usage because having a terminal is ubiquitous on every machine, and the demos shown in class are guaranteed to be reproducible on any student's laptop regardless of OS. Additionally, some homeworks may require the use of the CLI.

##### Git - Local setup and CLI commands

The most fundamental commands any Github user needs to master is:
1. Install Git on your local machine
2. Connect your local machine to Github
3. Clone a repository from online to your local machine
4. Add and commit the changes locally
5. Finally, push the changes you made locally back up into the cloud for public consumption

These commands are the basics for when you are working alone. Once collaboration starts, branching, pull requests and resolving merge conflicts becomes important and will be covered in a later homework.

**Note for Windows users:** Powershell is strenuous to master. Mac and other Linux based users can simply open a terminal and type in [well documented and standardized](https://man7.org/linux/man-pages/dir_section_1.html) Linux commands, but Windows users have to learn a whole different set of commands and argument inputs. This is an argument of why privatization is restrictive as compared to open standards. For Windows users, **please [download](https://learn.microsoft.com/en-us/windows/wsl/install) WSL**. This simulates a Linux kernel inside of your Powershell and allows you to use the same commands as shown above. After a successful installation try to type in wsl into the Powershell and you should see something like this:  

<img width="241" alt="Screenshot_20230129_101643" src="https://user-images.githubusercontent.com/121296124/215317162-35e88f8d-c281-4be7-a310-1297d866bfcc.png">

After you have done the setup, note that the blue section is your original system but the green section is where this simulated Linux environment is running. The point at which this environment is being added onto the normal Windows system is called the mounting point and denoted by "mnt".

###### 1. Install Git

[Install](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) Git on your computer to start using its functionalities. Windows users, do this after you are inside the WSL environment so you can install with Linux commands.

###### 2. Connect your local machine to Github

Originally, this setup could be completely skipped because it was done over https. Given the numerous insecurities surrounding https, Github has now moved onto SSH connections. You can still pull stuff down from online to local machine via https but pushing things upstream (a fancy way of saying publishing your work online), is no longer supported via https. Therefore we need to:
1. Generate a local SSH public and private key pair
2. Paste the public key into Github settings so Github can verify the connection requests from your machine (This is similar to public key signings in a wallet)

In order to do this, please follow [this](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) guide.

###### 3. Clone a respository from online to your local machine

The act of copying repositories from Github online to your local machine is called cloning. To do this, first setup a folder somewhere on your laptop (for easy access, I suggest your Desktop). Then head over to your Github account and click into the "Homework" repository. Once you are in the repository, locate the green code button on the top right, click on it, and choose the SSH tab. Click the button on the right of the generate line to copy the entire line.

<img width="340" alt="Screenshot_20230129_104229" src="https://user-images.githubusercontent.com/121296124/215318353-e9ce33e8-f88c-42a4-b30c-5a67b86296e2.png">

Now open the terminal, or Powershell plus wsl command, and navigate to the folder you created. To navigate, use the command "cd" + path name. On my machine, I created a folder called "Dauphine Digital Economics" on the Desktop so my "cd" command looks like:
```
cd Desktop/Dauphine\ Digital\ Economics/
```
Confirm that you are in the correct folder by checking if the path is now incorporated into your displayed path

<img width="497" alt="Screenshot_20230129_104607" src="https://user-images.githubusercontent.com/121296124/215318343-c6c130b8-041f-4bd9-8686-b11c9ea110ea.png">

Now that you are in the correct folder, type "git clone " and then paste in what you copied from the online Github repository. It should follow this format
```
git clone git@github.com:[account name]/[respository name].git
```
Now confirm that the clone has been successful by typing "ls" into the CLI. Your repository should now be listed. Alternatively, you can click on the folder you made and check if the project is now in there visually.

###### 4. Add, Commit, Push

Whenever you have made a block of changes and feel like you have reached a logic point of changes locally, use "git add ." to stage those changes. Staging means your changes are temporarily saved. Once you feel like your work is of a publishable quality you can commit your code. A commit packs all the adds that have been staged and compiles them into a hash and timestamp. Finally call "git push" to upload your work online. The work flow would look approximately like:
```
git add .
git commit -m "write a message telling people what this commit is about"
git push
```

##### Foundry Toolchain
Finally, we come to the software that enables blockchain development itself - the Foundry Toolchain. Bookmark the [Foundry Book](https://book.getfoundry.sh/), it contains all commands to enable the full software development lifecycle.

What is a Toolchain? It is a term used to collectively describe all software used to deploy code. The Foundry toolchain consists of:
1. **Forge** - The compiler. The heart of code processing. It compiles the code to Bytecode, enables testing and deploys the completed smart contract to a target chain. You will spent most of your time interacting with Forge.
2. **Anvil** - A local simulation of a fullnode so there is no need to deploy to Sepolia testnet constantly.
3. **Cast** - A command line tool to get information about the chain.
4. **Chisel** - A solidity REPL. You will not be using this as we will not code directly in the command line.

## That's all! Have a great semester!
