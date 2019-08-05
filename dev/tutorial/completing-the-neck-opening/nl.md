---
title: De halsopening afwerken
order: 180
---

Aangezien de halsopening symmetrisch is, hoeven we de punten aan de andere kant niet opnieuw te berekenen. Je kan ze gewoon omdraaien. Dat is dus precies wat we gaan doen:

Eerst creëer je een aantal nieuwe punten:

```js
points.rightCp2 = points.rightCp1.flipY();
points.bottomCp1 = points.bottomCp2.flipX();

points.left = points.right.flipX();
points.leftCp1 = points.rightCp2.flipX();
points.leftCp2 = points.rightCp1.flipX();

points.top = points.bottom.flipY();
points.topCp1 = points.bottomCp2.flipY();
points.topCp2 = points.bottomCp1.flipY();
```

<Note>

We gebruiken hier de methodes `Point.flipX()` en `Point.flip7()`. Je kan misschien wel raden wat ze doen. Anders kan je het nalezen in de [API-documentatie](/api/point).

</Note>

Vervolgens update je het pad:

```js
paths.neck = new Path()
  .move(points.top)
  .curve(points.topCp2, points.leftCp1, points.left)
  .curve(points.leftCp2, points.bottomCp1, points.bottom)
  .curve(points.bottomCp2, points.rightCp1, points.right)
  .curve(points.rightCp2, points.topCp1, points.top)
  .close();
```

<Example pattern="tutorial" part="step4" caption="And now you have a complete neck opening" />