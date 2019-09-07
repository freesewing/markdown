---
title: Macros
---

Toutes les macros prennent un unique objet comme configuration. L'objet de configuration est documenté sur cette page pour toutes les macros disponibles.

<Tip>

Pour plus d'informations sur une macro spécifique et des exemples, suivez le lien vers le plugin qui fournit la macro.

</Tip>

## cutonfold

Ajoute un indicateur *Coupé au pli* à votre patron.

| Propriété   | Défaut  | Type                | Description                                                                 |
| ----------- | ------- | ------------------- | --------------------------------------------------------------------------- |
| `from`      |         | [Point](/api/point) | Le point de départ de l'indicateur *Coupé au pli*                           |
| `to`        |         | [Point](/api/point) | Le point final de l'indicateur *Coupé au pli*                               |
| `margin`    | 5       | [Point](/api/point) | La distance en % à garder à partir du bord de départ/fin                    |
| `offset`    | 50      | Number              | La distance en mm de décalage par rapport à la ligne du début à la fin      |
| `grainline` | `false` | Boolean             | Si cet indicateur de découpage correspond également à la ligne de droit-fil |


<Note>

La macro `cutonfold` est fournie par le [plugin cutonfold](/plugins/cutonfold).

</Note>

## grainline

Ajoute un indicateur *Coupé au pli* à votre patron.

| Propriété | Défaut | Type                | Description                                             |
| --------- | ------ | ------------------- | ------------------------------------------------------- |
| `from`    |        | [Point](/api/point) | Le point de départ de l'indicateur *ligne de droit-fil* |
| `to`      |        | [Point](/api/point) | Le point final de l'indicateur *ligne de droit-fil*     |


<Note>

La macro `grainline` (ligne de droit-fil) est fournie par le [plugin grainline](/plugins/grainline).

</Note>

## hd

Ajoute une *dimension horizontale* à votre patron.

| Propriété       | Défaut               | Type                | Description                                                                                       |
| --------------- | -------------------- | ------------------- | ------------------------------------------------------------------------------------------------- |
| `from`          |                      | [Point](/api/point) | Le point de départ de la dimension                                                                |
| `to`            |                      | [Point](/api/point) | Le point final de la dimension                                                                    |
| `y`             |                      | Number              | La valeur en Y où dessiner la dimension                                                           |
| `text`          | Distance horizontale | Number              | Le texte à indiquer sur une dimension s'il ne s'agit pas de la de la distance horizontale from-to |
| `noStartMarker` | `false`              | Boolean             | Ne pas dessiner un marqueur de début                                                              |
| `noEndMarker`   | `false`              | Boolean             | Ne pas dessiner un marqueur de fin                                                                |


<Note>

La macro `hd` est fournie par le [plugin dimension](/plugins/dimension).

</Note>

## ld

Ajoute une *dimension linéaire* à votre patron.

| Propriété       | Défaut            | Type                | Description                                                                    |
| --------------- | ----------------- | ------------------- | ------------------------------------------------------------------------------ |
| `from`          |                   | [Point](/api/point) | Le point de départ de la dimension                                             |
| `to`            |                   | [Point](/api/point) | Le point final de la dimension                                                 |
| `d`             | 0                 | Number              | Le décalage avec lequel dessiner la dimension                                  |
| `text`          | Distance linéaire | Number              | Le texte à accoler à la dimension si ce n'est pas la distance linéaire from-to |
| `noStartMarker` | `false`           | Boolean             | Ne pas dessiner un marqueur de début                                           |
| `noEndMarker`   | `false`           | Boolean             | Ne pas dessiner un marqueur de fin                                             |


<Note>

La macro `ld` est fournie par le [plugin dimension](/plugins/dimension).

</Note>

## pd

Ajoute une *dimension de chemin* à votre patron.

| Propriété       | Défaut             | Type              | Description                                                        |
| --------------- | ------------------ | ----------------- | ------------------------------------------------------------------ |
| `path`          |                    | [Path](/api/path) | Le chemin le long duquel dessiner la dimension                     |
| `offset`        | 0                  | Number            | Le décalage avec lequel dessiner la dimension                      |
| `text`          | Longueur du chemin | Number            | Le texte à accoler au chemin si ce n'est pas la longueur du chemin |
| `noStartMarker` | `false`            | Boolean           | Ne pas dessiner un marqueur de début                               |
| `noEndMarker`   | `false`            | Boolean           | Ne pas dessiner un marqueur de fin                                 |


<Note>

La macro `pd` est fournie par le [plugin dimension](/plugins/dimension).

</Note>

## round

Arrondit un coin. Notez que cela ne s'adresse qu'aux coins à 90 degrés.

| Propriété | Défaut  | Type                | Description                                                         |
| --------- | ------- | ------------------- | ------------------------------------------------------------------- |
| `from`    |         | [Point](/api/point) | Le point de départ de l'arrondi                                     |
| `to`      |         | [Point](/api/point) | Le point final de l'arrondi                                         |
| `via`     |         | [Point](/api/point) | Le coin à arrondir                                                  |
| `radius`  | Maximum | Number              | Le rayon en mm si c'est pas le maximum                              |
| `prefix`  |         | String              | Un préfixe à donner aux points et aux chemins créés par cette macro |
| `render`  | `false` | Boolean             | Afficher le chemin créé par cette macro                             |
| `class`   |         | String              | Classe(s) à assigner au chemin créé par cette macro                 |


<Note>

La macro `round` est fournie par le [plugin round](/plugins/round).

</Note>

## scalebox

Adds a *scale box* to your pattern.

| Propriété | Défaut                   | Type                | Description                            |
| --------- | ------------------------ | ------------------- | -------------------------------------- |
| `at`      |                          | [Point](/api/point) | The point to anchor the *scale box* on |
| `lead`    | FreeSewing               | String              | The lead text above the title          |
| `title`   | *pattern name + version* | String              | The title text                         |
| `text`    | (\*)                   | String              | The text below the title               |
| `rotate`  | 0                        | Number              | Rotation in degrees                    |


(\*) `freesewingIsMadeByJoostDeCockAndContributors \n withTheFinancialSupportOfOurPatrons`

<Note>

La macro `round` est fournie par le [plugin round](/plugins/round).

</Note>

## sprinkle

Bulk-adds snippets to your pattern.

| Propriété | Défaut | Type             | Description                                               |
| --------- | ------ | ---------------- | --------------------------------------------------------- |
| `snippet` |        | String           | Name of the snippet to sprinkle                           |
| `on`      | `[]`   | Array of strings | An array with *the names* of points to add the snippet on |


<Note>

The `sprinkle` macro is provided by the [sprinkle plugin](/plugins/sprinkle).

</Note>

## title

Bulk-adds snippets to your pattern.

| Propriété  | Défaut  | Type                | Description                                                                                                                              |
| ---------- |:-------:| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `at`       |         | [Point](/api/point) | The point at which to insert the title                                                                                                   |
| `nr`       |         | String              | The number of the pattern part                                                                                                           |
| `title`    |         | String              | The name of the pattern part. If title is not set or is an empty string, this won't be rendered, and the version will go beneath the nr. |
| `prefix`   |         | String              | A prefix to add to the created points. This allow for more than 1 title per part, as long as you give them a different prefix.           |
| `append`   | `false` | Boolean             | Set this to `true` to append the `nr` to any text already set in Point `at`'s attributes, rather than overwrite it                       |
| `rotation` |    0    | Number              | An optional rotation in degrees                                                                                                          |
| `scale`    |    1    | Number              | An optional scaling factor                                                                                                               |


<Note>

The `title` macro is provided by the [title plugin](/plugins/title).

</Note>

## vd

Adds a *vertical dimension* to your pattern.

| Propriété       | Défaut            | Type                | Description                                                          |
| --------------- | ----------------- | ------------------- | -------------------------------------------------------------------- |
| `from`          |                   | [Point](/api/point) | Le point de départ de la dimension                                   |
| `to`            |                   | [Point](/api/point) | Le point final de la dimension                                       |
| `x`             |                   | Number              | The X-value at which to draw the dimension                           |
| `text`          | Vertical distance | Number              | The text to go on the dimension if not the from-to vertical distance |
| `noStartMarker` | `false`           | Boolean             | Ne pas dessiner un marqueur de début                                 |
| `noEndMarker`   | `false`           | Boolean             | Ne pas dessiner un marqueur de fin                                   |


<Note>

The `vd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>