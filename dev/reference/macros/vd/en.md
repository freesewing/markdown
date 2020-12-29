---
title: vd
---

The `vd` macro adds a *vertical dimension* to your pattern.  
It is provided by the [dimension plugin](/reference/plugins/dimension/).

<Example 
  part="point_dy"
  caption="An example of a vertical dimension"
/>

```js
macro('hd', {
  from: points.from,
  to: points.to,
  x: 25
})
```

| Property        | Default | Type                | Description | 
|----------------:|---------|---------------------|-------------|
| `from`          |         | [Point](/reference/api/point) | The startpoint of the dimension |
| `to`            |         | [Point](/reference/api/point) | The endpoint of the dimension |
| `x`             |         | Number              | The X-value at which to draw the dimension |
| `text`          | Vertical distance | Number    | The text to go on the dimension if not the from-to vertical distance |
| `noStartMarker` | `false` | Boolean             | Whether to not draw a start marker |
| `noEndMarker`  | `false` | Boolean             | Whether to not draw an end marker |



