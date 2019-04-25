---
title: Installation
path: /en/docs/developer/install
---

The fastest way to get started is to grab [our pattern template](https://github.com/freesewing/pattern-template),
install its dependencies, and build the project:

```bash
git clone git@github.com:freesewing/pattern-template.git
cd pattern-template
npm install
npm run build
```

Open the **index.html** file in the project's root folder,
you should see this:

![The pattern template comes with two parts with a line and some text in them, so you can see it works](./patterntemplate.png)

It's maybe not much to look at, but you now have an (almost) empty pattern that you can 
start working on.

The source code is in the `src` directory. Go ahead and make some changes. When you do you
need to rebuild the project. 
You obviously have better things to do than doing that manually every time, so run this instead:

```bash
npm run watch
```

It will watch the `src` directory for changes, and re-build the project every time you hit save.
