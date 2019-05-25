---
title: round
---

[![Build-time plugin](https://img.shields.io/badge/Type-build--time-purple.svg)](/plugins)
&nbsp;
[![License: MIT](https://img.shields.io/npm/l/@freesewing/plugin-round.svg?label="License)](https://www.npmjs.com/package/@freesewing/plugin-round)
&nbsp;
[![Code quality on DeepScan](https://deepscan.io/api/teams/2114/projects/2993/branches/23256/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=2114&pid=2993&bid=23256)
&nbsp;
[![Open issues tagged pkg:plugin-round](https://img.shields.io/github/issues/freesewing/freesewing/pkg:plugin-round.svg?label=Issues)](https://github.com/freesewing/freesewing/issues?q=is%3Aissue+is%3Aopen+label%3Apkg%3Aplugin-round)

The **round** plugin provides the `round` macro:

<Example part="plugin_round" caption="An example of the round macro" design={false} />

```js
points.topLeft = new Point(0, 0);
points.bottomLeft = new Point(0, 30);
points.topRight = new Point(100, 0);
points.bottomRight = new Point(100, 30);

paths.demo = new Path()
  .move(points.topLeft)
  .line(points.bottomLeft)
  .line(points.bottomRight)
  .line(points.topRight)
  .close()
  .attr("class", "note dashed");

macro("round", {
  from: points.topLeft,
  to: points.bottomRight,
  via: points.bottomLeft,
  radius: 10,
  prefix: 'bl',
  render: true
});
macro("round", {
  from: points.bottomRight,
  to: points.topLeft,
  via: points.topRight,
  radius: 20,
  prefix: 'tr',
  render: true
});
```

<Tip>

The round plugin is part of our [plugin-bundle](/plugins/bundle)

</Tip>

## Installation

```bash
npm install @freesewing/plugin-round
```

## Usage

Like all [build-time plugins](/plugins#build-time-plugins), you load them 
by passing them to the [`freesewing.Design`](/api#design) constructor:

```js
import freesewing from "@freesewing/core";
import round from "@freesewing/plugin-round";
import config from "../config";

const Pattern = new freesewing.Design(config, round);
```

Now you can use the macro in your parts:

```js
void macro("round", {
  from: Point,
  to: Point,
  via: Point,
  radius: Point,
  prefix: string,
  render: bool,
});
```
The macro takes a single configuration object with the following properties:

 - `from`: A [`Point`](/api/point) object to start the rounding from
 - `to`: A [`Point`](/api/point) object to end the rounding towards
 - `via`: A [`Point`](/api/point) object that is the corner to round
 - `radius`: The radius to use (in mm)
 - `prefix`: A prefix to apply to the points this macro adds to the part
 - `render`: Whether to render the rounder corner, or merely add all required points to the part

 <Warning>

 The round macro only supports rounding of 90° angles

 </Warning>

