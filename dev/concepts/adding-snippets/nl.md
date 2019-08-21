---
title: Snippets toevoegen
order: 280
---

Nadat je de [shorthand](/concepts/shorthand) hebt gebruikt, heeft `Snippet` de constructor voor nieuwe snippets, en is `snippets` een referentie naar `part.snippets`, waar je je nieuwe snippets moet bewaren.

Things will now *just work* when you do this:

```js
snippets.logo = new Snippet('logo', points.logoAnchor);
```

You can scale and rotate a snippet by setting the `data-scale` and `data-rotate` attributes respectively.

- **data-scale** : Either a single scale factor, or a set of 2 scale factors for the X and Y axis respectively. See [the SVG scale transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Scale) for details.
- **data-rotate**: A rotation in degrees. The center of the rotation will be the snippet's anchor point

<Tip>

See [Using attributes](/concepts/attributes) for details on how to set attributes.

</Tip>

Below is an example of the available snippets, and the use of the `data-scale` and `data-rotate` attributes:

<Example pattern="rendertest" caption="Overview of available snippets" options={{ colors: false, text: macros: circles: widthHd: false }} />