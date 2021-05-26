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

Das ist selbstverständlich nicht cool. Und während es durchaus Möglichkeiten gibt, Webpack so zu konfigurieren, dass es sich so verhält wie wir wollen, erlaubt CRA so eine Art von Anpassung nicht. Es ist zwar jederzeit möglich, die CRA Konfiguration abzustoßen (oder react-scripts zu forken), das würde aber zu viel Mehraufwand in der Wartung bedeuten.

## Die FreeSewing Entwicklungsumgebung: Jetzt mit fast refresh

Wir wollen, dass die Entwicklungsumgebung alle Änderungen widerspiegelt, die du an deinem Code vornimmst. Und wir würden gerne die neue fast refresh Funktion nutzen, weil sie ziemlich toll ist.

Im Gegensatz zum vorherigen hot-reload, der einfach nur die Seite neugeladen hat, kann fast refresh eine geänderte React-Komponente dynamisch aktualisieren.

Das ist eine wichtige Unterscheidung, weil ein Neuladen der Seite die Entwicklungsumgebung in den Zustand zurücksetzt, der im lokalen Speicher gespeichert ist. Das umfasst zwar die allerwichtigsten Dinge wie Körpermaße, aber es beinhaltet nicht, was genau du dir in der Entwicklungsumgebung angeschaut hast, die Konfiguration des Schnittmusters, und so weiter. Also brauchtest du mit jedem Neuladen ein paar Klicks, um wieder dorthin zu kommen, wo du vorher warst, was ein wenig nervig war.

Fast refresh hat das Potential, das zu beheben, und alles was wir tun müssen, damit es funktionieren kann, ist das Schnittmuster als lokale Komponente zu laden. Leider verwendet CRA das `ModuleScopePlugin` von Webpack, das es uns verbietet, lokalen Code von außerhalb des `example/src`-Ordners zu importieren.

Um dieses Problem zu umgehen, wird das Ausführen von

```bash
npx create-freesewing-pattern
```

nun einen symbolischen Link von `example/src/pattern` im root-Ordner deines Schnittmusters anlegen. Das bringt den Code in den lokalen Bereich, so dass er korrekt geladen und fast-refreshed werden kann.

Dieser Ansatz hat einen weiteren Vorteil: Wo zuvor zwei Terminals laufen mussten — eines zum Erstellen/Beobachten des Schnittmustercodes, und eines zum Erstellen/Beobachten der Entwicklungsumgebung —, brauchst du jetzt nur noch eines, weil die Entwicklungsumgebung nun auch den Schnittmustercode erstellen/beobachten kann.

Entwickler, frohlocket 🎉

## Migration von react-markdown 5 zu 6

Eine weitere wichtige Änderung ist [react-markdown](https://www.npmjs.com/package/react-markdown). Wir haben es bereits auf unseren Webseiten aktualisiert (Teil der Migration nach Gatsby v3, die wir Anfang dieses Monats abgeschlossen haben), aber wir verwenden es auch in unserer Entwicklungsumgebung.

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
