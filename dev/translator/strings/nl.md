---
title: Translating strings
---

Crowdin maakt het vertalen van tekst erg gemakkelijk.  
Als je een vertaling van een tekst maakt, zorgt Crowdin ervoor dat deze vertaling uiteindelijk in de repository wordt opgenomen. De development mensen zorgen er daarna voor dat hij deel gaat uitmaken van de teksten.

Hier is wat je moet weten om aan de slag te gaan:

- Crowdin link: https://crowdin.com/project/freesewing
- Verzoek een uitnodiging: https://gitter.im/freesewing/freesewing

## Syntax

Most strings are just text, but sometimes you'll find a little markup sprinkled in.

### HTML formatting

When you encounter HTML tags, simply translate around them. For example:

```markup
<b>No</b>, never.
```

looks like this in Spanish:

```markup
<b>No</b>, nunca.
```

### Placeholders

When you encounter a `{key}` between curly braces, leave it as-is. These will be filled in later with the correct value. For example:

```markup
{field} saved
```

looks like this in Spanish

```yaml
{field} guardado
```