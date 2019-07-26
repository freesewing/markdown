---
title: Pattern
path: /en/docs/developer/api/pattern
components: true
---

## Description

A Pattern object comes wih the following properties:

- `settings` : The settings as set by the user
- `options` : the options as set by the user
- `config` : The pattern configuration
- `parts` : A plain object to hold your parts
- `Part` : The [Part](/en/docs/developer/api/part) constructor
- `store` : A [Store](/en/docs/developer/api/store) instance
- `svg` : An [Svg](/en/docs/developer/api/svg) instance
- `is` : A string that will be set to `draft` or `sample` when you respectively draft or sample a pattern. This allows plugins that hook into your pattern to determine what to do in a given scenario.

## Pattern.draft()

```js
Pattern pattern.draft()
```

Does the actual work of drafting the pattern.

Your draft method should return the pattern object, thus making it chainable.

<pattern-example pattern="aaron">

```js
import patterns from "@freesewing/patterns"
import models from "@freesewing/models"

let aaron = new patterns.aaron({
  settings: {
    embed: true,
    measurements: models.manSize38
  }
})

let svg = aaron.draft().render()
```

</pattern-example>

## Pattern.sample()

```js
Pattern pattern.sample()
```

This method calls either [sampleOption()](#patternsampleoption), [sampleMeasurement()](#patternsamplemeasurement), or [sampleModels()](#patternsamplemodels).

Unlike those three methods who you need to pass the relevant info to, [sample()](#pattern-sample) will read the `pattern.settings.sample` object to determine what to do.

The possiblities are:

- **type**: One of `option`, `measurement`, or `models`
- **option**: An option name as defined in the pattern config file (only used when `type` is option).
- **measurement**: A measurement name as defined in the pattern config file (only used when `type` is measurement).
- **models**: An array of models with the required measurements for this pattern (only used when `type` is models).

See the specific sample methods below for more details.

> ###### Anchor your samples
> 
> If you add a point named `anchor` to your pattern part, the different samples will be anchored on this point.
> 
> In other words, for each sample, the anchor point will be kept in the same location.

## Pattern.sampleOption()

```js
Pattern pattern.sampleOption(string option)
```

Samples an option by drafting variations of the pattern while adapting the option's value.

The exact behavior depends on [the type of option](../config#options):

The goal of option sampling is to verify the impact of an option on the pattern, and verify that its min and max boundaries are correct and its default value is sensible.

- For options that are an object with a **min** and **max** property, 10 steps will be sampled, between min and max
- For options that are a numeric value (**constants**), 10 steps will be sampled between 90% and 110% of the value
- For options with a **list** of options, each option in the list will be sampled

<pattern-example pattern="aaron" action="sampleOption" option="necklineDrop">

```js
import patterns from "@freesewing/patterns"
import models from "@freesewing/models"

let aaron = new patterns.aaron({
  settings: {
    embed: true,
    measurements: models.manSize38
  }
})

let svg = aaron.sampleOption("necklineDrop").render()
```

</pattern-example>

## Pattern.sampleMeasurement()

```js
Pattern pattern.sampleMeasurement(string measurement)
```

Samples a measurement by drafting 10 variations of the pattern while adapting the measurement between 90% and 110% of its original value.

The goal of measurement sampling is to understand the impact of a given measurement on a pattern.

<pattern-example pattern="aaron" action="sampleMeasurement" measurement="chestCircumference">

```js
import patterns from "@freesewing/patterns"
import models from "@freesewing/models"

let aaron = new patterns.aaron({
  settings: {
    embed: true,
    measurements: models.manSize38
  }
})

let svg = aaron.sampleMeasurement("chestCircumference").render()
```

</pattern-example>

## Pattern.sampleModels()

```js
Pattern pattern.sampleModels(object models, string focus)
```

Samples a pattern for a number of models you pass to it.

The goal of model sampling is to verify that a pattern grades correctly up and down as sizes change.

<pattern-example pattern="aaron" action="sampleModels" focus="manSize38">

```js
import patterns from "@freesewing/patterns"
import models from "@freesewing/models"

let aaron = new patterns.aaron({
  settings: {
    embed: true,
  }
})

let svg = aaron.sampleModels(models, "manSize38").render()
```

</pattern-example>

> ###### Model focus: Making a comparison
> 
> When sampling models, you can put the *focus* on one of the models, thereby making it easier to see a comparison between a given set of measrurements, and the rest.
> 
> To do so, pass a second parameter to the `sampleModels()` method. This should be the key of the model in the models object for that model you want the focus to be on.
> 
> Alternatively, you can use the `sample()` method and set `settings.sample.focus` to the key identifying your model in the models object.

## Pattern.render()

```js
string pattern.render()
```

Returns your drafted pattern as SVG.

## Pattern.needs()

```js
bool pattern.needs(string partName)
```

Returns `true` or `false` depending on whether a pattern part is *needed*, based on the value of [pattern.settings.only](/settings/#only) and the part dependencies listed in the configuration file.

A part is needed if:

- it is requested by the user in the `only` setting
- it is a dependency of a part requested by the user in the `only` setting
- the `only` setting is not set or is `false`, and the part is not hidden

> You don't typically use this method. Instead, configure part dependencies in your [configuration file](../config).

## Pattern.wants()

```js
bool pattern.wants(string partName)
```

Returns `true` or `false` depending on whether a pattern part is *wanted*, based on the value of [pattern.settings.only](/settings/#only).

A part is wanted if:

- it is requested by the user in the `only` setting
- the `only` setting is not set or is `false`, and the part is not hidden

> You don't typically use this method. Instead, configure part dependencies in your [configuration file](../config).

## Pattern.use()

```js
Pattern pattern.use(object plugin)
```

Loads a freesewing plugin. This method is chainable.

See [extending freesewing](../extend) for details about extending freesewing with plugins.

```js
import freesewing from "freesewing";
import config from "../config/config";
import pluginBundle from "@freesewing/plugin-bundle";

var pattern = new freesewing.Pattern(config)
  .use(pluginBundle);
```

## Pattern.apply()

```js
Pattern pattern.apply(object settings)
```

Merges the settings passed to it with the current pattern settings.

## Pattern.on()

```js
void pattern.on(string hook, function method)
```

Allows you to attach a method to one of our hooks.

Takes the hook name as a first argument, and your method as a second.

See [extending freesewing](/en/docs/developer/extend) for details about extending freesewing with hooks.

## Pattern.debug()

```js
void pattern.debug(mixed data)
```

Triggers the `debug` hook and passes data to it.

See [extending freesewing](/en/docs/developer/extend) for details about extending freesewing with hooks.