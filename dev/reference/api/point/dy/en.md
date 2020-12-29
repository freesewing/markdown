---
title: dy()
---

```js
float point.dy(Point point)
```

Returns de delta along the Y-axis between this point and the point you pass it.

<Example 
  part="point_dy"
  caption="An example of the Point.dy() method"
/>

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.from = new Point(10, 10);
points.to = new Point(90, 40);

macro("vd", {
  from: points.to,
  to: points.from,
  x: 50
});
```
