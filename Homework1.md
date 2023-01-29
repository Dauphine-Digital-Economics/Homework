# Homework 1 - Setup and Web Development

The first week will focus on setting up necessary software for the course and practicing some web development skills. We will be using [MetaMask](https://metamask.io/), a popular custodial Ethereum wallet, as the wallet of choice and Github as the platform on which you build a technical portfolio. We will also get setup on [Snapshot](https://snapshot.org/#/) for the class DAO.

### MetaMask Setup

Since MetaMask is both a wallet and a provider, it allows for easy web3 development. A quality of MetaMask is that it is designed to be device first and not user first. This means that for every platform (even different browsers n the same devicce) you install MetaMask, you will receive a new Secret Recovery Phrase and set a new password. Keep the Recovery phrases safe and never share it under any condition to prevent the [loss of funds](https://www.cnbc.com/2017/12/20/man-lost-127-million-worth-of-bitcoins-and-city-wont-let-him-look.html).

After a MetaMask wallet has been setup, experiment with setting up different accounts and networks. MetaMask is not only able to have multiple accounts, for testing and real fund management, but each account is able to hold different currencies through switching the network. 

We will be needing test funds to enable deploying on the Goerli testnet of Ethereum. Go ahead and get some funds from the Goerli faucet [here](https://goerlifaucet.com/). You will notice that in order to get test funds, it is required to have an [Alchemy account](https://www.alchemy.com/). This is quite a tactical partnership to increase user base fast. Create an Alchemy account, and take a look at their offerings if you like (they have great educational content if things are going too fast in class). Head back to the Goerli faucet and plug in your MetaMask account address and receive some funds!

Note, test funds are capped to regulate supply and prevent abuse. Try to request one or two times more to make sure you have enough for the semester.

### Github online and local setup

Github is a cloud hosting platform for Git repositories. **Git** is the version control technology powering open source through version control and contribution techniques. There are many enterprise solutions to Github like Gitlab and Bitbucket. These solutions tend to add in enterprise features such as deployment pipelines and project management features. Ever since Github was acquired by Microsoft in 2018, Github has also gained many new enterprise features as well as a gamification aspect with badges.

##### Git online setup

At the start of the course, it is totally possible to use Github solely through their online interface. If you have not yet, [create your own Github account and fork the class website respository](#1-fork-the-class-website-into-your-own-github-account). You can click into a repository from the main page, add a new file or click on an existing file, and then simply click on the pencil button and edit directly in Github. Don't forget to write a little commit message before hitting the green "commit changes" button at the bottom.

As time goes on and your projects become more complex, you will need to move Git capabilities to your local machine. This can be achieved either through a chosen IDE, for exmaple VSCode has [Github integration](https://code.visualstudio.com/docs/sourcecontrol/github), which you use to write your smart contracts or you can go completely old school and use the command line interfact (CLI). This homework will teach you basics of the CLI because having a terminal(Mac) or shell(Windows) is ubiquitous on every machine, honoring the early days of computer history where graphics did not exist and it was simply typing into a black screen.

##### Git local setup and CLI commands

The most fundamental commands any Github user needs to master is:
1. Connect your local machine to Github
2. How to clone a respository from online to your local machine
3. How to add and commit the changes locally
4. How to push the changes you made locally back up into the cloud for public consumption

These commands are the basics for when you are working alone. Once collaboration starts, branching, pull requests and resolving merge conflicts becomes important and will be covered in a later homework.

**Note for Windows users:** Powershell and Bash is difficult and cumbersome to use. Whereas Mac and all Linux based machines can simply open a terminal and type in [well documented and standardized](https://man7.org/linux/man-pages/dir_section_1.html) Linux commands, Windows users have to learn a whole different set of commands and argument inputs. This is another use case of why privatization is restrictive as compared to open standards. For Windows users, **please [download](https://learn.microsoft.com/en-us/windows/wsl/install) WSL**. This simulates a Linux kernel on top of your Powershell and allows you to use the same commands as shown below. After a successful installation try to type in wsl into the Powershell and you should see something like this:


###### 1. Connect your local machine to Github
Oringally, this setup could be completely skipped because it was done over https. Given he numerous insecurities surrounding https, Github has now moved onto SSH connections. You can still pull stuff down from online to local machine via https but pushing things upstream (a fancy way of saying putting your work online again), is no longer supported via https. Therefore we need to:
1. Generate a local SSH public and private key pair
2. Paste the public key into Github settings so Github can verify the connection requests from your machine (This is similar to public key signings in a wallet)

In order to do this, please follow [this](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) guide. After you have done the setup 

### Snapshot setup and DAO fundamentals

### Web Development Exercise

The class [website](https://dauphine-digital-economics.github.io/Dauphine-Digital-Economics/) is a demonstration of a simply constructed front end that is visual enough to showcase our work and be an easy reference or presentation. It is made from pure HTML, CSS and JS. Today, there are many frameworks which simplify many tasks of web development. If you would like to dive deeper into web development, it is better to start with an in-demand framework such as [React](https://reactjs.org/) or [flutter](https://flutter.dev/) for mobile-first development. In our homework, nothing fancy will be necessary.

##### 1. Fork the class website into your own Github account

To prevent clashing code edits, the first thing we must do is fork the class repository into individual private accounts. You can do this very easily by being logged into your personal account then pressing the fork button on the [class repository](https://github.com/Dauphine-Digital-Economics/Dauphine-Digital-Economics). Now you can start working on the homework in your own repository. For more information on forks, see [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo).  

The class branch will be protected against accidents by being locked for the duration of the week. There are many ways to protect a branch, see [here](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository) if you are interested.

##### 2. Add your professional picture

Now that you are in your own repository, try clicking on the index.html file and your default browser will load the page. You will see that there is the section we coded in class, followed by a short professor introduction and then a grid of cyberpunks representing our class.

While Cyberpunks are cool, we would like to show the world who has taken the course and is capable of creating awesome websites. Therefore, please add a high quality picture of yourself into the img folder and then change the relevant HTML line (pick any grid box) to display your image. The images are loaded in a Bootstrap 4 [Grid system](https://getbootstrap.com/docs/4.4/layout/grid/), which gives it a lot of auto resizing capabilities but notice how the dimension of your picture changes the grid layout. come up with a way to fit your single grid cell into what it looks like originally. This may require some CSS.

##### 3. Add a Flip Card capability

Flip cards are animations which let's you "flip" the grid cell when hovering over it. [Here](https://www.w3schools.com/howto/howto_css_flip_card.asp), you can use an existing element like this, to enable this animation, or any other method or framework to make the card "flip".

##### 4. Back of the card

At the back of your card, Write your name and then a little description of yourself. Both of these elements should be center text-aligned. 

Lastly, add a button. This button will have a click functionality. Name this button and add some Javascript in the index.js file. If you are uncomfortable with Javascript, just copy line 2 in the file up to the "=" sign. You would need to write your own function afterwards. What function do you need to write? Any function. you can make kitties float across the screen, do something web3 or go all out and have the button link to a whole new website you built. It is enough that the button causes something visbile to happen. If it is not something very clear, include an explanation in a README.md file in your submission.

##### 5. Optional Bonus:suggest an optimization

This website was hacked together very fast and as such, if you viewed it on mobile or a very wide screen, basically anything not a normal laptop, you will immediatly notice that it looks very strange. Suggest an improvement in your code and write the improvement down in your README.md file.
