---
title: Accessing options
order: 250
---

Options are stored in `pattern.settings.options`, but thanks to the [shorthand](/concepts/shorthand) call, you can simply write:

```js
let sleeveBonus = measurements.shoulderToWrist * (1 + options.sleeveLengthBonus);
```

## Adding points

After our [shorthand](#using-shorthand) call, **Point** contains the point constructor, while **points** is a reference to `part.points`, which is where you should store your points.

Things will now *just work* when we write this:

```js
points.centerBack  = new Point(0,0);
```

## Adding paths

Due to our [shorthand](#using-shorthand) call earlier, **Path** now contains the path constructor, while **paths** is a reference to `part.paths`, which is where you should store your paths.

We can now do this:

```js
paths.example = new Path();
```

## Adding snippets

Finally, our [shorthand](#using-shorthand) call also provides the snippet constructor in **Snippet**, and **snippets** is the place to store our snippets:

```js
snippets.logo = new Snippet('logo', points.logoAnchor);
```

You can scale and rotate a snippet by setting the `data-scale` and `data-rotate` attributes respectively.

- **data-scale** : Either a single scale factor, or a set of 2 scale factors for the X and Y axis respectively. See [the SVG scale transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Scale) for details.
- **data-rotate**: A rotation in degrees. The center of the rotation will be the snippet's anchor point

## Using attributes

Points, Paths, and Snippets all have [attributes](/api/#attributes) that you can use to influence how they behave.

A common scenario is to apply CSS classes to style a path;

```js
paths.example.attr('class', 'lining dashed');
```

> ###### attr() is a shortcut to set attributes
> 
> We're using the [Path.attr()](/api/#path-attr) method here. We could have also acccessed the path's `attributes` property and call [Attributes.add()](/api/#attributes-add) on it like this:
> 
> ```js
paths.example.attributes.add('class', 'lining dashed');
```

But less is more, right?

## Adding text

There's another, less intuitive, use for attributes. And that is to add text to your pattern.

To add text, all you have to do is add it to the `data-text` attribute. In addition, all attributes that have a `data-text-` prefix will apply to the text, rather than the point:

<api-example o="point" m="attr" box="1" strings='{ "msg": "Hello world!\nThis is\na line break"}'></api-example>

> ###### Multi-line text
> 
> Our example above has one more trick up its sleeve: Multi-line text. Adding a linebreak character (`\n`) to your text will start a new line.
> 
> Sadly, SVG support for multi-line text is patchy at best. And while you can style the text with CSS classes, there's no such thing as a paragraph in SVG.
> 
> That's why you have a secret weapon at your disposal: the `data-text-lineheight` attribute. Set it, and we will render your multiline SVG with the line height you set in it.
> 
> The default lineheight for multi-line text is 12mm

## Text on paths

Text on paths (which is a rather nice SVG feature) works exactly the same way as adding text on points. Simply set the `data-text` attribute.

<api-example o="path" m="attr" strings='{ "msg": "I am text on a path"}'></api-example>

## Drawing circles

Real circles are rarely used in pattern design, and they are not part of the SVG path specification, but rather a different SVG element.

Still, if you want a circle, you can draw one by setting a Point's `data-circle` attribute to the radius of the circle you want to draw.

In addition, all attributes that have a `data-circle-` prefix will apply to the circle, rather than the point.

<api-example o="utils" m="circlesintersect"></api-example>

## Adding seam allowance

Thanks to our [shorthand](#using-shorthand) call, the **sa** variable holds the seam allowance our user wants.

All you have to do now is let [Path.offset()](/api/#path-offset) do the dirty work for you.

<api-example o="settings" m="sa"></api-example>

## Using macros

Macros are a way to facilitate pattern design by bundling a bunch of individual actions into a little routine.

Macros are provided by [plugins](/extend/). Here are some examples:

- **grainline** : Adds a grainline to your pattern
- **cutonfold** : Adds a cut-on-fold indicator to your pattern
- **title** : Adds a part title
- **dimension** : Used to add dimensions on paperless patterns

Thanks to our [shorthand](#using-shorthand) call, you can simply call the macro method and pass it the name of the macro you want to run, and its arguments:

<api-example o="plugin" m="dimension"></api-example>

## Passing data between parts

Sometimes, you'll want to access data from another part. For example, you may store the length of the armhole in your front and back parts, and then read that value when drafting the sleeve so you can verify the sleeve fits the armhole.

Our [shorthand](#using-shorthand) call provides the [Store](/api/#store) object which you can use for this.

```js
{ store } = parts.onePart.shorthand();
store.set('hello', 'world');

{ store } = parts.anotherPart.shorthand(); // Note: different part
store.get('hello'); // Returns 'world'
```

In a case like this, you need to make certain that `onePart` is drafted before `anotherPart`, which is something you can setup in your [pattern configuration](/config/).