---
title: Accessing options
order: 250
---

Options are stored in `pattern.settings.options`, but thanks to the [shorthand](/concepts/shorthand) call, you can simply write:

```js
let sleeveBonus = measurements.shoulderToWrist * (1 + options.sleeveLengthBonus);
```