---
title: Plugins
order: 620
---

Plugins allow you to extend freesewing beyond the basic functionality.

The following plugins are available from FreeSewing:

- [plugin-bundle](/plugins/bundle): Bundles the most common build-time plugins
- [plugin-bust](/plugins/bust): A plugin to help you adapt menswear patterns for breasts
- [plugin-buttons](/plugins): Adds the `button` and `buttonhole` snippets. Part of [plugin-bundle](/plugins/bundle)
- [plugin-cutonfold](/plugins): Adds the `cutunfold` macro.
- [plugin-dimension](/plugins): Adds various dimension macros.
- [plugin-flip](/plugins): Adds the `flip` macro
- [plugin-grainline](/plugins): Adds the `grainline` macro
- [plugin-i18n](/plugins): Provides translation
- [plugin-logo](/plugins): Adds the `logo` snippet
- [plugin-round](/plugins): Adds the `round` macro
- [plugin-scalebox](/plugins): Adds the `scalebox` macro
- [plugin-sprinkle](/plugins): Allows bulk-adding of snippets
- [plugin-svgattr](/plugins): A plugin to set SVG attributes
- [plugin-theme](/plugins): Provides CSS styles for SVG
- [plugin-title](/plugins): Adds the `title` macro

If you can't find what you're looking for, you can write your own plugin.

## Plugin structure

Plugins can do two things:

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

The `name` and `version` attributes are self-explanatory. But `hooks` and `macros` requires some more explanation.

## Hooks

A **hook** is a lifecycle event. The available hooks are:

- [preRender](#prerender): Called at the start of [`Pattern.render()`](/api/pattern#render)
- [postRender](#postrender): Called at the end of [`Pattern.render()`](/api/pattern#render)
- [insertText](#inserttext): Called when inserting text
- [preDraft](#predraft): Called at the start of [`Pattern.draft()`](/api/pattern#draft)
- [postDraft](#postdraft): Called at the end of [`Pattern.draft()`](/api/pattern#draft)
- [preSample](#presample): Called at the start of [`Pattern.sample()`](/api/pattern#sample)
- [postSample](#postsample): Called at the end of [`Pattern.sample()`](/api/pattern#sample)

You can register a method for a hook. When the hook is triggered, your method will be called. It will receive two parameters:

- An object relevant to the hook (see below for details)
- Data passed when the hook was registered (optional)

### preRender

The `preRender` hook is triggered just before your pattern is rendered to SVG.

Your hook method will receive [the SVG object](/api/svg) as its first parameter.

It is typically used to change the result of the render, for example by adding CSS to the SVG output.

### postRender

The `postRender` hook is triggered after the SVG is rendered.

Like the `preRender` hook, it receives [the SVG object](/api/svg) as its first parameter.

<note>

The `postRender` hooks is rarely used.

</Note>

### insertText

The `insertText` hook is called when text is about to be inserted during rendering.

Methods attached to the `insertText` hook will receive 2 parameters:

- `locale` : The language code of the language requested by the user (defaults to `en`)
- `text`: The text to be inserted

Unlike most hooks that receive an object that you can make changes to, for this hook you need to return a string.

This hook is typically used for translation, as is the case in [our i18n plugin](/plugins/i18n).

<note>

###### Understanding the insertText hook

When we say that *this hook is called when text is about to be inserted*, that is a simplified view. In reality, this hook is called:

- For every value set on data-text
- For the combined result of these values, joined together with spaces

Let's use an example to clarify things:

```js
points.example
  .attr('data-text', "seamAllowance")
  .attr('data-text', ": 1cm")
```

For the example point above, the `insertText` hook will end up being called 3 times:

- First it will pass `Seam allowance` to the plugin
- Then it will pass `: 1cm` to the plugin
- Finally it will pass `Seam allowance : 1cm` to the plugin

Having the `insertText` hook only run once with `Seam allowance: 1cm` would be problematic because the seam allowance may differ, or perhaps we're using imperial units, and so on.

Instead, you can (and should) divide your text into chunks that need translating, and chunks that do not.

This is also why we're not inserting **Seam allowance** but rather **seamAllowance**; It is merely a key to indicate what translation we want to replace this text with.

</Note>

### preDraft

The `preDraft` hook runs just before your pattern is drafted.

Your plugin will receive the Pattern object.

<note>

The `preDraft` hook is rarely used.

</Note>

### postDraft

The `preDraft` hook runs just after your pattern is drafted.

Your plugin will receive the Pattern object.

<note>

The `postDraft` hook is rarely used.

</Note>

### preSample

The `preSample` hook runs just before your pattern is sampled.

It is triggered at the very start of either:

- the [Pattern.sampleOption()](/en/docs/developer/api/pattern/#patternsampleoption) method
- the [Pattern.sampleMeasurement()](/en/docs/developer/api/pattern/#patternsamplemeasurement) method
- the [Pattern.sampleModels()](/en/docs/developer/api/pattern/#patternsamplemodels) method

Your plugin will receive the Pattern object.

<note>

The `preSample` hook is rarely used.

</Note>

### postSample

The `postSample` hook runs just after your pattern is sampled. Your plugin will receive the Pattern object.

It is triggered just before the end of either:

- the [Pattern.sampleOption()](/en/docs/developer/api/pattern/#patternsampleoption) method
- the [Pattern.sampleMeasurement()](/en/docs/developer/api/pattern/#patternsamplemeasurement) method
- the [Pattern.sampleModels()](/en/docs/developer/api/pattern/#patternsamplemodels) method

<note>

The `postSample` hook is rarely used.

</Note>

## Using hooks

For each hook, your plugin should provide a method that takes the relevant data as its first argument. If data was passed when the hook was loaded, you will receive that as the second object.

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

<note>

###### Note that we avoid running our hook twice

As you can see, the last thing we do in the `preRender` hook is set an attribute on the SVG tag with the name and version of our plugin.

We check for this attribute when the `preRender` hook runs, thereby avoiding that our styles and defs will be added twice.

It is good practice to wrap you hook methods in a call like this, because you have no guarantee the user won't render your pattern more than once.

</Note>

## Using hooks more than once

What if you want to attach more than one method to a hook? You could spread them over seperate plugins, but there's a better way.

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

## Macros

Plugin structure for macros is similar, with a few changes:

- Rather than the hook name, you provide the macro name (that you choose yourself)
- The context (`this`) of a macro method is **always** a [Part](/api/part) object.

Apart from these, the structure is very similar:

```js
import {name, version} from '../package.json';

export default {
  name,
  version,
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

Did you figure out what this plugin does? It provides a `box` macro that draws a box on our pattern in a given location with a give size.

We can use it like this:

```js
points.boxAnchor = new Point(100, 100);
macro('box', {
  anchor: points.boxAnchor
  size: 25
}); 
```

Obviously, you can expect to learn how to call a macro in its documentation, rather than have to comb through its code.

<note>

###### Macros take only 1 argument

When writing a macro, keep in mind that all information that needs to be passed to a macro needs to be contained in a single argument.

Typically, you use a single plain object to configure the macro.

</Note>

## Types of plugins

Plugins come in two flavours:

- Build-time plugins
- Run-time plugins

When writing a plugin, ask yourself whether it's a run-time or a build-time plugin. And if the answer is both, please split them into two plugins.

### Run-time plugins

A plugin is a run-time plugin if it can be added by the user after instantiating your pattern.

Our [theme plugin](/plugins/theme) is a good example of a run-time plugin.

If it's missing, your pattern will still work, it just won't look pretty.

Run-time plugin are loaded at run time, by passing them to the [`Pattern`](/api/pattern) constructor:

```js
import Aaron from "@freesewing/aaron";
import theme from "@freesewing/plugin-theme";
import i18n from "@freesewing/plugin-i18n";

const myAaron = new Aaron()
  .use(theme)
  .use(i18n);
```

<tip>

Plugins that use only hooks are typically run-time plugins

</Tip>

### Build-time plugins

A plugin is a build-time plugin if it is required by the pattern at build-time. In other words, if it's a dependency for the pattern.

Our [plugin bundle](/plugins/bundle) bundles build-time plugins that are used in many patterns. If they are missing, your pattern won't load.

Build-time plugin are loaded at build time, by passing them to the [`freesewing.Design`](/api/freesewing#design) constructor:

```js
import freesewing from "@freesewing/core";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";

const Pattern = new freesewing.Design(config, plugins);
```

<tip>

Plugins that provide a macro are typically build-time plugins

</Tip>

## Using hooks without a plugin

You can attach a method to a hook at run-time without the need for a plugin using the [Pattern.on()](/api/pattern#on) method.

The method takes the hook name as its first argument, and the hook method as its second.

Below is an example:

```js
pattern.on('preRender', function(svg) {
  svg.style += "svg { background: yellow;}";
});
```

Congratulations, you've just made your pattern yellow.