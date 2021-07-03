

Hargrave: The Scientist's Scrapbook

Science, with Texture!

Is it possible to make an electronic lab notebook that intrinsically makes the user a better scientist? 

dude, this is hard.


The problem

experience

things are going to get inexorably harder, more data will be input 

simultaneously too much quality control and not  enough 
we need to see every half-hearted attempt, in order to put the right priors on papers


texture is lost compared to older papers


Many of these are little more than a digital blank worksheet. 

high cognitive load

old cern papers at the dawn of the internet where lab notebooks and instruments  

protocols.io

it is extremely time consuming to accurately record every experimental detail in 
a human-readable way 
should be available for introspection. 
(this might seem invasive, but I don't think a well-kept lab notebook should include too many overly-personal
details anyhow!)

vanquish proprietariness

journals use supplemental (durrant a good example), but not enough

TEM laser paper

This has a few effects:

kill multiple birds with one stone

- fields where minute experimental details affect 
- it is possible that industry cannot as easily implement complex innovations
- it may be more difficult to falsify data, and mistakes like experimenter biases can be more easily seen
- publication bias 


how much of this do we want to take on responsibility for and feature creep?

Many extremely competent people are working on this problem, and my primitive exploration will certainly never approach their labours.

current options:

- A wiki. a great option.
- Whitequark's lab notebook
- eLabFTW
     elabftw's API is awesome.
- a google doc.
     one problem is that you tend to just append to the bottom 
     no sense of the certainty of a fact,
    old information is not replaced
- STAR methods
- Galaxy project
- stuff like [lab that bought ipad]
- that one lab's custom lab scrapbook
- ornl
- that math wiki
- https://openwetware.org/wiki/Main_Page


Collection of inspiration and guidelines on lab notebooks

- https://scout.lib.utk.edu/repositories/2/archival_objects/223576
https://people.ece.cornell.edu/land/ElectronicNotebooks.html


now, this is a crazy thought, but
it might even be possible to have this partly replace journals themselves. 

we see OpenReviews ; dozens of indexes for specific 



Things that are not helping:

proprietary.

papers have to do their own literature reviews, whereas it could be expected that an entire field
would have a master globally editable literature review 
(on the other hand the entire point is when you have a novel idea, so 
doing that sort of thing is maybe not useful)



*asciientist*

virtual environments for installing programs?


- Available over HTTP - maybe that should be seperate?

- Text files always remain human-readable

- Concat files horizontally, each with a title (with vertical rulers between), to stay within 100-col limit (configurable) but allow scrolling horizontally.

- Save in txt; don't support markdown options.

- Box colors? Where is it saved?

- Drag-n-drop image linking - how will that work for local files? Webcam previewing? Audio recording? Video recording? Video trimming to size, jumping to correct time?

- Images are just a little box with a tiny preview, expand out

- "Saved" flashes breifly

- latex - KaTeX snippet at the top on html export

- Readable on small devices?

- BibTeX - no, zotero! integration

- .bash_history, script-like? integration, but retroactive too -> choose command lines and output you want to assemble into install instructions

- Link objects together (date tag on a box, perhaps) so they move together spatially

- Code, too! Runnable python inline! Oh boy!

- Zotero notes are integrated properly
1
- Settings (media folder) and binary appended to the end of file to work better with version control

based on asciio

[https://github.com/rcaloras/bash-preexec](https://github.com/rcaloras/bash-preexec)

[https://unix.stackexchange.com/questions/485798/show-time-elapsed-since-i-started-last-command-in-prompt](https://unix.stackexchange.com/questions/485798/show-time-elapsed-since-i-started-last-command-in-prompt)

docear is basically what I want.

Here's why I'm spending all this time: this is a medical device, I don't want to screw up the science, rigor is now essential, and I'm wasting a lot of time looking for things I've already found.

There's really four regimes we have to provide for here:

- Quick, context-free note-taking in-situ - unreadable after a short period, not human readable extenrally

- Linearly logging what was believed and considered at what time - crucially, without going back and updating as new information is added.

  Currently I'm only operating in this regime - new info is appended to the bottom of the document without any updates. Auditable lab notebooks would seem to fulfil the same function, but everyone's better at them.

  In some ways git fulfils this function with an ELN.

- Rigorously documenting what was established and tested for future reference

- Production-quality final paper

[https://monodraw.helftone.com/](https://monodraw.helftone.com/) nice, only MacOX though

Zotero provides pdf names in the RDF file. cites should link to the local pdf?




Workflows that integrate both software workflows and IRL experiments; timers for processes, etc; records runs and 


instant searching of all text like zotero

zotero integration

extremely fast user interface that doesn't interfere with thinking while observing experiments


Great paper:

"Oleksik et al. [142] reported on their observational study of electronic lab notebooks (ELN)
in a research organization. They found that the flexibility of digital media can lead to much
less precision during experiment recording and that ‘freezing’ parts of the record might be
necessary. The authors stressed that “ELN environments need to incorporate automatic or
semi- automatic features that are supported by sophisticated technologies [...].”"
https://edoc.ub.uni-muenchen.de/26940/1/Feger_Sebastian.pdf


http://www.funraniumlabs.com/
"As an example, Glenn Seaborg’s lab notebooks are immaculate, clear and easy to follow. Seriously, I’m jealous of his penmanship."


https://en.wikipedia.org/wiki/The_Iron_Giant
He made sure to spread out the work on scenes between experienced and younger animators, noting, "You overburden your strongest people and underburden the others [if you let your top talent monopolize the best assignments]."


http://www.jesshamrick.com/2016/03/07/passing-quals/
"Different people prepare for quals in different ways. One of my labmates prepared by writing hand-written notes in many small notebooks and then scanning them. Another labmate made a handful of slides per paper. For me, I decided to write blog posts on each paper."



Notational Velocity (or nvPY ) has an interesting set of features that might be worth including.
in particular, it seems to maybe solve the part about finding buried facts  

it's easy to write things that are unsupported by evidence. 
need some way of linking a note to its source, making it explicit
whether it be a table of data, a 

lines drawn from sentences in papers to their supporting documentation.

how about just a set of standards for publications?

ssh kiosk@gemini.circumlunar.space

lack of review articles that aren't books or wikipedia [see that recent paper]

scientists are already performing excruciatingly detailed reviews for their papers,
that stuff is just lost when condensing down to 8 to 19 pages with a half-page introduction. That source 
material should be there! Of course, each paper's topic is ostensibly novel, so some re-review might be necessary, 
but still!

per-field standardized nomenclature?


actually, the bang bang control can be analytic? since it's just a sum of analytic step functions
another advantage of bang-bang is that the cost function can actually be a division!

make scrapbook a jupyterlab extnesion?


julia's Pluto.jl looks great!

ornl's: 

" Interactive input into the notebook is accomplished through CGI scripts. "



could directly integrate with the zotero sqlite apparently.

TUI interface to avoid buttons

android tablet usb keyboard

support websites like charmm-gui 

man I so want a single-source...

It's a machine, Schroeder. It doesn't get pissed off. It doesn't get happy, it doesn't get sad, it doesn't laugh at your jokes.
It just runs programs.


the problem with git is storing stuff like images or datasets. How do we get that stuff

represent everything as a computational graph

everything is an object? objects also include "how to obtain". That is, a link to the university's
server (kind of like Tim Berners Lee's new ideas). On git clone,  

"fix" vs "edit"? way to justify edits inline

"backed up"

gpg encrypted


