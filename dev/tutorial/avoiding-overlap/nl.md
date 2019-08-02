---
title: Overlap vermijden
order: 220
---

Je hebt nu enkel nog maar het uiteinde van één koordje getekend, maar het is al heel duidelijk dat ze overlappen. Dat is een grote no-no in naaipatronen, dus daar moeten we iets aan doen.

We gaan het koordje uit de weg draaien zodat het niet meer overlapt. De rest van het slabbetje moet blijven zoals het is, dus laten we om te beginnen een lijst maken van punten die moeten draaien:

```js
let rotateThese = [
  "edgeTopLeftCp",
  "edgeTop",
  "tipRight",
  "tipRightTop",
  "tipRightTopStart",
  "tipRightTopCp1",
  "tipRightTopCp2",
  "tipRightTopEnd",
  "tipRightBottomStart",
  "tipRightBottomCp1",
  "tipRightBottomCp2",
  "tipRightBottomEnd",
  "tipRightBottom",
  "top",
  "topCp2"
];
```

Nu kan je ze roteren. Hoe ver? Tot het koordje niet meer overlapt:

```js
while (points.tipRightBottomStart.x > -1) {
  for (let p of rotateThese) points[p] = points[p].rotate(1, points.edgeLeft);
}
```

We roteren alle punten in de `rotateThese`-reeks rond de punten van `edgeLeft`. We're using increments of 1 degree until the `tipRightBottomStart` point is 1mm passed the center of our bib.

While we're add it, let's add a point where the closure's snap should go:

```js
points.snapLeft = points.top.shiftFractionTowards(points.edgeTop, 0.5);
```

<example pattern="tutorial" part="step8" caption="The right part looks a bit wonky now, but we'll get to that" />

Now let's mirror this on the other side, and replace our `neck` and `rect` paths with a new path.