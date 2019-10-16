---
date: 2018-08-25
title: "Wir feiern ein Jahr von FreeSewing.org: Ankündigung der FreeSewing-Bibliothek"
linktitle: "Ankündigung der FreeSewing-Bibliothek"
img: uncork.jpg
caption: "Ich trinke nicht, aber das schien für einen Festbeitrag angemessen zu sein ¯\_(ツ)_/¯"
author: joost
---

Vor genau einem Jahr öffneten sich die Türen von FreeSewing.org für unsere Nutzer,während die von makemypattern.com eines dieser *Wir sind umgezogen*-Schilder erhielten.

Rückblickend auf [den Blogbeitrag von vor 12 Monaten](/blog/open-for-business), es ist fast unglaublich, dass die damals angekündigten Dinge erst ein Jahr alt sind. Das Konzept eines Entwurfs, die Vergleichsfunktion oder auch die Möglichkeit Schnittmuster papierlos zu übertragen. Sie alle feiern heute ihren ersten Geburtstag.

Aber nicht diese Website, weil [die bevorstehende DSGVO-Einführung](/blog/gdpr-plan) uns zwang unsere jekyll-basierte Website zugunsten eines neuen Frontends zu beerdigen. Dies geschah irgendwann im Mai.

## Weitere Sprachen mit weniger Sprachen

DSGVO war nur Teil dieser Geschichte. Weitere Gründe für den Rewrite unserer Seite waren unser Wunsch, mehrere Sprachen zu unterstützen und unseren Technologie-Stack zu vereinfachen.

Mit anderen Worten, wir wollten Menschen erreichen, die verschiedene Sprachen sprechen, und wollten die Anzahl der dafür erforderlichen Programmiersprachen überschaubar halten.

### Mehr natürliche Sprachen

In dieser Hinsicht haben wir uns bemerkenswert gut geschlagen. Sie werden zwar nicht alle Inhalte übersetzt vorfinden, aber die wichtigsten Funktionen dieser Website sind sind nun in fünf Sprachen verfügbar:

 - Englisch
 - Deutsch
 - Spanisch
 - Französisch
 - Holländisch

Das ist wirklich zu 100% der großartigen Arbeit von [unseren wunderbaren Übersetzern](/i18n/) zu verdanken.

### Weniger Programmiersprachen

Der Wechsel von [Jekyll]() zu einem [Nuxt](https://nuxtjs.org/)-basierten Frontend hat [Ruby](https://www.ruby-lang.org/) aus unserem Technologystack entfernt. Freesewing.org läuft jetzt auf JavaScript, PHP und ein wenig C (was wir jetzt ignorieren werden).

Aber das Entfernen von Programmiersprachen ist kein *Selbstzweck*. Vielmehr besteht das zugrunde liegende Ziel darin, die Dinge zu vereinfachen, es den Menschen leichter zu machen, sich einzubringen und letztlich mehr Mitwirkende anzuziehen, damit das Projekt wachsen und florieren kann.

Jetzt ist die Gestaltung/Entwicklung von Schnittmustern kein unüberwindliches Hindernis mehr. Wir haben nun [Benjamin](/patterns/benjamin), [Florent](/patterns/florent), und [Sandy](/patterns/sandy), um dies aufzuzeigen. All diese Schnitte wurde von Menschen beigesteuert, für die Freewing zunächst neu war, sie gingen durch das Design-Tutorial und schufen am Ende ein eigenes Schnittmuster.

Wir würden uns wünschen, dass mehr Menschen in ihre Fußstapfen treten. Den Gestaltungsprozess so einfach wie möglich zu gestalten war lohnenswerte Zeitinvestition.

## Wir künden die FreeSewing-Bibliothek an

In den letzten zwei Monaten habe ich mir eine Auszeit vom Schnitte entwerfen und dem Nähen genommen, um an der nötigen [Technischen Weiterentwicklung ](Yhttps://en.wikipedia.org/wiki/Technical_debt) zu arbeitet.

Konkret habe ich mich dazu entschlossen, unser Core-Backend von Grund auf in JavaScript neu zu schreiben. Aber es gibt eine Wendung. Es ist nicht länger ein Backend. It's a library you can use both in your browser, or on the server with [node.js](https://nodejs.org/).

It is currently in version 0.10, and feature complete with freesewing core. It's [available on GitHub](https://github.com/freesewing/freesewing) and [NPM](https://www.npmjs.com/package/freesewing), and is fully documented at [developer.freesewing.org](https://developer.freesewing.org/).

And while its API is richer than core's, it's footprint is actually a lot smaller:

![Lines of code comparison between the new library and (the relevant portion of) freesewing core](corevsfreesewing.svg)

Which is good news, in case you were wondering.

## What happens next?

A lot of work needs to be done before we can actually use this on freesewing.org:


 - All our existing patterns need to be parted to the JS version. [Brian](https://github.com/freesewing/brian) is the first pattern to have been ported.
 - Rewrite our data back-end in JS. Since this will remove the PHP programming language from our stack.
 - Build a new website using the freesewing library and our new data back-end.

This really is a lot of work, and while I hope that by the end of the year we'll have made good progress, I can't promise it will be done.

## But I just want patterns

Chances are, all you care about is patterns. What you want is more patterns, better patterns, different patterns. And all of this rewriting is not exactly pushing your buttons.

I get that. I really do. I for one have a list of patterns I'd like to see added to the site. And my work on other aspects of the project keeps me from adding them.

But I believe that investing now in a streamlined developer experience will have a knock-on effect in the long term.

If we want a few extra patterns, this is not the right approach. But if we want a lot more patterns, I believe it is.

And I want a lot more patterns.
