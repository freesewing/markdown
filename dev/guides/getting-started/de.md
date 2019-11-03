---
title: 02|Getting started
---

<Note>

###### Prerequisite: Node.js

FreeSewing is built with [Node.js](https://nodejs.org/), a JavaScript runtime.

If you don't have Node.js on your system, please follow the link above and 
install it on your system. Then you can really get started.

</Note>

It only takes one command to start designing a new FreeSewing pattern:

```bash
npm init freesewing-pattern
```

First, you will be asked a couple of questions. If you're not sure what to fill in, stick with the defaults. You can change all of these later. It's just to get you started.

Then, this command will download a bunch of dependencies, and bootstrap your development environment. This step can take a few minutes to complete.

Once the command is completed, you will have a directory that holds your pattern source code in the `scr` folder, and its configuration in the `config` folder.

In addition, you'll see an `example` folder to help your while developing.

## Start the development environment

Now you need to run two commands in two different terminals (because they need to be running side by side):

 - In the newly created folder that bears the name of your pattern, run `npm start`
 - In the `example` subfolder within, also run `npm start`

Your browser will spin up and open the FreeSewing development environment at http://localhost:3000


That's it. You got started. Here are some links to continue reading:

 - [Pattern design tutorial](/tutorials/pattern-design/): A step-by-step guide to designing your first pattern
 - [Core API reference](/reference/api/): Documentation for the FreeSewing core API
 - [High-level overview](/guides/overview/): A list of basic concepts explained
 - [Plugins](/reference/plugins/): A list of all the plugins that you can use in your pattern
 - [Get help](https://freesewing.org/docs/about/contact/): Where to turn to with your questions
