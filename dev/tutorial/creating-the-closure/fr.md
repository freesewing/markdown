---
title: Créer la fermeture
order: 210
---

Les choses commencent à prendre forme, mais nous ne pouvons pas passer le bavoir sur la tête du bébé comme ça. Alors nous devons créer un système de fermeture. Nous allons faire chevaucher les attaches à leurs extrémités, et y mettre un bouton pression.

Pour arrondir les attaches, nous allons utiliser quelque chose de nouveau : **une macro**.

Les macros sont de petites assistantes qui automatisent les tâches qui autrement seraient un peu fastidieuses. Il existe des macros pour ajouter des titres à votre patron, ou des indicateurs de droit-fil, une échelle, et il y a une macro pour arrondir les coins. The `round` macro.

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