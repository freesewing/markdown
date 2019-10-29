---
title: dimension
---

[![Build-time plugin](https://img.shields.io/badge/Type-build--time-purple.svg)](/plugins) &nbsp; [![License: MIT](https://img.shields.io/npm/l/@freesewing/plugin-dimension.svg?label=License)](https://www.npmjs.com/package/@freesewing/plugin-dimension) &nbsp; [![Code quality on DeepScan](https://deepscan.io/api/teams/2114/projects/2993/branches/23256/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=2114&pid=2993&bid=23256) &nbsp; [![Open issues tagged pkg:plugin-dimension](https://img.shields.io/github/issues/freesewing/freesewing/pkg:plugin-dimension.svg?label=Issues)](https://github.com/freesewing/freesewing/issues?q=is%3Aissue+is%3Aopen+label%3Apkg%3Aplugin-dimension)

The **dimension** plugin provides the following [macros](/plugins#macros):

 - [hd](#hd) : Adds a horizontal dimension
 - [vd](#vd) : Adds a vertical dimension
 - [ld](#ld) : Adds a linear dimension
 - [pd](#pd) : Adds a dimension along a path

<Example part="plugin_dimension" caption="An example of the different dimensinon macros" design={false} />

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

<Tip>

The dimension plugin is part of our [plugin-bundle](/reference/plugins/bundle)

</Tip>

## Installation

```bash
npm install @freesewing/plugin-dimension
```

## Usage

Like all [build-time plugins](/guides/plugins/#build-time-plugins), you load them by passing them to the [`freesewing.Design`](/reference/api#design) constructor:

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

| Propriété       | Défaut               | Type                          | Description                                                                                       |
| --------------- | -------------------- | ----------------------------- | ------------------------------------------------------------------------------------------------- |
| `from`          |                      | [Point](/reference/api/point) | Le point de départ de la dimension                                                                |
| `to`            |                      | [Point](/reference/api/point) | Le point final de la dimension                                                                    |
| `y`             |                      | Nombre                        | La valeur en Y où dessiner la dimension                                                           |
| `text`          | Distance horizontale | Nombre                        | Le texte à indiquer sur une dimension s'il ne s'agit pas de la de la distance horizontale from-to |
| `noStartMarker` | `false`              | Booléen                       | Ne pas dessiner un marqueur de début                                                              |
| `noEndMarker`   | `false`              | Booléen                       | Ne pas dessiner un marqueur de fin                                                                |

### vd

```js
void macro("vd", {
  from: Point,
  to: Point,
  x: number
});
```

The `vd` macro draws a vertical dimenstion. It takes a single configuration object with the following properties:

| Propriété       | Défaut             | Type                          | Description                                                                         |
| --------------- | ------------------ | ----------------------------- | ----------------------------------------------------------------------------------- |
| `from`          |                    | [Point](/reference/api/point) | Le point de départ de la dimension                                                  |
| `to`            |                    | [Point](/reference/api/point) | Le point final de la dimension                                                      |
| `x`             |                    | Nombre                        | La valeur en X à laquelle dessiner la dimension                                     |
| `text`          | Distance verticale | Nombre                        | Le texte correspondant à la dimension si ce n'est pas la distance verticale from-to |
| `noStartMarker` | `false`            | Booléen                       | Ne pas dessiner un marqueur de début                                                |
| `noEndMarker`   | `false`            | Booléen                       | Ne pas dessiner un marqueur de fin                                                  |

### ld

```js
void macro("ld", {
  from: Point,
  to: Point,
  d: number
});
```

The `ld` macro draws a linear dimenstion. It takes a single configuration object with the following properties:

| Propriété       | Défaut            | Type                          | Description                                                                    |
| --------------- | ----------------- | ----------------------------- | ------------------------------------------------------------------------------ |
| `from`          |                   | [Point](/reference/api/point) | Le point de départ de la dimension                                             |
| `to`            |                   | [Point](/reference/api/point) | Le point final de la dimension                                                 |
| `d`             | 0                 | Nombre                        | Le décalage avec lequel dessiner la dimension                                  |
| `text`          | Distance linéaire | Nombre                        | Le texte à accoler à la dimension si ce n'est pas la distance linéaire from-to |
| `noStartMarker` | `false`           | Booléen                       | Ne pas dessiner un marqueur de début                                           |
| `noEndMarker`   | `false`           | Booléen                       | Ne pas dessiner un marqueur de fin                                             |

### pd

```js
void macro("pd", {
  path: Path,
  d: number
});
```

The `ld` macro draws a dimenstion parallel to a [Path](/reference/api/path). It takes a single configuration object with the following properties:

| Propriété       | Défaut             | Type                          | Description                                                        |
| --------------- | ------------------ | ----------------------------- | ------------------------------------------------------------------ |
| `path`          |                    | [Chemin](/reference/api/path) | Le chemin le long duquel dessiner la dimension                     |
| `offset`        | 0                  | Nombre                        | Le décalage avec lequel dessiner la dimension                      |
| `text`          | Longueur du chemin | Nombre                        | Le texte à accoler au chemin si ce n'est pas la longueur du chemin |
| `noStartMarker` | `false`            | Booléen                       | Ne pas dessiner un marqueur de début                               |
| `noEndMarker`   | `false`            | Booléen                       | Ne pas dessiner un marqueur de fin                                 |

