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

Zo ziet dat eruit in de code:

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

Dat is een hele lap code, maar vooral veel herhaling. Eens kijken naar het eindresultaat:

<Example pattern="tutorial" part="bib" caption="Your paperless bib" settings={{paperless: true}} />

We hebben de `hd`-macro gebruikt om twee horizontale afmetingen toe te voegen:

- Eentje onderaan voor de breedte van het slabbetje
- Eentje voor de breedte van de halsopening

De `hd`-macro gebruikt een punt voor `from` en `to` en een `y`-waarde die aangeeft op welke Y-waarde de afmeting getekend moet worden.

We hebben drie `vd`-macro's toegevoegd voor de verticale afmetingen aan de rechterkant.

Die gebruiken ook een punt voor `from` en `to`, maar hebben een `x`-parameter nodig om aan te geven op welke X-waarde de afmeting getekend moet worden.

Finally, we added a `ld` macro for the linear dimension at the top that marks the width of our strap. While most dimensions are horizontal or vertical, sometimes you want a straight line from the `from` to the `to` points like in this case.

The `ld` macro takes a `d` argument (short for delta) that indicates how far the dimension should be offset from the line from the `from` to the `to` point, if at all.

Making your pattern paperless is the icing on the cake. Time to wrap up, go over what we've learned, and give some pointers on where to go from here.