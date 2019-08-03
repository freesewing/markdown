---
title: Part
---

Part objects hold the actual information, and together they make up your pattern.

Each Part object comes with the following properties:

- `paths` : A plain object to store your paths in
- `points` : A plain object to store your points in
- `render` : A flag that controls whether to include the part in the render output
- `snippets` : A plain object to store your snippets in

In addition, a Part object exposes the following methods:

## copy()

```js
Part part.copy(Part original)
```

This will copy the points, paths, and snippets from a part you pass into it.

<Note>

This method is used internally, you are unlikely to need this.

If you want one part to build on another, you should set up [part inheritance](/advanced/inject) in your pattern's [configuration](../config) file.

</Note>

## getId()

```js
int part.getId()
```

Returns a integer as an available ID that you can use as for Points/Paths/Snippets.

This is typically used when adding points programmatically.

## shorthand()

```js
object Part.shorthand();
```

This method returns a plain object with the following properties:

- `Point` : the [Point](/api/point) constructor
- `points` = `part.points`
- `Path` : the [Path](/api/path) constructor
- `paths` = `part.paths`
- `Snippet` : the [Snippet](/api/snippet) constructor
- `snippets` = `part.snippets`
- `measurements` = `pattern.settings.measurements`
- `options` = `pattern.settings.options`
- `sa` = `pattern.settings.sa`
- `utils` : A [Utils](/api/utils) instance with utility methods
- `units` : A context-aware version of `utils.units`
- `macro` : The macro runner
- `store` = `pattern.store`, a [Store](/api/store) instance that is shared across parts
- `final` : `true` is this is a full draft, or `false` if this is a sample.
- `paperless` = `pattern.settings.paperless`

As the name implies, this method can save you a bunch of typing, and keep your code concise. We highly recommend it. Below are some examples:

### Part.shorthand() example

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

<Tip>

As you can see in the example above, you can/should load only the shorthand you need by using object destructuring.

</Tip>

## units()

```js
string part.units(float number)
```

Formats input (in mm) as the units requested by the user.

<Tip>

###### This method is available as shorthand

You can access this units method from the [Part.shorthand](#shorthand) method;

```js
let { units } = part.shorthand();
```

</Tip>