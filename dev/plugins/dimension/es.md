---
title: dimension
---

[![Build-time plugin](https://img.shields.io/badge/Type-build--time-purple.svg)](/plugins) &nbsp; [![License: MIT](https://img.shields.io/npm/l/@freesewing/plugin-dimension.svg?label=License)](https://www.npmjs.com/package/@freesewing/plugin-dimension) &nbsp; [![Code quality on DeepScan](https://deepscan.io/api/teams/2114/projects/2993/branches/23256/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=2114&pid=2993&bid=23256) &nbsp; [![Open issues tagged pkg:plugin-dimension](https://img.shields.io/github/issues/freesewing/freesewing/pkg:plugin-dimension.svg?label=Issues)](https://github.com/freesewing/freesewing/issues?q=is%3Aissue+is%3Aopen+label%3Apkg%3Aplugin-dimension)

The **dimension** plugin provides the following [macros](/plugins#macros):

- [hd](#hd) : Adds a horizontal dimension
- [vd](#vd) : Adds a vertical dimension
- [ld](#ld) : Adds a linear dimension
- [pd](#pd) : Adds a dimension along a path

<example part="plugin_dimension" caption="An example of the different dimensinon macros" design={false} />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(0, 0);
points.B = new Point(0, 100);
points.C = new Point(50, 100);
points.D = new Point(100, 50);
points.DCp1 = new Point(100, 0);

paths.box = new Path()
  .move(points.A)
  .line(points.B)
  .line(points.C)
  .line(points.D)
  .curve(points.DCp1, points.A, points.A)
  .close();

macro("vd", {
  from: points.A,
  to: points.B,
  x: points.A.x - 15
});

macro("hd", {
  from: points.B,
  to: points.C,
  y: points.B.y + 15
});

macro("ld", {
  from: points.C,
  to: points.D,
  d: -15
});

macro("ld", {
  from: points.C,
  to: points.D,
  d: -30,
  text: "Custom text"
});

macro("pd", {
  path: new Path().move(points.A).curve(points.A, points.DCp1, points.D),
  d: -15
});
```

<tip>

The dimension plugin is part of our [plugin-bundle](/plugins/bundle)

</Tip>

## Installation

```bash
npm install @freesewing/plugin-dimension
```

## Usage

Like all [build-time plugins](/plugins#build-time-plugins), you load them by passing them to the [`freesewing.Design`](/api#design) constructor:

```js
import freesewing from "@freesewing/core";
import dimension from "@freesewing/plugin-dimension";
import config from "../config";

const Pattern = new freesewing.Design(config, dimension);
```

Now you can use the macros in your parts:

### hd

```js
void macro("hd", {
  from: Point,
  to: Point,
  y: number
});
```

The `hd` macro draws a horizontal dimenstion. It takes a single configuration object with the following properties:

| Property        | Default             | Type                | Description                                                            |
| --------------- | ------------------- | ------------------- | ---------------------------------------------------------------------- |
| `from`          |                     | [Point](/api/point) | The startpoint of the dimension                                        |
| `to`            |                     | [Point](/api/point) | The endpoint of the dimension                                          |
| `y`             |                     | Number              | The Y-value at which to draw the dimension                             |
| `text`          | Horizontal distance | Number              | The text to go on the dimension if not the from-to horizontal distance |
| `noStartMarker` | `false`             | Boolean             | Whether to not draw a start marker                                     |
| `noEndMarker`   | `false`             | Boolean             | Whether to not draw an end marker                                      |


### vd

```js
void macro("vd", {
  from: Point,
  to: Point,
  x: number
});
```

The `vd` macro draws a vertical dimenstion. It takes a single configuration object with the following properties:

| Property        | Default           | Type                | Description                                                          |
| --------------- | ----------------- | ------------------- | -------------------------------------------------------------------- |
| `from`          |                   | [Point](/api/point) | The startpoint of the dimension                                      |
| `to`            |                   | [Point](/api/point) | The endpoint of the dimension                                        |
| `x`             |                   | Number              | The X-value at which to draw the dimension                           |
| `text`          | Vertical distance | Number              | The text to go on the dimension if not the from-to vertical distance |
| `noStartMarker` | `false`           | Boolean             | Whether to not draw a start marker                                   |
| `noEndMarker`   | `false`           | Boolean             | Whether to not draw an end marker                                    |


### ld

```js
void macro("ld", {
  from: Point,
  to: Point,
  d: number
});
```

The `ld` macro draws a linear dimenstion. It takes a single configuration object with the following properties:

| Property        | Default         | Type                | Description                                                        |
| --------------- | --------------- | ------------------- | ------------------------------------------------------------------ |
| `from`          |                 | [Point](/api/point) | The startpoint of the dimension                                    |
| `to`            |                 | [Point](/api/point) | The endpoint of the dimension                                      |
| `d`             | 0               | Number              | The offset at which to draw the dimension                          |
| `text`          | Linear distance | Number              | The text to go on the dimension if not the from-to linear distance |
| `noStartMarker` | `false`         | Boolean             | Whether to not draw a start marker                                 |
| `noEndMarker`   | `false`         | Boolean             | Whether to not draw an end marker                                  |


### pd

```js
void macro("pd", {
  path: Path,
  d: number
});
```

The `ld` macro draws a dimenstion parallel to a [Path](/api/path). It takes a single configuration object with the following properties:

| Property        | Default     | Type              | Description                                                   |
| --------------- | ----------- | ----------------- | ------------------------------------------------------------- |
| `path`          |             | [Path](/api/path) | The path to draw the dimension along                          |
| `offset`        | 0           | Number            | The offset at which to draw the dimension                     |
| `text`          | Path length | Number            | The text to go on the dimension if not the length of the path |
| `noStartMarker` | `false`     | Boolean           | Whether to not draw a start marker                            |
| `noEndMarker`   | `false`     | Boolean           | Whether to not draw an end marker                             |