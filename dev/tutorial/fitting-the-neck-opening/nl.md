---
title: De halsopening aanpassen
order: 170
---

Dit is hoe we ervoor gaan zorgen dat de halsopening *precies goed* zit:

```js
let tweak = 1;
let target = (measurements.headCircumference * options.neckRatio) /4;
let delta;
do {
    points.right = new Point(tweak * measurements.headCircumference / 10, 0);
    points.bottom = new Point(0, tweak * measurements.headCircumference / 12);

    points.rightCp1 = points.right.shift(90, points.bottom.dy(points.right)/2);
    points.bottomCp2 = points.bottom.shift(0, points.bottom.dx(points.right)/2);

    paths.neck = new Path()
      .move(points.right)
      .curve(points.rightCp1, points.bottomCp2, points.bottom);

    delta = paths.neck.length() - target;
  if (delta > 0) tweak = tweak * 0.99;
  else tweak = tweak * 1.02;
} while (Math.abs(delta) > 1);
```

We hebben een paar nieuwe variabelen toegevoegd:

- `tweak`: Een *tweak factor* die we gaan gebruiken om de halfopening groter of kleiner te maken door de waarde in te stellen als groter of kleiner dan 1
- `target`: Hoe lang onze (kwart) halsopening moet zijn
- `delta`: Hoever we ernaast zitten. Een positief getal geeft aan dat de halsopening te lang is, een negatief dat hij te kort is

Now that we know what `target` is, we construct our path as we did before. But this time around, we multiply our point coordinates with our `tweak` variable (1 at the start).

Then, we compare our `target` to the result of `paths.neck.length()` which — you guessed it — returns the length of our neck path.

If the delta is positive, our path is too long and we reduce the tweak factor.  
If the delta is negative, our path is too short and we increase the tweak factor.

We keep on doing this until `Math.abs(delta)` is less than 1. Meaning that we are withing 1mm or our target value.

<Example pattern="tutorial" part="step2" caption="It might look the same as before, but now it's just right" />

Now that we're happy with the length of our quarter neck opening, let's construct the entire neck opening.