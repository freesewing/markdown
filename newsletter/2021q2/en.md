# Pattern releases winter 2021

Here's a quick recap of the new patterns we released in the first quarter of this year:

 - [The Bella bodice block for womenswear](https://freesewing.org/blog/bella-bodice-block/): A collaboration with somebody from the industry to replicate the kind of bodice block that's used in fashion today. Currently it has a bust dart towards the side-seam. A variation with a shoulder dart is on our todo list.
 - [The Hortensia handbag](https://freesewing.org/blog/announcing-hortensia/): Another collaboration, this time between Stofsuchti and long-time contributor Wouter Van Wageningen brought the first handbag pattern to FreeSewing.
 - [The Cornelius cycling breeches](https://freesewing.org/blog/cornelius-cycling-breeches/): More from Wouter still, these cycling breeches or knickerbockers are based on the Keystone drafting method.

Click through any of the links for the blog posts announcing these patterns.


---


# Spotlight on some lesser-know FreeSewing features

Regardless of whether you've only recently discovered FreeSewing, or have been a user for many years, here are some things you might not have discovered on your own:

## Multilingualism

FreeSewing is available in 5 languages, each with their own website. In addition to English at freesewing.org, we have websites in [French](https://fr.freesewing.org/), [German](https://de.freesewing.org/), [Dutch](https://nl.freesewing.org/), and [Spanish](https://es.freesewing.org/).

If you'd like to help us add more languages, [get in touch](https://discord.freesewing.org/).
## Paperless patterns

Not a fan of printing and sticking pages together? Or perhaps you don't have a printer? Don't despair, because FreeSewing provides **paperless patterns**.

You'll find the **paperless** option under the **Pattern options**. Flick it on and now you'll have dimensions as well as a grid in either metric or imperial so you can transfer your pattern directly to fabric or another medium like pattern paper.

## Custom layout/tiler

Laying out the different pattern parts on your pattern happens automatically. But alas, it's one of those things that computers are far worse at that humans. Often you can save a bunch of pages by squishing things together yourself. If only you could, right?

Turns out you can. Simply **Export** your pattern as **SVG** and fire up **Inkscape** (which you can [download for free](https://inkscape.org/)). 

When you open the pattern in Inkscape, the entire pattern will be in a *group*, so first thing to do is to **select** it and **right-click** and choose **ungroup**. Now you can rotate and flip each part around and arrange them just as you like. When you're happy, click **File** -> **Document properties** and choose **Resize page to content**.

When you're done, save the SVG and upload it to our custom tiler: https://tiler.freesewing.org/
There you can upload the SVG and pick your page size, and you'll get a PDF just like on the  website. Only this time, with your own layout 👍

## Remove details from a pattern

This option was originally intended for laser cutters, but has other uses too.

For this, you'll have to enable so-called **Expert mode**. Under **Pattern options**, click **Expert mode** and set it to **Show**.
Now, you'll have the **Advanced** option under which you'll find **Detail**. If you set it to **Hide**, your pattern will not only show the outline of the different pattern parts.

This is also handy for when you are making doll clothes as the titles, logo, and size box end up being taking up more space than the pattern itself.

## Include only certain pattern parts

Since we've unlocked **Expert mode**, here's another tip you mightn't be aware of: the **Contents** option. This option allows you to not draft the entire pattern, but only those parts that you want. 

This can be handy if you want to make a change to a pattern and only print those parts that are affected. But also if you want to combine different styles. For example you can generate a complete Simon pattern, and then additional collar or cuff styles where only the collar/cuffs are included in the pattern.

Got an idea for some other cool feature you'd like to see? Make sure to [let us know](https://discord.freesewing.org/).


---


# Some of the more crazy ideas on our drawing board

We're rarely stuck for things to do, because some work is never finished: adding more patterns, writing more or better documentation, improving user experience, and so on.

But sometimes, we also like to shoot the breeze and come up with some ideas that are a bit off the beaten path. Here's a selection of them that we've been mulling over. Don't consider it a sneak preview though, some of these are bona fide moonshots:

## Allowing users to create their own pattern layouts on the site

The pattern layout -- the way the individual pattern pieces are laid out on the page -- seems like the low-hanging fruit of improvements. Almost without exception, your pattern will not be the most optimal layout.

Thing is, computers are not very good at this sort of spacial problem that's called *packing*. We could try to tweak the algorithm, but human beings are just intuitively better at it than computers are. 

**The goal**
To make it possible (and ideally easy) for people to do their own layout. So that before you export your pattern, you have the option to arrange it just as you like it.

**What it would take**
This is something that's been on the drawing board for quite some time. FreeSewing core already has support for custom layouts, so it's really *just* a matter of creating the frontend interface to handle the layouting.

**Roadblocks**
Doing the SVG layout on mobile is a minefield.

**Chances of this happening**
High. We're almost certainly going to do this at some point.

## Using 3D renders to showcase patterns or options

3D in general is something we have our eye on, but in this case it's really about presenting the patterns to the user. People want to know what they're going to get, and line drawings and showcases can only go so far to show that.

The idea would be to be able to show patterns on a 3D avatar. However, a big caveat is that we would have to be able to somehow automate this process since we can't go manually creating a 3D render of every pattern & option.

**The goal**
Create 3D renders of different patterns and the effect of pattern options. Integrating this with our build pipeline so those renders can be auto-generated.

**What it would take**
Some work has been done already. Last year we wrote a DXF-exporter plugin that can export patterns as DXF, a popular format in 3D tools. We did some initial tests with CLO3D but the lack of automation options not to mention the fact that it's a closed-source commercial product made us abandon that path.

The right thing to do would be using Blender so that this work would benefit the open source community.

**Roadblocks**
Blender is not that easy to learn. Automation and plugins in Blender need to be written in Python, and we're a JavaScript project. Basically, we have nobody who knows how to even start on this today.

**Chances of this happening**
Medium. Could really use some help on this.

## Frankenstein patterns

The name *Frankenstein pattern* is something that came up during one of our contributor calls, and the name sort of stuck. The idea is that you could mix and match parts from different patterns to create your own combinations. Like, pick a top and combine it with the sleeves from another top and perhaps the collar from yet another top.

**The goal**
Allow patterns to be created by combining different building blocks.

**Roadblocks**
This would require some sort of inter-pattern API or interface specification. 

**Chances of this happening**
Low. For pattern developers, combining parts from different patterns is already possible via inheritance. Exposing this sort of functionality to the user level would already be a significant challenge. But doing it in a way that requires no code and merely some clicking around is pretty far out there.


---


# FreeSewing is Brought to You By the Kindness of Strangers

On April 5th 2011, a Tuesday of all days, I published a sewing pattern on my blog. 
BXR-M01A was a pattern for boxer briefs that came in one size only, and was free to download under a Creative Commons license.

It was also the very first pattern I ever published.

The event as such doesn’t deserve much attention, but it just happens to have occurred 10 years ago — almost to the day. 
So it seemed a good starting point for a brief history of how we got from there to here.

## The Early Days

I started drafting my own sewing patterns because I had fitting issues with store-bought ones. 
Drafting my own patterns held the promise of flawless fit with just a bit of effort (Oh, how naive I was!). 
The fiddling about with paper had me bored in no time, so I set out to try to automate that part of the process. 
I came up with a way to reduce the pattern to a number of steps, and abstract away the measurements. 
Now, you could feed it whatever measurements you wanted, and it would re-draft the pattern for you.

I launched the beta version of my little pattern machine in February of 2012. 
It wasn’t an immediate success. 
As a matter of fact, to the best of my knowledge, only one person ever tested it. 
That person was Nico in Copenhagen (who I've sadly lost track of) who wrote:

> That is sooo cool.  
> I will enter my thoughts about your project using your feed back thingy on the pattern web site. 
> But you should know that the overall fit is amazing! I think I have a new favourite pattern :-)

## makemypattern.com

One good review is perhaps not much to go on, but I found it rather encouraging and set out to walk this path a bit further. 
Fast-forward six months and I’d rewritten the thing from scratch, and with four patterns available officially launched makemypattern.com in September of 2012.

Things sort of trickled along as I added a pattern every now and then. 
Then, in January 2014 I got an email from Tin Doan in Canada asking how they could donate to the site. 
I sort of expected this to be some sort of scam, but I still answered the email asking “Are you for real?”. Tin answered:

> Yes Joost, I'm serious. Please kindly accept $200.00 from me.

Sure enough, I soon found myself at the receiving end of a $200 donation. 
To this day, it remains the highest amount I've ever received in a single donation.

This unexpected yet very tangible token of support felt like a fork in the road. 
I'd been happy building this thing mostly as a learning experience. 
Now it felt like perhaps it needed a bit more devotion and care.

In retrospect, this point probably marks the end of my social life 😂 good thing I had found a partner by now (phew).

## Pivot to Open Source and freesewing.org

So of course I rewrote the whole thing — again — into what would turn out to be the last version of makemypattern.com. 
By the summer of 2016, five years after my first pattern release, and four years after launching makemypattern.com, 
my little hobby project had made a lot of headway, and I found myself at another turning point: 
Keep doing what I'm doing, or try to break through the next barrier.

Up until this point, I had been doing makemypattern.com on my own. 
The code wasn’t even available. I wanted to make it into an open source project that people could contribute to. 
But I had never started it with that ambition, and it was going to take some serious refactoring 
to make it into something that people would be able to wrap their heads around.

So I did exactly that, and in March 2017 I launched v1.0.0 of freesewing.org. 
A new name (and logo) to mark the transition to an open source project. 
This was a much more mature release, with a documented API and it led to the first patterns contributed by others. 
It also came with a hat I hadn't worn before, open source maintainer.

## FreeSewing v2.0.0: It's JavaScript Now

During all this time, the world of frontend development had changed and we could do so much more in a browser. 
Rather than picking a bunch of options and getting a pattern in the end, the idea of seeing 
the pattern update in your browser as you changed options was — at least in theory — attainable now. 

With that goal in mind, I started over again, this time in JavaScript. 
And in August of 2019 v2.0.0 landed on freesewing.org. 
A complete rewrite in JavaScript with a new website to boot.

Since then, I've been able to keep myself from rewriting the entire thing again 🤞

## The Family You Choose

We're getting closer to present time, but there's one more moment that stands out for me, 
and that's a blog post from August 2020 where — maybe for the first time — I explicitly asked for help to grow the project. 
Since then, a community has developed around FreeSewing that feels more valuable to me than any code I could ever write.

Motivation is a powerful thing, and I wonder whether FreeSewing would exist today if it wasn't for the full-on enthusiasm of Nico in the early days. 
Or whether it would have fizzled out without Tin injecting some rocket fuel in the form of a donation. 
Or whether perhaps I would have succumbed to burnout by now if I hadn't found such a great group of people to walk this road with me.

Speaking of which: There are countless individuals who have contributed to get to where we are today. 
I couldn't possible mention them all. But what they have in common is that at one point, they were complete strangers to me, as I was to them.

It’s the kindness of strangers that brought us here.

Thank you, Strangers.
