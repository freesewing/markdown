---
date: 2021-05-22
title: FreeSewing 2.16 enthält React 17 und Webpack 5
img: student.jpg
caption: "Kurze Anerkennung für nappy.co für das Bild"
author: joost
---

Wir haben heute FreeSewing v2.16 veröffentlicht. Der oberflächliche Beobachter erkennt nicht viele Änderungen. Und für die Nutzer dieser Website ist das sicherlich der Fall.

Gehe aber nur ein wenig in die Tiefe, und du erkennst, dass eine ganze Menge Arbeit in dieser Version steckt.

Schauen wir uns doch einmal an, was sich alles geändert hat:

## create-freesewing-pattern

Die größte Änderung betrifft [create-freesewing-pattern](https://www.npmjs.com/package/create-freesewing-pattern) und die Entwicklungsumgebung, die es für dich einrichtet.

Unter der Haube verwenden wir [create-react-app](https://www.npmjs.com/package/create-react-app) (alias <abbr title='Create React App'>CRA</abbr>), und FreeSewing 2.16 ist die erste Version, die [React](https://reactjs.org/) 17, CRA 4 und [Webpack](https://webpack.js.org/) 5 enthält.

Die Migration zu CRA 4 (und seinem Begleiter, [react-scripts](https://www.npmjs.com/package/react-scripts) 4) ist signifikant, weil es eine ganz neue Art und Weise für den hot-reload deiner Anwendung enthält, genannt `FAST_REFRESH`.

Der Nachteil ist, dass das nur für *lokale Komponenten* deiner Anwendung geht. Und da unsere Entwicklungsumgebung deinen Schnittmustercode als (lokale) Dependency lädt, wird es nicht neugeladen, wenn du die Datei deines Schnittmusters änderst.

Schlimmer noch, Webpack 5 behält die erstellten Dependencies als Cache im Speicher. So werden selbst beim Neustart der Entwicklungsumgebung die Änderungen, die du an deinem Schnittmuster vorgenommen hast, nicht angezeigt.

Das ist selbstverständlich nicht cool. Und während es durchaus Möglichkeiten gibt, Webpack so zu konfigurieren, dass es sich so verhält wie wir wollen, erlaubt CRA so eine Art von Anpassung nicht. You can always eject the CRA configuration (or fork react-scripts) but that would create too much maintenance overhead.

## The FreeSewing development environment: Now with fast refresh

We want the development environment to reflect any changes you make to your code. And we'd like to use the new fast refresh feature because it's pretty great.

Unlike the previous hot-reload that would just reload the page, fast refresh can dynamically update a changed React component.

That's an important distinction because a page reload will reset the development environment to the state that's stored in local storage. That includes the most important things like measurements, but it does not include what you were looking at in the development environment, pattern configuration, and so on. So each reload you'd need a few clicks to get back to what you were doing, which was a bit of an annoyance.

Fast refresh has the potential to fix that, and to enable it all we need to do is import the pattern as a local component. Alas, CRA uses Webpack's `ModuleScopePlugin` which forbids importing local code from outside the `example/src` folder.

To sidestep that issue, running:

```bash
npx create-freesewing-pattern
```

will now symlink `example/src/pattern` to the root folder of your pattern. That brings the code into the local scope, so it can be correctly loaded and fast-refreshed.

There's another advantage to this approach: Where previously you had to run two terminals — one to build/watch the pattern code and one to build/watch the development environment — you now need to load just one because the development environment will also build/watch the pattern code.

Developers rejoice 🎉

## Migration of react-markdown 5 to 6

Another major change is [react-markdown](https://www.npmjs.com/package/react-markdown). We've already upgraded it on our websites (part of the migration to Gatsby v3 that we completed earlier this month), but we're also using it in our development environment.

It's a relatively trivial change where the markdown content is no longer passed in as an explicit prop:

```jsx
<Markdown source={`Hello, I am **Markdown**`} />
```

But rather via the special *children* prop.

```jsx
<Markdown>Hello, I am **Markdown**</Markdown>
```

## Upgraded rollup plugins

The following rollup-plugins also had some major changes:

- rollup-plugin-terser 6 => 7
- @rollup/plugin-commonjs 14 => 19
- @rollup/plugin-node-resolve 8 => 13

This should not cause any issues unless perhaps you're bundling your own freesewing patterns. If you hit any snags, [let us know](https://discord.freesewing.org/).

## Defaults for browserlist

We now use the recommended `defaults` setting for [browserlist](https://github.com/browserslist/browserslist) which controls browser support for cross-compilers such as [Babel](https://babeljs.io/).

We used to have a set of custom settings but there is no real reason for us to not stick to the defaults.

This could potentiality impact browser support for some really old browsers, but chances are this too will pass under the radar.

## Summary

Not so much has changed in the FreeSewing code itself, but there's a bunch of changes that impact the dependencies and bundlers.

These are typically the hardest and most esoteric things about any JavaScript project.

If you run into any problems after upgrading to FreeSewing v2.16, please [hop onto our Discord server](https://discord.freesewing.org/) so we can help you out.

That being said, as long as you use the same version of different FreeSewing packages, you should not have any problems.
