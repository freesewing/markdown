---
title: Chemin
---

Un chemin représente un chemin SVG; les lignes et les courbes de notre patron.

Le constructeur de chemin Path ne prend aucun argument :

```js
Path new Path();
```

Un objet chemin Path vient avec les propriétés suivantes :

- `render` : Set this to `false` to not render the path (exclude it from the output)
- `attributes` : An [Attributes](/api/attributes) instance holding the path's attributes

In addition, a Path object exposes the following methods:

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

### Path.attr() example

<Example part="path_attr" caption="Example of the Path.attr() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.B = new Point(10, 50);
points.BCp2 = new Point(40, 10);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, 90);

paths.example = new Path()
  .move(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .attr("class", "canvas")
  .attr("data-text", "freesewingIsMadeByJoostDeCockAndContributors")
  .attr("data-text-class", "text-xs center");
```

## close()

```js
Path path.close()
```

Closes a path by drawing a straight line from the current position to the path's start.

### Path.close() example

<Example part="path_close" caption="Example of the Path.close() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.from = new Point(10, 20);
points.cp2 = new Point(60, 30);
points.to = new Point(90, 20);

paths.line = new Path()
  .move(points.from)
  ._curve(points.cp2, points.to)
  .close()
  .reverse() // To keep text from being upside-down
  .attr("data-text", "Path._close()")
  .attr("data-text-class", "text-sm right fill-note");
```

## clone()

```js
Path path.clone()
```

Returns a new Path that is a deep copy of this path.

### Path.clone() example

<Example part="path_clone" caption="Example of the Path.clone() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.example = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C);

paths.clone = paths.example
    .clone()
    .attr("class", "note lashed stroke-l")
    .attr("style", "stroke-opacity: 0.5");
```

## curve()

```js
Path path.curve(Point cp1, Point cp2, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint.

### Path.curve() example

<Example part="path_curve" caption="Example of the Path.curve() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.from = new Point(10, 20);
points.cp1 = new Point(40, 0);
points.cp2 = new Point(60, 30);
points.to = new Point(90, 20);

paths.line = new Path()
  .move(points.from)
  .curve(points.cp1, points.cp2, points.to)
  .attr("data-text", "Path.curve()")
  .attr("data-text-class", "text-sm center fill-note");
```

## \_curve()

```js
Path path._curve(Point cp2, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint. However, the start control point is identical to the start point.

<Tip>

###### This method exists to save you some typing

Note that the two following calls yield the same result:

```js
.curve(point1, point1, point2)
._curve(point1, point2)
```

So the only purpose of this method is to save your some typing.

</Tip>

### Path.\_curve() example

<Example part="path__curve" caption="Example of the Path._curve() method" />

```js
  let { Point, points, Path, paths } = part.shorthand();

  points.from = new Point(5, 20);
  points.cp2 = new Point(60, 30);
  points.to = new Point(90, 20);

  paths.line = new Path()
    .move(points.from)
    ._curve(points.cp2, points.to)
    .attr("data-text", "Path._curve()")
    .attr("data-text-class", "text-sm center fill-note");
```

## curve\_()

```js
Path path.curve_(Point cp1, Point to)
```

Draws a cubic Bezier curve from the current position via two control points to a given endpoint. However, the end control point is identical to the end point.

<Tip>

###### This method exists to save you some typing

Note that the two following calls yield the same result:

```js
.curve(point1, point2, point2)
.curve_(point1, point2)
```

So the only purpose of this method is to save your some typing;

</Tip>

### Path.curve\_() example

<Example part="path_curve_" caption="Example of the Path.curve_() method" />

```js
  let { Point, points, Path, paths } = part.shorthand();

  points.from = new Point(10, 20);
  points.cp1 = new Point(40, 0);
  points.to = new Point(90, 20);

  paths.line = new Path()
    .move(points.from)
    .curve_(points.cp1, points.to)
    .attr("data-text", "Path.curve_()")
    .attr("data-text-class", "text-sm center fill-note");
```

## divide()

```js
array path.divide()
```

Breaks a path apart in an array of atomic paths. An atomic path is a path that can't be divided further and is always made up of one move + one drawing operation.

### Path.divide() example

<Example part="path_divide" caption="Example of the Path.divide() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.A = new Point(55, 40);
points.B = new Point(10, 70);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 60);
points.CCp1 = new Point(50, -30);
points.D = new Point(50, 80);
points.DCp1 = new Point(140, 50);

paths.example = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .curve(points.DCp1, points.DCp1, points.D)
  .close();

let style = "stroke-width: 4; stroke-opacity: 0.5;";
let i = 0;
for (let p of paths.example.divide()) {
  i++;
  paths[i] = p
    .attr("style", style)
    .attr("style", `stroke: hsl(${i * 70}, 100%, 50%)`);
}
```

## edge()

```js
Point path.edge(string side)
```

Returns the Point object at the edge of the path you specify. Edge must be one of:

- `top`
- `bottom`
- `left`
- `right`
- `topLeft`
- `topRight`
- `bottomLeft`
- `bottomRight`

### Path.edge() example

<Example part="path_edge" caption="Example of the Path.edge() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);
points.D = new Point(-60, 90);
points.E = new Point(90, 190);

paths.demo = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .curve(points.E, points.D, points.A)
  .close();

for (let i of [
  "topLeft",
  "topRight",
  "bottomLeft",
  "bottomRight",
  "top",
  "left",
  "bottom",
  "right"
]) snippets[i] = new Snippet("notch", paths.demo.edge(i));
```

## end()

```js
Point path.end()
```

Returns the Point object at the end of the path.

### Path.end() example

<Example part="path_end" caption="Example of the Path.end() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.demo = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C);

snippets.end = new Snippet("notch", paths.demo.end());
```

## intersects()

    array|false path.intersects(Path path)
    

Returns the Point object(s) where the path intersects with a path you pass it.

<Tip>

###### Use the intersection methods in Utils whenever possible

This is an expensive (read: slow) method that you should only use when you don't know in advance in what segment of your path the intersection will occur.

If you do know, use one of the intersection methods in [Utils](/api/utils).

</Tip>

### Path.intersects() example

<Example part="path_intersects" caption="Example of the Path.intersects() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);
points.D = new Point(50, 130);
points.DCp1 = new Point(150, 30);

points._A = new Point(55, 40);
points._B = new Point(0, 55);
points._BCp2 = new Point(40, -20);
points._C = new Point(90, 40);
points._CCp1 = new Point(50, -30);
points._D = new Point(40, 120);
points._DCp1 = new Point(180, 40);

paths.demo1 = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .curve(points.DCp1, points.DCp1, points.D);
paths.demo2 = new Path()
  .move(points._A)
  .line(points._B)
  .curve(points._BCp2, points._CCp1, points._C)
  .curve(points._DCp1, points._DCp1, points._D);

for (let p of paths.demo1.intersects(paths.demo2)) {
  snippets[part.getId()] = new Snippet("notch", p);
}
```

## intersectsX()

```js
array|false path.intersectsX(float x)
```

Returns the Point object(s) where the path intersects with a given X-value.

### Path.intersectsX() example

<Example part="path_intersectsx" caption="Example of the Path.intersectsX() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(95, 50);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);
points.D = new Point(50, 130);
points.DCp1 = new Point(150, 30);

points.top = new Point(60, -10);
points.bot = new Point(60, 140);

paths.line = new Path()
  .move(points.top)
  .line(points.bot)
  .attr("class", "lining dashed");

paths.demo = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .curve(points.DCp1, points.DCp1, points.D);

for (let p of paths.demo.intersectsX(60)) {
  snippets[part.getId()] = new Snippet("notch", p);
}
```

## intersectsY()

```js
array|false path.intersectsY(float y)
```

Returns the Point object(s) where the path intersects with a given Y-value.

### Path.intersectsY() example

<Example part="path_intersectsy" caption="Example of the Path.intersectsY() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(55, 40);
points.B = new Point(10, 70);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 60);
points.CCp1 = new Point(50, -30);
points.D = new Point(50, 80);
points.DCp1 = new Point(140, 50);

points.top = new Point(10, 58);
points.bot = new Point(130, 58);

paths.line = new Path()
  .move(points.top)
  .line(points.bot)
  .attr("class", "lining dashed");

paths.demo = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .curve(points.DCp1, points.DCp1, points.D);

for (let p of paths.demo.intersectsY(58)) {
  snippets[part.getId()] = new Snippet("notch", p);
}
```

## join()

```js
Path path.join(path other)
```

Joins this path with another path.

<Warning>

You cannot join a closed path to another path

</Warning>

### Path.join() example

<Example part="path_join" caption="Example of the Path.join() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.path1 = new Path()
  .move(points.A)
  .line(points.B)
  .attr("class", "various");

paths.path2 = new Path()
  .move(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .attr("class", "canvas");

paths.joint = paths.path1
  .join(paths.path2)
  .attr("class", "note lashed stroke-l")
  .attr("style", "stoke-opacity: 0.5");
```

## length()

```js
float path.length()
```

Returns the length of the path.

### Path.length() example

<Example part="path_length" caption="Example of the Path.length() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.example = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C);

macro("pd", {
  path: paths.example,
  d: -20
});

macro("pd", {
  path: new Path().move(points.B).line(points.A),
  d: 10
});

macro("pd", {
  path: new Path().move(points.B).curve(points.BCp2, points.CCp1, points.C),
  d: -10
});
```

## line()

```js
Path path.line(Point to)
```

Draws a straight line from the current position to a given point.

### Path.line() example

<Example part="path_line" caption="Example of the Path.line() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.from = new Point(10, 10);
points.to = new Point(90, 10);

paths.line = new Path()
  .move(points.from)
  .line(points.to)
  .attr("data-text", "Path.line()")
  .attr("data-text-class", "text-sm center fill-note");
```

## move()

```js
Path path.move(Point to)
```

Moves to a given point without drawing a line.

<Tip>

###### Always start your path with a move

When drawing a path, you must always start with a `move()` call, followed by your `line()` and/or `curve()` calls and an optional `close()` call.

These calls are chainable, making your code easier to read:

```js
paths.example = new Path()
  .move(points.a)
  .curve(points.b, points.c, points.d)
  .line(points.e)
  .close();
```

</Tip>

### Path.move() example

<Example part="path_move" caption="Example of the Path.move() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.to = new Point(50, 20)
  .attr("data-text", "Path.move()")
  .attr("data-text-class", "text-xs fill-note");

paths.noline = new Path().move(points.to);
```

## offset()

```js
Path path.offset(float distance)
```

Returns a new Path that is offset by distance from the original path.

### Path.offset() example

<Example part="path_offset" caption="Example of the Path.offset() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.example = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .line(points.A)
  .close();

paths.offset = paths.example
  .offset(-10)
  .attr("class", "interfacing");

paths.lineOffset = new Path()
  .move(points.A)
  .line(points.B)
  .offset(-5)
  .attr("class", "various");

paths.curveOffset = new Path()
  .move(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .offset(-5)
  .attr("class", "canvas");
```

## reverse()

```js
Path path.reverse()
```

Returns a path that is the reversed version of this path. As in, start becomes end, and end becomes start.

<Note>

The reversed path is a shallow copy. It will in other words not inherit the attributes of the original path.

If you want a deep copy, including the attributes, use `Path.clone().reverse()`.

</Note>

### Path.reverse() example

<Example part="path_reverse" caption="Example of the Path.reverse() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.example = new Path()
  .move(points.B)
  .curve(points.BCp2, points.CCp1, points.C)
  .attr("data-text", "freesewingIsMadeByJoostDeCockAndContributors")
  .attr("data-text-class", "text-xs fill-note");

paths.reverse = paths.example
  .reverse()
  .attr("data-text", "freesewingIsMadeByJoostDeCockAndContributors")
  .attr("data-text-class", "text-xs fill-lining");
```

## setRender()

```js
Path path.setRender(bool render)
```

This is a chainable method to sets the `path.render` property. If you set it to `false` your path will not be rendered.

## shiftAlong()

```js
Point path.shiftAlong(float distance)
```

Returns a point that lies at distance travelled along the path.

### Path.shiftAlong() example

<Example part="path_shiftalong" caption="Example of the Path.shiftAlong() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.example = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C);

points.x1 = paths.example
  .shiftAlong(20)
  .attr("data-text", "2cm")
  .attr("data-text-class", "center fill-note")
  .attr("data-text-lineheight", 6);
points.x2 = paths.example
  .shiftAlong(90)
  .attr("data-text", "9cm")
  .attr("data-text-class", "center fill-note")
  .attr("data-text-lineheight", 6);

snippets.x1 = new Snippet("notch", points.x1);
snippets.x2 = new Snippet("notch", points.x2);
```

## shiftFractionAlong()

```js
Point path.shiftFractionAlong(float fraction)
```

Returns a point that lies at fraction of the length of the path travelled along the path.

### Path.shiftFractionAlong() example

<Example part="path_shiftfractionalong" caption="Example of the Path.shiftFractionAlong() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.example = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C);

points.x1 = paths.example
  .shiftFractionAlong(0.2)
  .attr("data-text", "msg_20")
  .attr("data-text-class", "center")
  .attr("data-text-lineheight", 6);
points.x2 = paths.example
  .shiftFractionAlong(0.9)
  .attr("data-text", "msg_90")
  .attr("data-text-class", "center")
  .attr("data-text-lineheight", 6);

snippets.xl = new Snippet("notch", points.x1);
snippets.x2 = new Snippet("notch", points.x2);
```

## start()

```js
Point path.start()
```

Returns the Point object at the start of the path.

### Path.start() example

<Example part="path_start" caption="Example of the Path.start() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.example = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C);

snippets.start = new Snippet("notch", paths.example.start());
```

## split()

```js
array path.split(Point splitPoint)
```

Splits a path in two halves, on a point along that path that you pass it.

### Path.split() example

<Example part="path_split" caption="Example of the Path.split() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);
points.D = new Point(50, 130);
points.DCp1 = new Point(150, 30);

paths.demo = new Path()
  .move(points.D)
  .curve(points.DCp1, points.DCp1, points.C)
  .curve(points.CCp1, points.BCp2, points.B)
  .line(points.A);

points.split = paths.demo.shiftFractionAlong(0.75);
snippets.split = new Snippet("notch", points.split);

let style = "stroke-width: 3; stroke-opacity: 0.5;";
let halves = paths.demo.split(points.split);
for (let i in halves) {
  paths[i] = halves[i]
    .attr("style", style)
    .attr("style", `stroke: hsl(${i * 70}, 100%, 50%)`);
}
```

## translate()

```js
Path path.translate(float deltaX, float deltaY)
```

Returns a path with [a translate transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Translate) applied.

### Path.translate() example

<Example part="path_translate" caption="Example of the Path.translate() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(45, 60);
points.B = new Point(10, 30);
points.BCp2 = new Point(40, 20);
points.C = new Point(90, 30);
points.CCp1 = new Point(50, -30);

paths.A = new Path()
  .move(points.A)
  .line(points.B)
  .curve(points.BCp2, points.CCp1, points.C);

paths.B = paths.A.translate(60, 30);

points.step1 = points.B.shift(0, 60);
points.step2 = points.step1.shift(-90, 30);
macro("ld", {
  from: points.B,
  to: points.step1,
  noStartMarker: true
});
macro("ld", {
  from: points.step1,
  to: points.step2,
  noStartMarker: true
});
```

## trim()

```js
Path path.trim()
```

Returns a new Path that is this path with overlapping parts removed.

This method is typically used when [Path.offset()](#offset) caused some overlap.

<Warning>

###### Use sparsely or performance will suffer

This method is recursive and complex, and the performance penalty for using it on a long/complex path will be significant.

To limit the impact of path.trim(), follow this approach:

- construct a minimal path that contains the overlap
- trim it
- now join it to the rest of your path

You can see an example of this [in the front part of the Bruce pattern](https://github.com/freesewing/freesewing/blob/develop/packages/bruce/src/front.js#L195).

</Warning>

### Path.trim() example

<Example part="path_trim" caption="Example of the Path.trim() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.center = new Point(0, 0);
points.base = new Point(0, 10);
points.tip = new Point(0, 50);
points.tipCpRight = new Point(30, 50);
points.tipCpLeft = new Point(-30, 50);
paths.example = new Path().move(points.base);
for (let i = 0; i < 4; i++) {
  points["base" + i] = points.base.rotate(60 * i, points.center);
  points["tip" + i] = points.tip.rotate(60 * i, points.center);
  points["tipCpRight" + i] = points.tipCpRight.rotate(60 * i, points.center);
  points["tipCpLeft" + i] = points.tipCpLeft.rotate(60 * i, points.center);
  if (i < 2) {
    paths.example
      .line(points["base" + i])
      .curve(points["base" + i], points["tipCpLeft" + i], points["tip" + i])
      .curve(
        points["tipCpRight" + i],
        points["base" + i],
        points["base" + i]
      );
  } else {
    paths.example
      .line(points["base" + i])
      .line(points["tip" + i])
      .line(points["tipCpRight" + i])
      .line(points["base" + i]);
  }
}

paths.offset = paths.example
  .offset(10)
  .attr("class", "lining dotted stroke-sm");

paths.trimmed = paths.offset
  .trim()
  .attr("class", "various stroke-xl")
  .attr("style", "stroke-opacity: 0.5;");
```