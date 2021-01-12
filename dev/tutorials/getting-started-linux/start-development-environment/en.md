---
title: Start the development environment
order: 50
---

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

