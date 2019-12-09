---
title: Tekst toevoegen
order: 310
---

SVG is vrij mooi, maar de tekstafhandeling laat veel te wensen over.

Om de ingewikkelde details van het toevoegen van tekst aan een SVG-document te vermijden geeft FreeSewing je de optie om tekst aan patronen toe te voegen door het aan de attributen van punten en paden te koppelen.

Het enige wat u hoeft te doen is het `data-text` attribuut toe te voegen aan het patroon:

```js
points.anchor = new Point(100, 25)
  .attr("data-text", "freesewingIsMadeByJoostDeCockAndContributors")
  .attr("data-text-class", "center");
```

<Example part="point_attr" caption="Text inserted in a FreeSewing pattern" />

<Note>

Misschien heeft U gemerkt dat de tekst die we hebben toegevoegd niet de tekst is die wordt getoond.
That is because, in line with our [best practices](/do) we allow translation of
our pattern by inserting a key that is used to lookup the string in the language
of the pattern, using [the i18n plugin](/plugins/i18n).

</Note>

Je kunt dezelfde manier gebruiken om tekst aan een pad toe te voegen:

```js
points.B = new Point(10, 50);
points.BCp2 = new Point(40, 10);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, 90);

paths.example = new Path()
  .move(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .attr("class", "canvas")
  .attr("data-text", "freesewingIsMadeByJoostDeCockAndContributors")
  .attr("data-text-class", "text-xs center");
```

<Example part="path_attr" caption="Text on a path" />
