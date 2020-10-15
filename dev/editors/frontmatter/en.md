---
title: Working with frontmatter
---

Frontmatter is a way to add metadata to markdown documents.

Frontmatter sits at the top of the file (it's matter that's at the front) and is
surrounded by lines with three dashes on them:

```ms
---
title: This is frontmatter
---
```

## Structure

Frontmatter is made up of `key: value` pairs.
The value must be quoted if you use a `:` in it to avoid problems parsing the key values:

```md
title: This does not need to be quoted
slogan: "Markdown: This is the way"
```

## Lists or arrays

Values are typically text or numbers, but you can also make it a list or array.
There's two types of syntax for this:

```md
tags: [tag1, another, three]
categories:
 - cat1
 - anothercat
 - somethingelse
```

## Muli-line text

To add multi-line text in frontmatter, use a `|` character, 
and prefix the lines by spaces:

```md
about: |
  This is a multi-line text
  that will be assigned to the about key
```



