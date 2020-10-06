---
title: Hooks
order: 20
---

<Note>

See also: [The hooks API reference](/reference/hooks/)

</Note>

A **hook** is a lifecycle event. The available hooks are:

 -  [preRender](/reference/hooks/prerender/): Called at the start of [`Pattern.render()`](/reference/api/pattern#render)
 -  [postRender](/reference/hooks/postrender/): Called at the end of [`Pattern.render()`](/reference/api/pattern#render)
 -  [insertText](/reference/hooks/inserttext/): Called when inserting text
 -  [preDraft](/reference/hooks/predraft/): Called at the start of [`Pattern.draft()`](/reference/api/pattern#draft)
 -  [postDraft](/reference/hooks/postdraft/): Called at the end of [`Pattern.draft()`](/reference/api/pattern#draft)
 -  [preSample](/reference/hooks/presample/): Called at the start of [`Pattern.sample()`](/reference/api/pattern#sample)
 -  [postSample](/reference/hooks/postsample/): Called at the end of [`Pattern.sample()`](/reference/api/pattern#sample)

You can register a method for a hook. When the hook is triggered, your method will be
called. It will receive two parameters:

 - An object relevant to the hook. See the [hooks API reference](/reference/hooks/) for details.
 - Data passed when the hook was registered (optional)

## Using hooks

For each hook, your plugin should provide a method that takes the relevant data
as its first argument. If data was passed when the hook was loaded, you will receive
that as the second object.

Remember that:

 - The `insertText` hook will receive a locale and string and you should return a string.
 - All other hooks receive an object. You don't need to return anything, but rather modify the object you receive.

Let's look at an example:

```js
import myStyle from './style';
import myDefs from './defs';
import {name, version} from '../package.json';

export default {
  name,
  version,
  hooks: {
    preRender: function(svg) {
      if (svg.attributes.get("freesewing:plugin-"+name) === false) {
        svg.style += myStyle;
        svg.defs += myDefs;
        svg.attributes.add("freesewing:plugin-"+name, version);
      }
    },
    insertText: function(text) {
      return text.toUpperCase();
    }
  }
}
```

This is a complete plugin, ready to be published on NPM. It uses two hooks:

 - `preRender` : We add some style and defs to our SVG
 - `insertText` : We transfer all text to UPPERCASE

<Note>

###### Note that we avoid running our hook twice

As you can see, the last thing we do in the `preRender` hook is set an attribute on
the SVG tag with the name and version of our plugin.

We check for this attribute when the `preRender` hook runs, thereby avoiding that
our styles and defs will be added twice.

It is good practice to wrap you hook methods in a call like this, because you have 
no guarantee the user won't render your pattern more than once.

</Note>

## Using hooks more than once

What if you want to attach more than one method to a hook?
You could spread them over seperate plugins, but there's a better way.

Rather than assigning a method to your hook, assign an array of methods like this:

```js
import myCoolMethod from './method-a';
import myEvenCoolerMethod from './method-b';
import {name, version} from '../package.json';

export default {
  name,
  version,
  hooks: {
    preRender: [
      myCoolMethod,
      myEvenCoolerMethod
    ]
  }
}
```

## Using hooks without a plugin

You can attach a method to a hook at run-time without the need for a plugin 
using the [Pattern.on()](/api/pattern#on) method.

The method takes the hook name as its first argument, and the hook method as its second.

Below is an example:

```js
pattern.on('preRender', function(svg) {
  svg.style += "svg { background: yellow;}";
});
```

Congratulations, you've just made your pattern yellow.

