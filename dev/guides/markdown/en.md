---
title: Text formatting with Markdown
order: 90
for: contributors
icons: 
  - edit
  - markdown
about: |
  A quick primer on Markdown, the markup language you didn't know you needed in your life
goals:
  - Understand what Markdown is
  - Format text with Markdown, including headers, paragraphs, links, and lists
  - Learn how to include images and tables
  - Learn about the different custom components
---

Markdown is a lightweight markup language with plain text formatting syntax. 
It is designed to be easily readable by humans, and computers alike.

Markdown is often used to format documentation, online comments,
or anywhere where you want rich text while using a plain text editor.

## Basic text and paragraphs

```md
You can just start writing.

An empty starts a new paragraph.
```
You can just start writing.

An empty starts a new paragraph.

## Line breaks

If you want to force a linebreak, but not a new paragraph,
simply leave 2 spaces at the end of the line.

```md
Like  
this.
```

Like  
this.

## Italic and bold

```md
You can make text *italic* or **bold** 
by wrapping it in 1 or 2 asterix respectively.
```
You can make text *italic* or **bold** by wrapping it in 1 or 2 asterix respectively:

```md
Alternatively, you can also use underscores to mark _italic_ or __bold__.
```
Alternatively, you can also use underscores to mark _italic_ or __bold__.

## Headings

Prefix your line with a number of `#` characters to determine the header level.

```md
### This is a H3 heading

#### This is a H4 heading

##### This is a H5 heading
```

### This is a H3 heading

#### This is a H4 heading

##### This is a H5 heading

<Note>

Keep in mind that you should never use an H1 element, for that will be the page title.

Your top-level headings should be H2, or `##`

</Note>

## Lists

To make a list, just do as you would in plain text:

```md
- a bullet
- list
  - a sublist
  - item
```

- a bullet
- list
  - a sublist
  - item

If you want an numbered list, just write numbers. 
They don't even have to be the correct numbers:

```md

1. Item 1
2. Item 2
2. Item 3
```

1. Item 1
2. Item 2
2. Item 3

## Links

Links combine square brackets for the link text with round brackets for the desitation.

```md
[Like this](https://freesewing.org)
```
[Like this](https://freesewing.org)

## Images

Images are like links, just prefix them with an exclamation mark.
The part between square brackets is the image caption or alt-text.

```md
![This is the alt text & title](image.jpg)
```

![This is the caption](image.jpg)

## Tables

If you need them, you can create tables too:


```md
| Name | Description |
| ---- | ----------- |
| Compound | A substance composed of two or more elements. Chemically combined in definite proportions by weight |
| Mixture | Two or more substances that are not chemically united, such as air |
| Solution | A uniform mixture of varying proportions of a solvent and a solute |
```

| Name | Description |
| ---- | ----------- |
| Compound | A substance composed of two or more elements. Chemically combined in definite proportions by weight |
| Mixture | Two or more substances that are not chemically united, such as air |
| Solution | A uniform mixture of varying proportions of a solvent and a solute |

You can change the alignment of the columns too:

```md
| Align-right | Align-center |
| -----------:|:------------:|
| Compound | A substance composed of two or more elements. Chemically combined in definite proportions by weight |
| Mixture | Two or more substances that are not chemically united, such as air |
| Solution | A uniform mixture of varying proportions of a solvent and a solute |
```

| Align-right | Align-center |
| -----------:|:------------:|
| Compound | A substance composed of two or more elements. Chemically combined in definite proportions by weight |
| Mixture | Two or more substances that are not chemically united, such as air |
| Solution | A uniform mixture of varying proportions of a solvent and a solute |

## Code blocks

Especially for our developer documentation, there's a lot of times we include source code 
in the documentation.
You can make these look pretty by using a code block.

The basic use is to wrap your code in three backtick characters on a line:

````
```
let me = 'you'
```
````

This is a generic code block. But we also support syntax highlighting.
To do so, add the language specifier after the opening backticks:

````js
```js
let me = 'you'
```
````

The folowing language codes are supported:

 - `js` for Javascript code
 - `md` for Markdown
 - `html` for HTML
 - `svg` for SVG
 - `bash` for Bash or shell scripts
 - `mdx` for MDX
 - `jsx` for JSX
 - `json` for JSON
 - `js-error` for a Javascript error
 - `js-trace` for a Javascript stack trace


## More reading

This will be enough to get you started. If you'd like to learn more, 
visit [markdownguide.org](https://www.markdownguide.org/).

## Custom components

In addition to what Markdown provides, we have a number of so-called _custom components_ that you can use.

Keep in mind that if you place content inside a customer component, you need to leave an empty
line at the start and finish.

### Note

```md
<Note>

##### I am a note
I point out things

</Note>
```

<Note>

##### I am a note
I point out things

</Note>

### Tip

```md
<Tip>

##### I am a tip
I give great advice

</Tip>
```

<Tip>

##### I am a tip
I give great advice

</Tip>

### Warning

```md
<Warning>

##### I am a warning
Ignore me at your own peril

</Warning>
```

<Warning>

##### I am a warning
Ignore me at your own peril

</Warning>


### Fixme

```md
<Fixme>

##### I am a FIXME
I indicate that something needs work or improvement

</Fixme>
```

<Fixme>

##### I am a FIXME
I indicate that something needs work or improvement

</Fixme>

### YouTube


```md
<YouTube id='Rz6ShSftDlI' />
```
Embeds a single video:
  
<YouTube id='Rz6ShSftDlI' />

```md
<YouTube id='RDRz6ShSftDlI' playlist />
```
Embeds a playlist:
  
<YouTube id='RDRz6ShSftDlI' playlist />

### Hashtag

```md
<Hashtag tag='WeAreFreeSewing' />
```
Which adds our _community_ font and color:

<Hashtag tag='WeAreFreeSewing' />

### ReadMore

```md
<ReadMore />
```

Will add a list of child-pages (empty in this case)

<ReadMore />
