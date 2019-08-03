---
title: scalebox
---

[![Build-time plugin](https://img.shields.io/badge/Type-build--time-purple.svg)](/plugins) &nbsp; [![License: MIT](https://img.shields.io/npm/l/@freesewing/plugin-scalebox.svg?label=License)](https://www.npmjs.com/package/@freesewing/plugin-scalebox) &nbsp; [![Code quality on DeepScan](https://deepscan.io/api/teams/2114/projects/2993/branches/23256/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=2114&pid=2993&bid=23256) &nbsp; [![Open issues tagged pkg:plugin-scalebox](https://img.shields.io/github/issues/freesewing/freesewing/pkg:plugin-scalebox.svg?label=Issues)](https://github.com/freesewing/freesewing/issues?q=is%3Aissue+is%3Aopen+label%3Apkg%3Aplugin-scalebox)

The **scalebox** plugin provides the `scalebox` macro:

<Example part="plugin_scalebox" caption="An example of the scalebox" design={false} />

```js
let { Point, points, macro } = part.shorthand();

points.anchor = new Point(0, 0);

macro("scalebox", {
  at: points.anchor
});
```

<Note>

###### Purpose of a scale box

A scalebox allows people to verify the pattern is printed at the correct scale

</Note>

<Tip>

The scalebox plugin is part of our [plugin-bundle](/plugins/bundle)

</Tip>

## Installation

```bash
npm install @freesewing/plugin-scalebox
```

## Usage

Like all [build-time plugins](/plugins#build-time-plugins), you load them by passing them to the [`freesewing.Design`](/api#design) constructor:

```js
import freesewing from "@freesewing/core";
import scalebox from "@freesewing/plugin-scalebox";
import config from "../config";

const Pattern = new freesewing.Design(config, scalebox);
```

Now you can use the macro in your parts:

```js
void macro("scalebox", {
  at: Point,
  rotate: number,
  lead: string,
  title: string,
  text: string
});
```

The macro takes a single configuration object with the following properties:

| Propriété | Défaut                   | Type                | Description                            |
| --------- | ------------------------ | ------------------- | -------------------------------------- |
| `at`      |                          | [Point](/api/point) | The point to anchor the *scale box* on |
| `lead`    | FreeSewing               | String              | The lead text above the title          |
| `title`   | *pattern name + version* | String              | The title text                         |
| `text`    | (\*)                   | String              | The text below the title               |
| `rotate`  | 0                        | Number              | Rotation in degrees                    |


(\*) `freesewingIsMadeByJoostDeCockAndContributors \n withTheFinancialSupportOfOurPatrons`