---
title: Snippets toevoegen
order: 280
---

Nadat je de [shorthand](/howtos/core/shorthand/) hebt gebruikt, heeft `Snippet` de constructor voor nieuwe snippets, en is `snippets` een referentie naar `part.snippets`, waar je je nieuwe snippets moet bewaren.

De dingen werken nu *gewoon* als je dit doet:

```js
snippets.logo = new Snippet('logo', points.logoAnker);
```

Je kunt een snippet vergoten/verkleinen en roteren met de `data-scale` en `data-rotate` attributen.

 - **data-scale** : Of een enkele waarde voor beide, of twee individuele waarden voor de X- en de Y-as. Zie [the SVG scale transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Scale) voor specificaties.
 - **data-rotate**: Een rotatie in graden. Het centrum van de rotatie zal het ankerpunt van de snippet zijn.

<Tip>

Zie [attributen gebruiken](/concepten/attributen) voor meer informatie over het gebruik van attributen.

</Tip>

Hieronder is een voorbeeld van `data-scale` en `data-rotate`:

<Example pattern="rendertest" caption="Overzicht van de verschillende snippets" options={{ colors: false, text: false, macros: false, circles: false, widthHd: false }} />
