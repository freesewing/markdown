---
title: Adding points
order: 260
---

After using the [shorthand](/concepts/shorthand) call, `Point` contains the point constructor, while `points` is a reference to `part.points`, which is where you should store your points.

Things will now *just work* when you do this:

```js
points.centerBack  = new Point(0,0);
```

<tip>

The [Point API docs](/api/point) list many ways to create a point.

</Tip>