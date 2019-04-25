---
title: Utils
path: /en/docs/developer/api/utils
components: true
---

## Description

The Utils object bundles utility methods to facilitate your work.

## utils.deg2rad

```js
float deg2rad(float degrees)
```

Returns the degrees you pass to it as radians.

This is useful for when you use methods like `Math.cos()` that expects a corner
in radians, when we typically use degrees.

## utils.beamIntersectsCircle

```js
array | false utils.beamIntersectsCircle(
  Point center, 
  float radius, 
  Point point1, 
  Point point1, 
  string sort = 'x'
)
```

Finds the intersection between an endless line through points `point1` and `point2`
and a circle with its center at point `center` and a radius of `radius` mm.

The 5th and last parameter controls the *sorting* of the found intersections.
This will (almost) always return 2 intersections, and you can choose how 
they are ordered in the returned array:

Set sort to:

 - `x` : The point with the lowest X-coordinate will go first (left to right)
 - `y` : The point with the lowest Y-coordinate will go first (top to bottom)

<api-example o="utils" m="beamintersectscircle"></api-example>

## utils.beamIntersectsX

```js
Point | false utils.beamIntersectsX(Point A, Point B, float X)
```

Finds the intersection between an endless line and a given X-value. Returns a [Point](#point) object
for the intersection, or `false` there is no intersection.

<api-example o="utils" m="beamintersectsx"></api-example>

## utils.beamIntersectsY

```js
Point | false utils.beamIntersectsY(Point A, Point B, float Y)
```

Finds the intersection between an endless line and a given Y-value. Returns a [Point](#point) object
for the intersection, or `false` there is no intersection.

<api-example o="utils" m="beamintersectsy"></api-example>

## utils.beamsIntersect

```js
Point | false utils.beamsIntersect(
  Point A, 
  Point B, 
  Point C, 
  Point D
)
```

Finds the intersection between two endless lines (beams). Returns a [Point](#point) object
for the intersection, or `false` if the lines don't intersect.

<api-example o="utils" m="beamsintersect"></api-example>

## utils.circlesIntersect

```js
array | false utils.circlesIntersect(
  Point centerA, 
  float radiusA, 
  Point centerB, 
  float radiusB, 
  string sort = 'x'
)
```

Finds the intersections between two circles described by their center point and radius.

The 5th and last parameter controls the *sorting* of the found intersections.
When this returns 2 intersections, you can choose how they are ordered in the returned array:

Set sort to:

 - `x` : The point with the lowest X-coordinate will go first (left to right)
 - `y` : The point with the lowest Y-coordinate will go first (top to bottom)

<api-example o="utils" m="circlesintersect"></api-example>

## utils.curveIntersectX

```js
array | Point | false utils.curveIntersectsX(
  Point start, 
  Point cp1,
  Point cp2,
  Point end,
  float x)
```

Finds the point(s) where a curve intersects a given X-value.

This is a low-level variant 
of [`Path.intersectsX()`](/en/docs/developer/api/path/#pathintersectsx).
Instead of a path, you describe a single curve by passing the four
points that describes it.

This returns `false` if no intersections are found, 
a [Point](/en/docs/developer/api/point/) object if 
a single intersection is found, and an array 
of [Point](/en/docs/developer/api/point/) objects if 
multiple intersections are found.

<api-example o="utils" m="curveintersectsx"></api-example>

## utils.curveIntersectY

```js
array | Point | false utils.curveIntersectsY(
  Point start, 
  Point cp1,
  Point cp2,
  Point end,
  float y)
```

Finds the point(s) where a curve intersects a given Y-value.

This is a low-level variant 
of [`Path.intersectsY()`](/en/docs/developer/api/path/#pathintersectsy).
Instead of a path, you describe a single curve by passing the four
points that describes it.

This returns `false` if no intersections are found, 
a [Point](/en/docs/developer/api/point/) object if 
a single intersection is found, and an array 
of [Point](/en/docs/developer/api/point/) objects if 
multiple intersections are found.

<api-example o="utils" m="curveintersectsy"></api-example>

## utils.curvesIntersect

```js
array | false utils.curvesIntersect(
  Point startA, 
  Point Cp1A,
  Point Cp2A,
  Point endA,
  Point startB, 
  Point Cp1B,
  Point Cp2B,
  Point endB)
```

Finds the intersections between two curves described by 4 points each.

<api-example o="utils" m="curvesintersect"></api-example>

## utils.lineIntersectsCircle

```js
array | false utils.lineIntersectsCircle(
  Point center, 
  float radius, 
  Point from, 
  Point to, 
  string sort = 'x'
)
```

Finds the intersection between a line segment from point `from` to point `to`
and a circle with its center at point `center` and a radius of `radius` mm.

The 5th and last parameter controls the *sorting* of the found intersections.
When this returns 2 intersections, you can choose how they are ordered in the returned array:

Set sort to:

 - `x` : The point with the lowest X-coordinate will go first (left to right)
 - `y` : The point with the lowest Y-coordinate will go first (top to bottom)

<api-example o="utils" m="lineintersectscircle"></api-example>

## utils.lineIntersectsCurve

```js
array | false utils.lineIntersectsCurve(
  Point from, 
  Point to, 
  Point start, 
  Point cp1, 
  Point cp2, 
  Point end
)
```

Finds the intersection between a line segment from point `from` to point `to`
and a curve described by points `start`, `cp1`, `cp2, and `end`.

<api-example o="utils" m="lineintersectscurve"></api-example>

## utils.linesIntersect

```js
Point | false utils.linesIntersect(
  Point A, 
  Point B, 
  Point C, 
  Point D
)
```

Finds the intersection between two line segments. Returns a [Point](#point) object
for the intersection, or `false` if the lines don't intersect.

<api-example o="utils" m="linesintersect"></api-example>


## utils.pointOnBeam

```js
bool utils.pointOnBeam(
  Point point1, 
  Point point2, 
  Point check, 
  float precision = 1e6
)
```

Returns `true` if the point `check` lies on the endless line that goes through `point1` and `point2`.
The fourth parameter controls the precision. Lower numbers make the check less precise.

<api-example o="utils" m="pointonbeam"></api-example>

> ###### Tweak precision only when needed
> 
> Typically, you don't need to worry about precision. But occasionally, you may get 
> unexpected results because of floating point errors, rounding errors, or 
> cubic bezier juggling.
> 
> When that happens, you can lower the precision so you get what you expect.

## utils.pointOnLine

```js
bool utils.pointOnLine(
  Point from, 
  Point to, 
  Point check, 
  float precision = 1e6
)
```

Returns `true` if the point `check` lies on a line segment from point `from` to point `to`.

The fourth parameter controls the precision. See [pointOnBeam](#utilspointonbeam).

<api-example o="utils" m="pointonline"></api-example>

## utils.pointOnCurve

```js
bool utils.pointOnCurve(
  Point start, 
  Point cp1, 
  Point cp2, 
  Point end, 
  Point check
)
```

Returns `true` if the point `check` lies on a curve described by points `start`, `cp1`, `cp2`, and `end`.

> Note that calculations with Bezier curves are never fully precise.

<api-example o="utils" m="pointoncurve"></api-example>

## utils.stretchToScale

```js
float utils.stretchToScale(float stretch)
```

The way people measure stretch intuitively is different from the way we handle stretch in code.

When people say *25% stretch* they mean that 10cm fabric gets stretched to 12.5cm fabric.
In code and on our patterns, that means we need to scale things by 80%.

This method does that by returning:

```js
1 / (1 + parseFloat(stretch));
```

## utils.round

```js
float utils.round(float value)
```

Rounds a value to two decimals. For example:

 - 0.1234 becomes 0.12
 - 5.6789 becomes 5.68

> The [Part.shorthand](/en/docs/developer/api/part#partshorthand) exposes a context-aware
> `unit()` method that will call this method and pass it the units requested by the user.

## utils.units

```js
string utils.units(float value, string format = 'metric')
```

Converts the units `value` you pass it into a formatted string for the `format` you pass it.

Format must be either `imperial` or `metric` (the default).


