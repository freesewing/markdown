---
title: Je patroon vervolledigen
order: 260
---

Helemaal in het begin hebben we gezegd dat een goede boilerplate voor onderdelen er zo uitziet:

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

Tot nu toe hebben we ons beperkt tot het onderdeel *// Design pattern here*. Nu gaan we verder met het stuk onder *// Complete?*.

<note>

###### Het nut van (niet-)complete patronen

Gebruikers kunnen de instelling `complete` als `false` opgeven. Als dat het geval is, moet je een basisversie van het patroon ontwerpen in plaats van een volledig gedetailleerd patroon.

This has different uses, such as generating patterns to be cut out with a laser cutter.

</Note>

De instelling `complete` staat standaard op `true`, maar de gebruiker kan dat veranderen. Je krijgt toegang tot deze instelling via `part.shorthand()`.

Als we toch bezig zijn, kunnen we ook `snippets` en `Snippet` toevoegen:

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
  Snippet
} = part.shorthand();
```

## Adding snippets

Snippets zijn kleine, herbruikbare dingen die je aan je patroon toevoegt, zoals knopen en knoopsgaten, een logo of een markering voor drukknopen:

```js
// Complete?
if (complete) {
  snippets.snapMale = new Snippet("snap-male", points.snapLeft);
  snippets.snapFemale = new Snippet("snap-female", points.snapRight)
    .attr("opacity", 0.5);

  if (sa) {
  }
  // Paperless?
  if (paperless) {
  }
}
```

Je hebt nu een snippet toegevoegd voor beide delen van een drukknoop, `snap-male` en `snap-female`, op de punten die we daarvoor voorzien hadden.

Omdat het 'vrouwtje' van de drukknoop aan de achterkant van de stof zit, maak je het halftransparant door de eigenschap `opacity` in te stellen op `0.5`. Jep, dat kan.

<tip>

Alle eigenschappen die je instelt, worden toegevoegd aan de SVG-output.

</Tip>

Nu we toch snippets aan het maken zijn, kunnen we ook een logo toevoegen:

```js
points.logo = new Point(0, 0);
snippets.logo = new Snippet("logo", points.logo);
```

## Seam allowance

Net zoals ze de keuze hebben tussen een compleet patroon of een vereenvoudigd, kunnen gebruikers ook kiezen of ze naadwaarde willen toevoegen aan het patroon of niet.

Daarvoor dient deze voorwaarde:

```js
if (sa) {
}
```

Ons slabbetje heeft geen naadwaarde omdat we het afwerken met biaislint. Je kan de voorwaarde in dit geval dus gewoon weglaten.

Maar voor een volgende keer, wanneer je wél de optie van naadwaarde nodig hebt: `sa` (kort voor 'seam allowance' of naadwaarde) is een variabele die je instelt in `part.shorthand()`, net zoals `complete`. In plaats van `true` of `false` voeg je hier de naadwaarde toe in millimeter.

Je kan `if (sa)` hier nog altijd toevoegen. De naadwaarde is dan nul, want nul is *falsy*.

We voegen hier dus geen naadwaarde toe, maar we doen iets dat op hetzelfde neerkomt. In plaats van een extra lijn toe te voegen aan de buitenkant van het slabbetje om de naadwaarde aan te geven, tekenen we een lijn aan de binnenkant om de rand van het biaislint aan te geven:

```js
paths.bias = paths.seam
  .offset(-5)
  .attr("class", "various dashed")
  .attr("data-text", "finishWithBiasTape")
  .attr("data-text-class", "center fill-various");
```

De `path.offset()`-methode maakt het onnodig om naadwaarde toe te voegen, aangezien het een parallel pad toevoegt op de afstand die je instelt. Negen van de tien keer ga je dat gebruiken als `path.offset(sa)`.

Merk op dat we hier opnieuw eigenschappen (attributen) gebruiken om het uitzicht van de lijn te veranderen en er tekst aan toe te voegen. Dat staat verder uitgelegd in [Tekst toevoegen](/concepts/adding-text).

## Scalebox and title

Two more macros and we're done.

The `title` macro adds a title to our part. It's not that big a deal here since we only have one part in our pattern. But patterns typically have many different parts, some of them which might look rather similar. That's why you should number your parts and give them a name.

The `title` macro can help you with that:

```js
points.title = points.bottom.shift(-90, 45);
macro("title", {
  at: points.title,
  nr: 1,
  title: "bib"
});
```

The `scalebox` macro prints a box of an exact size. It is used by people who print the pattern to make sure their print is correctly scaled.

```js
points.scalebox = points.title.shift(-90, 55);
macro("scalebox", { at: points.scalebox });
```

And with that, our pattern is now *complete*:

<example pattern="tutorial" part="step11" caption="We used attributed to add color, dashes, text on a path and even opacity" />

We're not done yet though. There's one more thing the user can ask for: a *paperless* pattern.