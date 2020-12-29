---
title: dist()
---

```js
float point.dist(Point point)
```

Returns the distance between this point and the point you pass it.

### Points.dist() example

<Example 
  part="point_dist"
  caption="An example of the Point.dist() method"
/>

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.from = new Point(10, 10);
points.to = new Point(90, 40);

macro("ld", {
  from: points.from,
  to: points.to
});
```

