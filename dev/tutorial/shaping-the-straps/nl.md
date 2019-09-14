---
title: De bandjes vormgeven
order: 200
---

De bandjes van het slabbetje moeten de halsopening volgen. Dat is niet zo moeilijk. We moeten alleen maar de controlepunten van de curves op vergelijkbare proporties behouden. Dus halverwege het begin van de curve, en aan de hoek van onze rechthoek.

<Note>

Hiervoor gaan we een nieuwe methode gebruiken: `Point.shiftFractionTowards()`. We hebben `Point.shift()` al eens gebruikt. Er bestaat ook een `Point.shiftTowards()` en een `Point.shiftOutwards()`. Zoals gewoonlijk staan alle details in de [API-documenten](/api/point).

</Note>

```js
points.edgeLeft = new Point(points.topLeft.x, points.left.y);
points.edgeRight = new Point(points.topRight.x, points.right.y);
points.edgeTop = new Point(0, points.topLeft.y);

points.edgeLeftCp = points.edgeLeft.shiftFractionTowards(points.topLeft, 0.5);
points.edgeRightCp = points.edgeLeftCp.flipX();
points.edgeTopLeftCp = points.edgeTop.shiftFractionTowards(
  points.topLeft,
  0.5
);
points.edgeTopRightCp = points.edgeTopLeftCp.flipX();
```

Pas nu het `rect`-pad aan zodat het geen rechthoek meer is:

```js
paths.rect = new Path()
  .move(points.edgeTop)
  .curve(points.edgeTopLeftCp, points.edgeLeftCp, points.edgeLeft)
  .line(points.bottomLeft)
  .line(points.bottomRight)
  .line(points.edgeRight)
  .curve(points.edgeRightCp, points.edgeTopRightCp, points.edgeTop)
  .close();
```

Plots begint het er echt als een slabbetje uit te zien:

<Example pattern="tutorial" part="step6" caption="Pretty good, but how are we going to fit it over the baby's head?" />