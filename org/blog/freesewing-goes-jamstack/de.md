---
date: 2017-06-12
title: "Wir sind JAMstack, wir sind JAMstack, wir sind JAMstack, wir sind JAMstack, wir sind JAMstack, wir sind JAMstack, wir sind JAMstack, wir sind JAMstack, und ich hoffe, dass du auch JAMstack magst"
linktitle: "Ich hoffe, du magst JAMstack auch"
img: pipes.jpg
caption: "Bild von"
author: joost
---

Als wir Ende März den FreeSewing Core veröffentlichten, verlagerte sich mein Fokus sofort auf den Aufbau unseres Frontends, sodass [freesewing.org](/) [makemypattern.com](https://makemypattern.com/) vollständig ersetzen konnte.

Ich glaube, dass der Wert von FreeSewing bei dem Core der Plattform und unseren Schnittmustern liegt. Aber ohne eine benutzerfreundliche Möglichkeit, diese Werte zu präsentieren, werden sie weitgehend ignoriert werden.

Deshalb brauchten wir eine Website, die es den Leuten ermöglicht, Schnittmuster zu generieren. Makemypattern.com &mdash; wohl der beste Vergleich von etwas Ähnlichem &mdash; läuft auf Drupal 7, und meine erste Idee war es, die neue Seite auf Drupal 8 zu betreiben. Ich ging diesen Weg weit genug, um sicher zu sein, dass ich ihn zum Laufen bringen und an unser Backend anschließen konnte. An diesem Punkt habe ich das Ruder herumgerissen und mich dem FreeSewing Core zugewendet.

Der Bau des Cores dauerte etwa 7 Monate, und seitdem hat sich viel verändert. Oder vielleicht habe ich mich verändert, ich habe auf jeden Fall viel gelernt. So oder so, ich habe mich entschieden, die Dinge anders zu machen.

## Das Problem mit einem CMS

Ich habe kein Problem mit Drupal, aber die Idee, die FreeSewing-Website über ein Content Management System (CMS) zu verwalten, gefällt mir nicht.

Einer der Hauptgründe ist, dass so viele Informationen unter einer undurchsichtigen Datenbankschicht gespeichert sind, was die Verwaltung erschwert. Das gilt für Inhalte, bei denen Beiträge, Metadaten, Bilder usw. über Tabellen, Speicherorte und Ordner verteilt sind. Aber es gibt auch das Theme, das einen Haufen Zeug enthält, es gibt die benutzerdefinierten Drupal-Module, um sich mit dem Backend zu verbinden, und so weiter und so fort.

> Ich wollte den gleichen Ansatz in einer Website. Außer, dass sie nicht statisch sein kann, weil sie, Sie wissen schon, Dinge tun muss.

Als wir den Kern fertiggestellt haben, habe ich eine Dokumentationsseite dafür erstellt, die auf [Jekyll](https://jekyllrb.com/) basiert. Im Vergleich zu Drupal fühlte es sich wie ein Hauch von frischer Luft an. Nur ein Haufen Markdown-Dateien, mit einigen SASS, Bildern und etwas JavaScript, die in den Mixxer geworfen wurden, und alles wird zu einer ordentlichen statischen Website zusammengefügt.

Es ist einfach zu verwalten und lässt sich gut in einen GitHub-zentrierten Workflow integrieren, der potenziellen Mitwirkenden vertraut sein dürfte.

Ich wollte den gleichen Ansatz in einer Website. Außer, dass sie nicht statisch sein kann, weil sie, Sie wissen schon, Dinge tun muss.


## Ein alternativer Ansatz: JAMstack

Ich habe zum ersten Mal von JAMstack erfahren, als ich anfing, mich mit dem Hosting für diese zentrale Dokumentationsseite zu befassen. Es wurde ursprünglich auf GitHub-Seiten gehostet, die kostenloses Hosting anbieten. Sie haben auch SSL oder einen benutzerdefinierten Domänennamen, aber Sie können nicht beides haben. Was eine Art Deal-Breaker war.

Auf der Suche nach Alternativen stolperte ich über [Netlify](https://www.netlify.com/), die sowohl SSL- als auch kundenspezifische Domains betreiben und ein kostenloses Angebot für Open-Source-Projekte haben (danke Jungs). Außerdem hat mich dieses Video von Netlify CEO Mathias Biilmann

 sehr begeistert für JAMstack.</p> 

Sofern Sie nicht mit JAMstack vertraut sind, schlage ich vor, dass Sie sich das Video ansehen, aber es läuft darauf hinaus:

 - **J** = JavaScript
 - **A** = APIs
 - **J** = Markup

Die Idee ist, dass Sie Ihre statische Website (Markup) erstellen, die Sie dann mit JavaScript interaktiv machen, das an eine oder mehrere APIs angeschlossen ist.

Anstatt also in unserem Fall eine einfache Dokumentationsseite mit einfach zu bearbeitendem Markdown und einem komplexen CMS zur Handhabung des dymanischen Materials zu haben, lassen Sie uns einfach eine einfache Seite erstellen, die statisch generiert wird, aber JavaScript und APIs verwendet, um das interaktive Material bereitzustellen.



## Laufen, bevor Sie gehen können

Ich muss zugeben, dass ich in meiner Begeisterung, diesen neuen Ansatz anzunehmen, ein wenig über mich selbst hinausgewachsen bin. Plötzlich baute ich keine einfache Website mehr, aber ich war bis zum Anschlag in isomorphem Rendering, client-seitigem Routing, React and Redux, Node.js und ES6 Transpiling verwickelt.



> Wenn Sie nicht wissen, was das alles bedeutet, werden Sie vielleicht einen Eindruck von der Frustration bekommen, die ich empfand, als ich versuchte, all diese neuen Bestien zu zähmen.
> 
> Wenn Sie wissen, was das alles bedeutet, wo waren Sie dann im April, als ich durch das Tal des Todes ging? 

Der Punkt ist, ich bin kein Entwickler und ich war weit über meinem Level. Während ich jeden Tag neue Dinge lernte, machte ich bei der eigentlichen Aufgabe nicht viel Fortschritte und war frustriert über meine Unfähigkeit, selbst die alltäglichsten Dinge zu tun.

Nach einem Monat der Frustration, vielen Versuchen und scheinbar noch mehr Fehlern warf ich das Handtuch. Eff this newfangled shiny JavaScript all the young kids are using, I'll stick to what I know. 

Which is essentially the basics of jQuery. In other words, stuff that was pretty cool 10 years ago.



## 10 year old jam is still jam right?

So here we are, freesewing.org is a site powered by the JAMstack. And you know what, it seems to do what it needs to do.

We have Jekyll build out static site, and when we push to our master branch, it gets autmatically deployed to Netlify.



> Eff this newfangled shiny JavaScript all the young kids are using

We have [a brand new data API](https://github.com/freesewing/data) build on [the Slim framework](https://www.slimframework.com/). It handles all user data. Things like accounts, measurements, models, and drafts, but also comments on this website and so on.

It also talks to core for us, and every time you draft a pattern, we don't just give you the pattern, but we also run a comparison of your pattern to a range of standard sizes, which is kinda cool.

And we have other cool stuff, like the ability to fork or redraft an existing draft.



## This is a starting point

I hope the user experience/interface is not going to be a roadblock for people. I've made a great deal of effort to make the drafting process as intuitive as possible and I think that in comparison to our demo (or the makemypattern interface for that matter) it's a vast improvement.

Then again, I'm sure things will break left or right, or that some of you don't like the colours or whatnot.

The point is that I set out to build something that can replace makemypattern.com so that I could tell all of you _Hey, come over and play with this new thing_.

I think if nothing else, I can do that now. And if you see room for improvement, please [join the effort](/contribute), we're only getting started.

<small>PS: For those of you wondering about the title of this post:</small>

@[youtube](oFRbZJXjWIA)










