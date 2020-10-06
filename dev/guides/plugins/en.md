---
title: Extending FreeSewing with plugins
order: 40
---

Plugins allow you to extend freesewing beyond the basic functionality. 
We have [a list of available plugins](/reference/plugins/).
If you can't find what you're looking for, you can write your own plugin.

## Types of plugins

Plugins come in two flavours:

 - Build-time plugins
 - Run-time plugins

When writing a plugin, ask yourself whether it's a run-time or a build-time plugin.
And if the answer is both, please split them into two plugins.

### Run-time plugins

A plugin is a run-time plugin if it can be added by the user after instantiating your pattern.

Our [theme plugin](/reference/plugins/theme/) is a good example of a run-time plugin.

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

<Tip>

Plugins that use only hooks are typically run-time plugins

</Tip>

### Build-time plugins

A plugin is a build-time plugin if it is required by the pattern at build-time.
In other words, if it's a dependency for the pattern.

Our [plugin bundle](/reference/plugins/bundle/) bundles build-time plugins that are used in many patterns.
If they are missing, your pattern won't load.

Build-time plugin are loaded at build time, by passing them to the [`freesewing.Design`](/reference/api/#design) constructor:

```js
import freesewing from "@freesewing/core";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";

const Pattern = new freesewing.Design(config, plugins);
```

<Tip>

Plugins that provide a macro are typically build-time plugins

</Tip>
