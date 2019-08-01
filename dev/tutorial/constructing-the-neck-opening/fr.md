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
// Design pattern here (concevoir le patron ici)
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

Vous avez ajouté quelques points à votre partie, et dessiné votre premier chemin. Examinons chaque ligne en détail :

```js
points.right = new Point(measurements.headCircumference / 10, 0);
```

- Nous ajoutons un point nommé `right` à `points`, qui contient les points de notre partie
- Nous utilisons le constructeur Point, qui prend deux arguments : les valeurs X et Y du point
- La valeur X est `measurements.headCircumference / 10`
- La valeur Y est `0`

Le point `bottom` est très similaire, alors passons directement à la ligne suivante :

```js
points.rightCp1 = points.right
  .shift(90, points.bottom.dy(points.right)/2);
```

- Nous ajoutons un point nommé `rightCp1`, qui va devenir le *point de contrôle* de la partie droite
- Au lieu d'utiliser le constructeur Point, nous faisons appel à la méthode `Point.shift()` sur un point existant
- Elle prend deux arguments : l'angle de décalage et la distance
- Vous pouvez voir que nous décalons à 90 degrés (ce qui signifie vers le haut) mais la distance emploie une autre méthode
- La méthode `Point.dy()` retourne la différence selon l'axe Y entre le point appelé et le point source
- Nous nous décalons de la moitié de la différence en Y

Le point suivant est très similaire de nouveau, excepté que cette fois nous nous décalons vers la droite (0 degré) de la moitié de la distance en X entre les points `bottom` et `right`.

<tip>

Points vient avec une ribambelle de ces méthodes. Vous pouvez toutes les trouver dans [les docs API pour Point](/fr/api/point).

</Tip>

La ligne suivante vous introduit une notion nouvelle, les chemins (Paths) :

```js
paths.neck = new Path()
  .move(points.right)
  .curve(points.rightCp1, points.bottomCp2, points.bottom)
```

- Nous ajoutons un chemin nommé `neck` à `paths` qui contient les chemins de notre partie
- Nous utilisons le constructeur de chemin Path, qui ne prend aucun argument
- Nous poursuivons avec l'appel à `Path.move()` qui prend un Point comme argument
- Puis, il y a un appel à `Path.curve()` qui prend 3 points comme arguments

Si vous avez lu les [concepts de base de FreeSewing](/fr/concepts), vous aurez appris que les chemins commencent toujours avec une opération `move()`. Dans ce cas, nous avons bougé depuis notre point `right`.

From there, we drew a Bezier curve to our `bottom` point by using `rightCp1` and `bottomCp2` as control points.

When all is said and done, we now have a quarter of our neck opening:

<example pattern="tutorial" part="step2" caption="You have drawn your first path" />

The only problem is, we have no guarantee whatsoever that this opening is the correct size.

Rather than hope it is the correct size, you'll make sure it is next.