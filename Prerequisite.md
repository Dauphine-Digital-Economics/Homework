# Prerequisite - Class tooling and development environment Setup

Before class starts, please set up the necessary software for the course. The chosen platforms and softwares are common tools for communication, voting and software development in the web3 industry.

### Part 1 - The necessary tools

##### Discord

In this course, Discord will be used for announcements and other casual communications outside of formal emails where you will receive feedback and grades. Please join the class Discord [here](https://discord.gg/GHN9VUBvGd).

As a coding focused course, a lot of technical challenges arise in the homework. Do not hesitate to ask for help either privately or on the #help channel.

##### MetaMask Setup

In blockchain networks, every action, from trading to voting, is executed via a signed transaction. Therefore, we need to get a wallet which allows us to connect to the target network and interact with others.

MetaMask is an integrated wallet and a provider, which means we can see our token balances (acts as a wallet) *and* submit transactions to the blockchain (provides access to different networks). Download it onto your most used web browser by going to the extension manager of the browser. Keep the Recovery phrases safe and never share it under any circumstance to prevent the [loss of funds](https://www.cnbc.com/2017/12/20/man-lost-127-million-worth-of-bitcoins-and-city-wont-let-him-look.html).

After a MetaMask wallet has been installed, experiment with setting up different accounts and networks. We will be using the Sepolia network for this course. Make sure you select this network in the dropdown. If it does not appear, manually enable test networks in the settings.

<img width="286" height="124" alt="Metamask Sepolia" src="https://github.com/user-attachments/assets/29aa39c3-2700-414e-9c8b-68cf6e8518e3"/>

Next, use [Google's Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia) to get some tokens. Note however, only a small amount, called a "drip", is given out each day to prevent spam bots. Therefore, you have to request tokens over multiple days to get a good amount. 0,25 - 0,5 SepoliaETH is sufficient for this course.


##### Snapshot
Now that we have a working wallet with some tokens, we will set up the voting mechanic used for presentations. Snapshot is an off-chain (aka: no gas fee payment when performing actions) voting mechanism that can allow DAOs and protocols to get a feel of the community sentiment before making an official onchain proposal. We will be using the demo version of this platform to vote on the grade for the weekly presentations. The DAO is set up so that only authors can post proposals. Therefore, if it is your week to present, please send your wallet address to the professor privately over the class Discord. For the rest of the class, when you are voting, please include some comment reasoning for your grade.

Given the anonymous nature of these votes and the dangers of collusion in small communities, the following veto rules are in place:
1. You cannot vote for yourself. If there are more than n-3 amount of votes for any presentation, the class vote is void.
2. If the general consensus is far from the professor assessment AND there are no comments attached to the vote explaining the grade, votes are vetoed.

For further instructions around weekly presentations, please refer to the Presentations repository.

To start, please sign up and bookmark the DAO [here](https://testnet.v1.snapshot.box/#/dauphine-solidity.eth/). To join and vote, you must have a MetaMask wallet because all activities are signed with your wallet's public key. You will see there is a proposal already up asking about your sentiment towards this course. **One bonus point will be added to your homework 1 for participating in this preliminary proposal.** Once you have voted, please privately let the professor know your identity and wallet address.

##### Remix

Remix is an IDE which allows you to write, test, and deploy Solidity code from your web browser. Once again, bookmark [this](https://remix.ethereum.org/) link. After you enter Remix, it is essential to connect it to your Github. This is because your homework is submitted on Github and as a browser application, if the browser crashes, you lose your work. Therefore, go to the left hand side and click on the Git button <img width="23" height="28" alt="Git Icon" src="https://github.com/user-attachments/assets/8168ce50-4ff8-48dc-804f-42f3fed3c775" />. Then open the Github Setup tab (ignore the giant initialize repository button) and click the "Login with Github" button. If you are already logged into your Github account, this should be automatic. Otherwise, you may also manually fill in your Github details below.

<img width="316" height="437" alt="Remix Git" src="https://github.com/user-attachments/assets/feafdad9-2e43-41aa-8009-734c53315547" />

Additionally, it is highly advised that you import the [LearnEth plugin](https://remix-learneth-plugin.readthedocs.io/en/latest/index.html). This plugin provides in depth tutorials which explain both the Remix interface, and many aspects of the Solidity programming language. LearnEth serves as a complementary source to the class content.

### Part 2 - The optional tools

While Remix provides the quick start to Solidity programming, its Git functionalities are limited. As you begin collaborating with your peers, a local setup may be required to manage merge conflicts and perform advanced branch operations. 

##### Remix Desktop

[Download](https://github.com/remix-project-org/remix-desktop) the desktop version of Remix. This will enable you to save your work on your computer. There is also a terminal which allows you to use Git locally, with full functionality. Ignore the built in Git button on th desktop.

##### Preparing the terminal for Windows users
Mac and Linux terminals have commands which are standardized. For reference, [here](https://man7.org/linux/man-pages/dir_section_1.html) is the list of all Git commands which are available. Windows use a different terminal called Powershell. In order to standardize the code in this course, **please [download](https://learn.microsoft.com/en-us/windows/wsl/install) WSL if you are a Windows user**. This simulates a Linux kernel inside of your Powershell and allows you to use the same commands as Linux terminals. After a successful installation try to type in wsl into the Powershell and you should arrive at something like this:  

<img width="241" alt="Screenshot_20230129_101643" src="https://user-images.githubusercontent.com/121296124/215317162-35e88f8d-c281-4be7-a310-1297d866bfcc.png">

Additional techie info: the green section is your original system and the blue section is where the simulated Linux environment is running. The point at which this environment is being added onto the normal Windows system is called the mounting point and denoted by "mnt".

##### Github - online and local setup

Github is a cloud hosting platform for Git repositories. **Git** is the actual technology powering open source through version control and contribution techniques. There are other enterprise solutions to Git outside of Github like Gitlab, SVN, Bitbucket and more. These solutions tend to add in enterprise features such as deployment pipelines and project management features. Ever since Github was acquired by Microsoft in 2018, Github has also gained many new enterprise features as well as a gamification aspect with badges.

##### Git - Online setup

At the start of the course, it is totally possible to use Github solely through their online interface. If you have not yet, create your own Github account and then star the [class repository](https://github.com/Dauphine-Digital-Economics) in order to receive updates directly in your email. The updates are sent to the email you registered your account with so please sign up using your Dauphine email.

##### Git - Local setup and CLI commands

If you are unfamiliar with basic Git commands, the following tutorial may be helpful:

1. Install Git on your local machine
2. Connect your local machine to Github
3. Clone a repository from online to your local machine
4. Add and commit the changes locally
5. Finally, push the changes you made locally back up into the cloud for public consumption

###### 1. Install Git

[Install](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) Git on your computer to start using its functionalities. Windows users, do this after you are inside the WSL environment so you can install with Linux commands.

###### 2. Connect your local machine to Github

Originally, this setup could be completely skipped because it was done over https. Given the numerous insecurities surrounding https, Github has now moved onto SSH connections. You can still pull stuff down from online to local machine via https but pushing things upstream (a fancy way of saying publishing your work online), is no longer supported via https. Therefore we need to:
1. Generate a local SSH public and private key pair
2. Paste the public key into Github settings so Github can verify the connection requests from your machine (This is similar to public key signings in a wallet)

In order to do this, please follow [this](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) guide.

###### 3. Clone a repository from online to your local machine

The act of copying repositories from Github online to your local machine is called cloning. To do this, first setup a folder somewhere on your laptop (for easy access, I suggest your Desktop). Then, in your Github account, create a "Homework" repository and click into it. Once you are in the repository, locate the green code button on the top right, click on it, and choose the SSH tab. Click the copy button on the right of the generated link.

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
Now confirm that the clone has been successful by typing "ls" into the CLI. Your repository should now be listed. Now homework assignments may be added and submitted.

###### 4. Add, Commit, Push

Whenever you have made a block of changes and feel like you have reached a logic point of changes locally, use "git add ." to stage those changes. Staging means your changes are temporarily saved. Once you feel like your work is of a publishable quality you can commit your code. A commit packs all the adds that have been staged and compiles them into a hash and timestamp. Finally call "git push" to upload your work online. The work flow would look approximately like:
```
git add .
git commit -m "write a message telling people what this commit is about"
git push origin main
```

## That's all! Have a great semester!

