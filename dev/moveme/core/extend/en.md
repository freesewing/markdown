---
path: /en/docs/developer/extend
title:  Extending freesewing
---

Plugins allow you to extend freesewing beyond the basic functionality. 

We already have a [list of available plugins](/en/docs/developer/plugins)
but if you can't find what you're looking for, you can write your own.

## Plugin structure

Plugins are relatively simple, as they can only do two things: 

 - They can use hooks 
 - They can provide macros

Your plugin should export an object with the following structure:

```js
{
  name: 'myPlugin',
  version: '1.0.0',
  hooks: {},
  macros: {}
};
```

The `name` and `version` attributes are self-explanatory. 
But `hooks` and `macros` requires some more explanation.

## Available hooks

A **hook** is a way for your plugin to listen to an event in a pattern's lifecycle.

You can register a method for a hook. When the hook is triggered, your method will be
called. It will receive two parameters:

 - An object that is relevant to the hook (see below for details)
 - Data passed when the hook was registered (optional)

This will become more clear when we look in detail at the available hooks. They are:

 -  [preRender](#prerender)
 -  [postRender](#postrender)
 -  [insertText](#inserttext)
 -  [debug](#debug)
 -  [preDraft](#predraft)
 -  [postDraft](#postdraft)
 -  [preSample](#presample)
 -  [postSample](#postsample)

### preRender

The `preRender` hook is triggered just before your pattern is rendered to SVG.
Your hook method will receive [the SVG object](/en/docs/developer/api/svg) as its first parameter.

### postRender

The `postRender` hook is triggered after the SVG is rendered.
It is rarely used, but available when you need it.

Like the `preRender` hook, it receives the SVG object as its first parameter.

### insertText

The `insertText` hook is called when text is about to be inserted during rendering.

Methods attached to the `insertText` hook will receive 2 parameters:

 - `locale` : The language code of the language requested by the user (default = `en`)
 - `text`: The text to be inserted

Unlike most hooks that receive an object that you can make changes to, 
for this hook you need to return a string. 

This hook is typically used for translation, as is the case
in [our i18n plugin](/en/docs/developer/plugins/#i18n).

> ###### Understanding the insertText hook
> 
> When we say that *this hook is called when text is about to be inserted*, that is a simplified view.
> In reality, this hook is called:
> 
>  - For every value set on data-text
>  - For the combined result of these values, joined together with spaces
> 
> Let's use an example to clarify things:
> 
> ```js
> points.example
>   .attr('data-text', "seamAllowance")
>   .attr('data-text', ": 1cm")
> ```
> 
> For the example point above, the `insertText` hook will end up being called 3 times:
> 
>  - First it will pass `Seam allowance` to the plugin
>  - Then it will pass `: 1cm` to the plugin
>  - Finally it will pass `Seam allowance : 1cm` to the plugin
> 
> Having the `insertText` hook only run once with `Seam allowance: 1cm` would be problematic because
> the seam allowance may differ, or perhaps we're using imperial units, and so on.
> 
> Instead, you can (and should) divide your text into chunks that need translating, and chunks that do not.
> 
> This is also why we're not inserting **Seam allowance** but rather **seamAllowance**; 
> It is merely a key to indicate what translation we want to replace this text with.

### debug

The debug hook is attached to the [Pattern](/en/docs/developer/api/pattern/) object, 
the [Svg](/en/docs/developer/api/svg/) object, and it's also available through
the [Part.shorthand()](/en/docs/developer/api/part/#partshorthand) method.

Unlike other hooks, the `debug` hook is not triggered by freesewing itself, but can
be triggered by pattern designers and users alike.

Our [debug plugin](/en/docs/developer/plugins/#debug)
is an example of a plugin using the debug hook. 

### preDraft

The `preDraft` hook runs just before your pattern is drafted.
Your plugin will receive the Pattern object. 

The `preDraft` hook is rarely used.

### postDraft

The `preDraft` hook runs just after your pattern is drafted.
Your plugin will receive the Pattern object. 

The `postDraft` hook is rarely used.

### preSample

The `preSample` hook runs just before your pattern is sampled.
Your plugin will receive the Pattern object. 

It is triggered at the very start of either:

 - the [Pattern.sampleOption()](/en/docs/developer/api/pattern/#patternsampleoption) method
 - the [Pattern.sampleMeasurement()](/en/docs/developer/api/pattern/#patternsamplemeasurement) method
 - the [Pattern.sampleModels()](/en/docs/developer/api/pattern/#patternsamplemodels) method

The `preSample` hook is rarely used.

### postSample

The `postSample` hook runs just after your pattern is sampled.
Your plugin will receive the Pattern object. 

It is triggered just before the end of either:

 - the [Pattern.sampleOption()](/en/docs/developer/api/pattern/#patternsampleoption) method
 - the [Pattern.sampleMeasurement()](/en/docs/developer/api/pattern/#patternsamplemeasurement) method
 - the [Pattern.sampleModels()](/en/docs/developer/api/pattern/#patternsamplemodels) method

The `postSample` hook is rarely used.

## Using hooks

For each hook, your plugin should provide a method that takes the relevant data
as its first argument. If data was passed when the hook was loaded, you will receive
that as the second object.

 - The `insertText` hook will receive a locale and string and you should return a string.
 - The `debug` hook will receive the data passed in the debug call.
 - All other hooks receive an object. So you don't need to return
anything, but rather modify the object you receive.

Let's look at an example:

```js
import myStyle from './style';
import myDefs from './defs';
import {name, version} from '../package.json';

export default {
  name: name,
  version: version,
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

> ###### Note that we avoid running our hook twice
> 
> As you can see, the last thing we do in the `preRender` hook is set an attribute on
> the SVG tag with the name and version of our plugin.
> 
> We check for this attribute when the `preRender` hook runs, thereby avoiding that
> our styles and defs will be added twice.
> 
> It is good practice to wrap you hook methods in a call like this, because you
> have no guarantee that a user won't render your pattern twice.


## Using hooks more than once

What if you want to attach more than one method to a hook?
You could spread them over seperate plugins, but there's a better way.

Rather than assigning a method to your hook, assign an array of methods like this:

```js
import myCoolMethod from './method-a';
import myEvenCoolerMethod from './method-b';
import {name, version} from '../package.json';

export default {
  name: name,
  version: version,
  hooks: {
    preRender: [
      myCoolMethod,
      myEvenCoolerMethod
    ]
  }
}
```

## Using macros

Plugin structure for macros is similar, with a few changes:

 - Rather than the hook name, you provide the macro name (that you choose yourself)
 - The context (`this`) of a macro method is **always** a [Part](/en/docs/developer/api/part) object.

Apart from these, the structure is very similar:

```js
export default {
  name: name,
  version: version,
  macros: {
    box: function(so) {
      this.points.boxTopLeft = so.anchor;
      this.points.boxTopRight = so.anchor.shift(0, so.size);
      this.points.boxBottomRight = this.points.boxTopRight.shift(-90, so.size);
      this.points.boxBottomLeft = new this.Point(so.anchor.x, this.points.boxBottomRight.y);
     
      this.paths.box = new this.Path()
        .move(this.points.boxTopLeft)
        .line(this.points.boxTopRight)
        .line(this.points.boxBottomRight)
        .line(this.points.boxBottomLeft)
        .close()
        .attr('class', 'box');
		}
	}
}
```

Did you figure out what this plugin does? 
It provides a `box` macro that draws a box on our pattern in a given location with a give size.

We can use it like this:

```js
points.boxAnchor = new Point(100, 100);
macro('box', {
  anchor: points.boxAnchor
  size: 25
}); 
```

Obviously, you can expect to learn how to configure a macro in its documentation, 
rather than have to comb through its code.

> ###### Macros take only 1 argument
> 
> When writing a macro, keep in mind that all information that needs to be passed
> to a macro needs to be contained in a single argument.
> 
> Typically, you use a single plain object to configure the macro.

## Run-time vs build-time

When writing a plugin, ask yourself whether it's a run-time or a build-time plugin.

And if the answer is both, please split them into two plugins.

### Run-time plugins

A plugin is a run-time plugin if it can be added by the user after instantiating your pattern.

Our [theme plugin](https://github.com/freesewing/plugin-theme) is a good example of a run-time plugin.

If it's missing, your pattern will still work, it just won't look pretty.

> ###### Hooks only?
> 
> Plugins that use only hooks are typically run-time plugins

### Build-time plugins

A plugin is a build-time plugin if it is required by the pattern at build-time.
In other words, if a pattern can't be instantiated without it.

Our [plugin bundle](https://github.com/freesewing/plugin-bundle) bundles build-time plugins
that are used in many patterns.

If they are missing, your pattern won't load.

> ###### Using a macro?
> 
> Plugins that provide a macro are almost certainly build-time plugins

## Using hooks without a plugin

You can attach a method to a hook at run-time without the need for a plugin 
using the [Pattern.on()](/en/docs/developer/api/pattern#patternon) method.

The method takes the hook name as its first argument, and the hook method as its second.

Below is an example:

```js
pattern.on('preRender', function(svg) {
  svg.style += "svg { background: yellow;}";
});
```

Congratulations, you've just made your entire pattern yellow.
