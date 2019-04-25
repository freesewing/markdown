---
title: Attributes
path: /en/docs/developer/api/attributes
components: true
---

## Description

Attributes is an object that holds... you guessed it... attributes.
Attributes are attached to [Point](./point), [Path](./path), and [Snippet](./snippet) objects. 
All of these have an instantiated Attributes object in their `attributes` property.

> ###### attr() is chainable
>
> The `attr()` method that you'll find on [Point](./point#attr), [Path](./path#attr), 
> and [Snippet](./snippet#attr) objects makes setting attributes chainable for these objects.

An Attributes object exposes the following methods:

## Attributes.add()

```js
Attributes attributes.add(string key, string value)
```

Adds `value` to the attribute identified by `key`.

Adding multiple values to the same key will result in them being joined together 
(with a space) when rendering.

```js
let { Path, paths } = part.shorthand();

// This will render as: class="classA classB"
paths.demo = new Path();
paths.demo.attributes.add('class', 'classA');
paths.demo.attributes.add('class', 'classB');


// This does the same thing:
paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');
```

## Attributes.set()

```js
Attributes attributes.set(string key, string value)
```

Sets the attribute identified by `key` to value `value`.
 
This will overwrite any value that's currently set on the attribute identified by `key`:

```js{2,3}
let { Path, paths } = part.shorthand();

// This will render as: class="classB"
paths.demo = new Path();
paths.demo.attributes.set('class', 'classA');
paths.demo.attributes.set('class', 'classB');

// This does the same thing:
paths.demo = new Path()
  .attr('class', 'classA', true)
  .attr('class', 'classB', true);
```

## Attributes.get()

```js
string attributes.get(string key)
```
Will return the value of attribute stored under `key`, or `false` if it's not set.

If key has multiple values, they will be joined together in a string, seperated by spaces.

```js
let { Path, paths } = part.shorthand();

paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');

let class = paths.demo.attributes.get('class'); 
// class now holds: "classA classB"
```

## Attributes.getAsArray()

```js
array attributes.getAsArray(string key)
```

Will return an array with the value of attribute stored under `key`, or `false` if it's not set.

```js
let { Path, paths } = part.shorthand();

paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');

let class = paths.demo.attributes.getAsArray('class'); 
// class now holds: ["classA", "classB"]
```

## Attributes.remove()

```js
Attributes attributes.remove(string key)
```

Removes the attribute values under key and returns the Attributes object.

```js
let { Path, paths } = part.shorthand();

paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');

let class = paths.example.attributes
  .remove()
  .get('class'); 
// class now holds: false
```

## Attributes.clone()

```js
Attributes attributes.clone()
```

Returns a new Attributes object that is a deep copy of this one.
