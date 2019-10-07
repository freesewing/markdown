---
title: Verwende Übersetzungschlüssel, nicht Text
---

Fügen Sie keine Texte in Ihre Schnittmuster ein. Stattdessen fügen Sie bitte einen Schlüssel ein, der übersetzt werden kann.

Wenn Sie z. B. *mit Schrägband abschließen wollen,* auf Ihrem Schnittmuster, seien Sie nicht versucht, folgendes zu tun:

```js
path.seam.attr("data-text", "Abschluss mit Schrägband");
```

Dieses (englische) Textfragment ist jetzt in Ihrem Schnittmuster hart codiert. As freesewing supports translation out of the box, it would be a real shame not to make use of it.

Instead, insert a key to identify the string:

```js
path.seam.attr("data-text", "finishWithBiasTape");
```

This way, it can be translated.
