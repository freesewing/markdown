---
title: Design 
order: 10
---

```js
function freesewing.Design(object config, object|array plugins)
```

A super-constructor to create a new pattern design. 
It takes the following arguments:

 - `config` : The pattern configuration
 - `plugins` : Either a plugin object, or an array of plugin objects
 to load in your pattern

```js
import freesewing from "@freesewing/core"
import plugins from "@freesewing/plugin-bundle"
import config from "../config"

// Create new design
const Sorcha = new freesewing.Design(config, plugins)
```

<Tip>

This method is a *super-constructor*. It will return a constructor 
method that should be called to instantiate your pattern. 

See [creating a new pattern design](/howtos/core/new-design/) for an example.

</Tip>
