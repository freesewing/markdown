---
title: De hoeken afronden
order: 240
---

We weten al hoe je hoeken afrondt; daar dient de `round`-macro voor:

```js
macro("round", {
  from: points.topLeft,
  to: points.bottomRight,
  via: points.bottomLeft,
  radius: points.bottomRight.x / 4,
  prefix: "bottomLeft"
});
macro("round", {
  from: points.bottomLeft,
  to: points.topRight,
  via: points.bottomRight,
  radius: points.bottomRight.x / 4,
  prefix: "bottomRight"
});
```

Maar hier kunnen we nog iets bijleren. Als je kijkt naar hoe we de `round`-macro hiervoor toegepast hebben, zie je dat we deze regel gebruikt hebben:

```js
  render: true,
```

Dit geeft de `round`-macro de opdracht om een pad te creëren dat de afgeronde hoek tekent. Standaard doet de macro niet meer dan de punten te creëren die nodig zijn om de hoek af te ronden.

Meestal zal je afgeronde hoek deel uitmaken van een groter pad. Dan wil je niet dat de macro het ook nog eens tekent. Daarom staat de `render`-eigenschap van de `round`-macro standaard ingesteld als `false`.

We've left it out here, and you should also remove it from your earlier use of the `round` macro. We merely set `render` to `true` at that time so you could see what the macro was doing.

With our corners rounded, we should update our path. Fortunately, we merely have to update the start of it. Replace this:

```js
paths.seam = new Path()
  .move(points.edgeLeft)
  .line(points.bottomLeft)
  .line(points.bottomRight)
  .line(points.edgeRight)
```

With this:

```js
paths.seam = new Path()
  .move(points.edgeLeft)
  .line(points.bottomLeftStart)
  .curve(points.bottomLeftCp1, points.bottomLeftCp2, points.bottomLeftEnd)
  .line(points.bottomRightStart)
  .curve(points.bottomRightCp1, points.bottomRightCp2, points.bottomRightEnd)
  .line(points.edgeRight)
```

and keep the rest of the path as it was.

The shape our bib is now completed:

<Example pattern="tutorial" part="step10" caption="That is looking a lot like a bib" />