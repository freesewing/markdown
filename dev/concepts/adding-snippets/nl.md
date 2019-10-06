---
title: Snippets toevoegen
order: 280
---

Nadat je de [shorthand](/concepts/shorthand) hebt gebruikt, heeft `Snippet` de constructor voor nieuwe snippets, en is `snippets` een referentie naar `part.snippets`, waar je je nieuwe snippets moet bewaren.

Things will now *just work* when you do this:

```js
snippets.logo = new Snippet('logo', points.logoAnker);
```

Je kunt een snippet vergoten/verkleinen en roteren met de `data-scale` en `data-rotate` attributen.

 - **data-scale** : Either a single scale factor, or a set of 2 scale factors for the X and Y axis respectively. Zie [the SVG scale transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Scale) voor specificaties.
 - **data-rotate**: A rotation in degrees. Het centrum van de rotatie zal het ankerpunt van de snippet zijn.

<Tip>

See [Using attributes](/concepts/attributes) for details on how to set attributes.

</Tip>

Hieronder is een voorbeeld van `data-scale` en `data-rotate`:

<Example pattern="rendertest" caption="Overview of available snippets" options={{ colors: false, text: macros: circles: widthHd: false }} />
