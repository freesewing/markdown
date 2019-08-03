---
title: Mettre en forme les attaches
order: 200
---

Nos attaches devraient suivre l'encolure, ce qui n'est pas difficile à faire. Il nous faut juste nous assurer que les points de contrôle de nos courbes aient des proportions similaires. Ce qui signifie, à la moitié entre le début de la courbe et le coin de notre rectangle.

<Note>

Pour cela, vous allez employer une nouvelle méthode : `Point.shiftFractionTowards()`. Nous avons déjà utilisé `Point.shift()` et il y a aussi `Point.shiftTowards()` et `Point.shiftOutwards()`. Comme toujours, [les docs API](/api/point) contiennent tous les détails à ce propos.

</Note>

```js
points.edgeLeft = new Point(points.topLeft.x, points.left.y);
points.edgeRight = new Point(points.topRight.x, points.right.y);
points.edgeTop = new Point(0, points.topLeft.y);

points.edgeLeftCp = points.edgeLeft.shiftFractionTowards(points.topLeft, 0.5);
points.edgeRightCp = points.edgeLeftCp.flipX();
points.edgeTopLeftCp = points.edgeTop.shiftFractionTowards(
  points.topLeft,
  0.5
);
points.edgeTopRightCp = points.edgeTopLeftCp.flipX();
```

Maintenant, adaptons notre chemin `rect` de façon à ce qu'il ne soit plus un rectangle :

```js
paths.rect = new Path()
  .move(points.edgeTop)
  .curve(points.edgeTopLeftCp, points.edgeLeftCp, points.edgeLeft)
  .line(points.bottomLeft)
  .line(points.bottomRight)
  .line(points.edgeRight)
  .curve(points.edgeRightCp, points.edgeTopRightCp, points.edgeTop)
  .close();
```

Tout à coup, les choses commencent à prendre la forme d'un bavoir :

<Example pattern="tutorial" part="step6" caption="Pretty good, but how are we going to fit it over the baby's head?" />