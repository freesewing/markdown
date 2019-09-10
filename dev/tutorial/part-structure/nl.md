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

Dit is de boilerplate van de `draftBib`-methode. It takes the part as an argument, and returns it.

<Note>

If you're new to JavaScript, and don't intuitively *get this*, stick with it. It will become second nature soon enough.

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

This is FreeSewing's **shorthand** method. It returns an object with a bunch of handy helpers and you use JavaScript's *object destructuring* to only get what you need.

The example above makes the following variables available:

- `Point`: The Point constructor
- `points`: A reference to the part's points
- `Path`: The Path constructor
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