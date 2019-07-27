---
title: Drawing circles
order: 320
---

Real circles are rarely used in pattern design, and they are not part of the SVG path specification, but rather a different SVG element.

Still, if you want a circle, you can draw one by setting a Point's `data-circle` attribute to the radius of the circle you want to draw.

In addition, all attributes that have a `data-circle-` prefix will apply to the circle, rather than the point.

<example pattern="rendertest" caption="Circles" options={{ colors: false, text: macros: snippets: widthhd: false }} />