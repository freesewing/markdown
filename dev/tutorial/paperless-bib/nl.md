---
title: Je patroon papierloos maken
order: 270
---

Gebruikers kunnen papierloze patronen opvragen door `paperless` in te stellen als `true`.

Die waarde kan je uit de `part.shorthand()`-methode halen. Dit is de laatste shorthand die we nodig hebben:

```js
let {
  Point,
  points,
  Path,
  paths,
  measurements,
  options,
  macro,
  complete,
  snippets,
  Snippet,
  paperless
} = part.shorthand();
```

Het idee achter *papierloze patronen* is dat gebruikers je patroon niet hoeven af te drukken om het te gebruiken. In plaats daarvan voegen we afmetingen toe op het patroon waarmee ze het patroon rechtstreeks op de stof kunnen aanduiden, of op een drager zoals patroonpapier.

Daar bovenop maakt FreeSewing automatisch een grid voor elk patroon met metrieke of imperiale aanduidingen, afhankelijk van de eenheid die de gebruiker heeft ingesteld.

Het grid wordt automatisch toegevoegd, maar de afmetingen moet je zelf toevoegen. Gelukkig zijn er macro's die je daarmee kunnen helpen, namelijk:

- De `hd`-macro voegt een horizontale afmeting toe
- De `vd`-macro voegt een verticale afmeting toe
- De `ld`-macro voegt een lineaire afmeting toe
- De `pd`-macro voegt een padafmeting toe die een specifiek pad volgt

<Warning>

FIXME: link naar macrodocumenten toevoegen

</Warning>

Eens kijken naar de code:

```js
if (paperless) {
  // Add dimensions
  macro("hd", {
    from: points.bottomLeftStart,
    to: points.bottomRightEnd,
    y: points.bottomLeft.y + 15
  });
  macro("vd", {
    from: points.bottomRightStart,
    to: points.bottom,
    x: points.bottomRight.x + 15
  });
  macro("vd", {
    from: points.bottomRightStart,
    to: points.right,
    x: points.bottomRight.x + 30
  });
  macro("vd", {
    from: points.bottomRightStart,
    to: points.tipLeftTopStart,
    x: points.bottomRight.x + 45
  });
  macro("hd", {
    from: points.left,
    to: points.right,
    y: points.left.y + 25
  });
  macro("ld", {
    from: points.tipLeftBottomEnd,
    to: points.tipLeftTopStart,
    d: 15
  });
}
```

There's a lot going on, but it's mostly repetition. Let's look at the end result, and discuss:

<Example pattern="tutorial" part="bib" caption="Your paperless bib" settings={{paperless: true}} />

We used the `hd` macro to add two horizontal dimensions:

- One at the bottom for the width of our bib
- One for the width of the neck opening

The `hd` macro takes a `from` and `to` point as well as a `y` value that says at what Y-value to draw the dimension.

We've also added three `vd` macros for the vertical dimensions on the right.

They also takes a `from` and `to` point, but expect a `x` parameter to indicate at what X-value the dimension should be drawn.

Finally, we added a `ld` macro for the linear dimension at the top that marks the width of our strap. While most dimensions are horizontal or vertical, sometimes you want a straight line from the `from` to the `to` points like in this case.

The `ld` macro takes a `d` argument (short for delta) that indicates how far the dimension should be offset from the line from the `from` to the `to` point, if at all.

Making your pattern paperless is the icing on the cake. Time to wrap up, go over what we've learned, and give some pointers on where to go from here.