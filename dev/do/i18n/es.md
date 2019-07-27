---
title: Use translation keys, not text
---

Don't insert literal text in your patterns. Instead, insert a key that can then be translated.

For example, if you want to put *Finish with bias tape* on your pattern, don't be tempted to do this:

```js
path.seam.attr("data-text", "Finish with bias tape");
```

That (English) string is now hard-coded in your pattern. As freesewing supports translation out of the box, it would be a real shame not to make use of it.

Instead, insert a key to identify the string:

```js
path.seam.attr("data-text", "finishWithBiasTape");
```

This way, it can be translated.