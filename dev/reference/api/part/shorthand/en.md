---
title: shorthand()
---

```js
object Part.shorthand();
```

This method returns a plain object with the following properties:

  - `Point` : the [Point](/reference/api/point) constructor
  - `points` = `part.points`
  - `Path` : the [Path](/reference/api/path) constructor
  - `paths` = `part.paths`
  - `Snippet` : the [Snippet](/reference/api/snippet) constructor
  - `snippets` = `part.snippets`
  - `measurements` = `pattern.settings.measurements`
  - `options` = `pattern.settings.options`
  - `sa` = `pattern.settings.sa`
  - `utils` : A [Utils](/reference/api/utils) instance with utility methods
  - `units` : A context-aware version of `utils.units`
  - `macro` : The macro runner
  - `store` = `pattern.store`, a [Store](/reference/api/store) instance that is shared across parts
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

<Tip>

As you can see in the example above, you can/should load only 
the shorthand you need by using object destructuring.

</Tip>

