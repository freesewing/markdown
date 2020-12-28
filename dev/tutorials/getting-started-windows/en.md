---
title: Getting started on Windows
order: 30
for: developers
icons: 
  - start
  - windows
about: |
  You'll learn how to setup Node JS on a Windows system, 
  as well as initialize the FreeSewing development environment.
goals:
  - Install Node JS using nvm
  - Chosing a Node version to use
  - Initializing the FreeSewing development environment
  - Starting the FreeSewing development environment
---
## Setting up a development environment using Windows Subsystem for Linux (WSL) and Visual Studio Code (VSCode)
If you already have a working WSL environment and VSCode Remote configured you can follow the [getting started on Linux guide](getting-started-linux). If not, the following process is very similar but has some differences to avoid quirks specific to this environment.

Windows Subsystem for Linux allows you to run a Linux distribution as a development environment, with enough functionality to develop a FreeSewing pattern. While this approach offers some advantages this is not strictly necessary to develop patterns on Windows. If you would prefer a simpler setup process refer to [Setting up a development environment in Windows](#setting-up-a-development-environment-in-windows).

### Install WSL
<Warning>
This guide uses WSL version 2, which requires installing the Hyper-V virtualisation system. If you have another virtualisation system installed (such as VirtualBox or VMWare) you may run into conflicts which require either updating that system to a version which can use the HyperV backend or porting your existing machines to use HyperV.
</Warning>
[Install WSL 2](https://docs.microsoft.com/en-gb/windows/wsl/install-win10) (requires a recent version of Windows 10)

#### Install NVM
Open a new WSL terminal from the shortcuts created or by searching for "WSL Terminal" in the start menu.
[Install NVM](https://github.com/nvm-sh/nvm#install--update-script).
Once installed you will need to activate NVM by either following the instructions printed to the screen or opening a new terminal.

#### Install Yarn
Install node (`nvm install default`)
Install yarn (`npm install yarn -g`) (optional)

#### Install and configure Git
The package template initialisation script will attempt to create a git repository as part of the setup, as such we need to have git installed on the WSL environment even if you're going to be using a GUI client from the windows side.
`sudo apt install git`
`git config --global user.email "ephphatha@thelettereph.com"`
`git config --global user.name "ephphatha"`

### Install VSCode
[Download VSCode](https://code.visualstudio.com/)

#### Install VSCode Remote
[Follow the getting started guide for VSCode Remote](https://code.visualstudio.com/docs/remote/wsl) (If you've been following this guide you have already done steps 1 and 2, you will only need to install the [remote development extension](https://aka.ms/vscode-remote/download/extension))

### Create pattern package
Open VSCode, and inside VSCode open the folder you wish to contain the pattern (e.g. `documents/my-freesewing-patterns`). Ensure VSCode Remote is active then open a terminal (this will automatically set your working directory to the folder open in VSCode) and run `npx create-freesewing-pattern`

## Setting up a development environment in Windows.
<Fixme>
TODO
</Fixme>
