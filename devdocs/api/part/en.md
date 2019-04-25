---
title: Part
path: /en/docs/developer/api/part
components: true
---

## Description

Part objects hold the actual information, and together they make up your pattern.

Parts aren't typically created manually, but rather created for your based on your 
pattern configuration. Still, if you want to create a new Part, the Part constructor
is attached to the main freesewing object, and takes no arguments:

```js
import freesewing from "freesewing";

let part = new freesewing.Part();
```

Each Part object comes with the following properties:

 - `Point` : The constructor for [Point](./point) objects
 - `points` : A plain object to store your points in
 - `Path` : The constructor for [Path](./path) objects
 - `paths` : A plain object to store your paths in
 - `Snippet` : The constructor for [Snippet](./snippet) objects
 - `snippets` : A plain object to store your snippets in
 - `render` : A flag that controls whether to include the part in the render output
 - `context` : The context property injected by the Pattern into the Part prototype

In addition, a Part object exposes the following methods:

 - [Part.shorthand()](#partshorthand) : Returns a plain object that can save you some typing
 - [Part.copy()](#partcopy) : Copies points/paths/snippets from the part you pass it
 - [Part.debug()](#partdebug) : Triggers the debug hook
 - [Part.getId()](#partgetid) : Returns a free ID
 - [Part.units()](#partunits) : Formats a number according to the units requested by the user


## Part.shorthand()

```js
object Part.shorthand();
```

This method returns a plain object with the following properties:

  - `Point` : the [Point](#point) constructor
  - `points` = `part.points`
  - `Path` : the [Path](#path) constructor
  - `paths` = `part.paths`
  - `Snippet` : the [Snippet](#snippet) constructor
  - `snippets` = `part.snippets`
  - `measurements` = `pattern.settings.measurements`
  - `options` = `pattern.settings.options`
  - `sa` = `pattern.settings.sa`
  - `utils` : A [Utils](#utils) instance with utility methods
  - `units` : A context-aware version of `utils.units`
  - `macro` : The macro runner
  - `store` = `pattern.store`, a [Store](#store) instance that is shared across parts
  - `debug` : The debug hook
  - `final` : `true` is this is a full draft, or `false` if this is a sample.
  - `paperless` = `pattern.settings.paperless`

As the name implies, this method can save you a bunch of typing, and keep your
code concise. We highly recommend it. Below are some examples:

```js{16}
// You could write this:
part.points.from = new part.Point(
  pattern.measurements.chestCircumference / 2, 
  pattern.options.armholeDepth);

part.points.to = new part.Point(
  part.points.from.x + pattern.settings.sa, 
  part.points.from.y);

part.paths.example = new part.Path()
  .move(parts.points.from)
  .line(parts.points.to);

// Or use shorthand:
let { Point, points, measurements, options, sa } = part.shorthand();

points.from = new Point(
  measurements.chestCircumference / 2, 
  options.armholeDepth);

points.to = new part.Point(
  points.from.x + sa, 
  points.from.y);

paths.example = new Path()
  .move(points.from)
  .line(points.to);
```

> ###### No need to load all of this
>
> As you can see in the example above, you can/should load only 
> what you need by using object destructuring.

## Part.copy()

```js
Part part.copy(Part original)
```

This will copy the points, paths, and snippets from a part you pass into it.

This method is used internally, you are unlikely to need this.
If you want one part to build on another, simply set up a dependency 
in your [configuration](../config).

## Part.debug()

```js
void part.debug(mixed data)
```

This will trigger the debug hook and pass the data to it.

> ###### This method is available as shorthand
>
> You can access this debug method from the [Part.shorthand](#shorthand) method;
>
>```js
>let { debug } = part.shorthand();
>```

## Part.getId()

```js
int part.getId()
```
Returns a integer as an available ID that you can use as for Points/Paths/Snippets.

This is typically used when adding points programmatically (in a loop).

## Part.units()

```js
string part.units(float number)
```
Formats input (in mm) as the units requested by the user.

> ###### This method is available as shorthand
>
> You can access this units method from the [Part.shorthand](#shorthand) method;
>
>```js
>let { units } = part.shorthand();
>```
