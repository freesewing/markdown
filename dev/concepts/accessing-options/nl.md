---
title: Toegang tot opties
order: 250
---

Opties worden opgeslagen in `pattern.settings.options`, maar dankzij [shorthand](/concepts/shorthand) kan je gewoon schrijven:

```js
let sleeveBonus = measurements.shoulderToWrist * (1 + options.sleeveLengthBonus);
```