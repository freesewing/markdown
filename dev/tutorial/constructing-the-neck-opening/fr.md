---
title: Construire l'encolure
order: 160
---

Votre but est de construire une encolure légèrement ovale qui a une circonférence égale à la mesure `headCircumference` multipliée par l'option `neckRatio`.

Cela va peut-être impliquer un peu d'essai-erreur. Mais étant donné que l'encolure sera symétrique à la fois horizontalement et verticalement, vous aurez juste besoin de construire un quart de celle-ci.

Nous allons ajouter quelques points à notre patron pour cela. Mais nous voulons avoir accès à toutes nos mesures et options pour ce faire. Pour cela, vous allez d'abord mettre à jour l'appel aux raccourcis pour indiquer que vous voulez également avoir accès à `measurements` et `options`:

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

Merveilleux. Maintenant, mettons-nous au travail :

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

You've added some points to your part, and drawn your first path. Let's look at each line in detail:

```js
points.right = new Point(measurements.headCircumference / 10, 0);
```

- We're adding a point named `right` to `points` which holds our part's points
- We're using the Point constructor, which takes two arguments: The points X and Y values
- The X value is `measurements.headCircumference / 10`
- The Y value is `0`

The `bottom` part is very similar, so let's skip to the next line:

```js
points.rightCp1 = points.right
  .shift(90, points.bottom.dy(points.right)/2);
```

- We're adding a point named `rightCp1`, which will become the *control point* of the right part
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