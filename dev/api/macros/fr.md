---
title: Macros
---

Toutes les macros prennent un unique objet comme configuration. L'objet de configuration est documenté sur cette page pour toutes les macros disponibles.

<tip>

For more info on a specific macro and examples, follow the link to the plugin that provides the macro.

</Tip>

## cutonfold

Adds a *cut on fold* indicator to your pattern.

| Property    | Default | Type                | Description                                                  |
| ----------- | ------- | ------------------- | ------------------------------------------------------------ |
| `from`      |         | [Point](/api/point) | The startpoint of the *cut on fold* indicator                |
| `to`        |         | [Point](/api/point) | The endpoint of the *cut on fold* indicator                  |
| `margin`    | 5       | [Point](/api/point) | The distance in % to keep from the start/end edge            |
| `offset`    | 50      | Number              | The distance in mm to offset from the line from start to end |
| `grainline` | `false` | Boolean             | Whether this cutonfold indicator is also the grainline       |


<note>

The `cutonfold` macro is provided by the [cutonfold plugin](/plugins/cutonfold).

</Note>

## grainline

Adds a *grainline* indicator to your pattern.

| Property | Default | Type                | Description                                 |
| -------- | ------- | ------------------- | ------------------------------------------- |
| `from`   |         | [Point](/api/point) | The startpoint of the *grainline* indicator |
| `to`     |         | [Point](/api/point) | The endpoint of the *grainline* indicator   |


<note>

The `grainline` macro is provided by the [grainline plugin](/plugins/grainline).

</Note>

## hd

Adds a *horizontal dimension* to your pattern.

| Property        | Default             | Type                | Description                                                            |
| --------------- | ------------------- | ------------------- | ---------------------------------------------------------------------- |
| `from`          |                     | [Point](/api/point) | The startpoint of the dimension                                        |
| `to`            |                     | [Point](/api/point) | The endpoint of the dimension                                          |
| `y`             |                     | Number              | The Y-value at which to draw the dimension                             |
| `text`          | Horizontal distance | Number              | The text to go on the dimension if not the from-to horizontal distance |
| `noStartMarker` | `false`             | Boolean             | Whether to not draw a start marker                                     |
| `noEndMarker`   | `false`             | Boolean             | Whether to not draw an end marker                                      |


<note>

The `hd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## ld

Adds a *linear dimension* to your pattern.

| Property        | Default         | Type                | Description                                                        |
| --------------- | --------------- | ------------------- | ------------------------------------------------------------------ |
| `from`          |                 | [Point](/api/point) | The startpoint of the dimension                                    |
| `to`            |                 | [Point](/api/point) | The endpoint of the dimension                                      |
| `d`             | 0               | Number              | The offset at which to draw the dimension                          |
| `text`          | Linear distance | Number              | The text to go on the dimension if not the from-to linear distance |
| `noStartMarker` | `false`         | Boolean             | Whether to not draw a start marker                                 |
| `noEndMarker`   | `false`         | Boolean             | Whether to not draw an end marker                                  |


<note>

The `ld` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## pd

Adds a *path dimension* to your pattern.

| Property        | Default     | Type              | Description                                                   |
| --------------- | ----------- | ----------------- | ------------------------------------------------------------- |
| `path`          |             | [Path](/api/path) | The path to draw the dimension along                          |
| `offset`        | 0           | Number            | The offset at which to draw the dimension                     |
| `text`          | Path length | Number            | The text to go on the dimension if not the length of the path |
| `noStartMarker` | `false`     | Boolean           | Whether to not draw a start marker                            |
| `noEndMarker`   | `false`     | Boolean           | Whether to not draw an end marker                             |


<note>

The `pd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>

## round

Rounds a corner. Note that this is only intended for 90 degree corners.

| Property | Default | Type                | Description                                                    |
| -------- | ------- | ------------------- | -------------------------------------------------------------- |
| `from`   |         | [Point](/api/point) | The startpoint towards the corner to round                     |
| `to`     |         | [Point](/api/point) | The endpoint away from the corner to round                     |
| `via`    |         | [Point](/api/point) | The corner to round                                            |
| `radius` | Maximum | Number              | The radius in mm in not the maximum                            |
| `prefix` |         | String              | A prefix to give to the points and paths created by this macro |
| `render` | `false` | Boolean             | Whether to render the path created by this macro               |
| `class`  |         | String              | Class(es) to assign to the path created by this macro          |


<note>

The `round` macro is provided by the [round plugin](/plugins/round).

</Note>

## scalebox

Adds a *scale box* to your pattern.

| Property | Default                  | Type                | Description                            |
| -------- | ------------------------ | ------------------- | -------------------------------------- |
| `at`     |                          | [Point](/api/point) | The point to anchor the *scale box* on |
| `lead`   | FreeSewing               | String              | The lead text above the title          |
| `title`  | *pattern name + version* | String              | The title text                         |
| `text`   | (\*)                   | String              | The text below the title               |
| `rotate` | 0                        | Number              | Rotation in degrees                    |


(\*) `freesewingIsMadeByJoostDeCockAndContributors \n withTheFinancialSupportOfOurPatrons`

<note>

The `round` macro is provided by the [round plugin](/plugins/round).

</Note>

## sprinkle

Bulk-adds snippets to your pattern.

| Property  | Default | Type             | Description                                               |
| --------- | ------- | ---------------- | --------------------------------------------------------- |
| `snippet` |         | String           | Name of the snippet to sprinkle                           |
| `on`      | `[]`    | Array of strings | An array with *the names* of points to add the snippet on |


<note>

The `sprinkle` macro is provided by the [sprinkle plugin](/plugins/sprinkle).

</Note>

## title

Bulk-adds snippets to your pattern.

| Property   | Default | Type                | Description                                                                                                                              |
| ---------- |:-------:| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `at`       |         | [Point](/api/point) | The point at which to insert the title                                                                                                   |
| `nr`       |         | String              | The number of the pattern part                                                                                                           |
| `title`    |         | String              | The name of the pattern part. If title is not set or is an empty string, this won't be rendered, and the version will go beneath the nr. |
| `prefix`   |         | String              | A prefix to add to the created points. This allow for more than 1 title per part, as long as you give them a different prefix.           |
| `append`   | `false` | Boolean             | Set this to `true` to append the `nr` to any text already set in Point `at`'s attributes, rather than overwrite it                       |
| `rotation` |    0    | Number              | An optional rotation in degrees                                                                                                          |
| `scale`    |    1    | Number              | An optional scaling factor                                                                                                               |


<note>

The `title` macro is provided by the [title plugin](/plugins/title).

</Note>

## vd

Adds a *vertical dimension* to your pattern.

| Property        | Default           | Type                | Description                                                          |
| --------------- | ----------------- | ------------------- | -------------------------------------------------------------------- |
| `from`          |                   | [Point](/api/point) | The startpoint of the dimension                                      |
| `to`            |                   | [Point](/api/point) | The endpoint of the dimension                                        |
| `x`             |                   | Number              | The X-value at which to draw the dimension                           |
| `text`          | Vertical distance | Number              | The text to go on the dimension if not the from-to vertical distance |
| `noStartMarker` | `false`           | Boolean             | Whether to not draw a start marker                                   |
| `noEndMarker`   | `false`           | Boolean             | Whether to not draw an end marker                                    |


<note>

The `vd` macro is provided by the [dimension plugin](/plugins/dimension).

</Note>