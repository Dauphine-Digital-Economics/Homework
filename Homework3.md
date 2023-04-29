# Homework 3 - Automated Market Makers and Github Collaboration

In this Homework, we will focus on moving towards collaboration on Github. To simplify the process, we will only work on 1 file. You will be graded mainly on the quality of your research paper, but a brief examination of your commit histories, comments, PRs, will also be made.

### Advanced AMM models and Markdown files

Write a 750 word paper on an AMM model which combines oracles and traditional models and evaluate a protocol using this model. Some examples:

* [Sigmadex](https://sigmadex.org/) uses Dynamic AMMs (dAMM)
* [DODODex](https://dodoex.github.io/docs/docs/pmm/) uses Proactive AMMs (pAMM)
* [Perpetual Protocol](https://perp.com/) uses Virtual AMMs (vAMM)

These models are rather new and the protocols adopting these models are most likely young. You may include some extrapolations from older protocols if you cannot find sufficient data on [DefiLama](https://defillama.com/) or other DEX trackers on your chosen protocol. It is also useful to read a protocol's Whitepaper as well as READMEs on their Github to get the key points of interest about a protocol. Some industry standard software to analyze any protocol in DeFi:

* Market aggregators for competitive analysis - DefiLama, [TokenTerminal](https://tokenterminal.com/terminal/markets/exchange)
* Data gathering and custom manipulation - [Dune Analytics](https://dune.com/browse/dashboards?tags=DEX)

Sections for your paper:

1. Introduce the protocol, their product offering and make an evaluation of their company (Community and Financial metrics)
2. Introduce the AMM mechanic (general explanation, and intuition, then deeper mathematical explanation)
3. Describe a few use cases where this AMM model is useful or optionally, if you have the expertise, some suitable trading strategies
4. Conclude with some thoughts on your experience of collaborating on Github (what works well, challenges, learnings)

Write this in the format of a Markdown (.md) file. Github is able to directly render Markdown, as you can see from the homeworks. There are also IDE tools which can render markdown on your local machine. You may need to search online to learn the Markdown format, or you can look at the raw format of the homeworks to get an idea.

### Collaborating on Github

In order to learn how to collaborate on Github and resolve merge conflicts, try to do as much of the writing and discussion on Github as possible. Every team has a different collaboration flows but here are some helpful methods.

##### Git Branch

One of the most important workflows is to minimize conflicts. Most software teams will have weekly meetings to discuss how work is split (part of the Agile methodology) and features, or sections of the paper in this case, can be split into different branches to be merged into the main branch after completion of a section of work. With a good split of work, you may not even encounter any merge conflicts.

The probability of merge conflicts increases when the changes made touch many files or the change occurs on a core functionality. A good practice is to create smaller PRs and merge them into main often. Additionally, check the main branch often and merge into the branch you are working on. However, in some development teams, fast PR merges becomes a way of avoiding merge conflicts and passing it onto your colleagues. This is a secondary solution to good division of labour to avoid merge conflicts from arising in the first place.

For this homework, have 1 person be the main account and fellow group members should clone into that repository.

After cloning the repository onto each of your local machines, decide what feature each person is working on. Find a good descriptive name for your branch - good names are ones where anyone can immediately understand who is working on what feature.

Then, on your local machine, use **git checkout -b "AwesomeBranchName"** Afterwards, you can type in **git branch** and this will display all of your branches. The current branch you are working on will be starred at the beginning. You should see "main" and the name of the branch you just created.  

The Github easter egg: with the rise of bots and scripts, occasionally a PR can change thousands of files. When this happens, possibly with a higher number of files and terrible internet connection, the online interface of Github may crash and you will see a majestic unicorn. If you can intentionally cause this to happen, your open source street cred will have reached new heights.

##### Pull requests and code reviews

Once you have set up your branch and added your work to it, you will need to add, commit and push it back upstream. At this point, if you have not done a git commit from your local machine before, git will prompt you to set the global configuration for your name and email in order to associate your commits. For those that are privacy minded, there is a way to [redact your email address](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address). This step is also used in git blame (aka, Github is able to display who wrote each line of the final submission).

Once you successfully push, git will automatically give you a link to create a PR online. Assign your fellow team members as reviewers. Reviewers will receive a notification to review but will not block the merge of the PR by default. For this homework, it is sufficient to leave some comments on the PRs. 

Now, you will either be green to merge your PR or you will have a merge conflict.

##### Merge conflict resolution

Merge conflicts indicate that there is differing information on two branches. Merge conflicts may be resolved directly in Github or via the command line. Either way, opening the file in Github or your local code editor of choice will show you something similar to this
```
If you have questions, please
<<<<<<< HEAD
open an issue
=======
ask your question in IRC.
>>>>>>> branch-a
```
The angle brackets <<< and >>> demarcate the beginning and end of the conflict and === is the dividing line between the two branches in conflict. You can choose to keep one version or simply delete everything and write something new. Once the conflict is resolved, add the new changes and Github should allow you to merge. For a more detailed process, see [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/about-merge-conflicts).

##### Advanced Concepts: Branch management and asking for help

Git has many branch management commands. One good way to discover them is by read the man pages. Man pages are a standard form of Linux help documentation. This is one powerful example of open source standardization. All Linux packages had documentation written in man and it became so wide spread that linux systems came installed with man (hence no need to install). For Github, if you ever need help, the command is:
```
man git [command name]
```
Some more advanced commands: Revert and Rebase.

Revert a way to undo a commit. If a change that a team member made has drastic consequences, like hundreds of merge conflicts, it may be easier to throw the change away than trying to fix it. This is done with **git revert**. Actually, a revert applies counter changes to the commit that cancels out the changes. There are varying ways of undoing things in Git, see [here](https://github.blog/2015-06-08-how-to-undo-almost-anything-with-git/).

If you have added a feature to your branch but in the meantime, the main branch has progressed many commits ahead of your branch, instead of trying to integrate all the changes of the main branch into your branch, you may simply cut off your branch and stick it onto a more recent commit of the main branch. This requires you to input a number of parameters. Try to discover them with
```
man git rebase
```
