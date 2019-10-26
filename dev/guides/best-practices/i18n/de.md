---
title: Verwende Übersetzungschlüssel, nicht Text
---

Fügen Sie keine Texte in Ihre Schnittmuster ein. Stattdessen fügen Sie bitte einen Schlüssel ein, der übersetzt werden kann.

Wenn Sie z. B. *mit Schrägband abschließen wollen,* auf Ihrem Schnittmuster, seien Sie nicht versucht, folgendes zu tun:

```js
path.seam.attr("data-text", "Abschluss mit Schrägband");
```

Dieses (englische) Textfragment ist jetzt in Ihrem Schnittmuster hart codiert. Da Freesewing die Übersetzung out of the Box unterstützt, wäre es eine Schande, sie nicht zu nutzen.

Stattdessen fügen Sie einen Schlüssel ein, um das Textfragment zu identifizieren:

```js
path.seam.attr("data-text", "finishWithBiasTape");
```

So kann es übersetzt werden.
