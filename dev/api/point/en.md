---
title: Point
---

A Point object represents a point on a 2D plane with an X and Y axis.

Point objects come with the following properties:

 - `x` : The X-coordinate of the point
 - `y` : The Y-coordinate of the point
 - `attributes` : An [Attributes](../attributes) instance holding the point's attributes

The point constructor takes two arguments:

 - `x` : The X-coordinate of the point
 - `y` : The Y-coordinate of the point

```js
Point new Point(x, y);
```

In addition, a Point object exposes the following methods:

## attr()

```js
Point point.attr(
  string name, 
  mixed value, 
  bool overwrite = false
)
```

This `Point.attr()` method calls `this.attributes.add()` under the hood, but returns the Point object.
This allows you to chain different calls together as in the example below.

If the third parameter is set to `true` it will call `this.attributes.set()` instead, thereby overwriting the value of the attribute.

<Example 
  part="point_attr"
  caption="An example of the Point.attr() method"
/>

## dx()

```js
float point.dx(Point point)
```

Returns de delta along the X-axis between this point and the point you pass it.

<Example 
  part="point_dx"
  caption="An example of the Point.dx() method"
/>

## dy()

```js
float point.dy(Point point)
```

Returns de delta along the Y-axis between this point and the point you pass it.

<Example 
  part="point_dy"
  caption="An example of the Point.dy() method"
/>

## dist()

```js
float point.dist(Point point)
```

Returns the distance between this point and the point you pass it.

<Example 
  part="point_dist"
  caption="An example of the Point.dist() method"
/>

## angle()

```js
float point.angle(Point point)
``` 

Returns the angle made by a line from this point to the point you pass it.

<Example 
  part="point_angle"
  caption="An example of the Point.angle() method"
/>

## rotate()

```js
Point point.rotate(float angle, Point center)
``` 

Rotates a point the number of degrees you pass it around the point you pass it.

<Example 
  part="point_rotate"
  caption="An example of the Point.rotate() method"
/>

## flipX()

```js
Point point.flipX(Point mirror = false)
```

Returns a new point that mirrors this point around the X-value of the point your pass it.

If you don't pass it a point, it will mirror around an X-value of zero.

<Example 
  part="point_flipx"
  caption="An example of the Point.flipX() method"
/>

## flipY()

```js
Point point.flipY(Point mirror = false)
```

Returns a new point that mirrors this point around the Y-value of the point your pass it.

If you don't pass it a point, it will mirror around a Y-value of zero.

<Example 
  part="point_flipy"
  caption="An example of the Point.flipY() method"
/>

## shift()

```js
Point point.shift(float degrees, float distance)
```

Returns a point that lies distance in the direction of degrees from this point.

<Example 
  part="point_shift"
  caption="An example of the Point.shift() method"
/>

## shiftTowards()

```js
Point point.shiftTowards(Point target, float distance)
```

Returns a point that lies distance in the direction of target.

<Example 
  part="point_shift"
  caption="An example of the Point.shiftTowards() method"
/>

## shiftFractionTowards()

```js
Point point.shiftFractionTowards(Point target, float fraction)
```

Returns a point that is shifted towards the target by a fraction of the distance between this point and the target.

<Example 
  part="point_shiftfractiontowards"
  caption="An example of the Point.shiftFractionTowards() method"
/>

## shiftOutwards()

```js
Point point.shiftOutwards(Point direction, float distance)
```

Returns a point that is shifted distance beyond target in the direction of target.

<Example 
  part="point_shiftoutwards"
  caption="An example of the Point.shiftOutwards() method"
/>

## translate()
 
```js
Point point.translate(float deltaX, float deltaY)
```

Returns a point with 
[a translate transform](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate) 
applied. 

In other words, this will:

 - Add `deltaX` to the point's X-coordinate
 - Add `deltaY` to the point's Y-coordinate

<Example 
  part="point_translate"
  caption="An example of the Point.translate() method"
/>

## sitsOn()

```js
bool point.sitsOn(Point check)
```

Returns true is the point has the same coordinates as the one you pass to it.

<Example 
  part="point_sitson"
  caption="An example of the Point.sitsOn() method"
/>

## sitsRoughlyOn()

```js
bool point.sitsRoughlyOn(Point check)
```

Returns true is the point has roughly the same coordinates as the one you pass to it.

<Note>

###### How rough?

The difference between this method and [Point.sitsOn](#pointsitson) is that this one rounds things down to the nearest integer (thus mm) before checking.

</Note>

<Example 
  part="point_sitsroughlyon"
  caption="An example of the Point.sitsRoughlyOn() method"
/>

## copy()

```js
Point point.copy()
```

Returns a new point with the same coordinates as this point.

<Example 
  part="point_copy"
  caption="An example of the Point.copy() method"
/>


## clone()
```
Point point.clone()
```

Returns a new point with the same coordinates and attributes as this point.

<Example 
  part="point_clone"
  caption="An example of the Point.clone() method"
/>

<Note>

###### Copy vs clone

The `Point.copy()` method will only copy the point's coordinates, whereas this
`Point.clone()` method will also copy its attributes.

</Note>

