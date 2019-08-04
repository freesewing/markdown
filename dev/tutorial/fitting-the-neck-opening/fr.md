---
title: Ajuster l'encolure
order: 170
---

Voici comment vous allez vous assurer que l'encolure est *au point* :

```js
let tweak = 1;
let target = (measurements.headCircumference * options.neckRatio) /4;
let delta;
do {
    points.right = new Point(tweak * measurements.headCircumference / 10, 0);
    points.bottom = new Point(0, tweak * measurements.headCircumference / 12);

    points.rightCp1 = points.right.shift(90, points.bottom.dy(points.right)/2);
    points.bottomCp2 = points.bottom.shift(0, points.bottom.dx(points.right)/2);

    paths.neck = new Path()
      .move(points.right)
      .curve(points.rightCp1, points.bottomCp2, points.bottom);

    delta = paths.neck.length() - target;
  if (delta > 0) tweak = tweak * 0.99;
  else tweak = tweak * 1.02;
} while (Math.abs(delta) > 1);
```

Nous avons ajouté quelques nouvelles variables :

- `tweak`: un *facteur d'ajustement* que nous utiliserons pour augmenter ou diminuer l'encolure en lui donnant une valeur supérieure ou inférieure à 1
- `target` : la longueur prévue de l'encolure (de son quart)
- `delta` : à quel point nous dévions de notre idéal. Les nombres positifs signifient qu'elle est trop longue, les nombres négatifs qu'elle est trop courte

Maintenant que nous savons ce qu'est la `cible` (target), nous construisons notre chemin comme nous l'avons fait précédemment. Mais cette fois, nous multiplions les coordonnées de notre point avec notre variable `d'ajustement` (tweak) (1 au départ).

Puis, nous comparons notre `cible` au résultat de `paths.neck.length()` qui - vous l'avez deviné — retourne la longueur du chemin de l'encolure.

Si le delta est positif, notre chemin est trop long et nous devrions réduire le facteur d'ajustement.   
Si le delta est négatif, notre chemin est trop court et nous devrions augmenter le facteur d'ajustement.

Nous continuons de faire ceci jusqu'à ce que `Math.abs(delta)` devienne inférieur à 1. Cela signifie que nous sommes à 1 mm près de notre valeur cible.

<example pattern="tutorial" part="step2" caption="It might look the same as before, but now it's just right" />

Maintenant nous sommes satisfaits de la longueur du quart de notre encolure, construisons à présent l'encolure complète.