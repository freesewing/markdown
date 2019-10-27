---
title: Snippets toevoegen
order: 280
---

After using the [shorthand](/howtos/core/shorthand/) call, `Snippet` contains the path constructor, while `snippets` is a reference to `part.snippets`, which is where you should store your paths.

De dingen werken nu *gewoon* als je dit doet:

```js
snippets.logo = new Snippet('logo', points.logoAnker);
```

Je kunt een snippet vergoten/verkleinen en roteren met de `data-scale` en `data-rotate` attributen.

 - **data-scale** : Of een enkele waarde voor beide, of twee individuele waarden voor de X- en de Y-as. Zie [the SVG scale transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Scale) voor specificaties.
 - **data-rotate**: Een rotatie in graden. Het centrum van de rotatie zal het ankerpunt van de snippet zijn.

<Tip>

See [Using attributes](/howtos/core/attributes/) for details on how to set attributes.

</Tip>

Hieronder is een voorbeeld van `data-scale` en `data-rotate`:

<Example pattern="rendertest" caption="Overview of available snippets" options={{ colors: false, text: macros: circles: widthHd: false }} />
