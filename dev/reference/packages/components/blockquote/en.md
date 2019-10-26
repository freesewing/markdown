---
title: Blockquote
---

The `Blockquote` component is a base blockquote that can be styled 
in a number of different ways:

 - note
 - warning
 - tip
 - fixme
 
It is typically used in our MDX content as a globally available component:

```md
<Note> This is a note </Note>
```

Which uses the `Blockquote` component under the hood, and renders as:

<Note> This is a note </Note>


## Props

| Name | Type | Default | Description |
|------|------|---------|-------------|
|*type*|`string`|`note`|Determines the style of the `Blockquote`. One of `note`', `tip`, `warning`, or `fixme`.|

<Note>

This component will render the `children` between its opening and closing tags.

</Note>
