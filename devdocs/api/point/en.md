---
title: Point
path: /en/docs/developer/api/point
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

## Point.attr()

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

<api-example o="point" m="attr" box="1" strings='{ "msg": "Hello world!\nThis is\na line break"}'></api-example>

## Point.dx()

```js
float point.dx(Point point)
```

Returns de delta along the X-axis between this point and the point you pass it.

<api-example o="point" m="dx" ></api-example>

## Point.dy()

```js
float point.dy(Point point)
```

Returns de delta along the Y-axis between this point and the point you pass it.

<api-example o="point" m="dy" ></api-example>

## Point.dist()

```js
float point.dist(Point point)
```

Returns the distance between this point and the point you pass it.

<api-example o="point" m="dist" ></api-example>

## Point.angle()

```js
float point.angle(Point point)
``` 

Returns the angle made by a line from this point to the point you pass it.

<api-example o="point" m="angle" ></api-example>

## Point.rotate()

```js
Point point.rotate(float angle, Point center)
``` 

Rotates a point the number of degrees you pass it around the point you pass it.

<api-example o="point" m="rotate" ></api-example>

## Point.flipx()

```js
Point point.flipX(Point mirror = false)
```

Returns a new point that mirrors this point around the X-value of the point your pass it.

If you don't pass it a point, it will mirror around an X-value of zero.

<api-example o="point" m="flipx" ></api-example>

## Point.flipY()

```js
Point point.flipY(Point mirror = false)
```

Returns a new point that mirrors this point around the Y-value of the point your pass it.

If you don't pass it a point, it will mirror around a Y-value of zero.

<api-example o="point" m="flipy" ></api-example>

## Point.shift()

```js
Point point.shift(float degrees, float distance)
```

Returns a point that lies distance in the direction of degrees from this point.

<api-example o="point" m="shift" ></api-example>

## Point.shiftTowards()

```js
Point point.shiftTowards(Point target, float distance)
```

Returns a point that lies distance in the direction of target.

<api-example o="point" m="shifttowards" ></api-example>

## Point.shiftFractionTowards()

```js
Point point.shiftFractionTowards(Point target, float fraction)
```

Returns a point that is shifted towards the target by a fraction of the distance between this point and the target.

<api-example o="point" m="shiftfractiontowards" ></api-example>

## Point.shiftOutwards()

```js
Point point.shiftOutwards(Point direction, float distance)
```

Returns a point that is shifted distance beyond target in the direction of target.

<api-example o="point" m="shiftshiftoutwards" ></api-example>

## Point.translate()
 
```js
Point point.translate(float deltaX, float deltaY)
```

Returns a point with 
[a translate transform](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate) 
applied. 

In other words, this will:

 - Add `deltaX` to the point's X-coordinate
 - Add `deltaY` to the point's Y-coordinate

<api-example o="point" m="transform" ></api-example>

## Point.sitsOn()

```js
bool point.sitsOn(Point check)
```

Returns true is the point has the same coordinates as the one you pass to it.

<api-example o="point" m="sitson" ></api-example>

## Point.sitsRoughlyOn()

```js
bool point.sitsRoughlyOn(Point check)
```

Returns true is the point has roughly the same coordinates as the one you pass to it.

> ###### How rough?
> The difference between this method and [Point.sitsOn](#pointsitson) is that this one rounds things down to the nearest integer (thus mm) before checking.

<api-example o="point" m="sitsroughlyon" ></api-example>

## Point.copy()

```js
Point point.copy()
```

Returns a new point with the same coordinates as this point.

<api-example o="point" m="copy" ></api-example>

## Point.clone()
```
Point point.clone()
```

Returns a new point with the same coordinates and attributes as this point.

<api-example o="point" m="clone" ></api-example>

> ###### Copy vs clone
> The `Point.copy()` method will only copy the point's coordinates, whereas this
> `Point.clone()` method will also copy its attributes.
