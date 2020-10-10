---
title: Getting started on Linux
order: 10
for: developers
icons: 
  - start
  - linux
about: |
  You'll learn how to setup Node JS on a Linux system, 
  as well as initialize the FreeSewing development environment
goals:
  - Install Node JS using nvm
  - Chosing a Node version to use
  - Initializing the FreeSewing development environment
  - Starting the FreeSewing development environment
---

In this tutorial, we will setup Node JS and initialize the FreeSewing 
development environment on a Linux system.

<Tip>These instructions are also valid for BSD- or other unix systems</Tip>

## Installing nvm

FreeSewing is built with [Node.js](https://nodejs.org/), a JavaScript runtime.

You'll need to install Node JS on your system, and to do so, we'll 
use [nvm](https://github.com/nvm-sh/nvm), short for _Node version manager_.

Using nvm has a number few benefits in comparison with installing Node from
the node.js website, or from a package providide by your linux distribution:

 - You can easily switch between different Node versions
 - Everything gets installed in your home folder, avoiding permission problems

To setup nvm, run the following command in a terminal:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
```

If you don't have `curl` on your system, here's an alternative approach using `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
```

After the script is completed, try running the following command:

```bash
nvm
```

If all goes well, it should show you the nvm help. 

<Tip>

If you get `nvm: command not found` or something similar, close the current terminal
window, and open a new one. Now `nvm` should be found.

</Tip>

## Installing Node

Now we will use nvm to install Node JS. Run the following command:

```bash
nvm install lts/*
```

This will install the most recent so-called LTS version on your system.
LTS versions -- short for Long Term Support -- are good node versions
to use because they are stable and supported for a long time.

## Using a different Node version

Now that you've got Node setup, we can start setting up the FreeSewing
development environment.

But before doing so, let's look at how `nvm` can help you juggle different
Node versions.

### nvm ls

To see the different Node versions on your system, run this command:

```bash
nvm ls
```

It will show you a list of local node versions. 
Either the version number, or an _alias_ that points to a specific version.
You should see the `lts/*` alias in the list which is what we've just installed.

### nvm ls-remote

To see all Node versions that are available, not just those you have locally,
run this command:

```bash
nvm ls-remote
```

Nvm will now spit out a long list of Node versions that you can install.

### nvm install

For any of these versions, either local or remote, you can install them
by making a note of the version or alias and running this command:

```bash
nvm install <version-or-alias>
```

### nvm use

With multiple Node versions installed, `nvm` allows you to switch between different
versions. Just tell it which version you want to use:

```bash
nvm use v10.22.1
```

If you picked a version that is not installed, `nvm` will simply tell you
and even suggest the command you should type to install it. Handy!

## Setting up the FreeSewing development environment

FreeSewing provides a development environment to help you design and develop patterns.

With Node installed, all you need to do to setup this development environment is run this command:

```bash
npx create-freesewing-pattern
```

It will take a moment to download some dependencies, and then will ask you the following questions.

You can change all of these later. It's just to get you started.
If you're not sure what to fill in, you can stick with the defaults or leave them blank.
Only a few of these are mandatory.

 - **Language**: Use the arrow keys to chose the language of your choice
 - **Pattern name**: This will be the name of your pattern, but also the name of the folder we'll setup for you. If you're just kicking the tires, something like `test` will do you fine.                      
 - **description**: A description of your pattern. It's not mandatory.
 - **Pattern type**: Use the arrow keys to chose either `block` or `pattern`. Choose `pattern` if you're not sure what to pick                   
 - **department**: Use the arrow keys to pick a department like `menswear`, `womenswear` or `accessories`. This is is only relevant if you decide to publish your pattern later. But by that time you will have learned how to change this.
 - **Author**: You can enter your name, or leave this blank for now
 - **GitHub repository**: You can leave this blank for now
 - **Package manager**: Choose either `npm` or `yarn` as your package manager. If you're not sure, pick `npm`.                    


When you've answered all questions, the command will download the development enviroment,
and set it up based on the choices you made.

This step will take anywhere from a few to about 10 minutes to complete.
But when it's done, you will have a new folder with the development environent inside.

## Start the development environment

You will have a new folder that has the name you picked for your pattern.
If you chose `test`, you will have a `test` folder. If you chose `banana`, you'll have a `banana` folder.

If you enter that folder, you'll find a couple of subfolders:

 - `config` holds your pattern's configuration file
 - `src` holds your pattern's source code
 - `example` holds the development environment

To start the development environment, we need to run two tasks in parallel, so open two terminal windows.

 - In the newly created folder that bears the name of your pattern, run `npm run start` (or `yarn start` if you're using Yarn as a package manager)
 - In the `example` subfolder within, also run `npm run start` (or `yarn start`)

The first command will build your pattern into a neat Javascript bundle. 
A result that you can also get by running `npm run build`.

But `npm run start` will not only build your pattern, but also watch for any changes you make to
the pattern's source code. When you do, it will build a new bundle. 


The second command -- the `npm run start` in the `example` folder -- will spin up the development 
environment. When you run it, a browser will open the FreeSewing development environment at
http://localhost:3000 

Keep these two terminal windows open while you work.
When you make a change to your pattern, the pattern will be rebuilt, which will be picked up by
the development environment which will reload the pattern and your browser window so you automatically see the latest changes.

<Note>

##### Yay, you're done!

All you have to do now, is design your pattern.
Thankfully, we have a tutorial for that too:

 - [Pattern design tutorial](/tutorials/pattern-design/): A step-by-step guide to designing your first pattern

</Note>

