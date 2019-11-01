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

From those people who were able to activate their account, less than 1% (6) have an email address managed by Microsoft. In the group of people who did not, or were not able to, activate their account, more than half have such an address.

More than 40% of account confirmation emails are simply blocked by Microsoft and, based on the number of activations, it seems likely that even when they aren't block at the SMTP relay, they get filtered somewhere further down the line.

As things stand, it seems almost impossible for the average hotmail/outlook/live/MSN/... user to sign up for this site.

## What can we do about it?

I chose mailgun for a number of reasons. Not having to handle SMTP outselves simplifies the code. Not depending on a local SMTP deamon makes the code more portable, and MailGun has a bunch of cool features that allow you to do things like replying to comments via email.

Microsoft's crude methods of spam filtering don't invalidate any of those reasons.

Using MailGun means using their SMTP relays, and being at the mercy of the reputation of that relay. The only way around that is to configure a dedicated relay in MailGun so that freesewing.org traffic is shielded from others, and we become masters of our own reputation.

![$59 per month? Perhaps not](pricing.png)

For that priviledge, MailGun charges 59 dollar per month, which amounts to 708 dollar yearly. I invite you to take a look at [the donations history](/about/pledge#donations-history), and you'll understand that's not going to happen either.

I could challenge the block list, and try to get the relay unblocked. But that's pretty much tilting at windmills when the host is not under my control. Not to mention that MailGun doesn't just have that one host.

It seems that I'm running low on options and quiet frankly, I'm also running out of patience.

## What I'm going to do about it

Microsoft is a behemoth, and I'm just a guy. I can't fight them on this. Unless I Titanfall their ass.

![Block this, bitch](titanfall.gif)

Do you think Gmail is ever abused to send out spam? You know it is. Do you think they would ever block all email coming from Gmail? You know they won't.

So last night, I rolled out some changes to work around the issue. If you have a *problemtic* email address, in addition to the regular email, this site will send out a second email through Gmail.

I'd like to see them block that.

> ##### Signup trouble? Help is available
> 
> If you are (still) having problems signing up, don't hesitate to [get in touch](/contact).
