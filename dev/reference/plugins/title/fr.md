---
title: title
---

[![Build-time plugin](https://img.shields.io/badge/Type-build--time-purple.svg)](/plugins) &nbsp; [![License: MIT](https://img.shields.io/npm/l/@freesewing/plugin-title.svg?label=License)](https://www.npmjs.com/package/@freesewing/plugin-title) &nbsp; [![Code quality on DeepScan](https://deepscan.io/api/teams/2114/projects/2993/branches/23256/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=2114&pid=2993&bid=23256) &nbsp; [![Open issues tagged pkg:plugin-title](https://img.shields.io/github/issues/freesewing/freesewing/pkg:plugin-title.svg?label=Issues)](https://github.com/freesewing/freesewing/issues?q=is%3Aissue+is%3Aopen+label%3Apkg%3Aplugin-title)

The **title** plugin provides the `title` macro:

<Example part="plugin_title" caption="An example of the title macro" design={false} />

```js
let { Point, points, macro } = part.shorthand();

points.title = new Point(90, 45);

macro("title", {
  at: points.title,
  nr: 4,
  title: "sleeve"
});
```

<Tip>

The title plugin is part of our [plugin-bundle](/reference/plugins/bundle)

</Tip>

## Installation

```bash
npm install @freesewing/plugin-title
```

## Usage

Like all [build-time plugins](/guides/plugins/#build-time-plugins), you load them by passing them to the [`freesewing.Design`](/reference/api#design) constructor:

```js
import freesewing from "@freesewing/core";
import title from "@freesewing/plugin-title";
import config from "../config";

const Pattern = new freesewing.Design(config, title);
```

Now you can use the macro in your parts:

```js
void macro("title", {
  at: Point,
  nr: number,
  title: string,
  rotation: number,
  scale: number,
  prefix: string,
  append: bool,
});
```
The macro takes a single configuration object with the following properties:

| Propriété  | Défaut  | Type                          | Description                                                                                                                                                                |
| ---------- |:-------:| ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `at`       |         | [Point](/reference/api/point) | Le point où insérer le titre                                                                                                                                               |
| `nr`       |         | Chaîne de caractères          | Le nombre de parties de patron                                                                                                                                             |
| `title`    |         | Chaîne de caractères          | Le nom de la partie de patron. Si le titre n'est pas paramétré ou bien une chaîne de caractères vide, cela ne sera pas affiché, et la version apparaîtra en dessous de nr. |
| `prefix`   |         | Chaîne de caractères          | Un préfixe à ajouter aux points créés. Cela autorise plus d'un titre par partie, du moment que vous leur donnez un préfixe différent.                                      |
| `append`   | `false` | Booléen                       | Réglez ça sur `true` pour ajouter `nr` à n'importe quel texte déjà indiqué dans l'attribut `at` de Point, plutôt que de l'écraser                                          |
| `rotation` |    0    | Nombre                        | Une rotation optionnelle en degrés                                                                                                                                         |
| `scale`    |    1    | Nombre                        | Un facteur optionnel de mise à l'échelle                                                                                                                                   |
