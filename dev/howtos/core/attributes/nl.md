---
title: Attributen gebruiken
order: 300
---

Points, Paths, and Snippets all have [attributes](/reference/api/attributes/) that you can use to influence how they behave.

Een algemeen toepassing is om CSS classes aan te geven:

```js
paths.example.attributes.add('class', 'lining dashed');
```

Omdat het zo vaak voorkomt om attributen toe te voegen hebben Points, Paths, en Snippets allemaal een `attr()` helper methode.

Niet alleen is de methode eenvoudiger, de methode is ook *chainable*, wat je dit toestaat:

```js
points.message = new Point(0,0)
  .attr("data-text", "Hello world!")
  .attr("data-text-class", "note");
```

<Note>

In this example, we're using attributes to add text to our pattern.
The [adding-text](/concepts/adding-text) documentation explains this in detail.

</Note>

<Tip>

When rendering, FreeSewing will output all your attributes. This gives you the 
possiblity to use any valid attribute to control the appearance.

This is also why we use the *data-* prefix for those attributes that have
special meaning within FreeSewing, such as `data-text`. Adding a `text` attribute
would result in invalid SVG as there is no such thing as a text attribute. But `data-text`
is fine because the `data-` prefix indicates it is a [custom attribute](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/data-*).

</Tip>

