# Homework 1 - Setup and Web Development

The first week will focus on setting up necessary software for the course and practicing some web development skills. We will be using [MetaMask](https://metamask.io/), a popular custodial Ethereum wallet, as the wallet of choice and Github as the platform on which you build a technical portfolio. We will also get setup on [Snapshot](https://snapshot.org/#/) for the class DAO.

### MetaMask Setup

Since MetaMask is both a wallet and a provider, it allows for easy web3 development. A quality of MetaMask is that it is designed to be device first and not user first. This means that for every platform (even different browsers n the same devicce) you install MetaMask, you will receive a new Secret Recovery Phrase and set a new password. Keep the Recovery phrases safe and never share it under any condition to prevent the [loss of funds](https://www.cnbc.com/2017/12/20/man-lost-127-million-worth-of-bitcoins-and-city-wont-let-him-look.html).

After a MetaMask wallet has been setup, experiment with setting up different accounts and networks. MetaMask is not only able to have multiple accounts, for testing and real fund management, but each account is able to hold different currencies through switching the network. 

We will be needing test funds to enable deploying on the Goerli testnet of Ethereum. Go ahead and get some funds from the Goerli faucet [here](https://goerlifaucet.com/). You will notice that in order to get test funds, it is required to have an [Alchemy account](https://www.alchemy.com/). This is quite a tactical partnership to increase user base fast. Create an Alchemy account, and take a look at their offerings if you like (they have great educational content if things are going too fast in class). Head back to the Goerli faucet and plug in your MetaMask account address and receive some funds!

Note, test funds are capped to regulate supply and prevent abuse. Try to request one or two times more to make sure you have enough for the semester.

### Github online and local setup

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
