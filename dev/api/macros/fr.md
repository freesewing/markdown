---
title: Macros
---

Toutes les macros prennent un unique objet comme configuration. L'objet de configuration est documenté sur cette page pour toutes les macros disponibles.

<Tip>

Pour plus d'informations sur une macro spécifique et des exemples, suivez le lien vers le plugin qui fournit la macro.

</Tip>

## cutonfold

Adds a *cut on fold* indicator to your pattern.

| Propriété   | Défaut  | Type                | Description                                                                 |
| ----------- | ------- | ------------------- | --------------------------------------------------------------------------- |
| `from`      |         | [Point](/api/point) | The startpoint of the *cut on fold* indicator                               |
| `to`        |         | [Point](/api/point) | The endpoint of the *cut on fold* indicator                                 |
| `margin`    | 5       | [Point](/api/point) | La distance en % à garder à partir du bord de départ/fin                    |
| `offset`    | 50      | Nombre              | La distance en mm de décalage par rapport à la ligne du début à la fin      |
| `grainline` | `false` | Booléen             | Si cet indicateur de découpage correspond également à la ligne de droit-fil |

<Note>

The `cutonfold` macro is provided by the [cutonfold plugin](/plugins/cutonfold).

</Note>

## grainline

Adds a *grainline* indicator to your pattern.

| Propriété | Défaut | Type                | Description                                 |
| --------- | ------ | ------------------- | ------------------------------------------- |
| `from`    |        | [Point](/api/point) | The startpoint of the *grainline* indicator |
| `to`      |        | [Point](/api/point) | The endpoint of the *grainline* indicator   |

<Note>

The `grainline` macro is provided by the [grainline plugin](/plugins/grainline).

</Note>

## hd

Adds a *horizontal dimension* to your pattern.

| Propriété       | Défaut               | Type                | Description                                                                                       |
| --------------- | -------------------- | ------------------- | ------------------------------------------------------------------------------------------------- |
| `from`          |                      | [Point](/api/point) | Le point de départ de la dimension                                                                |
| `to`            |                      | [Point](/api/point) | Le point final de la dimension                                                                    |
| `y`             |                      | Nombre              | La valeur en Y où dessiner la dimension                                                           |
| `text`          | Distance horizontale | Nombre              | Le texte à indiquer sur une dimension s'il ne s'agit pas de la de la distance horizontale from-to |
| `noStartMarker` | `false`              | Booléen             | Ne pas dessiner un marqueur de début                                                              |
| `noEndMarker`   | `false`              | Booléen             | Ne pas dessiner un marqueur de fin                                                                |

<Note>

The `hd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## ld

Adds a *linear dimension* to your pattern.

| Propriété       | Défaut            | Type                | Description                                                                    |
| --------------- | ----------------- | ------------------- | ------------------------------------------------------------------------------ |
| `from`          |                   | [Point](/api/point) | Le point de départ de la dimension                                             |
| `to`            |                   | [Point](/api/point) | Le point final de la dimension                                                 |
| `d`             | 0                 | Nombre              | Le décalage avec lequel dessiner la dimension                                  |
| `text`          | Distance linéaire | Nombre              | Le texte à accoler à la dimension si ce n'est pas la distance linéaire from-to |
| `noStartMarker` | `false`           | Booléen             | Ne pas dessiner un marqueur de début                                           |
| `noEndMarker`   | `false`           | Booléen             | Ne pas dessiner un marqueur de fin                                             |

<Note>

The `ld` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## pd

Adds a *path dimension* to your pattern.

| Propriété       | Défaut             | Type                | Description                                                        |
| --------------- | ------------------ | ------------------- | ------------------------------------------------------------------ |
| `path`          |                    | [Chemin](/api/path) | Le chemin le long duquel dessiner la dimension                     |
| `offset`        | 0                  | Nombre              | Le décalage avec lequel dessiner la dimension                      |
| `text`          | Longueur du chemin | Nombre              | Le texte à accoler au chemin si ce n'est pas la longueur du chemin |
| `noStartMarker` | `false`            | Booléen             | Ne pas dessiner un marqueur de début                               |
| `noEndMarker`   | `false`            | Booléen             | Ne pas dessiner un marqueur de fin                                 |

<Note>

The `pd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## round

Arrondit un coin. Notez que cela ne s'adresse qu'aux coins à 90 degrés.

| Propriété | Défaut  | Type                 | Description                                                         |
| --------- | ------- | -------------------- | ------------------------------------------------------------------- |
| `from`    |         | [Point](/api/point)  | Le point de départ de l'arrondi                                     |
| `to`      |         | [Point](/api/point)  | Le point final de l'arrondi                                         |
| `via`     |         | [Point](/api/point)  | Le coin à arrondir                                                  |
| `radius`  | Maximum | Nombre               | Le rayon en mm si c'est pas le maximum                              |
| `prefix`  |         | Chaîne de caractères | Un préfixe à donner aux points et aux chemins créés par cette macro |
| `render`  | `false` | Booléen              | Afficher le chemin créé par cette macro                             |
| `class`   |         | Chaîne de caractères | Classe(s) à assigner au chemin créé par cette macro                 |

<Note>

The `round` macro is provided by the [round plugin](/plugins/round).

</Note>

## scalebox

Adds a *scale box* to your pattern.

| Propriété | Défaut                     | Type                 | Description                            |
| --------- | -------------------------- | -------------------- | -------------------------------------- |
| `at`      |                            | [Point](/api/point)  | The point to anchor the *scale box* on |
| `lead`    | FreeSewing                 | Chaîne de caractères | Le texte au dessus du titre            |
| `title`   | *nom du patron et version* | Chaîne de caractères | Le texte du titre                      |
| `text`    | (\*)                     | Chaîne de caractères | Le texte en dessous du titre           |
| `rotate`  | 0                          | Nombre               | Rotation en degrés                     |

(\*) `freesewingEstCrééParJoostDeCockEtContributeurs \n avecLeSoutienFinancierDeNosMécènes`

<Note>

The `round` macro is provided by the [round plugin](/plugins/round).

</Note>

## sprinkle

Ajoute en brut des snippets à votre patron.

| Propriété | Défaut | Type                            | Description                                               |
| --------- | ------ | ------------------------------- | --------------------------------------------------------- |
| `snippet` |        | Chaîne de caractères            | Nom du snippet à ajouter                                  |
| `on`      | `[]`   | Tableau de chaîne de caractères | An array with *the names* of points to add the snippet on |

<Note>

The `sprinkle` macro is provided by the [sprinkle plugin](/plugins/sprinkle).

</Note>

## title

Ajoute en brut des snippets à votre patron.

| Propriété  | Défaut  | Type                 | Description                                                                                                                                                                |
| ---------- |:-------:| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `at`       |         | [Point](/api/point)  | Le point où insérer le titre                                                                                                                                               |
| `nr`       |         | Chaîne de caractères | Le nombre de parties de patron                                                                                                                                             |
| `title`    |         | Chaîne de caractères | Le nom de la partie de patron. Si le titre n'est pas paramétré ou bien une chaîne de caractères vide, cela ne sera pas affiché, et la version apparaîtra en dessous de nr. |
| `prefix`   |         | Chaîne de caractères | Un préfixe à ajouter aux points créés. Cela autorise plus d'un titre par partie, du moment que vous leur donnez un préfixe différent.                                      |
| `append`   | `false` | Booléen              | Réglez ça sur `true` pour ajouter `nr` à n'importe quel texte déjà indiqué dans l'attribut `at` de Point, plutôt que de l'écraser                                          |
| `rotation` |    0    | Nombre               | Une rotation optionnelle en degrés                                                                                                                                         |
| `scale`    |    1    | Nombre               | Un facteur optionnel de mise à l'échelle                                                                                                                                   |

<Note>

The `title` macro is provided by the [title plugin](/plugins/title).

</Note>

## vd

Adds a *vertical dimension* to your pattern.

| Propriété       | Défaut             | Type                | Description                                                                         |
| --------------- | ------------------ | ------------------- | ----------------------------------------------------------------------------------- |
| `from`          |                    | [Point](/api/point) | Le point de départ de la dimension                                                  |
| `to`            |                    | [Point](/api/point) | Le point final de la dimension                                                      |
| `x`             |                    | Nombre              | La valeur en X à laquelle dessiner la dimension                                     |
| `text`          | Distance verticale | Nombre              | Le texte correspondant à la dimension si ce n'est pas la distance verticale from-to |
| `noStartMarker` | `false`            | Booléen             | Ne pas dessiner un marqueur de début                                                |
| `noEndMarker`   | `false`            | Booléen             | Ne pas dessiner un marqueur de fin                                                  |

<Note>

The `vd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>





