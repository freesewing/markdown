---
title: Macros
---

All macro takes a single object as their configuration. The configuration object is documented on this page for all available macros.

<Tip>

For more info on a specific macro and examples, follow the link to the plugin that provides the macro.

</Tip>

## cutonfold

Adds a *cut on fold* indicator to your pattern.

| Property    | Default | Type                | Description                                                  |
| ----------- | ------- | ------------------- | ------------------------------------------------------------ |
| `from`      |         | [Point](/reference/api/point) | The startpoint of the *cut on fold* indicator                |
| `to`        |         | [Point](/reference/api/point) | The endpoint of the *cut on fold* indicator                  |
| `margin`    | 5       | [Point](/reference/api/point) | The distance in % to keep from the start/end edge            |
| `offset`    | 50      | Number              | The distance in mm to offset from the line from start to end |
| `grainline` | `false` | Boolean             | Whether this cutonfold indicator is also the grainline       |

<Note>

The `cutonfold` macro is provided by the [cutonfold plugin](/reference/plugins/cutonfold).

</Note>

## grainline

Adds a *grainline* indicator to your pattern.

| Property | Default | Type                | Description                                 |
| -------- | ------- | ------------------- | ------------------------------------------- |
| `from`   |         | [Point](/reference/api/point) | The startpoint of the *grainline* indicator |
| `to`     |         | [Point](/reference/api/point) | The endpoint of the *grainline* indicator   |

<Note>

The `grainline` macro is provided by the [grainline plugin](/reference/plugins/grainline).

</Note>

## hd

Adds a *horizontal dimension* to your pattern.

| Property        | Default             | Type                | Description                                                            |
| --------------- | ------------------- | ------------------- | ---------------------------------------------------------------------- |
| `from`          |                     | [Point](/reference/api/point) | The startpoint of the dimension                                        |
| `to`            |                     | [Point](/reference/api/point) | The endpoint of the dimension                                          |
| `y`             |                     | Number              | The Y-value at which to draw the dimension                             |
| `text`          | Horizontal distance | Number              | The text to go on the dimension if not the from-to horizontal distance |
| `noStartMarker` | `false`             | Boolean             | Whether to not draw a start marker                                     |
| `noEndMarker`   | `false`             | Boolean             | Whether to not draw an end marker                                      |

<Note>

The `hd` macro is provided by the [dimension plugin](/reference/plugins/dimension).

</Note>

## ld

Adds a *linear dimension* to your pattern.

| Property        | Default         | Type                | Description                                                        |
| --------------- | --------------- | ------------------- | ------------------------------------------------------------------ |
| `from`          |                 | [Point](/reference/api/point) | The startpoint of the dimension                                    |
| `to`            |                 | [Point](/reference/api/point) | The endpoint of the dimension                                      |
| `d`             | 0               | Number              | The offset at which to draw the dimension                          |
| `text`          | Linear distance | Number              | The text to go on the dimension if not the from-to linear distance |
| `noStartMarker` | `false`         | Boolean             | Whether to not draw a start marker                                 |
| `noEndMarker`   | `false`         | Boolean             | Whether to not draw an end marker                                  |

<Note>

The `ld` macro is provided by the [dimension plugin](/reference/plugins/dimension).

</Note>

## pd

Adds a *path dimension* to your pattern.

| Property        | Default     | Type              | Description                                                   |
| --------------- | ----------- | ----------------- | ------------------------------------------------------------- |
| `path`          |             | [Path](/reference/api/path) | The path to draw the dimension along                          |
| `offset`        | 0           | Number            | The offset at which to draw the dimension                     |
| `text`          | Path length | Number            | The text to go on the dimension if not the length of the path |
| `noStartMarker` | `false`     | Boolean           | Whether to not draw a start marker                            |
| `noEndMarker`   | `false`     | Boolean           | Whether to not draw an end marker                             |

<Note>

The `pd` macro is provided by the [dimension plugin](/reference/plugins/dimension).

</Note>

## round

Rounds a corner. Note that this is only intended for 90 degree corners.

| Property | Default | Type                | Description                                                    |
| -------- | ------- | ------------------- | -------------------------------------------------------------- |
| `from`   |         | [Point](/reference/api/point) | The startpoint towards the corner to round                     |
| `to`     |         | [Point](/reference/api/point) | The endpoint away from the corner to round                     |
| `via`    |         | [Point](/reference/api/point) | The corner to round                                            |
| `radius` | Maximum | Number              | The radius in mm in not the maximum                            |
| `prefix` |         | String              | A prefix to give to the points and paths created by this macro |
| `render` | `false` | Boolean             | Whether to render the path created by this macro               |
| `class`  |         | String              | Class(es) to assign to the path created by this macro          |

<Note>

The `round` macro is provided by the [round plugin](/reference/plugins/round).

</Note>

## scalebox

Adds a *scale box* to your pattern.

| Property | Default                  | Type                | Description                            |
| -------- | ------------------------ | ------------------- | -------------------------------------- |
| `at`     |                          | [Point](/reference/api/point) | The point to anchor the *scale box* on |
| `lead`   | FreeSewing               | String              | The lead text above the title          |
| `title`  | *pattern name + version* | String              | The title text                         |
| `text`   | (\*)                   | String              | The text below the title               |
| `rotate` | 0                        | Number              | Rotation in degrees                    |

(\*) `freesewingIsMadeByJoostDeCockAndContributors \n withTheFinancialSupportOfOurPatrons`

<Note>

The `round` macro is provided by the [round plugin](/reference/plugins/round).

</Note>

## sprinkle

Bulk-adds snippets to your pattern.

| Property  | Default | Type             | Description                                               |
| --------- | ------- | ---------------- | --------------------------------------------------------- |
| `snippet` |         | String           | Name of the snippet to sprinkle                           |
| `on`      | `[]`    | Array of strings | An array with *the names* of points to add the snippet on |

<Note>

The `sprinkle` macro is provided by the [sprinkle plugin](/reference/plugins/sprinkle).

</Note>

## title

Bulk-adds snippets to your pattern.

| Property   | Default | Type                | Description                                                                                                                              |
| ---------- |:-------:| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `at`       |         | [Point](/reference/api/point) | The point at which to insert the title                                                                                                   |
| `nr`       |         | String              | The number of the pattern part                                                                                                           |
| `title`    |         | String              | The name of the pattern part. If title is not set or is an empty string, this won't be rendered, and the version will go beneath the nr. |
| `prefix`   |         | String              | A prefix to add to the created points. This allow for more than 1 title per part, as long as you give them a different prefix.           |
| `append`   | `false` | Boolean             | Set this to `true` to append the `nr` to any text already set in Point `at`'s attributes, rather than overwrite it                       |
| `rotation` |    0    | Number              | An optional rotation in degrees                                                                                                          |
| `scale`    |    1    | Number              | An optional scaling factor                                                                                                               |

<Note>

The `title` macro is provided by the [title plugin](/reference/plugins/title).

</Note>

## vd

Adds a *vertical dimension* to your pattern.

| Property        | Default           | Type                | Description                                                          |
| --------------- | ----------------- | ------------------- | -------------------------------------------------------------------- |
| `from`          |                   | [Point](/reference/api/point) | The startpoint of the dimension                                      |
| `to`            |                   | [Point](/reference/api/point) | The endpoint of the dimension                                        |
| `x`             |                   | Number              | The X-value at which to draw the dimension                           |
| `text`          | Vertical distance | Number              | The text to go on the dimension if not the from-to vertical distance |
| `noStartMarker` | `false`           | Boolean             | Whether to not draw a start marker                                   |
| `noEndMarker`   | `false`           | Boolean             | Whether to not draw an end marker                                    |

<Note>

The `vd` macro is provided by the [dimension plugin](/reference/plugins/dimension).

</Note>





