---
title: Go counter-clockwise
---

Follow your paths counter-clockwise.

This applies both to naming points (specifically the control points of curves) and the order in which you define your points.

Obviously, the order in which you add points to your code needs to take a backseat to the logic of your code. But typically what you're doing is constructing an outline of (a part of) a garment.

So pick a point, and make your way around counter-clockwise.

When naming control points for curves, re-use the name of the point they are attached to and add `Cp1` to the control point before and `Cp2` to the control point after the point if , once again, you'd follow your path counter-clockwise.

For example:

```js
part.paths.seam = new Path()
  .move(points.hemCenter)
  .line(points.hemSide)
  .line(points.waistSide)
  .curve(points.waistSideCp2, points.armholeCp1, points.armhole)
```