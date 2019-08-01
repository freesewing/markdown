---
title: Translating content
---

## Getting started

All our content is written in [Markdown](/en/docs/markdown). You can find these files in [the markdown folder](https://github.com/freesewing/website/tree/develop/src/markdown) of [our website repository](https://github.com/freesewing/website).

In it, you will find three subfolders:

- `blog` : Contains blog posts
- `docs` : Contains documentation
- `showcase` : Contains showcase posts

To translate a post or documentation page, first find the English file which is always called `en.md`. Then, copy it to the language code you want to translate it to. For example, to translate it to French, you copy it to `fr.md` in the same directory. Now you can translate the file.

## Frontmatter

At the start of a MarkDown file, you will find frontmatter enclosed between a starting and ending line of 3 dashes `---` .

This holds the metadata of the page, and whether it needs to be transated depends on the context.

For example, this is the fronmatter of this page:

    ---
    title: Translating content
    ---
    

Frontmatter is always a `key:value` pair, in which the key never is translated. Translation of the value depends on the key. In the example above, you would translate the page title. But look at this frontmatter from a showcase:

    ---
    title: Sloppy Theodore trousers
    img: showcase.jpg
    caption: "Theodore Trousers"
    patterns: [theodore]
    author: cabi
    ---
    

Here, you would translate the title and caption, but you would not translate the other meta data as they are variables used by the system, rather than text to be read by the visitor.

When you’re not certain whether something needs translating or not , [you can ask someone](https://gitter.im/freesewing/freesewing).

## Syntax

MarkDown is a straigh-forward way to format text to turn it into HTML. You’ll be familiar with it in no time.

The [official MarkDown documentation](https://daringfireball.net/projects/markdown/syntax) is a bit dry. You may find [our summary of the main MarkDown features](/en/docs/markdown) a more pleasant read.

## Updating links to point to the correct language

When you link to a different place on the website, you need to update the language prefix.

For example, `/en/docs/i18n/markdown` points to the English version of this page. Whereas `/es/docs/i18n/markdown` points to the Spanish version of this page.

It’s important to update these links, as they determine the language of the site. If you are translating a page to Spanish, and you don’t update a link, then when a visitor clicks that link, the website will suddenly be in English instead of Spanish.