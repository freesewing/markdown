---
title: Path
---

A path represents an SVG path; The lines and curves on our pattern. 

The Path constructor takes no arguments:

```js
Path new Path();
```

A Path objects comes with the following properties:

 - `render` : Set this to `false` to not render the path (exclude it from the output)
 - `attributes` : An [Attributes](/api/attributes) instance holding the path's attributes

In addition, a Part object exposes the following methods:

## move()

```js
Path path.move(Point to)
```

Moves to a given point without drawing a line. 

<Example 
  part="path_ops" 
  caption="Example of the Path.move() method" 
  options={{focus: 'move'}}
/>

<Tip>

###### Always start your path with a move

When drawing a path, you must always start with a `move()` call, 
followed by your `line()` and/or `curve()` calls
and an optional `close()` call.

These calls are chainable, making your code easier to read:
 
```js
paths.example = new Path()
  .move(points.a)
  .curve(points.b, points.c, points.d)
  .line(points.e)
  .close();
```

</Tip>


## line()

```js
Path path.line(Point to)
```

Draws a straight line from the current position to a given point.

<Example 
  part="path_ops" 
  caption="Example of the Path.line() method" 
  options={{focus: 'line'}}
/>

## curve()

```js
Path path.curve(Point cp1, Point cp2, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint.

<Example 
  part="path_ops" 
  caption="Example of the Path.curve() method" 
  options={{focus: 'curve'}}
/>


## \_curve()
 
```js
Path path._curve(Point cp2, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint.
However, the start control point is identical to the start point.

<Example 
  part="path_ops" 
  caption="Example of the Path._curve() method" 
  options={{focus: '_curve'}}
/>

<Tip>

###### This method exists to save you some typing

Note that the two following calls yield the same result:

```js
.curve(point1, point1, point2)
._curve(point1, point2)
```

So the only purpose of this method is to save your some typing.

</Tip>

## curve\_()

```js
Path path.curve_(Point cp1, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint.
However, the end control point is identical to the end point.

<Example 
  part="path_ops" 
  caption="Example of the Path.curve_() method" 
  options={{focus: 'curve_'}}
/>


<Tip>

###### This method exists to save you some typing

Note that the two following calls yield the same result:

```js
.curve(point1, point2, point2)
.curve_(point1, point2)
```

So the only purpose of this method is to save your some typing;

</Tip>

## close()

```js
Path path.close()
```

Closes a path by drawing a straight line from the current position to the path's start.

<Example 
  part="path_ops" 
  caption="Example of the Path.close() method" 
  options={{focus: 'close'}}
/>

## attr()

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

<Example 
  part="path_attr" 
  caption="Example of the Path.attr() method" 
/>

## clone()

```js
Path path.clone()
```

Returns a new Path that is a deep copy of this path.

<Example 
  part="path_clone" 
  caption="Example of the Path.clone() method" 
/>

## divide()

```js
array path.divide()
```

Breaks a path apart in an array of atomic paths. An atomic path is a path that can't be divided further and is
always made up of one move + one drawing operation.

<Example 
  part="path_divide" 
  caption="Example of the Path.divide() method" 
/>

## edge()

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

<Example 
  part="path_edge" 
  caption="Example of the Path.edge() method" 
/>

## end()

```js
Point path.end()
```

Returns the Point object at the end of the path.

<Example 
  part="path_end" 
  caption="Example of the Path.end() method" 
/>

## intersects()

```
array|false path.intersects(Path path)
```

Returns the Point object(s) where the path intersects with a path you pass it.

<Tip>

###### Use the intersection methods in Utils whenever possible

This is an expensive (read: slow) method that you should only use when you don't know
in advance in what segment of your path the intersection will occur.

If you do know, use one of the intersection methods in [Utils](/api/utils).

</Tip>

<Example 
  part="path_intersects" 
  caption="Example of the Path.intersects() method" 
/>

## intersectsX()

```js
array|false path.intersectsX(float x)
```

Returns the Point object(s) where the path intersects with a given X-value.

<Example 
  part="path_intersectsx" 
  caption="Example of the Path.intersectsX() method" 
/>

## intersectsY()

```js
array|false path.intersectsY(float y)
```

Returns the Point object(s) where the path intersects with a given Y-value.

<Example 
  part="path_intersectsy" 
  caption="Example of the Path.intersectsY() method" 
/>

## join()

```js
Path path.join(path other)
```

Joins this path with another path.

<Example 
  part="path_join" 
  caption="Example of the Path.join() method" 
/>

<Warning>

You cannot join a closed path to another path

</Warning>

## length()

```js
float path.length()
```

Returns the length of the path.

<Example 
  part="path_length" 
  caption="Example of the Path.length() method" 
/>

## offset()
 
```js
Path path.offset(float distance)
```

Returns a new Path that is offset by distance from the original path.

<Example 
  part="path_offset" 
  caption="Example of the Path.offset() method" 
/>

## reverse()

```js
Path path.reverse()
```

Returns a path that is the reversed version of this path. As in, start becomes end, and end becomes start.

<Example 
  part="path_reverse" 
  caption="Example of the Path.reverse() method" 
/>

## shiftAlong()

```js
Point path.shiftAlong(float distance)
```

Returns a point that lies at distance travelled along the path.

<Example 
  part="path_shiftalong" 
  caption="Example of the Path.shiftAlong() method" 
/>


## shiftFractionAlong()

```js
Point path.shiftFractionAlong(float fraction)
```

Returns a point that lies at fraction of the length of the path travelled along the path.

<Example 
  part="path_shiftfractionalong" 
  caption="Example of the Path.shiftFractionAlong() method" 
/>


## split()
 
```js
array path.split(Point splitPoint)
```

Splits a path in two halves, on a point along that path that you pass it.

<Example 
  part="path_split" 
  caption="Example of the Path.split() method" 
/>


## start()

```js
Point path.start()
```

Returns the Point object at the start of the path.

<Example 
  part="path_start" 
  caption="Example of the Path.start() method" 
/>

## translate()
 
```js
Path path.translate(float deltaX, float deltaY)
```

Returns a path with 
[a translate transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Translate)
applied.

<Example 
  part="path_translate" 
  caption="Example of the Path.translate() method" 
/>

## trim()

```js
Path path.trim()
```

Returns a new Path that is this path with overlapping parts removed.

This method is typically used when [Path.offset()](#offset) caused some overlap.

<Warning>

###### Use sparsely or performance will suffer

This method is recursive and complex, and the performance penalty for using
it on a long/complex path will be significant.

To limit the impact of path.trim(), follow this approach:

 - construct a minimal path that contains the overlap
 - trim it
 - now join it to the rest of your path

You can see an example of this 
[in the front part of the Bruce pattern](https://github.com/freesewing/freesewing/blob/develop/packages/bruce/src/front.js#L195).

</Warning>

<Example 
  part="path_trim" 
  caption="Example of the Path.trim() method" 
/>
