---
title: Rendre votre patron sans papier
order: 270
---

Les utilisateurs peuvent demander des patrons sans papier en réglant le paramètre `paperless` sur `true`.

Nous pouvons obtenir cette valeur du paramètre à partir de la méthode `part.shorthand()`. Cela sera le dernier raccourci dont nous aurons besoin :

```js
let {
  Point,
  points,
  Path,
  paths,
  measurements,
  options,
  macro,
  complete,
  snippets,
  Snippet,
  paperless
} = part.shorthand();
```

L'idée derrière les *patrons sans papier* est que les utilisateurs n'aient pas à imprimer votre patron pour pouvoir l'utiliser. Au lieu de cela, nous incluons les dimensions sur le patron qui leur permettent de transférer la patron directement sur le tissu, ou sur un medium intermédiaire comme du papier carbone.

De plus, FreeSewing va automatiquement délivrer une grille pour chaque partie de patron avec des marques métriques ou impériales, selon les unités choisies par l'utilisateur.

Tandis que la grille est ajoutée automatiquement, vous aurez à ajouter les dimensions vous-mêmes. Heureusement, il existe des macros pour vous aider dans cette tâche, spécifiquement :

- La macro `hd` qui ajoute une mesure horizontale
- La macro `vd` qui ajoute une mesure verticale
- La macro `ld` qui ajoute une mesure linéaire
- La macro `pd` qui ajoute une mesure de chemin suivant ce même chemin

<warning>

FIXME: Ajouter les liens à la doc

</Warning>

Jetons un coup d'oeil à ce code :

```js
if (paperless) {
  // Add dimensions
  macro("hd", {
    from: points.bottomLeftStart,
    to: points.bottomRightEnd,
    y: points.bottomLeft.y + 15
  });
  macro("vd", {
    from: points.bottomRightStart,
    to: points.bottom,
    x: points.bottomRight.x + 15
  });
  macro("vd", {
    from: points.bottomRightStart,
    to: points.right,
    x: points.bottomRight.x + 30
  });
  macro("vd", {
    from: points.bottomRightStart,
    to: points.tipLeftTopStart,
    x: points.bottomRight.x + 45
  });
  macro("hd", {
    from: points.left,
    to: points.right,
    y: points.left.y + 25
  });
  macro("ld", {
    from: points.tipLeftBottomEnd,
    to: points.tipLeftTopStart,
    d: 15
  });
}
```

Beaucoup de choses se passent, mais elles sont répétitives. Voyons un peu le résultat final, et discutons-en :

<example pattern="tutorial" part="bib" caption="Your paperless bib" settings={{paperless: true}} />

Nous avons utilisé la macro `hd` pour ajouter deux mesures horizontales :

- Une en bas pour la largeur de notre bavoir
- Une pour la largeur de l'encolure

La macro `hd` prend un point d'origine `from` et un point d'arrivée `to` et également une valeur `y` qui dit à quelle valeur en Y marquer cette mesure.

Nous avons également ajouté trois macros `vd` pour les mesures verticales sur la droite.

Elle prennent aussi un point de départ `from` et un point d'arrivée `to`, mais attendent un paramètre `x` pour leur indiquer à quelle valeur de X la mesure doit être marquée.

Finalement, nous avons ajouté une macro `ld` pour la mesure linéaire du haut qui marque la largeur de notre attache. While most dimensions are horizontal or vertical, sometimes you want a straight line from the `from` to the `to` points like in this case.

The `ld` macro takes a `d` argument (short for delta) that indicates how far the dimension should be offset from the line from the `from` to the `to` point, if at all.

Making your pattern paperless is the icing on the cake. Time to wrap up, go over what we've learned, and give some pointers on where to go from here.