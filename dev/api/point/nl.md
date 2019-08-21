---
title: Point
---

Een Point object is een representatie van een punt op een vlak met een X en een Y as.

Point objecten hebben de volgende eigenschappen:

- `x`: De coördinaat op de X as van het punt
- `y`: De coördinaat op de Y as van het punt
- `attributes` : De [Attributes](../attributes) instantie die het punt's kenmerken bevat

De Point constructor heeft twee argumenten:

- `x`: De coördinaat op de X as van het punt
- `y`: De coördinaat op de Y as van het punt

```js
Point new Point(x, y);
```

Vervolgens heeft een Point object de volgende methoden:

## attr()

```js
Point point.attr(
  string name, 
  mixed value, 
  bool overwrite = false
)
```

De `Point.attr()` methode roept de `this.attributes.add()` functie aan, maar geeft het Point object terug. This allows you to chain different calls together as in the example below.

If the third parameter is set to `true` it will call `this.attributes.set()` instead, thereby overwriting the value of the attribute.

### Points.attr() voorbeeld

<Example part="point_attr" caption="An example of the Point.attr() method" />

```js
let { Point, points } = part.shorthand();

points.anchor = new Point(100, 25)
  .attr("data-text", "freesewingIsMadeByJoostDeCockAndContributors")
  .attr("data-text-class", "center");
```

## dx()

```js
float point.dx(Point punt)
```

Geeft het verschil over de X-as tussen dit punt en het punt dat je vermeld.

### Points.dx() voorbeeld

<Example part="point_dx" caption="An example of the Point.dx() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.vanaf = new Point(10, 10);
points.tot = new Point(90, 40);

macro("hd", {
  from: points.vanaf,
  to: points.tot,
  y: 25
});
```

## dy()

```js
float point.dy(Point punt)
```

Geeft het verschil over de Y-as tussen dit punt en het punt dat je vermeld.

### Points.dy() voorbeeld

<Example part="point_dy" caption="An example of the Point.dy() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.vanaf = new Point(10, 10);
points.tot = new Point(90, 40);

macro("vd", {
  from: points.tot,
  to: points.vanaf,
  x: 50
});
```

## dist()

```js
float point.dist(Point punt)
```

Geeft de afstand tussen dit punt en het punt dat je vermeld.

### Points.dist() voorbeeld

<Example part="point_dist" caption="An example of the Point.dist() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.vanaf = new Point(10, 10);
points.tot = new Point(90, 40);

macro("ld", {
  from: points.vanaf,
  to: points.tot
});
```

## angle()

```js
float point.angle(Point punt)
```

Geeft de hoek van een lijn van dit punt tot het punt dat je invoert.

### Points.angle() voorbeeld

<Example part="point_angle" caption="An example of the Point.angle() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.zon = new Point(10, 5);
points.maan = points.zon.shift(-15, 70);
points.tekst = points.zon
  .shiftFractionTowards(points.maan, 0.8)
  .attr("data-text", points.zon.angle(points.maan)+"°")
  .attr("data-text-class", "text-sm fill-note center");

paths.line = new Path()
  .move(points.zon)
  .line(points.maan)
  .attr("class", "dashed");
```

## rotate()

```js
Point point.rotate(float hoek, Point centrum)
```

Draait een punt het aantal graden om het punt dat je vermeld.

### Point.rotate() voorbeeld

<Example part="point_rotate" caption="An example of the Point.rotate() method" />

```js
let { Point, points, Path, paths, Snippet, snippets } = part.shorthand();

points.zon = new Point(40, 40);
points.maan = new Point(70, 40);
let stap = 360 / 36;
for (let i = 1; i < 37; i++) {
  let hoek = stap * i;
  points[`maan${i}`] = points.maan.rotate(hoek, points.zon);
  paths[`maan${i}`] = new Path().move(points.zon).line(points[`maan${i}`]);
}
```

## flipX()

```js
Point punt.flipX(Point spiegel = false)
```

Geeft een nieuw punt dat gespiegeld is om de X-waarde van het punt dat je vermeld.

Als je geen punt vermeld gebruikt het 0 (nul) voor de X-waarde.

### Point.flipX() voorbeeld

<Example part="point_flipx" caption="An example of the Point.flipX() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.top = new Point(50, 10);
points.uit1 = new Point(70, 30);
points.in1 = new Point(55, 35);
points.uit2 = new Point(75, 50);
points.in2 = new Point(60, 55);
points.uit3 = new Point(80, 70);
points.in3 = new Point(55, 70);
points.stamUit = new Point(55, 80);
points.stamIn = new Point(50, 80);

points._uit1 = points.uit1.flipX(points.top);
points._in1 = points.in1.flipX(points.top);
points._uit2 = points.uit2.flipX(points.top);
points._in2 = points.in2.flipX(points.top);
points._uit3 = points.uit3.flipX(points.top);
points._in3 = points.in3.flipX(points.top);
points._stamUit = points.stamUit.flipX(points.top);

points.basis = new Point(50, 80);

paths.boom = new Path()
  .move(points.top)
  .line(points.uit1)
  .line(points.in1)
  .line(points.uit2)
  .line(points.in2)
  .line(points.uit3)
  .line(points.in3)
  .line(points.stamUit)
  .line(points._stamUit)
  .line(points._in3)
  .line(points._uit3)
  .line(points._in2)
  .line(points._uit2)
  .line(points._in1)
  .line(points._uit1)
  .close();

paths.spiegel = new Path()
  .move(points.top)
  .line(points.basis)
  .attr("class", "note dashed");
```

## flipY()

```js
Point punt.flipY(Point spiegel = false)
```

Geeft een nieuw punt dat gespiegeld is om de Y-waarde van het punt dat je vermeld.

Als je geen punt vermeld gebruikt het 0 (nul) voor de Y-waarde.

### Point.flipX() voorbeeld

<Example part="point_flipy" caption="An example of the Point.flipY() method" />

```js
let { Point, points, Path, paths } = part.shorthand();

points.start = new Point(0, 50);
points.churchTowerMuurLinks = new Point(10, 50);
points.churchTowerDakLinks = new Point(10, 30);
points.kerkTorenTop = new Point(15, 10);
points.kerkTorenDakRechts = new Point(20, 30);
points.kerkDakRechts = new Point(50, 30);
points.kerkMuurRechts = new Point(50, 50);
points.huisMuurLinks = new Point(65, 50);
points.huisDakLinks = new Point(65, 35);
points.huisDakTop = new Point(75, 25);
points.huisDakRechts = new Point(85, 35);
points.huisMuurRechts = new Point(85, 50);
points.eind = new Point(95, 50);

points.spiegel = new Point(0, 60);
points.spiegelLineEnd = new Point(95, 60);

points._start = points.start.flipY(points.spiegel);
points._kerkTorenMuurLinks = points.kerkTorenMuurLinks.flipY(points.spiegel);
points._kerkTorenDakLinks = points.kerkTorenDakLinks.flipY(points.spiegel);
points._kerkTorenTop = points.kerkTorenTop.flipY(points.spiegel);
points._kerkTorenDakRechts = points.kerkTorenDakRechts.flipY(
  points.spiegel
);
points._kerkDakRechts = points.kerkDakRechts.flipY(points.spiegel);
points._kerkMuurRechts = points.kerkMuurRechts.flipY(points.spiegel);
points._huisMuurLinks = points.huisMuurLinks.flipY(points.spiegel);
points._huisDakLinks = points.huisDakLinks.flipY(points.spiegel);
points._huisDakTop = points.huisDakTop.flipY(points.spiegel);
points._huisDakRechts = points.huisDakRechts.flipY(points.spiegel);
points._huisMuurRechts = points.huisMuurRechts.flipY(points.spiegel);
points._eind = points.eind.flipY(points.spiegel);

paths.horizonTop = new Path()
  .move(points.start)
  .line(points.kerkTorenMuurLinks)
  .line(points.kerkTorenDakLinks)
  .line(points.kerkTorenTop)
  .line(points.kerkTorenDakRechts)
  .line(points.kerkDakRechts)
  .line(points.kerkMuurRechts)
  .line(points.huisMuurLinks)
  .line(points.huisDakLinks)
  .line(points.huisDakTop)
  .line(points.huisDakRechts)
  .line(points.huisMuurRechts)
  .line(points.eind);
```

## shift()

```js
Point punt.shift(float graden, float afstand)
```

Geeft een punt terug dat op de gespecificeerde afstand en hoek van dit punt ligt.

### Point.shift() voorbeeld

<Example part="point_shift" caption="An example of the Point.shift() method" />

```js
let { Point, points, macro } = part.shorthand();

points.A = new Point(90, 40)
  .attr("data-text", "Punt A")
  .attr("data-text-class", "right");
points.B = points.A.shift(155, 70)
  .attr("data-text", "Punt B is punt A 7cm verplaatst\nat onder een hoek van 155 graden")
  .attr("data-text-lineheight", 6);

macro("ld", {
  from: points.B,
  to: points.A,
  d: -10
});
```

## shiftTowards()

```js
Point puint.shiftTowards(Point doel, float afstand)
```

Geeft een punt terug dat de gespecificeerde afstand van dit punt ligt naar het vermelde punt.

### Point.shiftTowards() voorbeeld

<Example part="point_shifttowards" caption="An example of the Point.shiftTowards() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(90, 70).attr("data-text", "Punt A");
points.B = new Point(10, 10).attr("data-text", "Punt B");
points.C = points.A.shiftTowards(points.B, 35)
  .attr(
    "data-text",
    "Punt C is punt A 3.5cm verplaatst\nin de richting van punt B"
  )
  .attr("data-text-class", "center")
  .attr("data-text-lineheight", 6);

paths.richting = new Path()
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
Point point.shiftFractionTowards(Point doel, float deel)
```

Geeft een punt terug dat een deel van de afstand van dit punt ligt naar het vermelde punt.

### Point.shiftFractionTowards() voorbeeld

<Example part="point_shiftfractiontowards" caption="An example of the Point.shiftFractionTowards() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(90, 70).attr("data-text", "Punt A");
points.B = new Point(10, 10).attr("data-text", "Punt B");
points.C = points.A.shiftFractionTowards(points.B, 0.5)
  .attr(
    "data-text",
    "Punt C is punt A 50% verschoven\nin de richting van punt B"
  )
  .attr("data-text-class", "center")
  .attr("data-text-lineheight", 6);

paths.richting = new Path()
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
Point point.shiftOutwards(Point richting, float afstand)
```

Geeft een punt terug dat een afstand verwijderd is van het doel punt in de richting van het doel punt.

### Point.shiftOutwards() voorbeeld

<Example part="point_shiftoutwards" caption="An example of the Point.shiftOutwards() method" />

```js
let { Point, points, Path, paths, macro } = part.shorthand();

points.A = new Point(90, 70).attr("data-text", "Punt A");
points.B = new Point(10, 10).attr("data-text", "Punt B");
points.C = points.A.shiftOutwards(points.B, 30)
  .attr("data-text", "Punt C is punt A 3cm verschoven\nvoorbij punt B")
  .attr("data-text-lineheight", 6);

paths.richting = new Path()
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

Geeft een punt terug met [a translate transform](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate) toegepast.

In andre woorden, dit doet:

- Voegt `deltaX` toe aan de X-coordinate van het punt
- Voegt `deltaY` toe aan de Y-coordinate van het punt

### Point.translate() voorbeeld

<Example part="point_translate" caption="An example of the Point.translate() method" />

```js
let { Point, points, Snippet, snippets, macro } = part.shorthand();

points.A = new Point(10, 10).attr("data-text", "Punt A");
points.B = points.A.translate(120, 60)
  .attr(
    "data-text",
    "Punt B is punt A met een\ntranslate(120, 60)\ntransformatie toegepast"
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
bool point.sitsOn(Point controle)
```

Geeft `true` terug als het punt dezelfde coordinaten heeft als degene die je vermeld.

### Point.sitsOn() voorbeeld

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