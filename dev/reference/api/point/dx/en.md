---
title: dx()
---

```js
float point.dx(Point point)
```

Returns the delta along the X-axis between this point and the point you pass it.

<Example 
  part="point_dx"
  caption="An example of the Point.dx() method"
/>

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.from = new Point(10, 10);
points.to = new Point(90, 40);

macro("hd", {
  from: points.from,
  to: points.to,
  y: 25
});
```

