---
path: /en/docs/developer/examples
title: Learn by example
---

## Creating a new pattern design

To create a new pattern, call `new freesewing.Design()`.
It takes your pattern configuration, 
and any plugins you want to load as parameters.

For example, if we were creating a new pattern called `Sorcha`:

```js
import freesewing from "freesewing";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";

// Create new design
const Sorcha = new freesewing.Design(config, plugins);
```

> ###### freesewing.Design() is a super-constructor
>
> The only time you'll use the `freesewing.Design()` method is when you're
> creating a new pattern design. 
>
> Constructors are functions you can call with `new` to create an object. 
> But this constructor does not return a `Design` object. Instead it returns 
> a constructor method for your pattern.
>
> Here's an example:
>
> ```js
> import freesewing from "freesewing";
> import plugins from "@freesewing/plugin-bundle";
> import config from "../config";
> 
> // Create new design
> const Sorcha = new freesewing.Design(config, plugins);
>
> // Rest of your pattern code
>
> export default Sorcha;
> ```
>
> When importing your pattern, it is itself a constructor:
>
> ```js
> import Sorcha from "@freesewing/sorcha";
> 
> // Sorcha is a constructor for your pattern. 
> let pattern = new Sorcha();
> ```
> 
> As `freesewing.Design()` returns a constructor, you can think of it
> as a super-constructor.

## Adding pattern parts

Since the patterns parts are listed 
in [the configuration file](/en/docs/developer/config), freesewing knows about
all the parts that belong to your pattern.

It expects that each pattern has it's own draft method, that is called `draft`
followed by the capitalized name of the pattern part.

For example, if our pattern `Sorcha` has a part called `back`, you should
have a `draftBack` method. It's good practice to keep each part in its own
file, so create a file called `back.js`. Inside, you export your method
to draft this part:

```js
export default part => {
  // Your part code here
}
```

Then, in your `index.js` file, you import this file, and attach the
method to your pattern's prototype:

```js
import freesewing from "freesewing";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";
// Parts
import draftBack from "./back";

// Create new design
const Sorcha = new freesewing.Design(config, plugins);

// Per-part draft methods
Sorcha.prototype.draftBack = part => draftBack(part);
```

## Extending other patterns

If your pattern is based on, or extending, another pattern (some of) your
pattern parts will need to be drafted by the parent pattern.

In such a case, rather than return our own draft method for the part, you 
should instantiate the parent pattern, and return its part draft method:

```js
import freesewing from "freesewing";
import Brian from "@freesewing/brian";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";
// Parts
import draftBack from "./back";

// Create new design
const Sorcha = new freesewing.Design(config, plugins);

// Per-part draft methods
Sorcha.prototype.draftBack = part => draftBack(part);
Sorcha.prototype.draftBase = function(part) {
  // Getting the base part from Brian
  return new Brian(this.settings).draftBase(part);
};
```

> ###### Do not use an arrow function when using this
>
> Because we're using to the `this` keyword here, you cannot use the 
> arrow notation for these methods.

## Using shorthand

The [Part.shorthand()](/api/part/#shorthand) method will become your best friend.

By using [object destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Object_destructuring) you'll get access to a bunch
of handy variables to make your code more concise and readable.

[Part.shorthand()](/api/#part-shorthand) provides a lot of things, and you typically 
don't need all of them, but here's everything it has to offer:

```js
  let {
    options,      // Pattern options
    measurements, // Model measurements
    Point,        // Point constructor
    Path,         // Path constructor
    Snippet,      // Snippet constructor
    points,       // Holds part points
    paths,        // Holds part paths
    snippets,     // Holds part snippets
    store,        // The store allows you to share data between parts
    utils,        // A collection of utilities
    macro,        // Method to call a macro
    debug,        // Method to log debug info
    sa,           // Requested seam allowance
    final,        // Whether to draft a complete pattern or not
    paperless,    // Whether to draft a paperless pattern or not
    units,        // Requested units
  } = part.shorthand();
```

We will use our 
[shorthand](#using-shorthand)
notation as we continue our examples.

## Accessing measurements

Measusuremnets are stored in `pattern.settings.measurements`, but thanks to our 
[shorthand](#using-shorthand)
call earlier, we can simply write:

```js
let quarterChest = measurements.chestCircumference / 4;
```
## Accessing options
Similar story for options, who are stored stored in `pattern.settings.options`.

After a
[shorthand](#using-shorthand)
call, we can write:

```js
let sleeveBonus = measurements.shoulderToWrist * (1 + options.sleeveLengthBonus);
```

## Adding points

After our 
[shorthand](#using-shorthand)
call, **Point** contains the point constructor, while **points** is a reference to `part.points`,
which is where you should store your points.

Things will now *just work* when we write this:

```js
points.centerBack  = new Point(0,0);
```

## Adding paths
Due to our 
[shorthand](#using-shorthand)
call earlier, **Path** now contains the path constructor, while **paths** is a reference to `part.paths`,
which is where you should store your paths.

We can now do this:

```js
paths.example = new Path();
```

## Adding snippets

Finally, our 
[shorthand](#using-shorthand)
call also provides the snippet constructor in **Snippet**, and **snippets** is the place to store our snippets:

```js
snippets.logo = new Snippet('logo', points.logoAnchor);
```

You can scale and rotate a snippet by setting the `data-scale` and `data-rotate` attributes respectively.

 - **data-scale** : Either a single scale factor, or a set of 2 scale factors for the X and Y axis respectively. See [the SVG scale transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Scale) for details.
 - **data-rotate**: A rotation in degrees. The center of the rotation will be the snippet's anchor point

## Using attributes

Points, Paths, and Snippets all have [attributes](/api/#attributes) that you can use to
influence how they behave.

A common scenario is to apply CSS classes to style a path;

```js
paths.example.attr('class', 'lining dashed');
```

> ###### attr() is a shortcut to set attributes
>
> We're using the [Path.attr()](/api/#path-attr) method here.
> We could have also acccessed the path's `attributes` property and call 
> [Attributes.add()](/api/#attributes-add) on it like this:
> 
> ```js
> paths.example.attributes.add('class', 'lining dashed');
> ```
> But less is more, right?

## Adding text

There's another, less intuitive, use for attributes. And that is to add text to your pattern.

To add text, all you have to do is add it to the `data-text` attribute.
In addition, all attributes that have a `data-text-` prefix will apply to the text, rather than the point:

<api-example o="point" m="attr" box="1" strings='{ "msg": "Hello world!\nThis is\na line break"}'></api-example>

> ###### Multi-line text
> 
> Our example above has one more trick up its sleeve: Multi-line text.
> Adding a linebreak character (`\n`) to your text will start a new line.
> 
> Sadly, SVG support for multi-line text is patchy at best. 
> And while you can style the text with CSS classes, there's no such thing as a paragraph in SVG.
> 
> That's why you have a secret weapon at your disposal: the `data-text-lineheight` attribute.
> Set it, and we will render your multiline SVG with the line height you set in it.
> 
> The default lineheight for multi-line text is 12mm

## Text on paths

Text on paths (which is a rather nice SVG feature) works exactly the same way as adding text on points.
Simply set the `data-text` attribute.

<api-example o="path" m="attr" strings='{ "msg": "I am text on a path"}'></api-example>

## Drawing circles

Real circles are rarely used in pattern design, and they are not part of the SVG path specification, 
but rather a different SVG element.

Still, if you want a circle, you can draw one by setting a Point's `data-circle` attribute 
to the radius of the circle you want to draw.

In addition, all attributes that have a `data-circle-` prefix will apply to the circle, rather than the point.

<api-example o="utils" m="circlesintersect"></api-example>

## Adding seam allowance

Thanks to our 
[shorthand](#using-shorthand)
call, the **sa** variable holds the seam allowance our user wants.

All you have to do now is let [Path.offset()](/api/#path-offset) do the dirty work for you.

<api-example o="settings" m="sa"></api-example>

## Using macros

Macros are a way to facilitate pattern design by bundling a bunch of individual actions
into a little routine.

Macros are provided by [plugins](/extend/). Here are some examples:

 - **grainline** : Adds a grainline to your pattern
 - **cutonfold** : Adds a cut-on-fold indicator to your pattern
 - **title** : Adds a part title
 - **dimension** : Used to add dimensions on paperless patterns

Thanks to our 
[shorthand](#using-shorthand)
call, you can simply call the macro method and pass it the name of the macro you 
want to run, and its arguments:

<api-example o="plugin" m="dimension"></api-example>

## Passing data between parts

Sometimes, you'll want to access data from another part.
For example, you may store the length of the armhole in your front and back parts,
and then read that value when drafting the sleeve so you can verify the sleeve fits the armhole.

Our 
[shorthand](#using-shorthand)
call provides the [Store](/api/#store) object which you can use for this.

```js
{ store } = parts.onePart.shorthand();
store.set('hello', 'world');

{ store } = parts.anotherPart.shorthand(); // Note: different part
store.get('hello'); // Returns 'world'
```

In a case like this, you need to make certain that `onePart` is drafted before 
`anotherPart`, which is something you can setup in your [pattern configuration](/config/).
