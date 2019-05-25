---
title: cutonfold
---

[![Build-time plugin](https://img.shields.io/badge/Type-build--time-purple.svg)](/plugins)
&nbsp;
[![License: MIT](https://img.shields.io/npm/l/@freesewing/plugin-cutonfold.svg?label="License)](https://www.npmjs.com/package/@freesewing/plugin-cutonfold)
&nbsp;
[![Code quality on DeepScan](https://deepscan.io/api/teams/2114/projects/2993/branches/23256/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=2114&pid=2993&bid=23256)
&nbsp;
[![Open issues tagged pkg:plugin-cutonfold](https://img.shields.io/github/issues/freesewing/freesewing/pkg:plugin-cutonfold.svg?label=Issues)](https://github.com/freesewing/freesewing/issues?q=is%3Aissue+is%3Aopen+label%3Apkg%3Aplugin-cutonfold)

The **cutonfold** plugin provides the `cutonfold` macro:

<Example part="plugin_cutonfold" caption="An example of the cutonfold macro" design={false} />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.topLeft = new Point(0, 0);
points.topRight = new Point(150, 0);
points.bottomRight = new Point(150, 50);
points.bottomLeft = new Point(0, 50);

paths.box = new Path()
  .move(points.topLeft)
  .line(points.topRight)
  .line(points.bottomRight)
  .line(points.bottomLeft)
  .close();

macro("cutonfold", {
  from: points.topRight,
  to: points.topLeft,
  grainline: true
});
```

<Tip>

The cutonfold plugin is part of our [plugin-bundle](/plugins/bundle)

</Tip>

## Installation

```bash
npm install @freesewing/plugin-cutonfold
```

## Usage

Like all [build-time plugins](/plugins#build-time-plugins), you load them 
by passing them to the [`freesewing.Design`](/api#design) constructor:

```js
import freesewing from "@freesewing/core";
import cutonfold from "@freesewing/plugin-cutonfold";
import config from "../config";

const Pattern = new freesewing.Design(config, cutonfold);
```

Now you can use the macro in your parts:

```js
void macro("cutonfold", {
  from: Point,
  to: Point,
  grainline: bool
});
```
The macro takes a single configuration object with the following properties:

 - `from`: A [`Point`](/api/point) object to start the cutonfold indicator from
 - `to`: A [`Point`](/api/point) object to end the cutonfold indicator at
 - `grainline`: Set this to `true` to indicate that the cutonfold indicator also indicates the grainline. Defaults to `false`
