---
title: API Reference
order: 500
---

Freesewing geeft een enkel object terug met de volgende eigenschappen:

- `version`: Een string met het FreeSewing versie nummer

En FreeSewing's standaard export geeft toegang tot de volgende methode:

- `Design()`: A *super-constructor* to create new pattern designs.

## Design()

```js
function freesewing.Design(object config, object|array plugins)
```

Use this method to create a new pattern design. It takes the following arguments:

- `config` : The pattern configuration
- `plugins` : Either a plugin object, or an array of plugin objects to load in your pattern

<Tip>

This method will return a constructor method that should be called to instantiate your pattern.

See [creating a new pattern design](/concepts/new-design) for an example.

</Tip>