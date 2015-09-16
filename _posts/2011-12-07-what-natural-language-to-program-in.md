---
layout: post
title:  "What (Natural) Language To Program In?"
date:   2011-12-07
---

When people are starting a new software project, they tend to only think about what programming language they are going to use. It is usually simply assumed that there is no other way than to use English as the natural language of the project. I've found myself more often than once questioning this assumption.

Of course, there are many plusses with going with English. Firstly, programming language syntax is usually written in English. If one writes own code in another language, the code is bilingual. I'm not an expert in psychology but I think it is safe to say that reading bilingual code adds at least some burden to the programmer's mental burden.

Another obvious plus is that English is de facto language of the programming world so if you're collaborating with programmers speaking another language, you are more likely to have English than anything else as your common language. This is also fairly safe bet for the customer or managers of the project. If the project is written in English, it is easier to move development to another company or country. This can of course be exploited by a programmer: writing in non-English language can be used as a guarantee that one will not be kicked out of the project as easily. Hopefully a programmer doesn't need this kind of shenanigan and can prove one's worth with technical prowess rather than knowing an obscure natural language.

These are pretty weighty reasons for using English so what are the pluses for using something else?

Unfortunately, even though English is de facto language in programming world, that doesn't necessarily mean that all programmers can use English proficiently. Maybe they've learned to program in a non-English-speaking school or reading non-English books. They might be sufficient enough to understand error messages or other such short messages. However, writing unambiguous and comprehensive documentation for quite abstract constructs such as an architecture of multithreaded banking application requires a lot of talent. Usually programmers struggle even with writing this kind of documentation in their native tongue without the additional burden of using another language.

I think that it's very important to use good naming when writing a software. If for example the models of the software are named well, it is much easier to understand the software firstly as a developer but also as an user. Figuring out good names is hard: figuring out good names in multiple languages is more than twice as hard. This can create a barrier between the developers and customers or project managers. If managers and customers tend to use for example Finnish terms for business models, developers mentally translate these terms to their English counterparts before processing the message of the customer. If names are poorly selected or in a worst case, there are multiple ambiguous translations, it's a lot harder to be on the same page about the current state and the future of the project.

Next time when you're starting a new project, please take a moment to think if English is really the best choice for writing your program in. If this decision is done in haste, it is very time consuming to translate the code later on if the decision proves to wrong.
