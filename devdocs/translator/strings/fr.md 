---
path: /en/docs/translator/strings
title: Translating strings
---

Translating strings (or making changes to the translated strings) can be done in two ways:

- Making changes online to an individual string
- Changing the translation files themselves

Both are valid, but making changes online lends itself best to quickly updating a few strings. If you have a lot of translation work to do, it's probably faster to work with the files themselves.

Let's look at both methods in detail:

## Making changes online

By far the simplest way to work on the translation of strings is to head over to [this page](/en/i18n) which is a starting point to search, browse, and edit our translated strings.

You can search for things, and there's also a list of the different topics by which our translations are grouped.

Once you find what you need, click on the text to go to the online editor. There, you can simply make the changes you want and submit them for approval.

This way of working is simple and fast, but if you have a lot of things to translate it will probably be faster to work with the translation files themselves.

## Making changes offline

Those of you who are familiar with git and GitHub can fork [our i18n repository](https://github.com/freesewing/i18n), make all the changes you want, and then submit a pull request.

It's essentially the same thing as the online editor does behind the scenes. But this allows you to work on it off-line and use the editor of your choice.

### Translating YAML files

All our translation strings are stored in YAML files in the [`src/locales`](https://github.com/freesewing/i18n/tree/develop/src/locales) folder of [our i18n repository](https://github.com/freesewing/i18n).

Each language has it's own folder, based on its language code. For example, all Spanish strings are in the `es` folder.

Within each language folder, there are different YAML files to translate, sometimes there will be subfolders too.

#### YAML structure

YALM consists of `key: value` pairs. Here's an example:

```yaml
aboutFreesewing: About Freesewing
```

You never translate the key, as that's how we look up the translation. You only translate the value. For example, in the Spanish langauge file, this looks like:

```yaml
aboutFreesewing: Acerca de Freesewing
```

Most of the time, you will see these simple `key: value` pairs. But in some YAML files, you'll find a hierarchical structure like this:

```yaml
adjustmentRibbon:
  description: Add a ribbon to make the tie adjustable.
  options:
    - Do not include ribbon
    - Include ribbon
  title: Adjustment Ribbon
```

As before, do not translate the keys, only the values. In the case the Spanish looks as such:

```yaml
adjustmentRibbon:
  description: Agregar une cinta para que corbata sea ajustable.
  options:
    - No incluir una cinta
    - Incluir una cinta
  title: Cinta de ajuste 
```

#### Syntax

Most strings are just text, but sometimes you'll find a little markup sprinkled in.

##### HTML formatting

When you encounter HTML tags, simply translate around them. For example:

```yaml
profileShareAnswer: '<b>No</b>, never.'
```

looks like this in Spanish:

```yaml
profileShareAnswer: '<b>No</b>, nunca.'
```

##### Placeholders

When you encounter a `{key}` between curly braces, leave it as-is. These will be filled in later with the correct value. For example:

```yaml
fieldSaved: "{field} saved"
```

looks like this in Spanish

```yaml
fieldSaved: "{field} guardado"
```