---
title: De omtrek van het slabbetje schetsen
order: 190
---

Nu we een halsopening gemaakt hebben, is het tijd om de omtrek van het slabbetje te schetsen:

```js
let width = measurements.headCircumference * options.widthRatio;
let length = measurements.headCircumference * options.lengthRatio;

points.topLeft = new Point(
  width / -2,
  points.top.y - (width / 2 - points.right.x)
);
points.topRight = points.topLeft.shift(0, width);
points.bottomLeft = points.topLeft.shift(-90, length);
points.bottomRight = points.topRight.shift(-90, length);

paths.rect = new Path()
  .move(points.topLeft)
  .line(points.bottomLeft)
  .line(points.bottomRight)
  .line(points.topRight)
  .line(points.topLeft)
  .close();
```

Eerst hebben we de variabelen voor breedte (`width`) en lengte (`length`) aangemaakt om onszelf wat typwerk te besparen:

```js
let width = measurements.headCircumference * options.widthRatio;
let length = measurements.headCircumference * options.lengthRatio;
```

Zowel de lengte als de breedte van het slabbetje zijn een factor van de hoofdomtrek. This way, your bib size will adapt to the size of the baby, and the user can tweak the length and width by playing with the options you added to the pattern.

Once we have our variables, we're adding some new points, and a second path called `rect`.

```js
points.topLeft = new Point(
  width / -2,
  points.top.y - (width / 2 - points.right.x)
);
points.topRight = points.topLeft.shift(0, width);
points.bottomLeft = points.topLeft.shift(-90, length);
points.bottomRight = points.topRight.shift(-90, length);

paths.rect = new Path()
  .move(points.topLeft)
  .line(points.bottomLeft)
  .line(points.bottomRight)
  .line(points.topRight)
  .line(points.topLeft)
  .close();
```

We're calculating the `topLeft` point so that the top edge of our bib and the sides are equidistant from the neck neck opening.

You didn't have to do that. But it looks nicely balanced this way:

<Example pattern="tutorial" part="step5" caption="Note how the neck opening is the same distance from the left, right, and top edge" />