---
title: De sluiting ontwerpen
order: 210
---

Het begint er goed uit te zien, maar op deze manier krijgen we het slabbetje niet over baby's hoofdje. We hebben een sluiting nodig. We gaan de koordjes aan het uiteinde laten overlappen en er een drukknoop op zetten.

Om de koordjes rond te laten eindigen, gebruiken we iets nieuws: **een macro**.

Macro's zijn kleine helpers die dingen automatiseren die anders heel snel heel saai zouden worden. Er zijn macro's om titels toe te voegen aan je patroon, of aanwijzingen van de stofrichting, een schaalkader, ... en er is dus ook een macro om hoeken af te ronden. De `round`-macro.

Before we can use it, we have to update our `part.shorthand()` call to indicate that we'd also like to make use of macros. Simple add `macro` at the end:

```js
let {
  Point,
  points,
  Path,
  paths,
  measurements,
  options,
  macro
} = part.shorthand();
```

We need a half circle here, but the `round` macro works on 90° angles, so you'll use it twice.

As such, let's add some points to guide the macro, and then put it to work:

```js
let strap = points.edgeTop.dy(points.top);

points.tipRight = points.edgeTop.translate(strap / 2, strap / 2);
points.tipRightTop = new Point(points.tipRight.x, points.edgeTop.y);
points.tipRightBottom = new Point(points.tipRight.x, points.top.y);

macro("round", {
  from: points.edgeTop,
  to: points.tipRight,
  via: points.tipRightTop,
  prefix: "tipRightTop",
  render: true
});
macro("round", {
  from: points.tipRight,
  to: points.top,
  via: points.tipRightBottom,
  prefix: "tipRightBottom",
  render: true
});
```

<warning>

FIXME: Add link to macro/extend docs

</Warning>

<example pattern="tutorial" part="step7" caption="Pretty good, but how are we going to fit it over the baby's head?" />

Like our neck opening, we've only drawn half since we can simply copy the points to the other side.

However, doing so would make both straps overlap. Which doesn't work for a pattern as it would make it impossible to cut it out of a single piece of fabric. So let's deal with the overlap next.