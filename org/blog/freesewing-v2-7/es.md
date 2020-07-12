---
date: 2020-07-12
title: "FreeSewing v2.7: Titan, changes to measurements, and a long list of improvements"
linktitle: "Titan and measurement changes in FreeSewing v2.7"
img: balloon.jpg
caption: "Photo by Deeana Creates from Pexels"
author: joost
---

We've just release FreeSewing v2.7 🎉

There's a lot of work that went into this release, and unfortunately it  also will cause some breaking changes to your existing patterns and people, but it's all for the better.

Let's have a look at what's new:

## Titan trouser block

I have lost count of the number of times I have started working on a trouser block over the last couple of years. It's something that's been on my to-do list for a long time, yet despite several attempts at making it happen, I hadn't come up with something that I was happy with.

That's because designing trouser patterns is hard. Making sure things fit, while also guaranteeing that inseam, outseam, and cross seam are all the same length is no walk in the park. Especially if you want a pattern that will seamlessly adapt to different sizes and models.

It would have probably lingered on my to-do list a while longer, but in February, Debra reached out to me and proposed we would come up with a pants sloper together. I love teaming up with people because it a great way to stay motivated, so over the next 4 months or so, we worked on what Debra has named [Titan](/designs/titan/), a dart-free unisex trouser block.

Now a block is just that, a block or sloper. Our next steps are obviously this spin this into a number of different trouser patterns. Before we get to that though, we'd like to see how Titan performs on a variety of bodies.

So if you could whip up a muslin of a made-to-measure Titan and let us know how it went, that would be wonderful.

## Shoulder slope — again — and other changes to measurements

We've made changes to the different measurements on the site. The roughly fall into 3 categories:

 - We've made *waist* the basis for vertical measurements
 - We've changed the shoulder slope measurement
 - We've simplified the language and terms

As a result, some vertical measurements that were not based on the waist are not gone (hips to upper leg for example). Other measurements have been renamed under the hood to make things simpler, but unless you're a developer, you don't need to worry about that.

An important change is the one we made to the shoulder slope measurement. It's historically been a measurement that is hard to measure, and the changes we've made before to try to address that were in retrospect a bad idea.

We've changed it again, but this time around, shoulder slope is measured as you would expect a slope to be measured: in degrees.

This required some changes as up until now all measurements used the same units, but things should be ok now.

As a result of all these changes and measurements, there's two things you should know:

 - The people you have in your account will have their measurements updated (when the names changed) or removed (where the measurement is no longer used, or we changed how to measure it)
 - Patterns that you have saved in your account that use some of the changed measurements will no longer work. However, we've kept them in your account so that if you want, you can extract the data, and re-draft them for the new measurements. Feel free to reach out if you need assistance with that.

<Tip>

We've migrated our backend to these new measurements, but you are likely to still have some of the old stuff cached in your profile.  
To get around this, you should probably [reload your account](/account/reload/).

</Tip>

## Frontend changes

We've made a few changes to the website too.

 - We've added a [notation legend](/docs/about/patterns/notation/) to take the guesswork out of what those markings on your pattern mean.
 - We've added a [reload account](/account/reload/) page to help you avoid issues due to cached account data
 - We've changed the styling of the different sizes when you compare a pattern, as well as included a legend showing which outline corresponds to which size.


## And many more changes under the hood

As I said, a lot of work went into this release. Below is the relevant section of our [monorepo changelog](https://github.com/freesewing/freesewing/blob/develop/CHANGELOG.md):

### aaron

#### Changed

- Updated side seam shaping and tweaked options for better defaults
- Better handling of `armholeDrop` option
- Ported aaron to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names
- Report armhole and neck opening length through raised events

#### Fixed

- Fixed incorrect instruction for neck binding (the indicated length was only half)

### benjamin

#### Changed

- Removed `Circumference` suffix from measurement names

### bent

#### Changed

- Increased default for the `cuffEase` option
- Decreased default for the `armholeDepth` option
- Better range for the `shoulderSlopeReduction` measurement
- Ported brian to the new (names for) other measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Set tip of undersleeve as anchor point for sampling
- Removed `Circumference` suffix from measurement names

### breanna

#### Changed

- Ported breanna to the new shoulderSlope measurement. See [#358](https://github.com/freesewing/freesewing/issues/358)
- Ported breanna to the new (names for) other measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names
- Removed deprecated `debug()` statements

### brian

#### Changed

- Ported brian to new `shoulderSlope` degree measurement. See [#358](https://github.com/freesewing/freesewing/issues/358)
- Ported brian to the new (names for) other measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Set HPS as anchor point for sampling in front and back
- Removed `Circumference` suffix from measurement names
- Removed deprecated `debug()` statements

### bruce

#### Changed

- Ported bruce to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names
- Removed deprecated `debug()` statements

#### Fixed

- Sampling some options would not work in Bruce because the code shared across patterns would only run once. That's fixed now.

### carlita

#### Changed

- Better range for the `shoulderSlopeReduction` measurement
- Ported carlita to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Set a sample anchor point on the side part
- Removed `Circumference` suffix from measurement names

### carlton

#### Changed

- Better range for the `shoulderSlopeReduction` measurement
- Ported carlton to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### cathrin

#### Changed

- Ported carlita to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Set sample anchor points on all panels
- Removed `Circumference` suffix from measurement names
- Removed deprecated `debug()` statements

#### Fixed

- [Fixed missing points issue when changing panels option](https://github.com/freesewing/freesewing.org/issues/619)
- Fixed panels option being a list of numbers rather than strings

### components

#### Added

- The `sampleConfigurator` component now supports the antwoman test (in addition to the antman test)
- Changed `models` to `people` in `sampleConfigurator`
- The `Legend` component is new, it is similar to the `Example` component but only for the pattern notation legend
- Added support for custom sample styles
- Added Titan linedrawing

#### Changed

- Handle escaped quotes for React render. See [#437](https://github.com/freesewing/freesewing/issues/437)

#### Fixed

- Fixed bug that broke millimeter sliders

### core

#### Added

- Added support for injecting custom (path) styles when sampling. Closes [#380](https://github.com/freesewing/freesewing/issues/380)
- Added support for custom sample styles
- Added support for raising events via `raise.[type]()` method

#### Fixed

- [Properly escape quotes in imperial units](https://github.com/freesewing/freesewing/issues/437)

### css-theme

#### Changed

- Updated the width of the SVG paths of a draft to match plugin-theme

### diana

#### Changed

- Made the `shoulderSlopeReduction` option static so it's not available in the UI
- Ported diana to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### florence

#### Changed

- Removed `Circumference` suffix from measurement names

### florent

#### Changed

- Removed `Circumference` suffix from measurement names

### holmes

#### Changed

- Removed `Circumference` suffix from measurement names

### huey

#### Changed

- No longer use the `naturalWaist` measurement
- Changed some option to better defaults
- Ported huey to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Made the `shoulderSlopeReduction` option static so it's not available in the UI
- Removed `Circumference` suffix from measurement names

#### Fixed

- [Added seam allowance to the front closure](https://github.com/freesewing/freesewing/issues/420)

### hugo

#### Added

- Added shaping of the side seam

#### Changed

- Changed some option to better defaults
- Ported hugo to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names
- Removed deprecated `debug()` statements

### i18n

#### Changed

- Added translations for Titan
- Removed `Circumference` suffix from measurement names

### jaeger

#### Changed

- Changed some option to better defaults
- Set an anchor on side part for sampling
- Ported jaeger to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### legend

#### Added

- A pattern to document the markings on our patterns
- Initial release

### models

#### Changed

- Models now come with the new measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Ported models to the crotchDepth measurement. See [#425](https://github.com/freesewing/freesewing/issues/425)
- Removed `Circumference` suffix from measurement names

### penelope

#### Changed

- Ported penelope to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### plugin-bust

#### Changed

- Removed `Circumference` suffix from measurement names

### plugin-buttons

#### Changed

- Snippet names are changed, `snap-male` is now `snap-stud` and `snap-female` is now `snap-socket` Changing this to avoid needless use of gender related terminology.

#### Removed

- Snippet `snap-male` and `snap-female` are no longer available. Use `snap-stud` and `snap-socket` instead

### plugin-measurements

#### Added

- A FreeSewing plugin that adds measurements that can be calculated based on existing measurements

### plugin-mirror

#### Added

- A FreeSewing plugin for mirroring points or paths
- Initial release

### sandy

#### Changed

- Ported sandy to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### shin

#### Changed

- Ported shin to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### simon

#### Changed

- Ported simon to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### simone

#### Changed

- Ported simone to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### sven

#### Changed

- Improved the shaping of the side seam
- Changed some option to better defaults
- Ported sven to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### tamiko

#### Changed

- Switch from `shoulderSlope` option to `shoulderSlope` measurement
- Ported tamiko to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### theo

#### Changed

- Ported theo to the crotchDepth measurement. See [#425](https://github.com/freesewing/freesewing/issues/425)
- Removed `Circumference` suffix from measurement names

### titan

#### Added

- A FreeSewing block for pants/trousers
- Initial release

### trayvon

#### Changed

- Ported trayvon to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names

### tutorial

#### Changed

- Removed `Circumference` suffix from measurement names

### utils

#### Added

- Added new `isDegMeasurement` method. See [#358](https://github.com/freesewing/freesewing/issues/358)
- `neckStimate` now supports all new measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)

#### Changed

- Changed `neckstimate` to handle new `shoulderSlope` degree measurement. See [#358](https://github.com/freesewing/freesewing/issues/358)
- Changed `neckstimate` to support all new measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Ported `neckstimate` to the crotchDepth measurement. See [#425](https://github.com/freesewing/freesewing/issues/425)
- Removed `Circumference` suffix from measurement names
- Added the `isDegMeasurement` method

### wahid

#### Changed

- Ported wahid to the new (names for) measurements. See [#416](https://github.com/freesewing/freesewing/issues/416)
- Removed `Circumference` suffix from measurement names
- Removed `wrist` and `shoulderToWrist` as required measurements

### waralee

#### Changed

- Ported waralee to the crotchDepth measurement. See [#425](https://github.com/freesewing/freesewing/issues/425)
- Removed `Circumference` suffix from measurement names

