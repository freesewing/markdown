---
title: hd
---

The `hd` macro adds a *horizontal dimension* to your pattern.  
It is provided by the [dimension plugin](/reference/plugins/dimension/).

<Example 
  part="point_dx"
  caption="An example of a horizontal dimension"
/>

```js
macro('hd', {
  from: points.from,
  to: points.to,
  y: 25
})
```

| Property        | Default  | Type                | Description | 
|----------------:|----------|---------------------|-------------|
| `from`          |          | [Point](/reference/api/point) | The startpoint of the dimension |
| `to`            |          | [Point](/reference/api/point) | The endpoint of the dimension |
| `y`             |          | Number              | The Y-value at which to draw the dimension |
| `text`          | Horizontal distance | Number   | The text to go on the dimension if not the from-to horizontal distance |
| `noStartMarker` | `false`  | Boolean             | Whether to not draw a start marker |
| `noEndMarker`  | `false`  | Boolean             | Whether to not draw an end marker |

