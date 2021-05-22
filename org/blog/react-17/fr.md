---
date: 2021-05-22
title: FreeSewing 2.26 comes with React 17 and Webpack 5
img: student.jpg
caption: "Hat-tip to nappy.co for the picture"
author: joost
---

We released FreeSewing v2.16 today. To the casual observer, there's barely any changes at all. And for users of this website, that is very much the case. Scratch the surface however, and there's a lot of changes under the hood. Or rather, not so much under the hood of FreeSewing, but rather under the hood of some of the tools and libraries we depend on.

Let's look at what's been changed:

## create-freesewing-pattern

The biggest changes are related to [create-freesewing-pattern](https://www.npmjs.com/package/create-freesewing-pattern) and the development environment it sets up for you.

We use [create-react-app](https://www.npmjs.com/package/create-react-app) (aka <abbr title='Create React App'>CRA</abbr>) under the hood, and FreeSewing 2.16 is our first release to ship with [React](https://reactjs.org/) 17, CRA 4, and [Webpack](https://webpack.js.org/) 5.

That CRA 4 ships with Webpack 5 is important because it has a whole new way of hot-reloading your application, called `FAST_REFRESH`.

The downside is that it will only work for *local components* in your app. And since our development environment loads your pattern code as a (local) dependency, it does not reload when you change your pattern file.

To make matters worse, webpack 5 will keep a cache in memory of the built dependencies. So even restarting the development environment won't show the changes you've made to your pattern.

Obviously, that ain't cool. And while there's certainly ways to configure webpack to behave as we want it to, CRA doesn't allow for that sort of customization. You can always eject the CRA config (or fork react-scripts) but that would create too much maintenance overhead.

## The FreeSewing development environment: Now with fast refresh

We want the development environment to reflect any changes you make to your code. And we'd like to use the new fast refresh feature bceause it's pretty great.

Unlike the previous hot-reload that would just reload the page, fast refresh can dynamically update a changed React component. That's significant because a page reload will reset the development environment to the state that's stored in local storage. That includes the most important things like measurements, but it does not include what you were looking at in the development environment, pattern configuration, and so on. So each reload you'd need a few clicks to get back to what you were doing, which was a bit of an annoyance.

Fast refresh has the potential to fix that, and to enable it all we need to do is import the pattern as a local component. Alas, CRA uses Webpack's `ModuleScopePlugin` which forbids importing local code from outside the `example/src` folder.

To sidestep that issue, running `npx create-freesewing-pattern` will now symlink the root folder of your pattern as `pattern` into the `example/src` folder from which we'll load it. That brings the code into the local scope, where it will be correctly loaded and fast-refreshed.

There's another advantage to this approach: Where previously you had to run two terminals — one to build/watch the pattern code and one to build/watch the development environment — you now need to load just one because the development environment will also build/watch the pattern code.

Developers rejoice 🎉

## Migration of react-markdown 5 to 6

Another major change is react-markdown. We've already upgraded it on our websites (part of the migration to Gatsby v3 that we completed earlier this month), but we're also using it in our development environment.

It's a relatively trivial change where the markdown content is no longer passed in as an explicit prop, but rather via the special *children* prop.

## Upgraded rollup plugins

The following rollup-plugins also had some major changes:

- rollup-plugin-terser 6 => 7
- @rollup/plugin-commonjs 14 => 19
- @rollup/plugin-node-resolve 8 => 13

This should not cause any issues unless perhaps you're bundling your own freesewing patterns. If you hit any snags, [let us know](https://discord.freesewing.org/).

## Remark upgrade

A while ago, [remark](https://remark.js.org/) released version 13, and our [remark-jargon](https://www.npmjs.com/package/remark-jargon) package is a remark plugin, so here too there's been some changes.

Nothing too major, the only change required was that [unist-util-visit](https://www.npmjs.com/package/unist-util-visit) changed from default to named exports.

## Defaults for browserlist

We now use the recommended `defaults` setting for [browserlist](https://github.com/browserslist/browserslist) which controls browser support for cross-compilers such as [Babel](https://babeljs.io/).

We used to have a set of custom settings but there is no real reason for us to not stick to the defaults.

This could potentiality impact browser support for some really old browsers, but chances are this too will pass under the radar.

## Summary

Not so much has changed in the FreeSewing code itself, but there's a bunch of changes that impact the dependencies and bundlers.

These are typically the hardest and most esoteric things about any JavaScript project, so if you run into any problems after upgrading to FreeSewing v2.16, please [hop onto our Discord server](https://discord.freesewing.org/) so we can help you out.

That being said, as long as you use the same version of different FreeSewing packages, you should not have any problems.
