---
title: Utils
---

The Utils object bundles the following utility methods to facilitate your work.

## beamIntersectsCircle()

```js
array | false utils.beamIntersectsCircle(
  Point center, 
  float radius, 
  Point point1, 
  Point point1, 
  string sort = 'x'
)
```

Finds the intersection between an endless line through points `point1` and `point2` and a circle with its center at point `center` and a radius of `radius` mm.

The 5th and last parameter controls the *sorting* of the found intersections. This will (almost) always return 2 intersections, and you can choose how they are ordered in the returned array:

Set sort to:

- `x` : The point with the lowest X-coordinate will go first (left to right)
- `y` : The point with the lowest Y-coordinate will go first (top to bottom)

### Utils.beamIntersectsCircle() example

<Example part="utils_beamintersectscircle" caption="A Utils.beamIntersectsCircle() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.A = new Point(45, 45)
  .attr("data-circle", 35)
  .attr("data-circle-class", "fabric");
points.B = new Point(5, 50);
points.C = new Point(25, 30);
points.D = new Point(5, 65);
points.E = new Point(65, 5);
points.F = new Point(15, 75);
points.G = new Point(75, 15);

paths.line1 = new Path().move(points.B).line(points.C);
paths.line2 = new Path().move(points.D).line(points.E);
paths.line3 = new Path().move(points.F).line(points.G);

let intersections1 = utils.beamIntersectsCircle(
  points.A,
  points.A.attributes.get("data-circle"),
  points.B,
  points.C
);
let intersections2 = utils.beamIntersectsCircle(
  points.A,
  points.A.attributes.get("data-circle"),
  points.D,
  points.E,
  "y"
);
let intersections3 = utils.beamIntersectsCircle(
  points.A,
  points.A.attributes.get("data-circle"),
  points.F,
  points.G
);

snippets.first1 = new Snippet("bnotch", intersections1[0]);
snippets.second1 = new Snippet("notch", intersections1[1]);
snippets.first2 = new Snippet("bnotch", intersections2[0]);
snippets.second2 = new Snippet("notch", intersections2[1]);
snippets.first3 = new Snippet("bnotch", intersections3[0]);
snippets.second3 = new Snippet("notch", intersections3[1]);
```

## beamIntersectsX()

```js
Point | false utils.beamIntersectsX(Point A, Point B, float X)
```

Finds the intersection between an endless line and a given X-value. Returns a [Point](#point) object for the intersection, or `false` there is no intersection.

### Utils.beamIntersectsX() example

<Example part="utils_beamintersectsx" caption="A Utils.beamIntersectsX() example" />

```js
  let {
    Point,
    points,
    Path,
    paths,
    Snippet,
    snippets,
    utils
  } = part.shorthand();

  points.A = new Point(10, 10);
  points.B = new Point(90, 30);

  paths.AB = new Path().move(points.A).line(points.B);

  snippets.x = new Snippet("notch", utils.beamIntersectsX(points.A, points.B, 40));

  paths.help = new Path()
    .move(new Point(40, 5))
    .line(new Point(40, 35))
    .attr("class", "note dashed");
```

## beamIntersectsY()

```js
Point | false utils.beamIntersectsY(Point A, Point B, float Y)
```

Finds the intersection between an endless line and a given Y-value. Returns a [Point](#point) object for the intersection, or `false` there is no intersection.

### Utils.beamIntersectsY() example

<Example part="utils_beamintersectsy" caption="A Utils.beamIntersectsY() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.A = new Point(10, 10);
points.B = new Point(50, 40);

paths.AB = new Path().move(points.A).line(points.B);

snippets.x = new Snippet("notch", utils.beamIntersectsY(points.A, points.B, 30));

paths.help = new Path()
  .move(new Point(0, 30))
  .line(new Point(50, 30))
  .attr("class", "note dashed");
```

## beamsIntersect()

```js
Point | false utils.beamsIntersect(
  Point A, 
  Point B, 
  Point C, 
  Point D
)
```

Finds the intersection between two endless lines (beams). Returns a [Point](#point) object for the intersection, or `false` if the lines don't intersect.

### Utils.beamIntersect() example

<Example part="utils_beamsintersect" caption="A Utils.beamIntersect() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.A = new Point(10, 10);
points.B = new Point(50, 40);
points.C = new Point(45, 20);
points.D = new Point(60, 15);

paths.AB = new Path().move(points.A).line(points.B);
paths.CD = new Path().move(points.C).line(points.D);

snippets.x = new Snippet(
  "notch",
  utils.beamsIntersect(points.A, points.B, points.C, points.D)
);
```

## circlesIntersect()

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

The 5th and last parameter controls the *sorting* of the found intersections. When this returns 2 intersections, you can choose how they are ordered in the returned array:

Set sort to:

- `x` : The point with the lowest X-coordinate will go first (left to right)
- `y` : The point with the lowest Y-coordinate will go first (top to bottom)

### Utils.circlesIntersect() example

<Example part="utils_circlesintersect" caption="A Utils.circlesIntersect() example" />

```js
let { Point, points, Snippet, snippets, utils } = part.shorthand();

points.A = new Point(10, 10)
  .attr("data-circle", 15)
  .attr("data-circle-class", "fabric");
points.B = new Point(30, 30)
  .attr("data-circle", 35)
  .attr("data-circle-class", "fabric");
points.C = new Point(90, 10)
  .attr("data-circle", 15)
  .attr("data-circle-class", "various");
points.D = new Point(110, 30)
  .attr("data-circle", 35)
  .attr("data-circle-class", "various");

let intersections1 = utils.circlesIntersect(
  points.A,
  points.A.attributes.get("data-circle"),
  points.B,
  points.B.attributes.get("data-circle")
);
let intersections2 = utils.circlesIntersect(
  points.C,
  points.C.attributes.get("data-circle"),
  points.D,
  points.D.attributes.get("data-circle"),
  "y"
);

snippets.first1 = new Snippet("bnotch", intersections1[0]);
snippets.second1 = new Snippet("notch", intersections1[1]);
snippets.first2 = new Snippet("bnotch", intersections2[0]);
snippets.second2 = new Snippet("notch", intersections2[1]);
```

## curveIntersectX()

```js
array | Point | false utils.curveIntersectsX(
  Point start, 
  Point cp1,
  Point cp2,
  Point end,
  float x)
```

Finds the point(s) where a curve intersects a given X-value.

This is a low-level variant of [`Path.intersectsX()`](/en/docs/developer/api/path/#pathintersectsx). Instead of a path, you describe a single curve by passing the four points that describes it.

This returns `false` if no intersections are found, a [Point](/en/docs/developer/api/point/) object if a single intersection is found, and an array of [Point](/en/docs/developer/api/point/) objects if multiple intersections are found.

### Utils.curveIntersectsX() example

<Example part="utils_curveintersectsx" caption="A Utils.curveIntersectX() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  utils,
  snippets,
  Snippet
} = part.shorthand();

points.start = new Point(10, 15);
points.cp1 = new Point(80, 10);
points.cp2 = new Point(-50, 80);
points.end = new Point(110, 70);

paths.curve = new Path()
  .move(points.start)
  .curve(points.cp1, points.cp2, points.end);

for (let x of [30, 40]) {
  points["from" + x] = new Point(x, 10);
  points["to" + x] = new Point(x, 80);
  paths["line" + x] = new Path()
    .move(points["from" + x])
    .line(points["to" + x])
    .attr("class", "lining dashed");
}

snippets.i40 = new Snippet(
  "notch",
  utils.curveIntersectsX(points.start, points.cp1, points.cp2, points.end, 40)
);

for (let p of utils.curveIntersectsX(
  points.start,
  points.cp1,
  points.cp2,
  points.end,
  30
))
  snippets[p.y] = new Snippet("notch", p);
```

## curveIntersectY()

```js
array | Point | false utils.curveIntersectsY(
  Point start, 
  Point cp1,
  Point cp2,
  Point end,
  float y)
```

Finds the point(s) where a curve intersects a given Y-value.

This is a low-level variant of [`Path.intersectsY()`](/en/docs/developer/api/path/#pathintersectsy). Instead of a path, you describe a single curve by passing the four points that describes it.

This returns `false` if no intersections are found, a [Point](/en/docs/developer/api/point/) object if a single intersection is found, and an array of [Point](/en/docs/developer/api/point/) objects if multiple intersections are found.

### Utils.curveIntersectsY() example

<Example part="utils_curveintersectsy" caption="A Utils.curveIntersectY() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  utils,
  snippets,
  Snippet
} = part.shorthand();

points.start = new Point(10, 45);
points.cp1 = new Point(50, 10);
points.cp2 = new Point(0, 80);
points.end = new Point(110, 70);

paths.curve = new Path()
  .move(points.start)
  .curve(points.cp1, points.cp2, points.end);

for (let y of [40, 50]) {
  points["from" + y] = new Point(10, y);
  points["to" + y] = new Point(110, y);
  paths["line" + y] = new Path()
    .move(points["from" + y])
    .line(points["to" + y])
    .attr("class", "lining dashed");
}

snippets.i50 = new Snippet(
  "notch",
  utils.curveIntersectsY(points.start, points.cp1, points.cp2, points.end, 50)
);

for (let p of utils.curveIntersectsY(
  points.start,
  points.cp1,
  points.cp2,
  points.end,
  40
))
  snippets[p.x] = new Snippet("notch", p);
```

## curvesIntersect()

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

### Utils.curvesIntersect() example

<Example part="utils_curvesintersect" caption="A Utils.curvesIntersect() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.A = new Point(10, 10);
points.Acp = new Point(310, 40);
points.B = new Point(110, 70);
points.Bcp = new Point(-210, 40);

points.C = new Point(20, -5);
points.Ccp = new Point(60, 300);
points.D = new Point(100, 85);
points.Dcp = new Point(70, -220);
paths.curveA = new Path()
  .move(points.A)
  .curve(points.Acp, points.Bcp, points.B);
paths.curveB = new Path()
  .move(points.C)
  .curve(points.Ccp, points.Dcp, points.D);

for (let p of utils.curvesIntersect(
  points.A,
  points.Acp,
  points.Bcp,
  points.B,
  points.C,
  points.Ccp,
  points.Dcp,
  points.D
)) {
  snippets[part.getId()] = new Snippet("notch", p);
}
```

## deg2rad()

```js
float deg2rad(float degrees)
```

Returns the degrees you pass to it as radians.

This is useful for when you use methods like `Math.cos()` that expects a corner in radians, when we typically use degrees.

## rad2deg()

```js
float rad2deg(float radians)
```

Returns the radians you pass to it as degrees.

## lineIntersectsCircle()

```js
array | false utils.lineIntersectsCircle(
  Point center, 
  float radius, 
  Point from, 
  Point to, 
  string sort = 'x'
)
```

Finds the intersection between a line segment from point `from` to point `to` and a circle with its center at point `center` and a radius of `radius` mm.

The 5th and last parameter controls the *sorting* of the found intersections. When this returns 2 intersections, you can choose how they are ordered in the returned array:

Set sort to:

- `x` : The point with the lowest X-coordinate will go first (left to right)
- `y` : The point with the lowest Y-coordinate will go first (top to bottom)

### Utils.lineIntersectsCircle() example

<Example part="utils_lineintersectscircle" caption="A Utils.lineIntersectsCircle() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.A = new Point(95, 45)
  .attr("data-circle", 35)
  .attr("data-circle-class", "fabric");
points.B = new Point(55, 50);
points.C = new Point(75, 30);

points.D = new Point(55, 65);
points.E = new Point(115, 5);
points.F = new Point(65, 75);
points.G = new Point(125, 15);

paths.line1 = new Path().move(points.B).line(points.C);
paths.line2 = new Path().move(points.D).line(points.E);
paths.line3 = new Path().move(points.F).line(points.G);

let intersections1 = utils.lineIntersectsCircle(
  points.A,
  points.A.attributes.get("data-circle"),
  points.B,
  points.C
);
let intersections2 = utils.lineIntersectsCircle(
  points.A,
  points.A.attributes.get("data-circle"),
  points.D,
  points.E,
  "y"
);
let intersections3 = utils.lineIntersectsCircle(
  points.A,
  points.A.attributes.get("data-circle"),
  points.F,
  points.G
);
snippets.first1 = new Snippet("bnotch", intersections1[0]);
snippets.first2 = new Snippet("bnotch", intersections2[0]);
snippets.second2 = new Snippet("notch", intersections2[1]);
snippets.first3 = new Snippet("bnotch", intersections3[0]);
snippets.second3 = new Snippet("notch", intersections3[1]);
```

## lineIntersectsCurve()

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

Finds the intersection between a line segment from point `from` to point `to` and a curve described by points `start`, `cp1`, `cp2, and`end`.

### Utils.lineIntersectsCurve() example

<Example part="utils_lineintersectscurve" caption="A Utils.lineIntersectsCurve() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.A = new Point(10, 10);
points.Acp = new Point(310, 40);
points.B = new Point(110, 70);
points.Bcp = new Point(-210, 40);
points.E = new Point(20, -5);
points.D = new Point(100, 85);
paths.curve = new Path()
  .move(points.A)
  .curve(points.Acp, points.Bcp, points.B);
paths.line = new Path().move(points.E).line(points.D);

for (let p of utils.lineIntersectsCurve(
  points.D,
  points.E,
  points.A,
  points.Acp,
  points.Bcp,
  points.B
)) {
  snippets[part.getId()] = new Snippet("notch", p);
}
```

## linesIntersect()

```js
Point | false utils.linesIntersect(
  Point A, 
  Point B, 
  Point C, 
  Point D
)
```

Finds the intersection between two line segments. Returns a [Point](#point) object for the intersection, or `false` if the lines don't intersect.

### Utils.linesIntersect() example

<Example part="utils_linesintersect" caption="A Utils.linesIntersect() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.A = new Point(10, 10);
points.B = new Point(50, 40);
points.C = new Point(15, 30);
points.D = new Point(60, 15);

paths.AB = new Path().move(points.A).line(points.B);
paths.CD = new Path().move(points.C).line(points.D);

snippets.X = new Snippet(
  "notch",
  utils.linesIntersect(points.A, points.B, points.C, points.D)
);
```

## pointOnBeam()

```js
bool utils.pointOnBeam(
  Point point1, 
  Point point2, 
  Point check, 
  float precision = 1e6
)
```

Returns `true` if the point `check` lies on the endless line that goes through `point1` and `point2`. The fourth parameter controls the precision. Lower numbers make the check less precise.

<Note>

###### Tweak precision only when needed

Typically, you don't need to worry about precision. But occasionally, you may get unexpected results because of floating point errors, rounding errors, or cubic bezier juggling.

When that happens, you can lower the precision so you get what you expect.

</Note>

### Utils.pointOnBeam() example

<Example part="utils_pointonbeam" caption="A Utils.pointOnBeam() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.from1 = new Point(10, 10);
points.to1 = new Point(90, 60);
points.from2 = new Point(10, 30);
points.to2 = new Point(90, 80);
points.b1 = new Point(170, 110);
points.b2 = new Point(170, 130);

let scatter = [];
for (let i = 1; i < 36; i++) {
  for (let j = 1; j < 27; j++) {
    scatter.push(new Point(i * 10, j * 10));
  }
}
let snippet;
for (let point of scatter) {
  if (utils.pointOnBeam(points.from1, points.to1, point)) snippet = "notch";
  else snippet = "bnotch";
  snippets[part.getId()] = new Snippet(snippet, point);
  if (utils.pointOnBeam(points.from2, points.to2, point, 0.01)) {
    snippet = "notch";
  } else snippet = "bnotch";
  snippets[part.getId()] = new Snippet(snippet, point);
}
paths.line1 = new Path()
  .move(points.from1)
  .line(points.to1)
  .attr("class", "fabric stroke-lg");
paths.lne1 = new Path()
  .move(points.to1)
  .line(points.b1)
  .attr("class", "fabric dashed");
paths.line2 = new Path()
  .move(points.from2)
  .line(points.to2)
  .attr("class", "fabric stroke-lg");
paths.lne2 = new Path()
  .move(points.to2)
  .line(points.b2)
  .attr("class", "fabric dashed");
```

## pointOnCurve()

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

<Note>

Keep in mind that calculations with Bezier curves are often aproximations.

</Note>

### Utils.pointOnCurve() example

<Example part="utils_pointoncurve" caption="A Utils.pointOnCurve() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.start = new Point(10, 10);
points.cp1 = new Point(90, 10);
points.cp2 = new Point(10, 60);
points.end = new Point(90, 60);

let scatter = [];
for (let i = 1; i < 19; i++) {
  for (let j = 1; j < 14; j++) {
    scatter.push(new Point(i * 10, j * 10));
  }
}
let snippet;
for (let point of scatter) {
  if (
    utils.pointOnCurve(
      points.start,
      points.cp1,
      points.cp2,
      points.end,
      point
    )
  ) {
    snippet = "notch";
  } else snippet = "bnotch";
  snippets[part.getId()] = new Snippet(snippet, point);
}
paths.curve = new Path()
  .move(points.start)
  .curve(points.cp1, points.cp2, points.end)
  .attr("class", "fabric stroke-lg");
```

## pointOnLine()

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

### Utils.pointOnLine() example

<Example part="utils_pointonline" caption="A Utils.pointOnLine() example" />

```js
let {
  Point,
  points,
  Path,
  paths,
  Snippet,
  snippets,
  utils
} = part.shorthand();

points.from1 = new Point(10, 10);
points.to1 = new Point(90, 60);
points.from2 = new Point(10, 30);
points.to2 = new Point(90, 80);
points.b1 = new Point(170, 110);
points.b2 = new Point(170, 130);

let scatter = [];
for (let i = 1; i < 36; i++) {
  for (let j = 1; j < 27; j++) {
    scatter.push(new Point(i * 10, j * 10));
  }
}
let snippet;
for (let point of scatter) {
  if (utils.pointOnLine(points.from1, points.to1, point)) snippet = "notch";
  else snippet = "bnotch";
  snippets[part.getId()] = new Snippet(snippet, point);
  if (utils.pointOnLine(points.from2, points.to2, point, 0.01)) {
    snippet = "notch";
  } else snippet = "bnotch";
  snippets[part.getId()] = new Snippet(snippet, point);
}
paths.line1 = new Path()
  .move(points.from1)
  .line(points.to1)
  .attr("class", "fabric stroke-lg");
paths.lne1 = new Path()
  .move(points.to1)
  .line(points.b1)
  .attr("class", "fabric dashed");
paths.line2 = new Path()
  .move(points.from2)
  .line(points.to2)
  .attr("class", "fabric stroke-lg");
paths.lne2 = new Path()
  .move(points.to2)
  .line(points.b2)
  .attr("class", "fabric dashed");
```

## round()

```js
float utils.round(float value)
```

Rounds a value to two decimals. For example:

- 0.1234 becomes 0.12
- 5.6789 becomes 5.68

> The [Part.shorthand](/en/docs/developer/api/part#partshorthand) exposes a context-aware `unit()` method that will call this method and pass it the units requested by the user.

## stretchToScale()

```js
float utils.stretchToScale(float stretch)
```

The way people measure stretch intuitively is different from the way we handle stretch in code.

When people say *25% stretch* they mean that 10cm fabric gets stretched to 12.5cm fabric. In code and on our patterns, that means we need to scale things by 80%.

This method does that by returning:

```js
1 / (1 + parseFloat(stretch));
```

## units()

```js
string utils.units(float value, string format = 'metric')
```

Converts the units `value` you pass it into a formatted string for the `format` you pass it.

Format must be either `imperial` or `metric` (the default).