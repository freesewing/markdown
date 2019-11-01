---
date: 2017-09-07
title: "Danke für nichts Microsoft; E-Mail sollte nicht so schwierig sein"
linktitle: "Vielen Dank für nichts, Microsoft"
img: full.jpg
caption: "Würden Sie eine Spur schließen, weil ein Fahrer seine Musik zu laut spielte?"
author: joost
---

Menschen mit einer E-Mail-Adresse von Microsoft \--- denken Sie an Hotmail, MSN, live.com, outlook.com und ihre zahlreichen Varianten \--- melden sich, statistisch gesehen, deutlich weniger für diese Website an.

Der Grund dafür ist, dass mehr als 4 mal von 10, sie nie ihre Kontoaktivierungs-E-Mail erhalten.

## Was ist hier los?

Schauen wir uns zunächst an, was passiert. Hier ist ein relevantes Snippet aus den Logs:

````
Failed: postmaster@mg.freesewing.org -> ********@hotmail.co.uk 'Confirm your freesewing account' 
Server response: 550 5.7.1 Unfortunately, messages from [104.130.122.15] weren't sent. 
Please contact your Internet service provider since part of their network is on our block list. 
````

Das bedeutet, dass ein Teil des MailGun Netzwerks auf ihrer Blockliste steht. Im Endeffekt liefer Die (wer die sind mehr dazu später) die ausgehenden Nachrichten nicht aus an die Empfänger.

[MailGun](https://www.mailgun.com/) ist ein beliebter E-Mail-Dienst für Entwickler. Es wird von dieser Seite verwendet, um E-Mails zu verschicken, wie zum Beispiel die Aktivierungs-E-Mails.

Auch andere Leute nutzen diesen Dienst auch, und vielleicht haben einige von ihnen irgendwann Spam per Mailgun versendet. Oder es war vielleicht nur ein Mann mit einem Nachnamen, der dazu neigt, Spamfilter auszulösen.

![Some other MailGun customers. Not exactly a dodgy service is it?](mailgun.png)

Der Punkt ist, diese IP-Adresse oder einer ihrer Nachbarn hat *eine schlechte Reputation*. Das passiert. Aber sich zu weigern, Nachrichten von diesem Host (oder einem ganzen Netzwerk von Hosts) anzunehmen, ist gleichbedeutend mit dem Abschalten einer Autobahnspur (oder einer ganzen Autobahn), weil ein Auto in dieser Spur seine Musik einmal unangenehm laut wiedergab.

Was uns zu der nächsten Frage bringt:

## Who would do something like that?

Gute Frage. Hier sind ein paar Beispiele:

![A graph of mail delivery since the launch of this site](emailgraph.png)

Der obige Graph stellt E-Mails dar, die seit dem Start dieser Website verschickt wurden. Der kleine Abschnitt des roten Graphen sind E-Mails, die nicht ausgeliefert werden.

Diese Website versendet verschiedene Arten von E-Mails:

 - Benutzerkonto-Bestätigungs-E-Mail
 - Die *Ich habe mein Passwort vergessen* E-Mails
 - Kommentarantwort-Benachrichtigungen

Der Graph steht für alle E-Mails, aber ich konzentriere mich nur auf das Konto-Bestätigungs-E-Mails. Sie sind schließlich die Wichtigsten.

> Außer dem 1 Auslöser wurde jede blockierte Nachricht von Microsoft blockiert

Hier ist eine Liste aller Domains, die legitime Aktivierungs-E-Mails an ihre Benutzer blockiert haben:

 - btinternet.com
 - hotmail.com
 - hotmail.co.uk
 - live.ca
 - live.com
 - live.com.au
 - live.nl
 - msn.com
 - outlook.com

Abgesehen von diesem ersten Eintrag in der Liste (bei dem nur eine Nachricht blockiert wurde) handelt es sich um Microsoft-Domains.

Lassen Sie mich das noch einmal klar sagen: Abgesehen von dem 1 Auslöser wurde jede Meldung, die blockiert wurde, von Microsoft blockiert.

## Was sind die Auswirkungen?

Welche Auswirkungen hat das auf die Menschen?

Nun, zu dem Zeitpunkt, zu dem ich dies schreibe, gibt es 817 registrierte Benutzer, und ca. 80% (661) haben auch ihr Konto aktiviert.

![A disproportionate amount of pending activations is from users with an email address managed by Microsoft](activations.svg)

Von diesen Personen, die in der Lage waren, ihr Konto zu aktivieren, haben weniger als 1% (6) eine E-Mail-Adresse, die von Microsoft verwaltet wird. In der Gruppe von Personen, die ihr Konto nicht aktiviert haben oder nicht in der Lage waren, ihr Konto zu aktivieren, haben mehr als die Hälfte eine solche Adresse.

Mehr als 40% der E-Mail-Nachrichten zur Kontobestätigung werden einfach von Microsoft blockiert, und je nach Anzahl der Aktivierungen scheint es wahrscheinlich, dass sie, selbst wenn sie nicht am SMTP-Relay blockiert werden, irgendwo weiter hinten gefiltert werden.

So wie die Dinge liegen, scheint es fast unmöglich für die durchschnittliche Hotmail/outlook/live/MSN/... Benutzer, um sich für diese Seite zu registrieren.

## Was können wir dagegen tun?

Ich habe mailgun aus einer Reihe von Gründen gewählt. Das Fehlen von SMTP-Outselves vereinfacht den Code. Nicht abhängig von einem lokalen SMTP-Deamon zu sein macht den Code portabler, und MailGun hat eine Reihe cooler Funktionen, die es einem erlauben auf Kommentare per E-Mail zu antworten.

Microsofts grobe Methoden der Spam-Filterung entkräften keinen dieser Gründe.

MailGun zu benutzen bedeutet, ihre SMTP-Relais zu benutzen und dem Reputation dieses Relais ausgeliefert zu sein. Der einzige Weg, das zu umgehen, ist, ein dediziertes Relais in MailGun so zu konfigurieren, dass der FreeSewing.org-Traffic abgeschirmt ist vom Rest, und wir die Kontrolle über die Reputation unseres Smtp-Relais haben.

![$59 per month? Perhaps not](pricing.png)

Für dieses Privileg berechnet MailGun 59 Dollar pro Monat, was sich auf 708 Dollar jährlich beläuft. Wenn Sie einen Blick in die [Spendenhistory](/about/pledge#donations-history) werfen, werden Sie feststellen, dass dies nicht drin liegt.

Ich könnte die Blockliste herausfordern und versuchen, das Relais entsperrt zu bekommen. Aber das ist so ziemlicher Kampf gegen Windmühlen, wenn der Host nicht unter meiner Kontrolle ist. Ganz zu schweigen davon, dass MailGun nicht nur diesen einen Host hat.

Es scheint, dass ich kaum Optionen mehr habe, und ganz ehrlich, mir reisst auch der Geduldsfaden.

## Was ich dagegen tun werde

Microsoft ist ein Moloch, und ich bin nur ein Kerl. Ich kann sie hier nicht bekämpfen. Unless I Titanfall their ass.

![Block this, bitch](titanfall.gif)

Do you think Gmail is ever abused to send out spam? You know it is. Do you think they would ever block all email coming from Gmail? You know they won't.

So last night, I rolled out some changes to work around the issue. If you have a *problemtic* email address, in addition to the regular email, this site will send out a second email through Gmail.

I'd like to see them block that.

> ##### Signup trouble? Help is available
> 
> If you are (still) having problems signing up, don't hesitate to [get in touch](/contact).
