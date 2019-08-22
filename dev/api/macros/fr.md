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

| Propriété       | Défaut               | Type                | Description                                                            |
| --------------- | -------------------- | ------------------- | ---------------------------------------------------------------------- |
| `from`          |                      | [Point](/api/point) | Le point de départ de la dimension                                     |
| `to`            |                      | [Point](/api/point) | Le point final de la dimension                                         |
| `y`             |                      | Number              | La valeur en Y où dessiner la dimension                                |
| `text`          | Distance horizontale | Number              | The text to go on the dimension if not the from-to horizontal distance |
| `noStartMarker` | `false`              | Boolean             | Whether to not draw a start marker                                     |
| `noEndMarker`   | `false`              | Boolean             | Whether to not draw an end marker                                      |


<Note>

The `hd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## ld

Adds a *linear dimension* to your pattern.

| Propriété       | Défaut          | Type                | Description                                                        |
| --------------- | --------------- | ------------------- | ------------------------------------------------------------------ |
| `from`          |                 | [Point](/api/point) | Le point de départ de la dimension                                 |
| `to`            |                 | [Point](/api/point) | Le point final de la dimension                                     |
| `d`             | 0               | Number              | The offset at which to draw the dimension                          |
| `text`          | Linear distance | Number              | The text to go on the dimension if not the from-to linear distance |
| `noStartMarker` | `false`         | Boolean             | Whether to not draw a start marker                                 |
| `noEndMarker`   | `false`         | Boolean             | Whether to not draw an end marker                                  |


<Note>

The `ld` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## pd

Adds a *path dimension* to your pattern.

| Propriété       | Défaut      | Type              | Description                                                   |
| --------------- | ----------- | ----------------- | ------------------------------------------------------------- |
| `path`          |             | [Path](/api/path) | The path to draw the dimension along                          |
| `offset`        | 0           | Number            | The offset at which to draw the dimension                     |
| `text`          | Path length | Number            | The text to go on the dimension if not the length of the path |
| `noStartMarker` | `false`     | Boolean           | Whether to not draw a start marker                            |
| `noEndMarker`   | `false`     | Boolean           | Whether to not draw an end marker                             |


<Note>

The `pd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## round

Rounds a corner. Note that this is only intended for 90 degree corners.

| Propriété | Défaut  | Type                | Description                                                    |
| --------- | ------- | ------------------- | -------------------------------------------------------------- |
| `from`    |         | [Point](/api/point) | The startpoint towards the corner to round                     |
| `to`      |         | [Point](/api/point) | The endpoint away from the corner to round                     |
| `via`     |         | [Point](/api/point) | The corner to round                                            |
| `radius`  | Maximum | Number              | The radius in mm in not the maximum                            |
| `prefix`  |         | String              | A prefix to give to the points and paths created by this macro |
| `render`  | `false` | Boolean             | Whether to render the path created by this macro               |
| `class`   |         | String              | Class(es) to assign to the path created by this macro          |


<Note>

The `round` macro is provided by the [round plugin](/plugins/round).

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

The `round` macro is provided by the [round plugin](/plugins/round).

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
| `noStartMarker` | `false`           | Boolean             | Whether to not draw a start marker                                   |
| `noEndMarker`   | `false`           | Boolean             | Whether to not draw an end marker                                    |


<Note>

The `vd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>
