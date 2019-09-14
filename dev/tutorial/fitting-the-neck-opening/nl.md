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

- `tweak`: Een *tweakfactor* die we gaan gebruiken om de halfopening groter of kleiner te maken door de waarde in te stellen als groter of kleiner dan 1
- `target`: Hoe lang onze (kwart) halsopening moet zijn
- `delta`: Hoever we ernaast zitten. Een positief getal geeft aan dat de halsopening te lang is, een negatief dat hij te kort is

Nu we weten wat `target` is, kunnen we ons pad opbouwen zoals we eerder al gedaan hebben. Deze keer vermenigvuldigen we onze puntcoördinaten met de `tweak`-variabele (1 om te beginnen).

Dan vergelijken we onze `target` met het resultaat van `paths.neck.length()` en dat levert ons — je raadt het al — de lengte van het pad voor de hals op.

Als de delta positief is, is het pad te lang. Dan maken we de tweakfactor kleiner.  
Als de delta negatief is, is het pad te kort. Dan maken we de teakfactor groter.

Dat blijven we doen tot `Math.abs(delta)` kleiner is dan 1. Dat betekent dat we op minder dan 1 millimeter van onze doelwaarde zitten.

<Example pattern="tutorial" part="step2" caption="It might look the same as before, but now it's just right" />

Nu we tevreden zijn met de lengte van onze (kwart) halsopening, kunnen we de volledige halsopening opbouwen.