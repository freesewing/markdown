---
title: Path
path: /en/docs/developer/api/path
components: true
i18n:
  boxTitle: Nevermind that box() method
  boxInfo: You can ignore the box() method used in this example. In your patterns, you simply return the part object.
  boxWhy: The bounding box of a pattern part is calculated based on the paths used in that part. Some of these examples don't have any paths, and thus our example pattern has an extra box() method that draws an (invisible) diagonal line to force the bounding box to a certain size.
  i18nTitle: This pattern uses the i18n plugin
  i18nInfo: You'll notice that the text used in this pattern is different from the text inserted in the code. That's because this pattern uses the i18n plugin to allow translation.
  i18nData: In this case, we provided the following data to the i18n plugin
---

## Description

A path represents an SVG path; The lines and curves on our pattern.

The Path constructor takes no arguments:

```js
Path new Path();
```

A Path objects comes with the following properties:

- `render` : Set this to `false` to not render the path (exclude it from the output)
- `attributes` : An [Attributes](./attributes) instance holding the path's attributes

In addition, a Part object exposes the following methods:

## Path.move()

```js
Path path.move(Point to)
```

Moves to a given point without drawing a line.

> ###### Always start your path with a move
> 
> When drawing a path, you must always start with a `move()` call, followed by your `line()` and/or `curve()` calls and an optional `close()` call.
> 
> These calls are chainable, making your code easier to read:
> 
> ```js
paths.example = new Path()
  .move(points.a)
  .curve(points.b, points.c, points.d)
  .line(points.e)
  .close();
```

<api-example o="path" m="move" i="ops" margin="15" strings='{ "msg_move": "Move to point A", "msg_line": "", "msg_curve": "", "msg__curve": "", "msg_curve_": "", "msg_close": ""}'></api-example>

## Path.line()

```js
Path path.line(Point to)
```

Draws a straight line from the current position to a given point.

<api-example o="path" m="line" i="ops" margin="15" strings='{ "msg_move": "", "msg_line": "Line to point B", "msg_curve": "", "msg__curve": "", "msg_curve_": "", "msg_close": ""}'></api-example>

## Path.curve()

```js
Path path.curve(Point cp1, Point cp2, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint.

<api-example o="path" m="curve" i="ops" margin="15" strings='{ "msg_move": "", "msg_line": "", "msg_curve": "Curve to point C", "msg__curve": "", "msg_curve_": "", "msg_close": ""}'></api-example>

## Path.\_curve()

```js
Path path._curve(Point cp2, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint. However, the start control point is identical to the start point.

<api-example o="path" m="_curve" i="ops" margin="15" strings='{ "msg_move": "", "msg_line": "", "msg_curve": "", "msg__curve": "Curve to point D", "msg_curve_": "", "msg_close": ""}'></api-example>

> ###### This method exists to save you some typing
> 
> Note that the two following calls yield the same result:
> 
> ```js
.curve(point1, point1, point2)
._curve(point1, point2)
```

So the only purpose of this method is to save your some typing;

## Path.curve\_()

```js
Path path.curve_(Point cp1, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint. However, the end control point is identical to the end point.

<api-example o="path" m="curve_" i="ops" margin="15" strings='{ "msg_move": "", "msg_line": "", "msg_curve": "", "msg__curve": "", "msg_curve_": "Curve to point E", "msg_close": ""}'></api-example>

> ###### This method exists to save you some typing
> 
> Note that the two following calls yield the same result:
> 
> ```js
.curve(point1, point2, point2)
.curve_(point1, point2)
```

So the only purpose of this method is to save your some typing;

## Path.close()

```js
Path path.close()
```

Closes a path by drawing a straight line from the current position to the path's start.

<api-example o="path" m="close" i="ops" margin="15" strings='{ "msg_move": "", "msg_line": "", "msg_curve": "", "msg__curve": "", "msg_curve_": "", "msg_close": "Close the path"}'></api-example>

## Path.attr()

```js
Path path.attr(
  string name, 
  mixed value, 
  bool overwrite = false
)
```

This `Path.attr()` method calls `this.attributes.add()` under the hood, but returns the Path object.

This allows you to chain different calls together as in the example below.

If the third parameter is set to `true` it will call `this.attributes.set()` instead, thereby overwriting the value of the attribute.

<api-example o="path" m="attr" strings='{ "msg": "I am text on a path"}'></api-example>

## Path.clone()

```js
Path path.clone()
```

Returns a new Path that is a deep copy of this path.

<api-example o="path" m="clone"></api-example>

## Path.divide()

```js
array path.divide()
```

Breaks a path apart in an array of atomic paths. An atomic path is a path that can't be divided further and is always made up of one move + one drawing operation.

<api-example o="path" m="divide"></api-example>

## Path.edge()

```js
Point path.edge(string side)
```

Returns the Point object at the edge of the path you specify. Edge must be one of:

- top
- bottom
- left
- right
- topLeft
- topRight
- bottomLeft
- bottomRight

<api-example o="path" m="edge"></api-example>

## Path.end()

```js
Point path.end()
```

Returns the Point object at the end of the path.

<api-example o="path" m="end"></api-example>

## Path.intersects()

    array|false path.intersects(Path path)
    

Returns the Point object(s) where the path intersects with a path you pass it.

> ###### Use the intersection methods in Utils whenever possible
> 
> This is an expensive (read: slow) method that you should only use when you don't know in advance in what segment of your path the intersection will occur.
> 
> If you do know, use one of the intersection methods in [Utils](#utils).

<api-example o="path" m="intersects"></api-example>

## Path.intersectsX()

```js
array|false path.intersectsX(float x)
```

Returns the Point object(s) where the path intersects with a given X-value.

<api-example o="path" m="intersectsx"></api-example>

## Path.intersectsY()

```js
array|false path.intersectsY(float y)
```

Returns the Point object(s) where the path intersects with a given Y-value.

<api-example o="path" m="intersectsy"></api-example>

## Path.join()

```js
Path path.join(path other)
```

Joins this path with another path.

<api-example o="path" m="join"></api-example>

> ###### Only for unclosed paths
> 
> You cannot join a closed path to another path

## Path.length()

```js
float path.length()
```

Returns the length of the path.

<api-example o="path" m="length"></api-example>

## Path.offset()

```js
Path path.offset(float distance)
```

Returns a new Path that is offset by distance from the original path.

<api-example o="path" m="offset"></api-example>

## Path.reverse()

```js
Path path.reverse()
```

Returns a path that is the reversed version of this path. As in, start becomes end, and end becomes start.

<api-example o="path" m="reverse" strings='{ "msg": "This path starts here", "gsm": "But now it starts here"}'></api-example>

## Path.shiftAlong()

```js
Point path.shiftAlong(float distance)
```

Returns a point that lies at distance travelled along the path.

<api-example o="path" m="shiftalong" strings='{ "msg_2cm": "Shifted 2cm\nalong path", "msg_9cm": "Shifted 9cm\nalong path"}'></api-example>

## Path.shiftFractionAlong()

```js
Point path.shiftFractionAlong(float fraction)
```

Returns a point that lies at fraction of the length of the path travelled along the path.

<api-example o="path" m="shiftfractionalong" strings='{ "msg_20": "Shifted 20%\nalong path", "msg_90": "Shifted 90%\nalong path"}'></api-example>

## Path.split()

```js
array path.split(Point splitPoint)
```

Splits a path in two halves, on a point along that path that you pass it.

<api-example o="path" m="split"></api-example>

## Path.start()

```js
Point path.start()
```

Returns the Point object at the start of the path.

<api-example o="path" m="start"></api-example>

## Path.translate()

```js
Path path.translate(float deltaX, float deltaY)
```

Returns a path with [a translate transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Translate) applied.

<api-example o="path" m="translate" strings='{"msg_path": "I am a path", "msg_transform": "Now I am transformed"}'></api-example>

## Path.trim()

```js
Path path.trim()
```

Returns a new Path that is this path with overlapping parts removed.

This method is typically used when [Path.offset()](#path-offset) caused some overlap.

> ###### Warning: Use sparsely or performance will suffer
> 
> This method is recursive and complex, and the performance penalty for using it on a long/complex path will be significant.
> 
> To limit the impact of path.trim(), follow this approach:
> 
> - construct a minimal path that contains the overlap
> - trim it
> - now join it to the rest of your path
> 
> You can see an example of this [in the front part of the Bruce pattern](https://github.com/freesewing/bruce/blob/master/src/front.js#L139).

<api-example o="path" m="trim"></api-example>