---
title: Core API
for: developers
icons: 
  - javascript
  - terms
about: FreeSewing's core API reference documents all available methods and objects
---
Freesewing exports a single object with the following properties:

 - `version`: A string containing the FreeSewing version number
 - `Design()`: A *super-constructor* to create new pattern designs.

## Design()

```js
function freesewing.Design(object config, object|array plugins)
```

Use this method to create a new pattern design. It takes the 
following arguments:

 - `config` : The pattern configuration
 - `plugins` : Either a plugin object, or an array of plugin objects
 to load in your pattern

<Tip>

This method is a *super-constructor*. It will return a constructor 
method that should be called to instantiate your pattern. 

See [creating a new pattern design](/howtos/core/new-design/) for an example.

</Tip>
