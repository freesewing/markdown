---
title: De halsopening uitwerken
order: 160
---

Wat je nodig hebt, is een licht ovale halsopening met een doorsnee die overeenkomt met de hoofdomtrek `headCircumference`, vermenigvuldigd met de optie `neckRatio`.

Het zou kunnen dat je dit een paar keer moet proberen voordat het goed zit. Maar aangezien de halsopening zowel horizontaal als verticaal symmetrisch is, moet je maar één kwadrant opbouwen.

Om dat te doen, voegen we een paar punten toe aan het patroon. Eerst moeten we toegang krijgen tot de afmetingen en opties. Daarvoor moet je eerst de shorthand call updaten om aan te geven dat je toegang wil tot `measurements` en `options`:

```js
let {
  Point,
  points,
  Path,
  paths,
  measurements,
  options
} = part.shorthand();
```

Top. Nu kunnen we beginnen:

```js
// Design pattern here
points.right = new Point(measurements.headCircumference / 10, 0);
points.bottom = new Point(0, measurements.headCircumference / 12);

points.rightCp1 = points.right
  .shift(90, points.bottom.dy(points.right)/2);
points.bottomCp2 = points.bottom
  .shift(0, points.bottom.dx(points.right)/2);

paths.neck = new Path()
  .move(points.right)
  .curve(points.rightCp1, points.bottomCp2, points.bottom)
```

Je hebt een aantal punten toegevoegd aan je patroondeel en je eerste pad getekend. Even kijken naar elke lijn in detail:

```js
points.right = new Point(measurements.headCircumference / 10, 0);
```

- We voegen een punt met de naam `right` toe aan `points`, waar alle punten van het patroondeel opgeslagen zitten
- We gebruiken de Point constructor, die twee dingen nodig heeft: de waarden voor punten X en Y
- De waarde voor X is `measurements.headCircumference / 10`
- De waarde voor Y is `0`

Het deel voor `bottom` is bijna identiek, dus laten we verdergaan met de volgende regel:

```js
points.rightCp1 = points.right
  .shift(90, points.bottom.dy(points.right)/2);
```

- We voegen een punt toe met de naam `rightCp1`, dat het controlepunt of *control point* wordt voor het rechterdeel
- Instead of using the Point constructor, we're calling the `Point.shift()` method on an existing point
- It takes two arguments: The angle to shift towards, and the distance
- You can see that we're shifting 90 degrees (that means up) but the distance uses another method
- The `Point.dy()` method returns the delta along the Y axis between the point you call it on and the point you pass it
- We shift half of the Y-delta

The next point is very similar again, except that this time we're shifting to the right (0 degrees) for half of the X-delta between points `bottom` and `right`.

<tip>

Points come with a bunch of these methods. You can find them all in [the Point API docs](/api/point).

</Tip>

The next line introduces you to something new: Paths:

```js
paths.neck = new Path()
  .move(points.right)
  .curve(points.rightCp1, points.bottomCp2, points.bottom)
```

- We're adding a path named `neck` to `paths` which holds our part's paths
- We're using the Path constructor, which takes no arguments
- We're following up with a `Path.move()` call that takes one Point as argument
- Then, there's a `Path.curve()` call that takes 3 points as arguments

If you've read about [FreeSewing's basic concepts](/concepts) you will have learned that paths always start with a `move()` operation. In this case, we moved to our `right` points.

From there, we drew a Bezier curve to our `bottom` point by using `rightCp1` and `bottomCp2` as control points.

When all is said and done, we now have a quarter of our neck opening:

<example pattern="tutorial" part="step2" caption="You have drawn your first path" />

The only problem is, we have no guarantee whatsoever that this opening is the correct size.

Rather than hope it is the correct size, you'll make sure it is next.