---
path: /en/docs/developer/plugins
title: Plugins
---

Plugins fall into two categories: Build-time plugins and Run-time plugins.

## Build-time plugins

### Bundle

This plugin bundles the following build-time plugins:

- [plugin-cutonfold](#cutonfold)
- [plugin-dimension](#dimension)
- [plugin-grainline](#grainline)
- [plugin-logo](#logo)
- [plugin-scalebox](#scalebox)
- [plugin-title](#title)

These plugins are used in almost all patterns, so it made sense to provide them as a bundle.

### Cutonfold

Provides the `cutonfold` macro to add cut-on-fold indicators to your pattern.

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

|  Property | Default | Decription                                                               |
| ---------:|:-------:| ------------------------------------------------------------------------ |
|        to |         | A [Point](/api/#point) object for the start of the cut-on-fold indicator |
|      from |         | A [Point](/api/#point) object for the end of the cut-on-fold indicator   |
| grainline | `false` | Set this to `true` to indicate this is also marks the grainline          |

> ###### It's safe to use a corner of your pattern part for this
> 
> Since this is typically used on corners, the generated cut-on-fold indicator will not go all the way to the `to` and `from` points.

<api-example o="plugin" m="cutonfold"></api-example>

### Dimension

Provides the following macros to add dimension indicators to your pattern:

- [hd](#hd) : Adds a horizontal dimension
- [vd](#vd) : Adds a vertical dimension
- [ld](#ld) : Adds a linear dimension
- [pd](#pd) : Adds a dimension along a path

They are described in detail below:

#### hd macro

Adds a horizontal dimension (hd) to your pattern.

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

|      Property |       Default        | Decription                                                   |
| -------------:|:--------------------:| ------------------------------------------------------------ |
|            to |                      | A [Point](/api/#point) object for the start of the dimension |
|          from |                      | A [Point](/api/#point) object for the end of the dimension   |
|             y |                      | The Y-coordinate at which to draw the dimension              |
|          text | `units(from.dx(to))` | The text to be placed on the dimension                       |
| noStartMarker |        false         | Set this to `true` to suppress the arrow at the from point   |
|   noEndMarker |        false         | Set this to `true` to suppress the arrow at the to point     |

#### vd macro

Adds a vertical dimension (vd) to your pattern.

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

|      Property |       Default        | Decription                                                   |
| -------------:|:--------------------:| ------------------------------------------------------------ |
|            to |                      | A [Point](/api/#point) object for the start of the dimension |
|          from |                      | A [Point](/api/#point) object for the end of the dimension   |
|             x |                      | The X-coordinate at which to draw the dimension              |
|          text | `units(from.dy(to))` | The text to be placed on the dimension                       |
| noStartMarker |        false         | Set this to `true` to suppress the arrow at the from point   |
|   noEndMarker |        false         | Set this to `true` to suppress the arrow at the to point     |

#### ld macro

Adds a linear dimension (ld) to your pattern.

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

|      Property |        Default         | Decription                                                   |
| -------------:|:----------------------:| ------------------------------------------------------------ |
|            to |                        | A [Point](/api/#point) object for the start of the dimension |
|          from |                        | A [Point](/api/#point) object for the end of the dimension   |
|             d |                        | The distance to offset the dimension by                      |
|          text | `units(from.dist(to))` | The text to be placed on the dimension                       |
| noStartMarker |         false          | Set this to `true` to suppress the arrow at the from point   |
|   noEndMarker |         false          | Set this to `true` to suppress the arrow at the to point     |

#### pd macro

Adds a path dimension (ld) to your pattern. As in, a dimension that follows a path.

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

|      Property |        Default         | Decription                                                 |
| -------------:|:----------------------:| ---------------------------------------------------------- |
|          path |                        | A [Path](/api/#path) object for which to add the dimension |
|             d |                        | The distance to offset the dimension by                    |
|          text | `units(path.length())` | The text to be placed on the dimension                     |
| noStartMarker |         false          | Set this to `true` to suppress the arrow at the from point |
|   noEndMarker |         false          | Set this to `true` to suppress the arrow at the to point   |

<api-example o="plugin" m="dimension"></api-example>

### Grainline

Provides the `grainline` macro to add grainline indicators to your pattern.

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

| Property | Decription                                                               |
| --------:| ------------------------------------------------------------------------ |
|       to | A [Point](/api/#point) object for the start of the cut-on-fold indicator |
|     from | A [Point](/api/#point) object for the end of the cut-on-fold indicator   |

<api-example o="plugin" m="grainline"></api-example>

### Logo

Provides the `logo` snippet to add the freesewing logo to your pattern.

<api-example o="plugin" m="grainline"></api-example>

### Scalebox

Provides the `scalebox` macro to add a scale box to your pattern parts.

<api-example o="plugin" m="scalebox"></api-example>

> ###### Purpose of a scale box
> 
> A scalebox allows people to verify the pattern is printed at the correct scale

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

| Property |        Default         | Decription                                                    |
| --------:|:----------------------:| ------------------------------------------------------------- |
|       at |                        | A [Point](/api/#point) object at which to insert the scalebox |
|     lead |       freesewing       | The lead above the title                                      |
|    title | pattern name + version | The pattern title                                             |
|     text |        See (*)         | The text below the title                                      |

(*) `freesewingIsMadeByJoostDeCockAndContributors \n withTheFinancialSupportOfOurPatrons`

<api-example o="plugin" m="scalebox"></api-example>

### Title

Provides the `title` macro to add a title to your pattern parts.

Like all freesewing macros, you pass it a single configuration object.  
This macro excepts the following properties:

| Property | Default | Decription                                                                                                                               |
| --------:|:-------:| ---------------------------------------------------------------------------------------------------------------------------------------- |
|       at |         | A [Point](/api/#point) object at which to insert the title                                                                               |
|       nr |         | The number of the pattern part                                                                                                           |
|    title |   ""    | The name of the pattern part. If title is not set or is an empty string, this won't be rendered, and the version will go beneath the nr. |
|   prefix |   ""    | A prefix to add to the created points. This allow for more than 1 title per part, as long as you give them a different prefix.           |
|   append | `false` | Set this to `true` to append the `nr` to any text already set in Point `at`'s attributes, rather than overwrite it                       |

<api-example o="plugin" m="title"></api-example>

### Debug

Enabled logging of debug info to the console.

This plugin does not require any configuration. Simply add it to your pattern and debug info will be logged to the console.

### Designer

Facilitates pattern design by adding extra point info to your rendered SVG.

This plugin will also trigger a `pointHover()` JavaScript call when you hover over a point.  
For maximum usefulness, add the following JavaScript to your HTML page to handle these events:

```js
function pointHover(evt) {
    var point = evt.target;
    var id = point.id;
    var cx = point.getAttribute('x');
    var cy = point.getAttribute('y');
    var name = point.getAttribute('data-point');
    var part = point.getAttribute('data-part');
    console.log(name+' ('+cx+', '+cy+') @ '+part);
    var scale = 2;
    cx = cx-scale*cx;
    cy = cy-scale*cy;
    point.setAttribute("transform", 'matrix('+scale+', 0, 0, '+scale+', '+cx+', '+cy+')');
    pointUnhover(id);
}
function pointUnhover(id) {
  setTimeout(function(){
        document.getElementById(id).removeAttribute("transform", '');
  }, 500);
}
```

### i18n

This plugin provides translation through the [insertText](/en/docs/developer/extend/#inserttext) hook, based on the [locale](/settings/#locale) setting.

It does not provide translations itself, but translation for all freesewing patterns is available through [@freesewing/i18n](https://github.com/freesewing/i18n).

> ###### Making your pattern translatable
> 
> To ensure the i18n plugin can do its job, make sure to read the [insertText hook](/en/docs/developer/extend/#inserttext) documentation.

### Theme

Styles your SVG by adding our default CSS. Also provides the following snippets:

- `notch` : A notch
- `bnotch` : An alternatively styled notch to differentiate between front and back notches

### Validate

Will throw an error if not all measurements that are required to draft the pattern are provided.

Freesewing doesn't do input validation out of the box, this is up to the front-end. This plugin will do a minimal check that at least all required measurements are provided.

It also runs additional checks and will `console.log()` warnings when it detects potential issues in your pattern.