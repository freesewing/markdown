---
title: Plugin structure
order: 10
---

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

The `name` and `version` attributes are self-explanatory. 
But `hooks` and `macros` requires some more explanation.

