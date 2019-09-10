---
title: De structuur van een onderdeel
order: 150
---

Laten we eerst het voorbeeldvak weghalen. Open `scr/bib.js` en controleer of het er als volgt uitziet:

```js
export default function(part) {
  let { Point, points, Path, paths } = part.shorthand();
  // Ontwerp je patroon hier

  // Complete?
  if (complete) {
    if (sa) {
    }
    // Paperless?
    if (paperless) {
    }
  }
  return part;
}
```

Dit is een leeg 'geraamte' voor een patroondeel. Telkens wanneer je een nieuw onderdeel wil aanmaken, is dit een goed vertrekpunt.

Laten we snel de verschillende secties overlopen. Er is nu nog niet veel te zien, maar het is altijd goed om te begrijpen hoe het in elkaar zit.

## De tekenmethode

```js
export default function(part) {

  // ...

  return part;
}

```

Dit is de boilerplate van de `draftBib`-methode. Het gebruikt het onderdeel als argument en geeft het terug.

<Note>

Als JavaScript nieuw is voor jou, en je bent hier niet meteen intuïtief mee méé ... bijt dan gewoon even door. Het wordt al snel een tweede natuur.

</Note>

## Using shorthand

```js
let {
  Point,
  points,
  Path,
  paths,
} = part.shorthand();
```

Dit is de **shorthand**-methode van FreeSewing. Het geeft een object terug met een hoop handige hulpmiddelen. Je gebruikt de *object destructuring* van JavaScript om alleen de elementen te krijgen die je nodig hebt.

Het voorbeeld hierboven maakt de volgende variabelen beschikbaar:

- `Point`: de Point constructor, die punten creëert
- `points`: een verwijzing naar de punten van het onderdeel
- `Path`: de Path constructor, die paden creëert
- `paths`: A reference to the part's paths

<Note>

This will all become clear, but if you're curious, the API docs have all the details on [the Part.shorthand() method](/api/part#shorthand)

</Note>

## Part boilerplate

```js
// Complete?
if (complete) {
  if (sa) {
  }
  // Paperless?
  if (paperless) {
  }
}
```

This is some more boilerplate that makes sure we respect the `complete`, `sa`, and `paperless` settings.

For now, you don't need to worry about this. Let's just start designing our bib.