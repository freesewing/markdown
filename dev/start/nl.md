---
title: Getting started
order: 100
---

## Install Node.js

FreeSewing is a JavaScript library, so the first thing you will need is [Node.js](https://nodejs.org/). If you don't have Node.js on your system, follow the link above and install it on your system.

## Create a freesewing pattern

Once you have Node.js installed, it only takes one command to start a new FreeSewing pattern:

```bash
npm init freesewing-pattern@beta
```

<note>

The `@beta` in the end is required while FreeSewing v2 is still in beta. Once we release 2.0, it won't be needed

</Note>

It will ask your a number of question to prepare your pattern.

If you're not sure what to fill in, stick with the defaults.

You can change all of these later. It's just to get you started.

Behind the scenes, we'll pull in a bunch of software to bootstrap your development environment. Things like webpack, react, and a complete frontend to facilitate your development. This step can take a few minutes to complete.

Once you're ready, you will have a directory that holds your pattern source code in the `scr` folder, and its configuration in the `config` folder.

In addition, you'll see an `example` folder to help your while developing.

## Start the development environment

Now you need to run two commands in two different terminals (because they need to be running side by side):

- In the newly created folder that bears the name of your pattern, run `npm start`
- In the `example` subfolder within, also run `npm start`

Your browser will spin up and open http://localhost:3000

That's it. You got started. Here are some links to continue reading:

- [Tutorial](/tutorial): A step-by-step guide to designing your first pattern
- [API reference](/): Documentation for the FreeSewing API
- [Concepts](/concepts): A list of basic concepts explained
- [Advanced guides](/advanced): Guides on more advanced topics
- [Plugins](/plugins): A list of all the plugins that you can use in your pattern
- [Get help](/help): Where to turn to with your questions