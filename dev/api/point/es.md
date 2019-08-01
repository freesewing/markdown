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

This `Point.attr()` method calls `this.attributes.add()` under the hood, but returns the Point object. This allows you to chain different calls together as in the example below.

If the third parameter is set to `true` it will call `this.attributes.set()` instead, thereby overwriting the value of the attribute.

### Points.attr() example

<Example part="point_attr" caption="An example of the Point.attr() method" />

```js
let { Point, points } = part.shorthand();

points.anchor = new Point(100, 25)
  .attr("data-text", "freesewingIsMadeByJoostDeCockAndContributors")
  .attr("data-text-class", "center");
```

## dx()

```js
float point.dx(Point point)
```

Returns de delta along the X-axis between this point and the point you pass it.

### Points.dx() example

<Example part="point_dx" caption="An example of the Point.dx() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.from = new Point(10, 10);
points.to = new Point(90, 40);

macro("hd", {
  from: points.from,
  to: points.to,
  y: 25
});
```

## dy()

```js
float point.dy(Point point)
```

Returns de delta along the Y-axis between this point and the point you pass it.

### Points.dy() example

<Example part="point_dy" caption="An example of the Point.dy() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.from = new Point(10, 10);
points.to = new Point(90, 40);

macro("vd", {
  from: points.to,
  to: points.from,
  x: 50
});
```

## dist()

```js
float point.dist(Point point)
```

Returns the distance between this point and the point you pass it.

### Points.dist() example

<Example part="point_dist" caption="An example of the Point.dist() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.from = new Point(10, 10);
points.to = new Point(90, 40);

macro("ld", {
  from: points.from,
  to: points.to
});
```

## angle()

```js
float point.angle(Point point)
```

Returns the angle made by a line from this point to the point you pass it.

### Points.angle() example

<Example part="point_angle" caption="An example of the Point.angle() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.sun = new Point(10, 5);
points.moon = points.sun.shift(-15, 70);
points.text = points.sun
  .shiftFractionTowards(points.moon, 0.8)
  .attr("data-text", points.sun.angle(points.moon)+"°")
  .attr("data-text-class", "text-sm fill-note center");

paths.line = new Path()
  .move(points.sun)
  .line(points.moon)
  .attr("class", "dashed");
```

## rotate()

```js
Point point.rotate(float angle, Point center)
```

Rotates a point the number of degrees you pass it around the point you pass it.

### Point.rotate() example

<Example part="point_rotate" caption="An example of the Point.rotate() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.sun = new Point(40, 40);
points.moon = new Point(70, 40);
let step = 360 / 36;
for (let i = 1; i < 37; i++) {
  let angle = step * i;
  points[`moon${i}`] = points.moon.rotate(angle, points.sun);
  paths[`moon${i}`] = new Path().move(points.sun).line(points[`moon${i}`]);
}
```

## flipX()

```js
Point point.flipX(Point mirror = false)
```

Returns a new point that mirrors this point around the X-value of the point your pass it.

If you don't pass it a point, it will mirror around an X-value of zero.

### Point.flipX() example

<Example part="point_flipx" caption="An example of the Point.flipX() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.top = new Point(50, 10);
points.out1 = new Point(70, 30);
points.in1 = new Point(55, 35);
points.out2 = new Point(75, 50);
points.in2 = new Point(60, 55);
points.out3 = new Point(80, 70);
points.in3 = new Point(55, 70);
points.trunkOut = new Point(55, 80);
points.trunkIn = new Point(50, 80);

points._out1 = points.out1.flipX(points.top);
points._in1 = points.in1.flipX(points.top);
points._out2 = points.out2.flipX(points.top);
points._in2 = points.in2.flipX(points.top);
points._out3 = points.out3.flipX(points.top);
points._in3 = points.in3.flipX(points.top);
points._trunkOut = points.trunkOut.flipX(points.top);

points.bottom = new Point(50, 80);

paths.tree = new Path()
  .move(points.top)
  .line(points.out1)
  .line(points.in1)
  .line(points.out2)
  .line(points.in2)
  .line(points.out3)
  .line(points.in3)
  .line(points.trunkOut)
  .line(points._trunkOut)
  .line(points._in3)
  .line(points._out3)
  .line(points._in2)
  .line(points._out2)
  .line(points._in1)
  .line(points._out1)
  .close();

paths.mirror = new Path()
  .move(points.top)
  .line(points.bottom)
  .attr("class", "note dashed");
```

## flipY()

```js
Point point.flipY(Point mirror = false)
```

Returns a new point that mirrors this point around the Y-value of the point your pass it.

If you don't pass it a point, it will mirror around a Y-value of zero.

### Point.flipX() example

<Example part="point_flipy" caption="An example of the Point.flipY() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.start = new Point(0, 50);
points.churchTowerWallLeft = new Point(10, 50);
points.churchTowerRoofLeft = new Point(10, 30);
points.churchTowerTop = new Point(15, 10);
points.churchTowerRoofRight = new Point(20, 30);
points.churchRoofRight = new Point(50, 30);
points.churchWallRight = new Point(50, 50);
points.houseWallLeft = new Point(65, 50);
points.houseRoofLeft = new Point(65, 35);
points.houseRoofTop = new Point(75, 25);
points.houseRoofRight = new Point(85, 35);
points.houseWallRight = new Point(85, 50);
points.end = new Point(95, 50);

points.mirror = new Point(0, 60);
points.mirrorLineEnd = new Point(95, 60);

points._start = points.start.flipY(points.mirror);
points._churchTowerWallLeft = points.churchTowerWallLeft.flipY(points.mirror);
points._churchTowerRoofLeft = points.churchTowerRoofLeft.flipY(points.mirror);
points._churchTowerTop = points.churchTowerTop.flipY(points.mirror);
points._churchTowerRoofRight = points.churchTowerRoofRight.flipY(
  points.mirror
);
points._churchRoofRight = points.churchRoofRight.flipY(points.mirror);
points._churchWallRight = points.churchWallRight.flipY(points.mirror);
points._houseWallLeft = points.houseWallLeft.flipY(points.mirror);
points._houseRoofLeft = points.houseRoofLeft.flipY(points.mirror);
points._houseRoofTop = points.houseRoofTop.flipY(points.mirror);
points._houseRoofRight = points.houseRoofRight.flipY(points.mirror);
points._houseWallRight = points.houseWallRight.flipY(points.mirror);
points._end = points.end.flipY(points.mirror);

paths.skylineTop = new Path()
  .move(points.start)
  .line(points.churchTowerWallLeft)
  .line(points.churchTowerRoofLeft)
  .line(points.churchTowerTop)
  .line(points.churchTowerRoofRight)
  .line(points.churchRoofRight)
  .line(points.churchWallRight)
  .line(points.houseWallLeft)
  .line(points.houseRoofLeft)
  .line(points.houseRoofTop)
  .line(points.houseRoofRight)
  .line(points.houseWallRight)
  .line(points.end);
```

## shift()

```js
Point point.shift(float degrees, float distance)
```

Returns a point that lies distance in the direction of degrees from this point.

### Point.shift() example

<Example part="point_shift" caption="An example of the Point.shift() method" />

```js
let { Point, points, macro } = part.shorthand();

points.A = new Point(90, 40)
  .attr("data-text", "Point A")
  .attr("data-text-class", "right");
points.B = points.A.shift(155, 70)
  .attr("data-text", "Point B is point A shifted 7cm\nat a 155 degree angle")
  .attr("data-text-lineheight", 6);

macro("ld", {
  from: points.B,
  to: points.A,
  d: -10
});
```

## shiftTowards()

```js
Point point.shiftTowards(Point target, float distance)
```

Returns a point that lies distance in the direction of target.

### Point.shiftTowards() example

<Example part="point_shifttowards" caption="An example of the Point.shiftTowards() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(90, 70).attr("data-text", "Point A");
points.B = new Point(10, 10).attr("data-text", "Point B");
points.C = points.A.shiftTowards(points.B, 35)
  .attr(
    "data-text",
    "Point C is point A shifted 3.5cm\nin the direction of point B"
  )
  .attr("data-text-class", "center")
  .attr("data-text-lineheight", 6);

paths.direction = new Path()
  .move(points.A)
  .line(points.B)
  .attr("class", "note dashed");

macro("ld", {
  from: points.C,
  to: points.A,
  d: -10
});
```

## shiftFractionTowards()

```js
Point point.shiftFractionTowards(Point target, float fraction)
```

Returns a point that is shifted towards the target by a fraction of the distance between this point and the target.

### Point.shiftFractionTowards() example

<Example part="point_shiftfractiontowards" caption="An example of the Point.shiftFractionTowards() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(90, 70).attr("data-text", "Point A");
points.B = new Point(10, 10).attr("data-text", "Point B");
points.C = points.A.shiftFractionTowards(points.B, 0.5)
  .attr(
    "data-text",
    "Point C is point A shifted 50%\nin the direction of point B"
  )
  .attr("data-text-class", "center")
  .attr("data-text-lineheight", 6);

paths.direction = new Path()
  .move(points.A)
  .line(points.B)
  .attr("class", "note dashed");

macro("ld", {
  from: points.C,
  to: points.A,
  d: -10
});

macro("ld", {
  from: points.B,
  to: points.A,
  d: 20
});
```

## shiftOutwards()

```js
Point point.shiftOutwards(Point direction, float distance)
```

Returns a point that is shifted distance beyond target in the direction of target.

### Point.shiftOutwards() example

<Example part="point_shiftoutwards" caption="An example of the Point.shiftOutwards() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(90, 70).attr("data-text", "Point A");
points.B = new Point(10, 10).attr("data-text", "Point B");
points.C = points.A.shiftOutwards(points.B, 30)
  .attr("data-text", "Point C is point A shifted 3cm\nbeyond point B")
  .attr("data-text-lineheight", 6);

paths.direction = new Path()
  .move(points.A)
  .line(points.C)
  .attr("class", "note dashed");

macro("ld", {
  from: points.C,
  to: points.B,
  d: -10
});
```

## translate()

```js
Point point.translate(float deltaX, float deltaY)
```

Returns a point with [a translate transform](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate) applied.

In other words, this will:

- Add `deltaX` to the point's X-coordinate
- Add `deltaY` to the point's Y-coordinate

### Point.translate() example

<Example part="point_translate" caption="An example of the Point.translate() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.A = new Point(10, 10).attr("data-text", "Point A");
points.B = points.A.translate(120, 60)
  .attr(
    "data-text",
    "Point B is point A with a\ntranslate(120, 60)\ntransform applied"
  )
  .attr("data-text-class", "right")
  .attr("data-text-dy", -6)
  .attr("data-text-lineheight", 6);

snippets.A = new Snippet("x", points.A);
snippets.B = new Snippet("x", points.B);

macro("ld", {
  from: points.A,
  to: points.B,
  text: "translate(120,60)",
  noStartMarker: true
});
```

## sitsOn()

```js
bool point.sitsOn(Point check)
```

Returns true is the point has the same coordinates as the one you pass to it.

### Point.sitsOn() example

<Example part="point_sitson" caption="An example of the Point.sitsOn() method" />

```js
let { Point, points, Snippet, snippets } = part.shorthand();

let s;
for (let i = 0; i < 10; i++) {
  points[`a${i}`] = new Point(i * 10, 40);
  points[`b${i}`] = new Point(i * 10, i * 8);
  if (points[`a${i}`].sitsOn(points[`b${i}`])) s = "notch";
  else s = "bnotch";
  snippets[`b${i}`] = new Snippet(s, points[`b${i}`]);
  snippets[`a${i}`] = new Snippet(s, points[`a${i}`]);
}
```

## sitsRoughlyOn()

```js
bool point.sitsRoughlyOn(Point check)
```

Returns true is the point has roughly the same coordinates as the one you pass to it.

<Note>

###### How rough?

The difference between this method and [Point.sitsOn](#pointsitson) is that this one rounds things down to the nearest integer (thus mm) before checking.

</Note>

### Points.sitsRoughlyOn() example

<Example part="point_sitsroughlyon" caption="An example of the Point.sitsRoughlyOn() method" />

```js
let { Point, points, Snippet, snippets } = part.shorthand();

box(part);

let s;
for (let i = 0; i < 10; i++) {
  points[`a${i}`] = new Point(i * 10, 40);
  points[`b${i}`] = new Point(i * 10, i * 8);
  if (points[`a${i}`].sitsRoughlyOn(points[`b${i}`])) s = "notch";
  else s = "bnotch";
  snippets[`b${i}`] = new Snippet(s, points[`b${i}`]);
  snippets[`a${i}`] = new Snippet(s, points[`a${i}`]);
}
```

## copy()

```js
Point point.copy()
```

Returns a new point with the same coordinates as this point.

### Points.copy() example

<Example part="point_copy" caption="An example of the Point.copy() method" />

```js
let { Point, points, Snippet, snippets } = part.shorthand();

points.A = new Point(50, 25)
  .attr("data-text", "Point A")
  .attr("data-text-class", "text-xl");
points.B = points.A.copy().attr("data-text", "Point B");

snippets.x = new Snippet("notch", points.A);
```

## clone()

    Point point.clone()
    

Returns a new point with the same coordinates and attributes as this point.

<Note>

###### Copy vs clone

The `Point.copy()` method will only copy the point's coordinates, whereas this `Point.clone()` method will also copy its attributes.

</Note>

### Point.clone() example

<Example part="point_clone" caption="An example of the Point.clone() method" />

```js
  let { Point, points, Snippet, snippets } = part.shorthand();

  points.A = new Point(25, 25)
    .attr("data-text", "Point A")
    .attr("data-text-class", "text-xl")
    .attr("data-text-fill-opacity", "0.5");
  points.B = points.A.clone().attr("data-text", "Point B");

  snippets.x = new Snippet("notch", points.A);
```