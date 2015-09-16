---
layout: post
title:  "Automatic Portability Testing"
date:   2012-10-17
---

<p><em>This was originally written as my master's thesis for Department of Mathematical Information Technology at University of Jyväskylä. It was graded as 4 on a scale from 1 to 5.</em></p>

<p style="margin-bottom: 2em;"><em><a href="https://jyx.jyu.fi/dspace/handle/123456789/40043">PDF version of this thesis</a> is available at JYX publication system.</em></p>

<strong>Abstract:</strong> The complexity of today's software calls for automatic testing. Automatic tests are even more important when software is developed for multiple environments. By writing automatic tests on unit, integration, system and acceptance testing levels using different techniques, developers can better focus on the actual development instead of performing manual tests and customers can be sure that there isn't a constant regression in features compared to previous versions. If tests are written in the same languages as the actual and using portable tools, the same automatic test suites can be performed on all environments which the software itself is required to support without manifold increase in testing personnel.

<strong>Tiivistelmä:</strong> Nykypäivän ohjelmistojen monimutkaisuus johtaa automaattitestien tarpeeseen. Automaattiset testit ovat vielä tärkeämpiä, kun ohjelmistoa kehitetään usealle eri alustalle. Kirjoittamalla automaattitestejä yksikkö-, integraatio-, järjestelmä- ja hyväksyntätestaustasoilla käyttäen useita eri testaustekniikoita, kehittäjät voivat keskittyä paremmin varsinaiseen kehitykseen manuaalitestauksen sijaan ja asiakkaat voivat olla varmoja, etteivät ohjelmiston ominaisuudet hajoa uusien versioiden myötä. Jos testit kirjoitetaan samalla kielellä kuin ohjelmisto ja käyttäen siirrettäviä testaustyökaluja, samat automaattitestit voidaan suorittaa kaikilla niillä alustoilla, joita ohjelmisto tukee,  moninkertaistamatta testaushenkilöstön kokoa.

<strong>Keywords:</strong> Software testing, portability, software development, automated tests.

<strong>Avainsanat:</strong> Ohjelmistotestaus, siirrettävyys, ohjelmistotuotanto, automatisoidut testit.


## Sisältö

<ul>
    <li><a href="#pre">Preface</a></li>
    <li><a href="#glossary">Glossary</a></li>
    <li><a href="#sec1">1 Introduction</a>
        <ul>
            <li><a href="#sec1.1">1.1 Objective of the Thesis</a></li>
            <li><a href="#sec1.2">1.2 Research Methods</a></li>
            <li><a href="#sec1.3">1.3 Constraints of Research</a></li>
            <li><a href="#sec1.4">1.4 Structure of the Thesis</a></li>
        </ul>
    </li>
    <li><a href="#sec2">2 Software Testing</a>
        <ul>
        <li><a href="#sec2.1">2.1 What is Software Testing?</a></li>
        <li><a href="#sec2.2">2.2 World Without Software Testing</a></li>
        <li><a href="#sec2.3">2.3 Complexity of the Software Testing</a></li>
        <li><a href="#sec2.4">2.4 Automatic Testing</a></li>
        <li><a href="#sec2.5">2.5 Chapter Summary</a></li>
        </ul>
    </li>
    <li><a href="#sec3">3 Portability Testing</a>
        <ul>
            <li><a href="#sec3.1">3.1 History of Portability</a></li>
            <li><a href="#sec3.2">3.2 Different Types of Portability</a></li>
            <li><a href="#sec3.3">3.3 Motivation for Portability</a></li>
            <li><a href="#sec3.4">3.4 Problems of Portability and Portability Testing</a></li>
            <li><a href="#sec3.5">3.5 Chapter Summary</a></li>
        </ul>
    </li>
    <li><a href="#sec4">4 Testing Levels</a>
        <ul>
            <li><a href="#sec4.1">4.1 Defining Testing Levels</a></li>
            <li><a href="#sec4.2">4.2 Unit Testing</a></li>
            <li><a href="#sec4.3">4.3 Integration Testing</a></li>
            <li><a href="#sec4.4">4.4 System Testing</a></li>
            <li><a href="#sec4.5">4.5 Acceptance Testing</a></li>
            <li><a href="#sec4.6">4.6 Chapter Summary</a></li>
        </ul>
    </li>
    <li><a href="#sec5">5 Test Techniques</a>
        <ul>
            <li><a href="#sec5.1">5.1 Alpha and Beta Testing</a></li>
            <li><a href="#sec5.2">5.2 Configuration Testing</a></li>
            <li><a href="#sec5.3">5.3 Conformance/Functional/Correctness Testing</a></li>
            <li><a href="#sec5.4">5.4 Graphical User Interface Testing</a></li>
            <li><a href="#sec5.5">5.5 Installation Testing</a></li>
            <li><a href="#sec5.6">5.6 Penetration Testing</a></li>
            <li><a href="#sec5.7">5.7 Performance and Stress Testing</a></li>
            <li><a href="#sec5.8">5.8 Recovery Testing</a></li>
            <li><a href="#sec5.9">5.9 Regression Testing or Back-to-Back Testing</a></li>
            <li><a href="#sec5.10">5.10 Reliability Achievement and Evaluation</a></li>
            <li><a href="#sec5.11">5.11 Test-Driven Development</a></li>
            <li><a href="#sec5.12">5.12 Usability Testing</a></li>
            <li><a href="#sec5.13">5.13 Chapter Summary</a></li>
        </ul>
    </li>
    <li><a href="#sec6">6 Case Study: Sysdrone Oy</a>
        <ul>
            <li><a href="#sec6.1">6.1 Software Development for Health Technology Industry</a></li>
            <li><a href="#sec6.2">6.2 Current Testing Systems</a></li>
            <li><a href="#sec6.3">6.3 Supported Software Types</a></li>
            <li><a href="#sec6.4">6.4 Requirement Specifications</a></li>
            <li><a href="#sec6.5">6.5 Chapter Summary</a></li>
        </ul>
    </li>
    <li><a href="#sec7">7 Automatic Portability Testing Environments</a>
        <ul>
            <li><a href="#sec7.1">7.1 Common Aspects</a></li>
            <li><a href="#sec7.2">7.2 Web-based Software Project</a></li>
            <li><a href="#sec7.3">7.3 Desktop Software Project</a></li>
            <li><a href="#sec7.4">7.4 Server Software Project</a></li>
            <li><a href="#sec7.5">7.5 Chapter Summary</a></li>
        </ul>
    </li>
    <li><a href="#sec8">8 Summary</a></li>
    <li><a href="#sec9">9 References</a></li>
</ul>

## <a id="pre">Preface</a>

I first dabbled in portability testing as a teenager writing web pages.
At the time, Microsoft Internet Explorer and Netscape Navigator were the
two major browsers and web pages were notoriously difficult to write so
that they would be displayed similarly in both browsers. Later on as a
professional software developer I’ve made software for multiple
different platforms such as Windows, Linux and Mac computers, Android
and Symbian smartphones and even Microsoft Xbox 360 game console.

Unfortunately most platforms have minor differences between different
versions of the platform. One time I was involved in developing a
software which was required to work on Windows versions of XP, Vista and
7 and which used Windows Communication Foundation to communicate between
different software instances. One of the new features of Windows Vista
was User Account Control which was developed to secure the platform by
restricting different kinds of operations software can perform. One of
these restrictions concerned Windows Communication Foundation. It took
us a whole week to locate the source of the problem and another week to
refactor the software to work around this problem. This and other
similar experiences made me want to learn more about portability and how
to use software testing to ensure portability of developed software.

This thesis wouldn’t have been completed with the help of my thesis
instructor Tapani Ristaniemi who provided valuable insight, my
colleagues Ilkka Laitinen and Jaakko Kaski at Sysdrone Oy who helped me
keep the writing going by having weekly stand up meetings on the
progress of the thesis and Tommi Kärkkäinen who helped shape the idea
behind the thesis during the thesis seminar course.


## <a id="glossary">Glossary</a>

Configuration Testing
:   The testing process of finding a hardware combination that should
    be, but is not, compatible with the program.
    [<a href="#testing_computer_software">54</a>]

Compatibility
:   ​(1) The ability of two or more systems or components to perform
    their required functions while sharing the same hardware or software
    environment. (2) The ability of two or more systems or components to
    exchange information. [<a href="#ieee_terminology">45</a>]

Portability
:   The ease with which a system or component can be transferred from
    one hardware or software environment to another.
    [<a href="#ieee_terminology">45</a>]

Testing
:   ​(1) The process of operating a system or component under specified
    conditions, observing or recording the results, and making an
    evaluation of some aspect of the system or component. (2) (IEEE Std
    829-1983 [5]) The process of analyzing a software item to detect the
    differences between existing and required conditions (that is, bugs)
    and to evaluate the features of the software items.
    [<a href="#ieee_terminology">45</a>]


## <a id="sec1">1 Introduction</a>

    "Program testing can be used to show the presence of bugs, but never to show their absence!" -Edsger W. Dijkstra

Lockheed Martin F-22 Raptor is a 5th generation fighter plane
[<a href="#f22_lockheed">56</a>]. Australian Air Marshal Angus Houston has described
it as as "the most outstanding fighter aircraft ever built"
[<a href="#f22_outstanding">10</a>]. Each of them costs about 150 million U.S.
dollars [<a href="#f22_cost">101</a>]. On February 11th, 2007 a group of these
fighters were en route from Hickam Air Force base in Hawaii to Kadena
Air Force base in Japan [<a href="#f22_flight">19</a>]. As they were near 180th
meridian, the computers aboard the planes crashed. Navigation,
communication, fuel and all other systems shut down. The pilots tried to
reset their planes but the problem persisted [<a href="#critical_code">20</a>]. What
had happened? Problems started exactly on 180th meridian which is also
known as the International Date Line. When one passes the International
Date Line, the local time is shifted 24 hours
[<a href="#international_date_line">7</a>]. The software aboard the fighter planes
had passed tremendous amount of testing but the developers and the
testers had not managed to test them against this particular scenario. A
minor omission with dramatic consequences.

Software permeates many things in the world: it adjusts the braking
system in your car, stabilizes photos you capture with your camera,
handles your money at the bank and enables to you to share all about
your latest vacation to your friends near and far. Whereas the computers
executing this software are rarely in error, humans writing the software
are not infallible. Even if the software works as its developers
intended, it might not be the software the users actually needed or
wanted. The backbone of the creation of software is the software
development process. This process is in place to ease estimation of work
load, to keep the project from falling behind deadlines and a lot of
other things. One of these things is the testing of the software.

Software has changed from simple trajectory calculations of the 1940s to
hugely complex and intertwined systems of today. When a user encounters
a problem, she rarely has a clue where the error actually happened. Even
the developers might be perplexed. To bring order to this chaos,
computer scientists have formulated many test processes which can be
integrated to the software development process. Carefully planned and
executed testing allows the users to succeed or just relax using a
well-working software. It also gives the developers a peace of mind. As
software is given increasing amounts of responsibility of our daily
lives, this testing also becomes increasingly necessary.

Simply making the software work on a single platform might not be
enough. In 1940s there were just a handful of computers at all and most
of these were designed for some specific purpose such as calculating
trajectories of ammo. These days many people have much more powerful
devices containing much more complex software in their pockets,
backpacks or their desktops. Despite what device the user is using at
the moment, they usually want to have access to their data and favorite
applications. This means that the software developers have to support a
vast array of different hardware and software. This brings us to the
concept of portability of a software.

In my experience even the basic testing of the developer software is too
often done poorly and in haste. When the portability is added to the
mix, developers usually just concentrate on getting the software working
on their favorite platform. This leads to forcing a lot of the testing
process on the end users. In extreme cases, this ad hoc nature of
testing might even to lead to fatal consequences. When the time came for
writing my master’s thesis, I pondered on many different topics but
ultimately chose this. I wanted to delve deeper into the general
software testing and find out what other people are doing when faced
with the issue of portability.

While this thesis discusses general themes related to portability, the
main focus is on topics related to software development performed at
Sysdrone Oy (later Sysdrone) and more specifically its health technology
projects. Health technology software is increasingly targeted directly
at the actual people who monitor and improve their own health. This
leads to a wide array of potential devices used to access and execute
these health technology software. The software must function correctly
no matter which supported platform it is used. Malfunction is at least
annoying and in worst case, even fatal.


### <a id="sec1.1">1.1 Objective of the Thesis</a>

The objective of the thesis is to plan a practical automatic portability
testing environment for the kind of software typically developed at
Sysdrone. To support the planning process, this thesis is used in
defining software testing and portability and describing different
aspects of these concepts. The most important question this thesis
answers is:

-   *How can Sysdrone use automatic testing to detect and mitigate
    portability issues in its software development process?*

Related supporting questions are:

-   *What is automatic testing, why is it important and how it can be
    done?*

-   *What is portability, what kind of problems are related to it and
    how can these issues be detected automatically?*

First supporting question is used to explore why automatic testing is so
important, how it is used in software development process and what kind
of benefits and costs it presents. Automatic testing is a common subject
in software development but according to my experiences it is usually
understood in too shallow context. My goal is to gain in-depth knowledge
about different kinds of testing levels, test techniques and how these
can be interwoven with software development processes.

Second supporting question is used to explore why portability is an
important feature of a software, what kinds of problems are related to
portability and why performing portability manually is not recommended.
Based on my experiences, portability is a major issue and usually
software is developed primarily on a single platform. This may lead to a
situation where other platforms are usually tested only later on in the
software development process and the testing is performed manually.
Manual testing leads to potentially unsystematic testing and major
resource requirements.


### <a id="sec1.2">1.2 Research Methods</a>

The research of software testing and portability is done mainly by
reading academic and other professional literature. Some real world
examples and supporting data are found from blogs, Internet statistics
and discussion boards such as Stack Overflow.

The information about software being developed at Sysdrone is achieved
by my 2-year experience of the company and by consulting my colleagues
at Sysdrone.

Plans for automated portability testing environments are made with the
supporting theoretical background of the previous parts of the thesis
and by researching existing portability testing environments which are
already either planned or developed elsewhere.


### <a id="sec1.3">1.3 Constraints of Research</a>

Software development, portability and software testing are complex
concepts with a vast array of different aspects. This thesis is mostly
concerned with the kind of software testing and portability issues which
are typical in the software projects developed at Sysdrone.

Although the thesis concerns portability testing, it is more focused on
the kind of portability testing which can be automated. Thus this thesis
does not delve into the topic of for example manually testing a huge
array of Android handsets. This kind of testing, although useful, is so
labor intensive that small development teams at Sysdrone cannot perform
such testing.


### <a id="sec1.4">1.4 Structure of the Thesis</a>

Chapter 2 defines software testing, provides arguments
supporting its necessity, description of its complexity and how
automation of tests help mitigate the effects of the complexity.

Chapter 3 defines portability, provides arguments
for why portability is increasingly important feature of a software,
describes why portability is a hard problem and how software portability
can be tested.

Chapter 4 defines different test levels and generally
describes, which kind of aspects of a software each of these levels
tests.

Chapter 5 specifies different kinds of test techniques.
The list of test techniques is mainly derived from IEEE’s Software
Engineering Body of Knowledge but it is also supported by various other
literature sources. Each test technique is inspected from the point of
view of portability and automation.

Chapter 6 presents Sysdrone as a case study of a software
development company. The types of software developed at Sysdrone are
categorized and the need for encompassing testing for software related
to medical devices is discussed.

Chapter 7 contains plans
for how Sysdrone could develop automatic portability testing
environments for different types of software typically developed at the
company.

Chapter 8 contains the summary of the thesis.


## <a id="sec2">2 Software Testing</a>

This chapter contains the definition of software testing, arguments
supporting its necessity, description of its complexity and how
automation of tests helps mitigating the effects of the complexity.


### <a id="sec2.1">2.1 What is Software Testing?</a>

Definitions for software testing can be hugely varied. One commonly
heard everyday description of why testing is performed is that it is
done to ensure or improve the quality of the software. This description,
although true, is too vague to be of any use when assessing software
testing because "quality" has not been precisely defined. According to
motorcycle enthusiast and philosopher Robert M. Pirsig [<a href="#zamm">83</a>]: "Any
philosophic explanation of Quality is going to be both false and true
precisely because it is a philosophic explanation. The process of
philosophic explanation is an analytic process, a process of breaking
something down into subjects and predicates. What I mean (and everybody
else means) by the word ’quality’ cannot be broken down into subjects
and predicates. This is not because Quality is so mysterious but because
Quality is so simple, immediate and direct." Thus a more precise
definition is required.

IEEE Computing Society’s Guide to Software Engineering Body of Knowledge
[<a href="#swebok_testing">44</a>] defines software testing as follows: "Testing is
an activity performed for evaluating product quality, and for improving
it, by identifying defects and problems. Software testing consists of
the dynamic verification of the behavior of a program on a finite set of
test cases, suitably selected from the usually infinite executions
domain, against the expected behavior." The definition includes the
mention of quality but it defines specific ways to achieve better
quality. This definition also underlines the fact that often it is not
possible to test all scenarios: instead a specific subset of the most
important scenarios is selected for verification.

According to Cem Kaner [<a href="#exploratory_testing_keynote">55</a>]: "Software
testing is an empirical technical investigation conducted to provide
stakeholders with information about the quality of the product or
service under test." The information produced by testing can be used by
the stakeholders in various ways. If the quality of the product or
service has been proven satisfactory, stakeholders can decide to publish
the product to users. In another case the testing might have identified
a life-threatening and unhandled scenario which needs further resources
so that the risk can be mitigated or possibly even completely
eliminated.

The definition of testing has evolved over the years
[<a href="#systematic_testing_book">22</a>]. In year 1979 testing was defined as "the
process of executing a program or system with the intent of finding
errors". One definition from year 1983 was: "Testing is any activity
aimed at evaluating an attribute of a program or system. Testing is the
measure of software quality." More recently in year 2002 testing was
defined as "a concurrent lifecycle process of engineering, using, and
maintaining testware in order to measure and improve the quality of the
software being tested." Of course, there are variations between
definitions by different people in any given year but these examples
illustrate the shift in attitudes regarding testing. Software testing is
being regarded as a more integral part of the software development
process than in the past.

However, software testing can be a lot of work and dangerously often
when the deadlines are closing in the software testing is the first
thing to be left out. This may partly be because software testing
usually pays back only in the long run. Thus it is easy to adapt a
similar mind-set that was used in the build-up of the economic crisis in
late-2000s: "I’ll Be Gone, You’ll Be Gone" [<a href="#al_gore">36</a>]. The
consequences of this kind of behavior are discussed in the section 2.2.


### <a id="sec2.2">2.2 World Without Software Testing</a>

What would happen if software testing wasn’t performed? One example was
presented in the Introduction of this thesis but there are countless
others.

Peter Sestoft [<a href="#systematic_software_testing">100</a>] has described very
unfortunate results from a poorly performed software testing: Faulty
baggage handling system at Denver International Airport led to a delay
of a year for the opening of the whole airport and caused financial
losses of 360 million dollars. Ariane 5 rocket used control software
which was originally developed for Ariane 4 but the code was not tested
with the new rocket and the rocket launch failed and caused losses of
hundreds of millions of dollars. Even though financial losses of these
kinds of scales are very unfortunate, poorly performed testing can also
lead to fatal consequences: Patriot missiles used in Gulf War performed
imprecise calculations and the resulting rounding errors made the
defensive missiles miss incoming Scud missiles and led to the death of
American soldiers in 1991. Therac-25 radio-therapy equipment and its
faulty control software led to fatal radiation doses given to cancer
patients in 1987.

In United States, National Institute of Standards & Technology estimated
that the inadequate infrastructure for software testing resulted in an
annual national cost of 22.2-59.5 billion U.S. dollars in year 2001
[<a href="#nist_economic_impact">98</a>]. Based on the above evidence it is safe to
assert that the software testing is indeed important.


### <a id="sec2.3">2.3 Complexity of the Software Testing</a>

Bugs are result from any of these reasons [<a href="#why_is_testing_hard">103</a>]:

-   User executed untested code. Time constraints often result in at
    least partially untested codebase.

-   Code statements were performed in a surprising order.

-   The user entered untested input values. Testing all different input
    value combinations can be very difficult.

-   The user’s operating environment was never tested. For example
    building a large network with thousands of devices takes a lot of
    resources and such testing environment is rarely built for internal
    testing.

Unfortunately computer cannot guarantee that the software works
correctly. When a program code is compiled as a runnable software,
compiler only makes sure that the form of the software does not contain
errors: the errors in the meaning of the software cannot be detected by
the compiler. However, finding these errors in the meaning of the
software can be found in better ways than just randomly experimenting
with the software: these better ways are collectively called software
testing [<a href="#systematic_software_testing">100</a>].

On the surface, testing the software doesn’t sound so hard. You write
the software and verify that it works correctly. Unfortunately even a
simple program can be so complex that the programmer can’t think of all
the possible combinations.

Consider the following program: "The program reads three integer values
from an input dialog. The three values represent the lengths of the
sides of a triangle. The program displays a message that states whether
the triangle is scalene, isosceles, or equilateral." What kinds of tests
would be required to adequately test this simple program? Myers
[<a href="#art_of_software_testing">73</a>] lists 14 test cases: 13 of them represent
errors that actually have occurred in different versions of the program.
One additional requires that each of these test cases specify the
expected output from the program. According to Myers’ experience,
qualified professional programmers score on average only 7.8 out of the
possible 14.

The above program can very likely be written with most programming
languages in less than 50 lines of code. To put that figure in
perspective, Linux kernel version 2.6.35 contained 13 million lines of
code [<a href="#linux_kernel_loc">53</a>]. Windows Server 2003 contained 50 million
lines of code: its development team consisted of 2,000 people but its
testing team consisted of 2,400 people [<a href="#windows_2003_loc">59</a>].

It is not effective to apply the same type of testing to all different
type of software. For example when developing a simple game, small bugs
or issues under intense CPU load are usually not as serious as they
would be in a medical device or space shuttle. If the same type of
testing which is performed for space shuttle would be required for all
mobile games, the increased resource requirements would likely lead to a
massive decline of the amount of mobile games. This further complicates
the testing process because a development team cannot simply copy a
testing process from other project with a good reputation of catching
bugs and be done with it because it might prove to either be a lot more
exhaustive than required or it might not detect defects which were
acceptable in the other project but which are unforgivable in this
project.

### <a id="sec2.4">2.4 Automatic Testing</a>

    def is_leap_year(year):
        if year % 400 == 0: return True
        if year % 100 == 0: return False
        if year % 4 == 0: return True
        return False

    assert not is_leap_year(1900), '1900 should not be a leap year.'
    assert is_leap_year(1996), '1996 should be a leap year.'
    assert not is_leap_year(1998), '1998 should not be a leap year.'
    assert is_leap_year(2000), '2000 should be a leap year.'
    assert not is_leap_year(2100), '2100 should not be a leap year.'

<p style="text-align: center; width: 100%;"><em>Figure 2.1: A simple example of a test program that verifies leap year algorithm.</em></p>

Figure 2.1 presents a simple example of how a
programmatic unit test suite can be implemented. The tested function
`is_leap_year` is given an integer value and the function returns `True`
or `False` based on whether the given year is a leap year or not. Below
the function is a list of test cases and their expected values. For
example year 2000 is a leap year because it is divisible by 400 but year
2100 is not a leap year even though it is divisible by 4 because it is
also divisible by 100 but not divisible by 400. The test program
provides some kind of output whether tests succeeded or failed. In this
particular test program the output is simply printed in the console.

Because automatic tests do not require manual resources, they can be
performed easily. For example, when developer is writing the software,
she can easily perform all or specific tests to ensure that new changes
won’t break any existing tests. Even though tests are automatic, some of
them may be so complex or there may be so many tests that performing all
of them can take many hours or even days. This kind of testing would
interfere with the development. Because of this all tests in bigger
software projects are only performed during the night or even only when
releasing a new build.

According to Robert C. Martin [<a href="#immoral_manual_testing">61</a>], not only is
manual testing highly stressful, tedious and error prone, it also
immoral because it turns humans in machines. If a test procedure can be
written as a script, it is also possible to write a program to execute
that test procedure. This leads to cheaper, faster and more accurate
testing than the manual work performed by humans, and it also frees
humans to do what we do best: create.

According to research, code reviews are one of the best ways in finding
bugs. Unfortunately this sort of code reviewing is a manual process and
gathering the right people for performing code review or maybe even
having to train them takes a lot of effort. Because of this, it is
impossible to analyze the whole codebase with code reviews. Fortunately
same type of analysis can to a degree be automated by employing static
code analysis. This kind of tool analyzes either the program code itself
or the compiled bytecode and compares it to a database of common bug
patterns. Catching bugs as early as possible makes fixing them easier
[<a href="#static_code_analysis">57</a>]. Because static code analysis can be
performed even in realtime as the developer is typing the code, bugs can
be caught very early. Static code analysis cannot be used to detect all
possible problems: for example an usability problem or incorrectly
implemented mathematical algorithm cannot be detected if they are
technically correct program code.

Automatic testing is especially important with rapid application
development. Rapid application development attempts to minimize
development schedule and provide frequent builds. This is done so that
user can evaluate the evolution of the software in small increments and
provide feedback to development team so they can ensure that the
software reflects the actual needs and preferences of the user
[<a href="#automated_software_testing">25</a>]. Because of the rapid speed, there is
no time for a comprehensive manual testing each time a build is shipped
but if the testing would not be performed, the specified level of
quality could not be ensured. The best way to achieve rapid shipping of
new builds without compromising the quality is by employing automatic
software testing.


### <a id="sec2.5">2.5 Chapter Summary</a>

Software testing is a process to improve the quality of a software under
development. However quality should be defined more explicitly in the
context of each software. Software testing is an important part of the
software development and its omission can cause a lot of serious
problems. Unfortunately nearing deadlines often result in omitted or
poorly performed testing.

Complexity of the modern software projects leads to a vast number of
different operation combinations which have to be tested. Even very
simple pieces of software can have so many combinations that even
qualified professional programmers fail to recognize missing test cases.
Thus automated testing is a preferred way of testing software in many
complex and detailed test cases. Even though automated testing is a very
valuable tool, all software testing cannot and should not be automated.


## <a id="sec3">3 Portability Testing</a>

This chapter introduces the concept of portability, lists different
types of portability, presents reasons for developing portable software,
contains the definition of portability testing, and description of
problems related to portability and portability testing.

### <a id="sec3.1">3.1 History of Portability</a>

The amount of work required for moving a software from one environment
to another is dictated by how portable the specific software is. Ideally
software could moved between environments without any modifications to
the source code. Unfortunately, this is rarely possible in the real
world [<a href="#software_portability_evaluation">38</a>].

Peter J. Brown has given the following definition for portability
[<a href="#software_portability_brown">16</a>]: "Software is said to be *portable* if
it can, with reasonable effort, be made to run on computers other than
the one for which it was originally written. Portable software proves
its worth when computers are replaced or when the same software is run
on many different computers, whether widely dispersed or at a single
site."

There is no single specific definition for an environment of a software.
Over the years, the environments have changed considerably.

First electronic digital computer, ENIAC, was developed for calculating
ballistic trajectories. The programs for ENIAC were first developed on
paper and later input in the computer itself via physical interface
consisting of hundreds of wires and 3,000 switches
[<a href="#programming_the_eniac">23</a>]. ENIAC had no storage for programs but
instead they were only stored in the position of ENIAC’s wires and
switches. This was a problem because when users wanted to run some
another program on ENIAC, they had to change it physically by changing
the wires and switches. This could take days
[<a href="#early_electronic_computers">96</a>]. The only environment of ENIAC
programs was the ENIAC itself.

Manchester Baby was the first stored-program computer
[<a href="#early_electronic_computers">96</a>]. Stored-program computer is able to
store programs in its memory and change between them without users
changing any wires or flipping thousands of switches. Despite the move
to memory storage, the environment of the programs was still the machine
itself.

Programs for these early computers were written directly in machine
language which had hardware-specific instructions such as subtraction.
Machine languages are also called first-generation programming languages
[<a href="#programming_languages">34</a>]. These computers had no operating systems
so the only environment of programs running on these computers was the
hardware itself. The machines differed from each other in such dramatic
ways that there was no way to directly move a program from one kind of
machine to another.

One of the biggest problems with machine languages was that they were
closer to the language of the machine instead of the language of the
user. Writing programs in 0s and 1s was difficult and changing larger
programs was practically impossible. First step towards higher levels
was the development of assembly languages. Assembly languages are
symbolic representations of the machine languages. Programs written in
assembler were translated to machine languages and thus their
portability is nearly impossible. Assembly languages are called
second-generation programming languages. [<a href="#programming_languages">34</a>] An
example of an assembly program can be seen in code listing 3.1.

     # verify that   1 + 2 + 3 + .. + n = (1 + n) * n / 2 is true for
     # n = 3. Later on, we'll write a program for arbitrary n.
     #
    
    main:                               # beginning of the program
    
     # initialize $8, $9, and $10 as 1, 2, 3.               
       li $8, 1                         # $8 now contains 1
       li $9, 2                         # $9 now contains 2
       li $10, 3                        # $10 now contains 3
    
     # compute 1+2+3, result in $11
       add $11, $8, $9                  # $11 = $8+$9 = 3
       add $11, $11, $10                # $11 = $11+$10 = 3+3 = 6
     
     # compute (1+3)*3/2, result in $12
       add $12, $8, $10                 # $12 = $8+$10 = 1+3 = 4
       mul $12, $12, $10                # $12 = $12*$10 = 4*3 = 12
       div $12, $12, $9                 # $12 = $12/$9 = 12/2 = 6
    
     # subtract, result in $13
       sub $13, $11, $12                # $13 = $11-$12 = 6-6 = 0
                                        # verified
    j  $31                              # end the program

<p style="text-align: center; width: 100%;"><em>Figure 3.1: A program to verify that 1+2+3=(1+3)*3/2.</em></p>

First true general-purpose computers were developed in the 1950s and
1960s. Whereas previous computers were typically built for some specific
purpose such as calculating ballistic trajectories, general-purpose
computers could used for many different kinds of computers. During the
same time high-level programming languages (also called third-generation
programming languages) were developed. First of them, Fortran was
introduced in 1954 and finally developed in 1957. High-level programming
languages abstract the differences between different computers
[<a href="#programming_languages">34</a>]. Compilable high-level languages are
compiled from the source code written by the programmer to objects which
contain the program in a machine language with some additional data of
entry points and external calls [<a href="#problem_solving_using_c">12</a>].

Up to the introduction of operating systems, computers could only run
one program at a time so the environment of a program consisted only of
the machine itself. First operating system, GM-NAA I/O was developed by
IBM for 704 mainframe in 1956 [<a href="#gm_naa_io">46</a>]. With GM-NAA I/O the
environment consisted of both hardware and operating system. GM-NAA I/O
didn’t allow for multiple programs to run simultaneously[<a href="#gm_naa_io">46</a>]
so other programs couldn’t interact nor interfere with a program.

As computers were loaded with operating systems, portability didn’t mean
just transfering a program from one hardware to another. In 1978 Ritchie
and Johnson [<a href="#portability_of_c_programs">50</a>] wrote: "The realization
that the operating systems of the target machines were as great an
obstacle to portability as their hardware architectures led us to a
seemingly radical suggestion: to evade that part of the problem
altogether by moving the operating system itself."

According to an article published in The CPA Journal
[<a href="#cpa_software_portability">35</a>], the definition of portability hasn’t
changed from the 1970s. These sources still define portability as an
ability to move a software from hardware platform and/or operating
system to another. I argue that this is too narrow of a definition.

Oglesby et al. [<a href="#domain_specific_visual_languages">78</a>] have made the
following observation: "The history of software development has shown a
trend towards higher levels of abstraction. Each level allows the
developer to focus more directly on solving the problem at hand rather
than implementation details." Because the nature of software development
has changed due to increasing levels of abstraction, I argue that the
definition of portability should be broadened to better reflect the real
problems developers face when moving a software from one environment to
another.

For example, languages such as C\# and Java are not compiled directly to
machine code but instead they are compiled to bytecode. This bytecode is
then executed in a virtual machine which doesn’t provide a direct access
to neither operating system or hardware for the program. There are ways
to break out of these restrictions with tools such as Java Native
Interface but one of the key benefits of using these kinds of languages
is the ease of portability so using native interfaces is
disadvantageous.

As another example an HTML5 application can’t interact directly with
operating system nor hardware. The Internet browsers act as operating
systems for web applications.

Defining the portability of these kinds of software in terms of hardware
and operating system support is irrelevant because the developer has no
access to hardware and operating system. However these types of software
still face portability problems such as in the case of executing a Web
application in different browsers. Thus the problem of portability is
not simply solved by abstracting just hardware and operating system.

As hardware becomes more general-purpose, the specialty functionality
moves from hardware to software. For example whereas before some
software would have required some specific math co-processor which the
software would have been written directly against, these days software
usually require some third party libraries to provide the needed
functionality. Portability between different available third party
libraries becomes the more essential problem for developer to solve
instead of solving the problem of portability between specific hardware
components.

### <a id="sec3.2">3.2 Different Types of Portability</a>

There are a lot of different types of portability. Typically only
specific types of portability are related to a particular software. Thus
it is important to define the portability context of a software before
planning how to test portability of a software. This is by no means a
comprehensive list but are listed more as examples of what type of
portability issues might be encountered.

One of the most typical portability issue is the wide selection of
operating systems. Mainstream desktop and laptop operating systems are
Microsoft Windows, Apple Mac OS X and Linux-based distributions. On the
mobile front the most common ones are Google Android, Apple iOS, Windows
Phone, RIM BlackBerry OS and Nokia Symbian. In addition to these there
are lot of more specialized operating systems in embedded devices,
mainframes and other different hardware platforms.

Embedded software have a wide array of different hardware architecture.
These different hardware architectures have different characteristics
such as whether they are big endian or small endian. Embedded software
will not be discussed in more detail in this thesis because of the
reasons described in [constraints] but hardware architecture may present
issues even on mainstream computers and operating systems. For example,
Apple Inc. sold its computers with four different kinds of processors in
years 2005 and 2006. Previously Apple had used PowerPC-based processors
which were available as both 32-bit and 64-bit versions. In year 2005,
Apple announced its plans to switch over to x86-based processors
manufactured by Intel [<a href="#apple_confirms_switch">3</a>]. First versions of
its computers came with 32-bit Core Solo and Core Duo processors
[<a href="#apple_core_solo_duo">4</a>] but at the end of year 2006, Apple released
its first computer with 64-bit x86 processor, Core 2 Duo
[<a href="#apple_core_2_duo">5</a>]. 64-bit support has since been dropped in the
most recent version of OS X but at the introduction of 64-bit Intel
processors, there were four different combinations of Apple computer
processors: 32-bit Intel, 32-bit PowerPC, 64-bit Intel and 64-bit
PowerPC. With the introduction of Windows 8 and its ARM supports,
developers on Windows platform will soon be in a similar situation.

Browsers are one major source of portability issues. These issues are
described in more detail in sections
3.4 and 7.2.

Hosting a web server application requires a hosting site. A hosting site
can be a privately owned computer with a typical Internet connection but
a bigger traffic requires more serious hardware and network capacity. It
is possible to buy a dedicated high-volume network connections and
powerful server machines to host a site but buying enough for peak
traffic without spending a lot of money can be tricky. One way to solve
this is to use cloud-based hosting. There are many options for this type
of hosting. Some of the most well-known are Amazon Web Services and
Microsoft Azure but there are many others.

In addition to these there are some third party libraries which provide
major functionality. One example found in the realm of games and other
graphic-intensive software are APIs such as OpenGL and DirectX. OpenGL
can be found on most operating systems but DirectX is limited to
Microsoft Windows and Xbox 360 gaming console. When a major game title
is planned, the developers have to decide whether to support both.

### <a id="sec3.3">3.3 Motivation for Portability</a>

Portability requires extra resources. Why then is portability an
important feature of a software? As Peter J. Brown stated
[<a href="#software_portability_brown">16</a>]: "It costs planning and effort to
produce software that is portable. Moreover, on any one computer, a
portable program may be less efficient than a specially hand-tailored
one. Nevertheless, given the huge cost of rewriting non-portable
software, an investment in portability is normally one that will repay
handsomely."

Even though you would develop a very interesting software, customers
will rarely switch their existing platforms just for your software. This
might be the case in professional high-end software but even users are
probably accustomed to the existing ways of doing things and the switch
would be costly not just because hardware and software costs but due to
decrease in productivity. Portability of a software can also be seen as
a safety guarantee for the developing organization: they are less
susceptible to the changes done by the developer of the environment.
There are multiple documented cases
[<a href="#apple_bans_eucalyptus">37</a>][<a href="#apple_bans_page3">37</a>] of how developers
have put in a lot of work to create an iOS software just to see its
access denied to the Apple’s App Store and thus to all the iOS devices
(except for ones using rooted firmwares which allow software to be
installed even though the software has not received Apple’s blessing).

Typically possible users of a software use varying devices and operating
systems. For example if an organization wants to develop a software for
mobile devices which would potentially be available for 80% of the
population, the software would have to support four different mobile
operating systems: SymbianOS, iOS, Android and BlackBerry OS
[<a href="#statcounter_mobile_os_shares">92</a>].

Game industry is also concerned with portability. Most major game titles
are currently released on PC computers and Microsoft Xbox 360 and
PlayStation 3 consoles. In addition to these, the game may also be
released on Mac computers and Nintendo Wii console.

For example Battlefield 3 video game was released in 2011 for three
platforms: PC computers and Xbox 360 and PlayStation 3 consoles. On
November 6th, 2011 sales figures for each platform were 500,000 U.S.
dollars, 2.2 million and 1.5 million respectively
[<a href="#bf3_sales_figures">11</a>]. In this case choosing just a single supported
platform would have almost halved the sales rate.

### <a id="sec3.4">3.4 Problems of Portability and Portability Testing</a>

Each additional supported platform requires some additional resources.
At least the hardware and the software must be acquired and integrated
into the testing process. This can lead to a lot of different hardware
and software combinations. jQuery Mobile, which is a JavaScript library
for creating mobile user interfaces to web pages, is an example of this:
in their test lab they roughly 50 different phones, tablets and
e-readers to make sure their library performs properly on each platform
[<a href="#jquery_mobile_test_lab">52</a>].

Just providing a working software on a platform might not be enough. For
example there are certain differences between Windows, OS X and Linux
desktops which the users have grown accustomed to. One such difference
is the placement of OK and Cancel buttons in dialog windows. On Windows,
OK button is on the left and Cancel button on the right. On OS X these
are reversed and on Linux their placement varies between different
window managers. To create great software, it is recommended for the
software to feel native to its execution platform.

Some features might not be available on all platforms. It is up to the
developers to decide whether to go with the lowest common nominator,
which could lead to inferior product compared to the competitors, or to
create different versions for each platform to take advantage of each
platform’s features. Different versions introduce different test plans
and platform-specific test suites which in turn require additional
resources. There are no right answers to these decisions: they require
careful balancing.

Portability testing can be a very complex process. As discussed in
section 2.3, testing even a trivial
program can be difficult in itself and by introducing multiple platforms
the labor-intensiveness is multiplied. For example, by supporting
browsers of 80% of the international users, a software would have to
compatible with Internet Explorer, Google Chrome and Mozilla Firefox
browsers (based on data from November 2011)
[<a href="#statcounter_browser_shares">91</a>]. Unfortunately, just testing the
software with three browsers is not enough because the browser usage is
further divided into different versions of these browsers. By supporting
the same 80% share of the users, the software would have to be tested
with Chrome version 15, Internet Explorer versions 7.0, 8.0 and 9.0 and
Mozilla Firefox versions 3.6, 7.0 and 8.0
[<a href="#statcounter_browser_shares">91</a>]. Thus the testing would have to
performed with at least seven different desktop browsers. Things are
even further complicated if mobile browsers should be supported.
According to International Data Corporation, the amount of mobile
Internet users surpasses the amount of wireline users in United States
of America by year 2015 [<a href="#idc_mobile_surpasses_wireline">48</a>]. By
supporting the same 80% share of the mobile users, the software would
have to support Opera, Android, iPhone, Nokia and Blackberry browsers
[<a href="#statcounter_browser_shares">91</a>]. In addition to this, mobile browsers
also contain version differences [<a href="#mobile_html5">29</a>].

### <a id="sec3.5">3.5 Chapter Summary</a>

Nature of portability has changed over the years. In the beginning of
the computer era there were just a handful of vastly different machines.
Then the main issue in portability was supporting the hardware, as the
software typically directly interacted with the underlying machine with
no abstraction layers in between. Today a lot of developed software
doesn’t even have access to the machine below.

Different software face different types of portability issues. It is up
to developers to find out what these issues are, how affect the workings
of the software and how to mitigate portability problems.

Even though ensuring portability is not an easy task, it is important
for many reasons: Company doesn’t have to bet its business on just a
single platform. The pool of potential users is larger and thus the
potential economical or other benefits are larger as well.


## <a id="sec4">4 Testing Levels</a>

This chapter presents and compares multiple definitions of different
testing levels. The most often-used testing levels are described more
in-depth.


### <a id="sec4.1">4.1 Defining Testing Levels</a>

Software testing is often performed on multiple levels. For example, a
developer tests the software at a very low level because often she wants
to verify that a specific piece of code performs as expected. However
this test level is rarely a meaningful level for customer. At so low a
level evaluating the whole software can be very difficult. Instead
customer usually tests the software by using its user interface and
verifying that the software works as expected from the point of view of
an actual user.

Validation and verification testing are often mentioned when discussing
software testing. However they are neither testing levels nor methods.
Barry W. Boehm [<a href="#software_engineering_economics">15</a>] defines
verification as a process which answers the question "Are we building
the product right?" and validation process answers the question "Are we
building the right product?".

Testing levels as a term are also used to refer to maturity levels of
testing process in an organization. According to a definition by Ammann
& Offutt [<a href="#intro_to_software_testing">1</a>], there are five different
levels ranging from Level 0 "There’s no difference between testing and
debugging" to Level 4 "Testing is a mental discipline that helps all IT
professionals develop higher quality software". However this
categorization is outside of the scope of this thesis because this
thesis is more concerned with testing on a more technical level and not
on an organizational level.

There is no consensus of the exact definition of different test levels.
However different definitions contain a lot of common themes.

According to IEEE Computing Society’s Guide to Software Engineering Body
of Knowledge, there are three different target levels in software
testing: unit testing, integration testing and system testing. These
levels are defined as follows [<a href="#swebok_testing">44</a>]:

-   "Unit testing verifies the functioning in isolation of software
    pieces which are separately testable. Depending on the context,
    these could be the individual subprograms or a larger component made
    of tightly related units."

-   "Integration testing is the process of verifying the interaction
    between software components."

-   "System testing is concerned with the behavior of a whole system."

There are four different test levels according to Craig et al.
[<a href="#systematic_testing_book">22</a>]. Each level of testing has a
corresponding development level. Code is tested by unit tests, detailed
design by integration tests, high-level design by system testing and
software requirements by acceptance testing (figure 4.1). All
these levels should not necessarily be used in every software project.
Instead test manager should select the used levels based on a number of
variables such as complexity of the system, number of unique users and
budget. Unfortunately there is no formal formula for this decision.

<p style="text-align: center"><a href="http://villesalonen.fi/wp-content/uploads/2012/10/v_model.png"><img src="http://villesalonen.fi/wp-content/uploads/2012/10/v_model-300x225.png" alt="" title="" width="300" height="225" /></a></p>

<p style="text-align: center; width: 100%;"><em>Figure 4.1: Test levels and their corresponding development levels.</em></p>

Ammann et al. [<a href="#intro_to_software_testing">1</a>] present two different
kinds of testing levels. First kind is based on software activity and
the levels are defined as follows:

-   "Acceptance Testing - assess software with respect to requirements.

-   System Testing - assess software with respect to architectural
    design.

-   Integration Testing - assess software with respect to subsystem
    design.

-   Module Testing - assess software with respect to detailed design.

-   Unit Testing - assess software with respect to implementation."

These levels differ slightly with object-oriented software because the
design blurs distinction between units and modules. Testing of a single
method is usually called intramethod testing while testing of multiple
methods is called intermethod testing. If a test is constructed for the
whole class, it is called intraclass testing. Testing of interaction
between different classes is called interclass testing. The first three
are variations of unit and module testing and the interclass is testing
is a type of integration testing [<a href="#intro_to_software_testing">1</a>].

The rest of this chapter contains more in-depth definitions of different
levels. The set of testing levels is based on the definition of Craig et
al. as it most closely resembles the testing levels used at the target
organization of this thesis.


### <a id="sec4.2">4.2 Unit Testing</a>

Roy Osherove [<a href="#art_of_unit_testing">79</a>] defines unit test as follows: "A
unit test is a piece of a code (usually a method) that invokes another
piece of code and checks the correctness of some assumptions afterward.
If the assumptions turn out to be wrong, the unit test has failed. A
’unit’ is a method or function." By isolating the unit from other units,
tests do not rely on external variables such as a state of database or a
network connection.

Robert C. Martin [<a href="#clean_code">62</a>] describes devising a test for a piece
of software which he developed for an embedded real-time system which
scheduled commands to be run after a certain amount of milliseconds. His
test used an utility software in which by tapping a keyboard he
scheduled a text to be printed on the screen 5 seconds later. Then he
hummed a familiar song and tapped keyboard in rhythm and 5 seconds later
he hummed the same song again and tried to make sure that the pieces of
text would be printed in perfect synchronization. According to Martin,
this not an exemplary way of unit testing: instead it is an imprecise
test at best and at worst it is very error-prone and labor-intensive
because it requires manual interaction with the software. A good unit
test for this program would be one where the unit subjected for testing
would be isolated from the computer clock. This kind of unit test would
not only remove the ambiguous results of repeated manual tests: it would
also allow developer to manipulate time perceived by the tested software
to all kinds of arbitrary situations such as testing the timing at the
moment when clocks are adjusted due to daylight saving time. Testing
this particular situation by relying on the actual computer clock would
only be possible twice a year.

Ammann et al. [<a href="#intro_to_software_testing">1</a>] present Pentium Bug case
as a real-life example of how inadequately done unit testing can prove
very costly if problems are found in the later stages of testing or even
after the product release. A Pentium processor developed by Intel is an
example of this. The Pentium Bug was a defect discovered by MIT
mathematician Edelman and the bug resulted in incorrect answers to
particular floating-point calculations. Both Edelman and Intel claimed
that this would have been very difficult to catch in the testing but
according to Ammann et al. [<a href="#intro_to_software_testing">1</a>] it would
have been very easy to catch with proper unit testing.

As unit tests are small test programs which verify a certain part of a
production software, the test programs can be executed by a computer. By
employing a unit test framework such as NUnit, test programs can be
written in a way which makes it possible to automatically check whether
tests succeeded or failed and if they failed, which part of the software
malfunctioned [<a href="#nunit_example">76</a>].

According to a case study performed at Microsoft Corporation Inc.
[<a href="#microsoft_automated_unit_tests">107</a>] by comparing Version 1 of a
product, which was developed with ad hoc and individualized unit testing
practices, to Version 2, which was developed with the utilization of
NUnit automated testing framework by all team members, test defects
decreased by 20.9% while development time increased by 30%. Version 2
also had a relative decrease in defects found by customers during first
two years of software use.

Unit testing relates to portability in several ways. Firstly unit tests
can be used to learn and verify how external libraries behave. Secondly
unit testing can be used verify that basic operations such as adding and
subtracting work correctly despite the change in the execution
environment.

Unit testing external libraries which may be already thoroughly tested
by their development teams might sound redundant at first but it offers
several advantages. When a new external library is being investigated
for possible inclusion, writing unit tests against its API is a more
systematic approach to learning how to use the library compared to
simple ad hoc testing. These unit tests can later be used when the
library is updated to a new version to verify that the API still works
as expected. Without these kinds of unit tests, small changes in the
external library may propagate bugs in a very surprising ways.

When a software is ported to another architecture, there may differences
in the basic operations. For example, if a software is ported from
64-bit architecture to a 32-bit architecture, mathematical operations
with large integers or other number types may overflow. When an integer
overflow happens, it may change from architecture to architecture what
value will be returned as a result.

### <a id="sec4.3">4.3 Integration Testing</a>

Integration testing is performed to verify the correct integration of
different components. Integration testing ensures that passing of data
between components works as expected and that the components work in
cohesion. Components may be integrated on multiple levels in hierarchy
of the software. An example of integration between components is
presented in figure 4.2. Also the integration testing
can be done on multiple levels. At the lowest level small components are
integrated together. This level of testing is usually performed by the
development team. At a higher level the integrated components are much
larger and thus may require more testing resources. This level of
testing may be done by the developers but it may also be performed by a
dedicated test team [<a href="#systematic_software_testing">100</a>].

<p style="text-align: center"><a href="http://villesalonen.fi/wp-content/uploads/2012/10/integration_car_example.png"><img src="http://villesalonen.fi/wp-content/uploads/2012/10/integration_car_example-300x201.png" alt="" title="integration_car_example" width="300" height="201" class="aligncenter size-medium wp-image-715" /></a></p>

<p style="text-align: center; width: 100%;"><em>Figure 4.2: "Levels of Integration in a Typical Car" [<a href="#systematic_testing_book">22</a>]</em></p>

An example case of proper unit testing but inadequate integration
testing is the story of Mars Climate Orbiter in 1999
[<a href="#mars_climate_orbiter">74</a>]. Mars Climate Orbiter was designed to gather
data from Martian weather and to be a communications relay for Mars
Polar Lander. When Mars Climate Orbiter was entering the Martian
atmosphere communications to it were lost. NASA performed an
investigation into the reasons of this mishap and located the problem in
the communication between two components responsible for certain
calculations relating to the atmosphere entry. Both components worked
when they had been tested in isolation but when they were integrated the
calculations were incorrect. The reason of this incorrectness was that
another component used Imperial units and the other used metric units.

Integration testing at its nature is similar to unit testing except that
whereas unit testing is concerned with testing a small unit of the
software in isolation, integration testing tests the integration of
different components. Thus automatic integration tests can usually be
implemented with the same tools as automatic unit tests.

Portability requirements may present more requirements for the testing
process. Different components of the system may be used on different
platforms. Integration of the components on the similar platforms (such
as on 64-bit architecture) may perform as expected but when one of the
components is run on different platform (such as on 32-bit
architecture), the functionality may be altered. One way to avoid these
types issues is to have comprehensive unit tests which are performed on
all supported platforms. If the unit test results are equal on all
platforms, integrating such a component running on different platforms
should work as expected. However, even a unit testing with comprehensive
code coverage may not be able to detect subtle differences such as
slightly different timing which leads to problems only on specific
platforms. Thus if resources permit, performing integration tests on all
possible combinations of the integrated components would increase the
detection of unexpected problems.

### <a id="sec4.4">4.4 System Testing</a>

The target of system testing is the entire system in a fully integrated
state. The point of view of system testing varies based on the type of
the project: for example installation and usability testing are
performed from the point of view of a customer but some tests can verify
behavior which might go unnoticed by the user but are very important for
the correct performance of the system. System testing is usually
performed by an independent test organization if one is available
[<a href="#managing_the_test_process">13</a>].

Because system testing should be performed from the perspective of the
user, it is inadequate to just perform tests against internal APIs and
to verify their functionality. If the software under testing is has some
kind of user interface, the testing must also test the said user
interface. There are existing testing tools for testing web UIs
[<a href="#selenium">88</a>] and desktop UIs
[<a href="#microsoft_ui_automation">63</a>][<a href="#nunit_forms">77</a>].

To encourage developers to use automated system testing, it is
recommended to make test design and coding as easy as possible. If
developing automated tests is more of a burden than testing the feature
manually, there would no point in using automated tests. Automated
system tests can yield some unexpected benefits: if system testing
requires hardware, performing automated system tests outside of typical
office hours allows the hardware to be free for other use during the
office hours.

As system testing is concerned with the overall performance of the
software, it is important to perform system tests on all supported
platforms. Catching some portability problems such as disparities
between different database software might be hard to catch on lower
levels.

### <a id="sec4.5">4.5 Acceptance Testing</a>

Whereas unit, integration and system testing have been concerned about
looking for problems, acceptance testing is used to make sure that the
software fulfills the requirements. When software development has been
contracted, successful acceptance tests are usually required before the
customer accepts the product. However, this doesn’t mean that acceptance
tests would not be used when software is not developed under contract.
Acceptance tests should be performed in an environment as close to the
production environment as possible. The focus of the tests is usually on
typical user scenarios instead of corner cases
[<a href="#managing_the_test_process">13</a>].

People interested in the acceptance test plan and the results of test
can include many individuals from developers to business people. All
interested parties may not be technically oriented so acceptance test
plan should be non-technical [<a href="#systematic_testing_book">22</a>].

Test-driven development and unit testing are widely used and researched
methods in agile software development. Automated acceptance tests (AAT)
is a more recent arrival and compliments the previous practices.
Manually performing acceptance tests can be tedious, expensive and time
consuming and thus is not suitably for agile software development
processes. In AAT, acceptance requirements are captured in a format
which can be automatically and repeatedly executed
[<a href="#automated_acceptance_testing_using_fit">40</a>].

Selenium [<a href="#selenium">88</a>] is an example of such tool. Selenium can be
used to automate actions which user performs with a web browsers. Though
it can be used for other purposes than just acceptance tests, it can be
used for them as well. Portability testing of multiple browsers can be
done by executing Selenium test suites with multiple browsers.

However, Selenium tests are generally quite technical and therefore
usually difficult to present to the customer as is. Customers can rarely
read or especially write the code required for Selenium tests. FitNesse
[<a href="#fitnesse">30</a>] and RSpec [<a href="#rspec">85</a>] are example tools which attempt
to make the automated tests more readable to the customer.

RSpec is designed for Ruby programming language and is intended as a
Behaviour-Driven Development tool. Behaviour-Driven Development combines
Test-Driven Development, Domain Driven Design, and Acceptance
Test-Driven Planning. [<a href="#rspec">85</a>] For example, in a banking application
one acceptance criteria might be that a new bank account should contain
0 dollars. This test case can be written as an RSpec test detailed in
figure 4.3 [<a href="#rspec_book">17</a>].

    describe "A new account" do
        it "should have a balance of 0" do
            account = Account.new
            account.balance.should == Money.new(0, :USD)
        end
    end

<p style="text-align: center; width: 100%;"><em>Figure 4.3: An example of RSpec test case.</em></p>

FitNesse uses a wiki for creating and maintaing test cases. Pages in the
wiki contain test cases which are associated with tables of different
inputs and expected outputs. Test tables are then parsed and used to
perform tests against the software. When tests are performed, the
successful test values are colored green and unsuccessful tests are
colored red. [<a href="#fitnesse">30</a>]

<p style="text-align: center">
<table>
<tr><td colspan="3">eg.Division</td></tr>
<tr><td>numerator</td><td>denominator</td><td>quotient?</td></tr>
<tr><td>10</td><td>2</td><td>5.0</td></tr>
<tr><td>12.6</td><td>3</td><td>4.2</td></tr>
<tr><td>22</td><td>7</td><td>=3.14</td></tr>
<tr><td>9</td><td>3</td><td>&lt;5</td></tr>
<tr><td>11</td><td>2</td><td>4&lt;_&lt;6</td></tr>
<tr><td>100</td><td>4</td><td>33</td></tr>
</table>
</p>

<p style="text-align: center; width: 100%;"><em>Table 4.1: An example of a FitNesse test table.</em></p>

Based on case studies performed by Haugset et al.
[<a href="#automated_acceptance_testing">41</a>] developers felt that by having
automated acceptance tests it was safer to make changes in code, fewer
errors were found and the need for manual testing reduced. In addition
to these there were some higher-level benefits such as it was easier to
share competence within team, acceptance tests gave a better overview of
the whole project and writing acceptance tests made developers think of
what they are doing before doing this. Developers also felt that
traditional specifications received from customers were poor in quality
and writing acceptance tests based on them was in a way a reflection of
what the customer really needed.

By executing automated acceptance tests to ensure portability, resources
can be freed from performing same repetitive tests on multiple
platforms. These resources can used to for example perform additional
tests which may not possible to automate or to lower costs of the
overall software project.

### <a id="sec4.6">4.6 Chapter Summary</a>

There is no single universally accepted definition of testing levels.
Different software projects may require some testing levels which are
unnecessary in others. By comparing different definitions and
emphasizing the testing levels used at Sysdrone, unit, integration,
system and acceptance testing levels were chosen for more detailed
inspection. Unit testing is concerned with the operation of smallest
independent unit in software. Integration testing is used to verify that
the integration of two independently correctly working components is
working as expected. System testing tests the software as a whole with a
lot of technical and detailed test cases. Acceptance testing is usually
concerned with the user requirements and thus its test cases are smaller
in number and of less technical nature.

## <a id="sec5">5 Test Techniques</a>

In this chapter different test techniques are described and their
relation to automatic testing and portability testing are investigated.
The list of of test techniques is lifted from SWEBOK
[<a href="#swebok_testing">44</a>] but other literature and academic sources have
been used to supplement the descriptions.

### <a id="sec5.1">5.1 Alpha and Beta Testing</a>

The usage of terms "alpha testing" and "beta testing" can vary
significantly between different development teams. Most commonly they
are defined as follows [<a href="#systematic_testing_book">22</a>]: Alpha testing is
an acceptance test performed in a development environment and hopefully
with real users in a realistic environment. Beta testing is an
acceptance which is performed in a production environment with real
users. Many companies just release a beta version of the software for a
group of users and let them have a go at it. This kind of ad hoc testing
is not as precise as performing beta test with planned test cases and
expected results.

Acceptance tests are sometimes divided into two categories
[<a href="#managing_the_test_process">13</a>]: alpha tests which are performed
in-house and beta tests which are done by real customers. These tests
can be used to test whether the product is ready for market but they can
also be useful in finding bugs which were not found in the usual system
testing process.

Alpha and beta testing performed by real users with usage monitoring
systems (external or built-in into the tested software) can provide
valuable insight into how users really use the software or which
functions are the most commonly used.

Game called Starcraft II is one example of how beta testing can be
applied to solving complex problems [<a href="#blizzard_insider">14</a>]. Starcraft
II is a real-time strategy game with three different races which all
have different kinds of units. This leads to a tricky balancing between
different units and races so that no race or unit is unfairly dominating
in gameplay. Finding the right kind of balance by only using internal
testers can be very difficult but by releasing a beta version of the
game to public the development team can gather massive amounts of data
by embedding statistics tools and by asking opinions of the gaming
community and pro players. These can be used to measure for example
which units are used most or what are the winning ratios between three
races.

Alpha and beta testing are especially used to get real users for the
software by releasing alpha and beta versions. Real user feedback cannot
be obtained by any automatic testing system. Of course, alpha and beta
versions can be subjected to other tests but usually if any test suites
have been developed for the particular software, it should already pass
those tests completely or at least partially with an expected level of
errors before an alpha or beta version is released to the users.

Alpha and beta testing can be a good source of feedback about the
portability of a software. Developers may not have access to the same
array of devices that the users have or may not have enough resources to
perform testing with that many devices. For example, testing an Android
mobile software can be extremely difficult even if money is not a
problem due to the sheer amount of different devices with varying
hardware and software capabilities.

### <a id="sec5.2">5.2 Configuration Testing</a>

SWEBOK [<a href="#swebok_testing">44</a>] defines configuration testing as follows:
"In cases where software is built to serve different users,
configuration testing analyzes the software under the various specified
configurations." On the contrary, Kaner et al.
[<a href="#testing_computer_software">54</a>] definition is: "The goal of
configuration test is finding a hardware combination that should be, but
is not, compatible with the program." Based on SWEBOK definition,
portability testing and configuration testing are the same thing, but
Kaner et al. definition places configuration testing as a subset of
portability testing as portability testing is concerned with a more
general portability from one environment to another. These environments
may be identical in hardware aspect but differ on the software level.
Because of these reasons, configuration testing is not researched in
this particular subsection as it is researched overall in this thesis.

### <a id="sec5.3">5.3 Conformance/Functional/Correctness Testing</a>

SWEBOK [<a href="#swebok_testing">44</a>] defines conformance testing as follows:
"Conformance testing is aimed at validating whether or not the observed
behavior of the tested software conforms to its specifications."
Specification which is used to perform conformance testing may also be a
specific standard [<a href="#toward_credible_testing_certification">102</a>].

Requirements detailed in a specification can be used as a basis when
developing automatic test suite although some requirements may not
suitable for automatic testing.

Software may behave differently on other platforms. Thus a conformance
testing should be performed on all supported platforms.

### <a id="sec5.4">5.4 Graphical User Interface Testing</a>

Graphical user interface testing is hard because it involves testing
both the underlying system and the user interface implementation. User
interfaces have a large number of possible interactions. It is not just
sufficient to test each view but also to test each sequence of commands
which lead to that view. It is also very hard to determine how much of
the user interface is covered by each test set. Determining test
coverage of conventional systems is done by analyzing the amount and
type of code in the software. This does not apply to user interface
testing because the most important metric is how many different possible
states of the system are tested. Each step of the user interface test
has to be verified because if a problem has been encountered, it may not
be possible to proceed to the next step. [<a href="#user_interface_testing">64</a>]
Due to the amount of possible permutations, automation of graphical user
interface testing is paramount. Manually testing each permutation and
keeping track of which permutations have already been tested is very
labor-intensive even with a small amount of permutations.

Testing of graphical user interfaces is not limited to a single level.
The testing can be performed on all levels from a unit test level by
developer to an acceptance test level by end-user.

User interface consists GUI objects which can be anything from windows
and buttons to menus and other types of widgets. Even a simple interface
typically contains multiple GUI objects. These objects have a lot of
different behaviors from responding to a click to disabling an input
field. Testing these behaviors can be very complicated and the resulting
test code is usually messy. Some of these behaviors may even be
impossible to test. [<a href="#unit_test_frameworks">39</a>] Unit testing of GUI
objects can be made a lot easier by not putting code in the actual GUI
object class but to create another class, a smart test class, first and
the actual GUI object class last. GUI object doesn’t any logic in itself
but it is used just to display and retrieve data to and from user. This
kind GUI object can be represented by a mock object during unit tests so
developer can verify that smart class retrieved and displayed data
correctly. [<a href="#the_humble_dialog_box">28</a>]

Selenium [<a href="#functional_tests_selenium">43</a>] is a software used for
in-browser testing. Selenium offers the possibility for writing web
software in a test-first manner. These tests can be later used as a
regression test suite. Selenium can be used on a system testing and
acceptance testing levels.

There are also test software for taking automated screenshots of web
pages on multiple platforms. This kind of testing is also offered as a
service: one such example can found at http://browsershots.org/. This
will be explored more in depth in section 7.2.

### <a id="sec5.5">5.5 Installation Testing</a>

SWEBOK [<a href="#swebok_testing">44</a>] defines installation testing as follows:
"Usually after completion of software and acceptance testing, the
software can be verified upon installation in the target environment.
Installation testing can be viewed as system testing conducted once
again according to hardware configuration requirements. Installation
procedures may also be verified."

It is possible to perform a installation without user interaction at
least on Windows [<a href="#ms_cli_installer">65</a>], Mac OS X
[<a href="#mac_cli_installer">2</a>] and various other UNIX-based
[<a href="#rpm_cli_installer">27</a>][<a href="#aptget_cli_installer">6</a>][<a href="#bsd_cli_installer">33</a>]
platforms. These types of installers can be used automatically and a
successful installation can be verified in multiple ways depending on
the installed software.

Installation on different platforms requires testing because for example
installation on Windows and Linux operating systems are very different
processes. This can be performed automatically with the help of virtual
machines. [<a href="#vmware_installer_testing">9</a>]

### <a id="sec5.6">5.6 Penetration Testing</a>

The purpose of penetration testing
[<a href="#security_testing_and_assessment">97</a>] is to test security of the
software against real-world attacks in a safe way. The penetration
testers provide the software developers and managers data about the
possible security problems before real attackers can exploit these
problems. Penetration testing is usually performed on a real system and
staff. Penetration testing may even involve physical attacks such as
breaching physical security controls, stealing equipment or disrupting
communications. Many penetration testers use a combination of
vulnerabilities in one or many systems to gain improper access.

Most common vulnerabilities used in penetration testing can be found
from these categories [<a href="#security_testing_and_assessment">97</a>]:
Misconfigurations such as insecure default usernames and passwords.
Flaws in the kernel which is the heart of the operating system and thus
affect all programs which are executed within it. Buffer overflows where
an intruder can input a too large piece of data in memory and thus
inject malicious data. Insufficient input validation such as when an
attacker employs SQL injection by entering SQL commands in text inputs.
Symbolic links where an attacker can point the link to parts of file
system which would otherwise be inaccessible to the attacker. File
descriptor attacks where type of file can be used in malicious ways by
entering an invalid file descriptor. Race conditions where attacker can
hijack a program when the said program is running in with elevated
privileges. Incorrect file and directory permissions where attacker can
gain access to files which should not be made available.

Some of these categories - such as misconfigured security settings - may
not be directly related to the developed software. For example an UNIX
server which is configured to allow root user to login over SSH or even
telnet connection and a poor choice of root user password can be
combined to breach the system. Root privileges allow the attacker to
perform a variety of different attacks such as reading files which can
not be accessed through the developed software or overwriting certain
parts of the memory to fool the developed software to behave
incorrectly.

However categories such as insufficient input validation are a direct
responsibility of the developed software. For example database
components should have proper unit tests for detecting SQL injections
and when developing web software, HTML form components should be tested
against cross-site scripting attacks where attacker inputs malformed
data in a text input and manages to execute external JavaScript code.

Software may use security features of the underlying system. Different
systems may have different implementations of these security features.
Thus penetration testing should be performed on all supported platforms
to ensure the safe operation of software on each of them.

### <a id="sec5.7">5.7 Performance and Stress Testing</a>

Software problems are often not caused by a deficiency in program logic
but because the software is executed under a kind of stress which was
not anticipated or not properly tested for during the development.
Purpose of stress testing is to execute software in a situation where
expected resources are not available
[<a href="#mastering_software_quality_assurance">18</a>]. These kinds of situations
may be such as performing time-critical operations with CPU usage at
full capacity or losing network connection in the middle of a database
transaction.

SWEBOK [<a href="#swebok_testing">44</a>] defines performance testing as follows:
"This is specifically aimed at verifying that the software meets the
specified performance requirements, for instance, capacity and response
time. A specific kind of performance testing is volume testing, in which
internal program or system limitations are tried." In comparison, stress
testing is defined as follows: "Stress testing exercises software at the
maximum design load, as well as beyond it."

Stress testing is often used to mean an array of different tests such as
load testing, mean time between failure testing, low-resource testing,
capacity testing and repetition testing. Stress testing itself is used
to simulate a load greater than expected to expose bugs under stressful
conditions. Load testing instead is used to test software under typical
peak or higher loads. Mean time between failure measures average amount
of successful operation before an error or crash occurs. Low-resource
testing executes program in an environment with low or depleted
resources such as hard disk space or physical memory. Capacity testing
is used to measure the maximum amount of users a system can withstand.
Repetition testing is used to perform a test suite repeatedly to detect
hard-to-find problems such as tiny memory leaks which become a big
problem after a huge number of repetitions.
[<a href="#how_we_test_software_at_microsoft">80</a>]

Stress testing can be automated. Automated stress testing tools enable
test engineer to instruct which tests should be performed and how many
users should simulated during the test. Stress tests typically attempt
to mimic normal user behavior but this kind of behavior can be
multiplied with the automated stress testing tool. These kinds of tools
typically produce a log file which can be used to assess the performance
during test. Typical types of errors found in stress tests include
memory leaks, problems with performance, locking or concurrency, excess
consumption of system resources, and exhaustion of disk space.
[<a href="#automated_software_testing">25</a>]

Environment can affect software performance. For example, different
browsers provide different kinds of JavaScript performance, hardware
architecture (such as 32-bit compared to 64-bit) can affect memory
requirements and typically newer operating systems have more optimized
system functions. Thus it is important to perform performance and stress
tests on all supported platforms.

### <a id="sec5.8">5.8 Recovery Testing</a>

Many systems are required to have some degree of fault-tolerance. By
being fault-tolerant, system has to be able to recover from certain
hardware or network faults, software or human errors or loss of data
without causing the system to cease operating or crash. During recovery
testing, a system is intentionally injected with some type of system
failure to verify that the system recovery is properly performed.
Recovery process may or may not be automated. In case of automatic
recovery process, a test should validate that the recovery was properly
performed. [<a href="#recovery_testing_engel">26</a>] Specific objectives of recovery
testing include the following [<a href="#recovery_testing_perry">81</a>]:

-   "Adequate backup data is preserved.

-   Backup data is stored in a secure location.

-   Recovery procedures are documented.

-   Recovery personnel have been assigned and trained.

-   Recovery tools have been developed."

Some aspects of recovery testing - such as assigning and training
recovery personnel - cannot be used in automatic testing process.
However, certain fault scenarios can be triggered automatically. For
example, if a software recording data from medical devices loses a
database connection, it may be required to be able store medical data
for a certain time period in a secondary storage location. This type of
scenario can be used in a automated system or acceptance test where a
database is programmatically closed or its network traffic blocked and
then programmatically restored after the specified timespan. Automatic
test can then verify that all produced data can be found at the database
after the test has been concluded.

Different environments of software may affect the recovery procedures so
recovery testing should also be performed on all supported platforms.

### <a id="sec5.9">5.9 Regression Testing or Back-to-Back Testing</a>

Regression testing and back-to-back testing are somewhat related.
Back-to-back testing involves two different versions of the software
which are ran through the same set of tests and their test results are
compared. Regression testing is a way of testing subsequent versions of
software against the same set of tests and verifying that all the
previously passed test cases are still passed. [<a href="#swebok_testing">44</a>]
Majority of all testing effort in commercial software development is
regression testing. Regression testing is very important because even
small changes to one part of the system may cause unwanted changes in a
completely different part of the software.
[<a href="#intro_to_software_testing">1</a>]

Regression tests must be automated. If regression tests are not
automated, it is equivalent to no regression testing. Large components
or systems usually have large regression test suites.
[<a href="#intro_to_software_testing">1</a>] Performing the equal amount of testing
manually would be a huge waste of resources because these test suites
must absolutely be performed on each software release. Performing all
tests manually may take several weeks with a small test team. So for
example if a software project has a release cycle of two weeks, test
team may not even have enough time to perform all the previous
regression tests.

As small changes may cause unexpected changes, making a seemingly
innocuous change to code and testing it on one specific platform may
introduce a bug on another platform. Because of this, regression tests
must not only be automated but they must be performed on all supported
platforms to ensure the correct behavior of the software.

### <a id="sec5.10">5.10 Reliability Achievement and Evaluation</a>

Software reliability engineering is concerned with reliability which is
defined as "the probability of failure-free software operation for a
specified period of time in a specified environment". Reliability is one
of the attributes of software quality. Other attributes are
functionality, usability, performance, serviceability, capability,
installability, maintainability, and documentation. Software relibility
engineering includes measuring reliability, identifying attributes and
metrics which affect reliability and applying these to increase
reliability of the software. Reliability can be affected by multiple
factors such as product design, development process, system architecture
and software operational environment. [<a href="#software_reliability">58</a>]

Software reliability engineering can be divided into six steps. First it
is important to specify how software is used and what kind of
environmental conditions affect that. Secondly *quality* should be
defined in cooperation with the customer. Quality of course includes
reliability but also includes other factors such as delivery date or
costs. Thirdly quality definition and product usage data can be used to
design and implement the product. Fourthly reliability of third party
software should be measured and included in the acceptance requirements.
Fifthly reliability should be tracked during testing and this
information can be used when deciding on releasing the product. And
lastly reliability should be monitored in real world conditions and its
results should be used to guide the product development further.

A case study performed at AT&T researched the application of software
reliability engineering. Software engineers defined an *operational
profile* based on customer modeling. This operational profile was used
in automatically generating test cases. Software underwent a system test
done in increments and clean-room development techniques together with
feature testing based on the *operational profile*. Testing was done to
reliability objectives. The quality improved dramatically: a
factor-of-10 reduction in customer-reported problems, a factor-of-10
reduction in program maintenance costs, a factor-of-2 reduction in the
system test interval and a 30 percent reduction in new product
introduction interval. [<a href="#software_reliability">58</a>]

Besides using software reliability engineering methods to automatically
generate test cases based on a real-world operational profile, software
reliability can also be included in automatic testing process by adding
a measurement of reliability rates in the automatic test cases.

Different environments, both hardware and software, may have different
reliability rates. These reliability rates reflect on the reliability
rate of the software under testing. Due to this, software reliability
engineering should be performed on all supported platforms.

### <a id="sec5.11">5.11 Test-Driven Development</a>

Test-driven development [<a href="#tdd_defect_reduction">106</a>] is a software
development practice. Earliest references to TDD are from as early as
60s when it was used at NASA. TDD is a critical part in Extreme
Programming where code implementation is not preceded by any formal
designs.

Test-driven development or in its commonly abbreviated form TDD is a
software development process. Robert C. Martin defines the laws of
process as follows [<a href="#clean_code">62</a>]:

-   "First Law: You may not write production code until you have written
    a failing unit test.

-   Second Law: You may not write more of a unit test than is sufficient
    to fail, and not compiling is failing.

-   Third Law: You may not write more production code than is sufficient
    to pass the currently failing test."

These laws should be performed in a tight loop which is about two
minutes long and almost always ends in success. Based on Robert Martin’s
experience [<a href="#tdd">60</a>] by employing TDD 90% of the production will be
covered by unit tests. A major benefit of TDD is that if the code is not
covered by tests, developers are afraid to change it because they might
break it. If TDD is employed, any change may be tested against the
existing test suite and if no tests break, it is unlikely that anything
was broken. Unit tests can also be used as a documentation of how the
software works.

Traditionally TDD is focused on unit tests but variations of TDD such as
storytest-driven development (STDD) and acceptance test-driven
development (ATDD) have also emerged. Both STDD and ATDD rely on
automated test frameworks such as Fit, FitNesse and FitLibrary
[<a href="#tdd_stdd_atdd">42</a>].

Automatic tests created by using test-driven practices can and should be
performed on all supported platforms.

### <a id="sec5.12">5.12 Usability Testing</a>

Usability testing [<a href="#usability_testing">86</a>] is "a process that employs
people as testing participants who are representative of the target
audience to evaluate the degree to which a product meets specific
usability criteria". According to this definition, automation of
usability testing is impossible. There are however services such
UserTesting.com which help the user testing process.

UserTesting.com [<a href="#usertesting.com">99</a>] provides a crowdsourcing service
that provides a selection of test users from different demographics. The
user of the service can watch as the test users use the software and
provide commentary about their intents and frustrations. Unfortunately
these results still require manual evaluation.

### <a id="sec5.13">5.13 Chapter Summary</a>

Alpha and beta testing is a valuable tool to get information from a lot
of users. Due to its nature, it cannot be automated but by using
diagnostics tools, a lot of data can be obtained from the real-world
usage and possible problems related to portability.

Configuration testing is not precisely defined but most of its
definitions relate to testing software in different configurations. This
is similar to the portability testing but most definitions focus only on
the hardware configurations.

Requirements detailed in a specification can be used as a basis when
developing automatic test suite although some requirements may not
suitable for automatic testing.

Due to the amount of possible permutations, automation of graphical user
interface testing is paramount. Testing of graphical user interfaces is
not limited to a single level. There are design patterns and 3rd party
tools which help developers to create automatic test suites for
graphical user interfaces.

Installation is particularly dependent on the underlying environment.
Its testing can be automated. Virtual machines are useful when creating
a testing environment for installations.

The purpose of penetration testing is to test security of the software
against real-world attacks in a safe way. Some of the most common
vulnerabilities encountered in penetration testing are
misconfigurations, kernel flaws, buffer overflows, insufficient input
validation, symbolic links, file descriptor attacks, race conditions
and, incorrect file and directory permissions. Some aspects of the
penetration are not directly related to the software development and
some are concerned with the actual humans interacting with the system.
These cannot be automated but there are many aspects which can be.
Environment also can affect the safety of the software so penetration
testing should be done on all supported platforms.

Purpose of stress testing is to execute software in a situation where
expected resources are not available. Stress testing is often used to
mean an array of different tests such as load testing, mean time between
failure testing, low-resource testing, capacity testing and repetition
testing. Stress testing can be automated. Environment can affect
software performance and thus stress testing should be performed on all
supported platforms.

A system is injected with some type of failure recovery testing. To
succeed the tests, the system must recover from the failure. Recovery
testing involves educational and management work which cannot be
integrated into automatic tests but some failure injections and recovery
verifications can be automated.

In back-to-back testing two different versions are run through the same
set of tests and their test results are compared. Regression testing is
a way of testing subsequent versions of software against the same set of
tests. Majority of all testing effort in commercial software development
is regression testing. If regression tests are not automated, it is
equivalent to no regression testing.

Software reliability is the probability of failure-free software
operation for a specified period of time in a specified environment. A
case study performed at AT&T suggests that software reliability testing
can result in a factor-of-10 reduction in customer-reported problems, a
factor-of-10 reduction in program maintenance costs, a factor-of-2
reduction in the system test interval and a 30 percent reduction in new
product introduction interval.

Besides using software reliability engineering methods to automatically
generate test cases based on a real-world operational profile, software
reliability can also be included in automatic testing process by adding
a measurement of reliability rates in the automatic test cases.

Different environments, both hardware and software, may have different
reliability rates. These reliability rates reflect on the reliability
rate of the software under testing. Due to this, software reliability
engineering should be performed on all supported platforms.

Test-driven development is a tried and tested software development
practice. By employing TDD, software will have a comprehensive test
suite. Created tests are automatic.

Usability testing cannot be automated and thus falls outside the scope
of this thesis.

## <a id="sec6">6 Case Study: Sysdrone Oy</a>

This chapter describes software development process, typical software
project types and the requirements for validating and testing health
technology software.

### <a id="sec6.1">6.1 Software Development for Health Technology Industry</a>

Sysdrone Oy is a software development company located in Jyväskylä,
Finland and currently employs 14 people. Most of the staff are software
designers and software architects.

Sysdrone doesn’t have any internal product development: instead it
provides software development teams and project management for software
projects. Because of this, Sysdrone develops a lot of different kinds of
software for different kinds of environments. The company specializes in
health technology software. Most of the projects are developed with
Microsoft’s C\# language but due to different kinds of customer needs,
some projects have also been developed with languages such as C, Delphi
Object Pascal, Perl and PHP.

Some of these software projects have been web or other kinds of server
projects whereas in others the software has been installed on the
computers of Sysdrone’s client organizations or even directly on the
computers of the clients of Sysdrone’s client organizations.

Software testing is a pervasive requirement in software development at
Sysdrone. Requirements for the correct performance of the software
especially in the context of health technology and heavy industry
software require comprehensive and systematic testing. Especially the
software related to healthcare technology has some testing requirements
specified by either local or EU laws.

Even though Sysdrone doesn’t manufacture medical devices itself, both
the Council of the European Communities and Food and Drug Administration
of the United States of America include the related software as part of
the medical device [<a href="#fda_medical_device">32</a>][<a href="#eec_medical_device">21</a>].
Thus Sysdrone doesn’t manufacture any actual medical devices, it is
still required to comply with all the requirements defined for actual
medical devices.

There are many different standards which are used to evaluate medical
devices and software. ISO 13485 is one such standard and is used in the
European Union. ISO 13485 is based on ISO 9001 but places more emphasis
on meeting regulatory and customer requirements, risk management and
effective processes. Unfortunately just ISO 13485 certification is not
sufficient for the product to allowed for example in the United States
of America: FDA has its own Quality System Regulation. However, ISO
13485 certification aligns management system of an organization to
requirements of FDA’s QSR and other such regulatory requirements in
other countries. [<a href="#iso13485">104</a>]

ISO 13485 is meant to improve consistency. Consistency helps to minimize
errors. Well-documented processes, integrated quality controls and
automated quality management systems lead to consistency. According to
an article in Quality Magazine: "The standard is based on eight quality
management principles: customer focus, leadership, involvement of
people, process approach, system approach to management, continual
improvement, fact-based decision-making and mutually beneficial supplier
relationships." Failure to provide consistent functionality can lead to
massive financial and personal damages. One such example is from 2010
when Medtronic paid 268 million U.S. dollars to settle lawsuits and
claims related to their faulty defibrillation devices. The company
estimated that 13 people may have died due to these failures.
[<a href="#need_for_iso13485">105</a>]

### <a id="sec6.2">6.2 Current Testing Systems</a>

Software development process at Sysdrone "is based on Scrum development
process. Scrum is an iterative incremental process of software
development commonly used with agile software development. Sysdrone uses
slightly modified version of Scrum in order to fulfill the requirements
of Medical devices directive." [<a href="#sd_software_development_process">94</a>]

According to Sysdrone’s software development process documentation
software development has been divided into sprints. Sprint is an
development iteration of 2 weeks or sometimes up to a month. Each sprint
is started by having a meeting with a client and discussing which
backlog items are selected from the product backlog for the sprint
backlog. Product backlog is "a prioritized list of backlog items that
are user requirements or risk mitigation requirements or bug fixes."
Sprint backlog is "a list of backlog items to be completed during a
single sprint." [<a href="#sd_software_development_process">94</a>] Each backlog item
contains a description of what kind of new feature or change to an
existing feature should be done and what are the acceptance criteria for
the user story. These acceptance criteria are used as a starting point
for acceptance and validation testing plans which are written before the
development has been started.

Process is divided into three phases: initial analysis, iterative
development and release phase. Testing has been integrated into each of
these phases. Test plans are written based on the task descriptions
during the initial analysis. In the implementation phase, programming
tasks are implemented using test-driven development. If any of the newly
created tests or previously implemented tests fails, it is number one
priority to fix the tests. In the release phase acceptance tests are
performed manually and the test steps and test results are written to
test documents. [<a href="#sd_software_development_process">94</a>]

When a development for a user story is started, the development is split
into several tasks. Tasks should usually be the smallest possible
meaningful steps to further the development. One example of a task could
be adding an HTML form for adding a new patient to the system. When a
task is completed, it is handed over to another developer who reads the
program code or other similar result of the task and verifies that it is
developed correctly. Code is further reviewed usually once per sprint in
a more formal group code review session. According to Capers Jones, bug
detection efficiency of informal code reviews ranges from 20% to 35% and
efficiency of formal code inspections range from 45% to 70%
[<a href="#software_defect_removal_efficiency">51</a>].

All program code is developed by using test-driven development (as
described in section [tdd]). The resulting tests are also used in the
peer review phase to verify that the software works as expected in
another environment in addition to the development environment of the
developer of the particular task. These tests are automatically added to
the testing suite of the software.

Sysdrone uses continuous integration. According to Martin Fowler,
"Continuous Integration is a software development practice where members
of a team integrate their work frequently, usually each person
integrates at least daily - leading to multiple integrations per day.
Each integration is verified by an automated build (including test) to
detect integration errors as quickly as possible. Many teams find that
this approach leads to significantly reduced integration problems and
allows a team to develop cohesive software more rapidly."
[<a href="#continuous_integration">31</a>]

Automatic testing suite is divided into two testing processes:

First testing process is called instant build which is performed
instantly after the continuous integration system detects a new commit
to the version control system. Instant build only executes unit tests
which can be performed quickly. If instant build would take a lot of
time, developers couldn’t get feedback from the broken tests immediately
after committing new change to codebase. If a test fails, an email is
sent to the developer and build monitor displays red error message which
specifies the title and date of the breaking commit. Build monitors are
located near the developers at the office. Build monitors can also be
used by project managers or CEO to verify at a single glance that the
software works as expected. Some tests which are not part of the instant
build may also fail and developers won’t get feedback from these
immediately but it is a necessary compromise between smoothly flowing
programming effort and getting instant feedback from all tests.

Second testing process is called nightly build which is performed each
night. Nightly build executes all possible tests related to the project.
The same procedure is used in nightly build as in the instant build if a
test fails. Build monitor and error emails indicate if the problem is
with nightly or instant build tests.

Each step in the development cycle contains a *definition of done*.
Definition of done is a list of requirements which have to satisfied
before continuing to next step. One of the most important requirements
is planning and performing tests. Here is an example of how definitions
of done are specified for one of the projects at Sysdrone:

-   Analyze phase is done when developers have written acceptance and
    validation tests plans for a user story.

-   Develop phase is done when all implementation tasks are done and
    functionality can be demonstrated. Each programming task is
    developed with TDD and after the completion of a task, all unit
    tests are automatically performed. If an error is encountered, all
    development will be stopped until the error is analyzed and steps
    have been planned on how to solve the error.

-   Verify phase is done when all tests are implemented and integration
    tests pass in development server.

-   Deploy phase is done when all tests pass in a server which is as
    similar as possible to production server.

In addition to the unit tests created by developing with TDD, there are
two types of tests: integration tests and validation tests. Validation
tests are performed by the customer and are used to pass responsibility
from Sysdrone to the client. Validation and integration tests are
usually similar but whereas validation tests are quite simple and easy
to perform even manually, integration tests are much more comprehensive.

There are two differences in terminology used at Sysdrone when compared
to the more commonly used terminology:

-   Whereas integration tests in the more strict definition test
    integration between two or more components of the software,
    integration tests at Sysdrone contain all tests between but not
    including unit test and acceptance test levels.

-   Validation tests are similar to acceptance tests as detailed in this
    thesis but the chosen term *validation* tests was selected to
    emphasize the validation required in healthcare products.

### <a id="sec6.3">6.3 Supported Software Types</a>

Software developed at Sysdrone can be divided into three general
categories:

-   server software,

-   desktop software and

-   web-based software.

Server software is typically written in either C\# language with ASP.NET
framework or PHP language and executed on either Windows or Linux
servers. Server software may or may not also provide a web interface.

Desktop software is typically written in C\# language with .NET
framework but may also be written in other languages such as Delphi
Object Pascal and is mainly used on Windows operating system. .NET-based
languages may be run with Mono framework on operating systems ranging
from Android to Mac OS X and even on game consoles such as Nintendo Wii
and Sony PlayStation 3 [<a href="#mono">71</a>] but this cross-platform support
hasn’t been requested by current or previous customers.

Web-based software is typically written in C\# language with ASP.NET
framework or PHP. More recently client side of the software has been
developed using HTML5. These kinds of software is usually accessed with
a variety of different devices and operating systems ranging from
Windows desktops to Android and iOS mobile devices. Web-based software
may or may not interact with server software developed by Sysdrone.

### <a id="sec6.4">6.4 Requirement Specifications</a>

Requirement specifications for testing environment was composed based on
discussions with software developers and especially project manager
Ilkka Laitinen at Sysdrone.

Automatic portability testing system should be built using virtual
machines. Because automatic portability testing suites are typically
performed during nightly tests, having separate physical computers for
each testing environment would be detrimental due to increased hardware,
energy and physical space requirements. Sysdrone already uses
project-specific virtual machines in development workstations so the
company has previously acquired skills and knowledge related to building
a system composed of virtual machines. This would also enable individual
developers to install multiple different testing environments to their
own development workstations for possible manual testing.

The automatic portability testing system should provide an easy way to
choose desired testing environments for a specific project from a list
of all possible different testing environments.

Reports from different automatic portability testing environments should
preferably be provided as a single test report so developers or product
manager don’t have to access each of the selected testing environments
manually to read the test reports.

The amount of testing environments should be kept relatively small
because testing environments increase the amount of required computer
maintenance (such as installing system updates), the amount of required
server capabilities and in some cases the amount of licensing costs. In
practice the costs of multiple testing environments and the benefits of
higher defect-detection rate should be balanced. All newly added testing
environments may not contribute significantly to the defect-detection
rate and thus each testing environment should be carefully considered.

### <a id="sec6.5">6.5 Chapter Summary</a>

Sysdrone’s software development process is based on Scrum with slight
modifications to fulfill the requirements related to medical devices.
Testing is tightly integrated into the software development process.
Many of the tests are continuously and automatically performed in
addition to a smaller number of manual acceptance tests. Currently tests
are only performed on a single platform.

Software developed at Sysdrone can be roughly divided into three
categories: server software, desktop software and web-based software.
Testing environments for the software categories are describe in chapter
7.

## <a id="sec7">7 Automatic Portability Testing Environments</a>

This chapter includes plans for automatic portability testing
environments for different kinds of software projects typically
developed at Sysdrone.

### <a id="sec7.1">7.1 Common Aspects</a>

Even though portability testing increases the required testing effort by
introducing many different platforms, fortunately most of this increased
testing effort just requires more processing time from computers. If the
required behavior is the same on all platforms, an existing
comprehensive unit test suite for a single platform can be used when new
required platforms are added. However, some platforms may require or
utilize custom behavior which requires additional tests. An example of
this could be a web site which has both desktop and mobile versions
where the mobile version might not have all the features of the desktop
version.

Sysdrone uses TeamCity as a continuous integration server. TeamCity
supports feature called Build Grid. Build Grid consists of Build Agents
which are computers with installed agent software capable of running
builds. Build Agents can also run tests against the built software.
Build Agents can be installed on multiple platforms with different
pre-configured environments. Builds on multiple platforms can be
executed simultaneously to speed up the build and testing process. Each
build agent automatically checks out the most recent version from
version control system so the maintenance requires less manual effort.
[<a href="#teamcity">49</a>] Build Agents could be run on actual physical computers
but they can also be run in virtual machines which are abundantly
available at Sysdrone.

### <a id="sec7.2">7.2 Web-based Software Project</a>

This section focuses on the part of the software project which is
accessed by a web browser. Browser compatibility issues have been common
for a long time. Some of the issues were detailed in section
3.4. In summary, to support 80% of the
desktop users, developers would have to test the software with seven
different versions of three major browsers. On mobile devices, the
number of browsers to support 80% is five.

Sysdrone already employs Selenium as a system and acceptance testing
tool for web-based software projects. However the tests are only run on
a single platform. For existing projects, existing test suites can used
to verify the functionality on new platforms in addition to the current
testing platform.

Most of the major browsers such as Mozilla Firefox and Google Chrome are
available on all major platforms. However some browsers such as Apple
Safari are only available on certain platforms. In addition to this some
browsers implementations between different platforms. For example, Apple
Safari is available on Apple OS X and Microsoft Windows and the
implementations are mostly same but there are some minor differences
[<a href="#differences_between_win_and_mac_safari">90</a>]. Some of these platforms
can be installed on a virtual machine but some licensing issues may
prohibit this on at least Apple OS X. OS X can legally be installed only
on a Mac computer [<a href="#osx_only_on_mac_hardware">8</a>].

Selenium tests can also be executed on mobile platforms. Apple iOS and
Google Android devices support remote access to their mobile browser.
The browsers are controlled via RemoteWebDriver interface. This
interface also allows tests to retrieve screenshots of the tested
application. [<a href="#selenium_ios_android">87</a>] Currently support is only
available on Apple iOS and Google Android devices but the support is
reportedly coming to Microsoft Windows Phone 7 and Research In Motion
BlackBerry devices[<a href="#selenium_mobile_support">47</a>].

Screenshots can also be taken from the desktop browsers as well as
mobile browsers. Screenshots are especially helpful in error situations
but they can also be used to verify that not only the web application
works as expected, it also is displayed correctly. Manually comparing
screenshots can be labor-intensive in the long run so in the future it
might be viable to investigate if an automatic comparison tool can be
developed or integrated in to the automatic portability testing
environment. This comparison tool could automatically compare images and
trigger an alarm for example in a situation where the images of same
view are less than 95% similar.

Selenium testing would be most comprehensive if all the tests were run
on all combinations of available platforms and browsers. However due to
time and money constraints many software projects have a limited
selection of supported browsers. This should be accounted when building
the automatic portability testing environment so that time is not spent
on building support for platforms which are not required in any software
projects at Sysdrone.

Selenium testing can be used to verify functionality of the software on
acceptance and system testing levels. Testing all detailed functionality
of the software project at these levels is labor-intensive (see section
4.2). Unit and integration testing levels are also relevant
even on the client side (e.g. browser) of web-based software projects.

As JavaScript accounts for ever-increasing percentage of the codebase in
web-based projects, it too should be properly tested. There are many
unit testing frameworks for JavaScript. One of the popular unit testing
frameworks for JavaScript is Jasmine. Unit testing JavaScript is similar
to unit testing software written in other languages. Because JavaScript
support of the browsers differs between different browsers and their
versions, unit testing should be performed on all supported browsers. To
ensure that there is no regression in JavaScript code in the future
versions of the software, JavaScript unit tests should also be
integrated in the common build and testing processes. There are a
variety of options[<a href="#teamcity_nodejs">95</a>][<a href="#teamcity_jstestdriver">108</a>] of
how to integrate Jasmine tests to TeamCity.

Web-based software project usually also include server-side software.
That part is discussed in section 7.4.

### <a id="sec7.3">7.3 Desktop Software Project</a>

Desktop software developed at Sysdrone is typically executed on Windows
operating system. Because Sysdrone uses almost exclusively .NET desktop
software development tools without Mono multiplatform extensions, this
thesis will focus on the Windows portability issues.

The most apparent portability issue concerns different Windows versions.
Microsoft current support lifecycles cover XP (until April 2014
[<a href="#windows_xp_support_lifecycle">66</a>]), Vista (until April 2017
[<a href="#windows_vista_support_lifecycle">67</a>]) and 7 (until January 2020
[<a href="#windows_7_support_lifecycle">68</a>]). If the desktop software should
support Windows Server versions as well, supported versions range from
Windows Server 2003 to the latest one
[<a href="#windows_server_support_lifecycle">69</a>]. Due to customer requirements,
some obsolete Windows versions might have to be supported as well.
Further complexity arises from the availability of Service Pack updates.
Most software should perform correctly even after Service Pack update
but there are documented problems with at least some software and
Service Pack update combinations
[<a href="#windows_service_pack_incompatibility">70</a>]. The amount of versions and
Service Pack updates leads to a lot of different combinations. Each new
combination requires additional resources not only due to test suite
execution time but due to the maintenance of test environments.
Therefore it might not be ideal to perform all tests on all platforms
but instead negotiate with the client about a list of supported
versions. Unsupported versions can be periodically checked if customer
wants information about whether the software *can* be used on certain
platform even if that platform is not officially supported.

Some desktop software might be required for other desktop platforms.
Depending on the nature of the required platforms and chosen programming
languages and libraries, this might be relatively simple effort or
require a lot of additional resources. In the case of Sysdrone, most of
the software is developed on .NET platform. .NET software can be run on
other operating systems beside Windows by using Mono framework as
discussed in section 6.3. As the automatic test
suites for .NET software at Sysdrone are typically written in .NET
languages (and more specifically, with NUnit framework) as well, they
can be executed on all platforms supported by Mono [<a href="#mono_nunit">72</a>].
Different programming languages and libraries might need
platform-specific testing efforts but as currently there are no specific
platforms and programming languages which should be supported at
Sysdrone, discussing those platforms’ and programming languages’ needs
would overtly speculative and currently unnecessary.

So far, all desktop software projects at Sysdrone have been for x86
hardware architecture. Recently, both 32- and 64-bit hardware support
has become a requirement. So far, all the automatic tests have been run
on one hardware architecture 32-bit and 64-bit hardware architecture has
been tested manually and in a limited fashion. However, there haven’t
been any documented problems with this approach as .NET software can be
compiled as platform agnostic [<a href="#.net_platform_agnostic">89</a>]. If in the
future a more comprehensive testing is desired, automatic test suites
can be set up for execution on both 32- and 64-bit virtual or physical
machines without any added human effort. Of course, computer resource
needs will be increased.

### <a id="sec7.4">7.4 Server Software Project</a>

Server software at Sysdrone is typically written either for .NET
platform or in PHP. .NET framework and its portability and testability
were detailed in section 7.3. PHP is available
on a wide selection of operating systems [<a href="#php_platforms">82</a>]. Test
suites for PHP software are typically written also in PHP at Sysdrone so
all the test suites can be executed on all the platforms that the actual
software can be run. Selenium tests detailed in section
7.2 are used in most acceptance tests but for
example REST APIs can be tested simply with PHPUnit without using
Selenium.

As described in section 7.3, Windows operating
systems can be updated with service packs which may introduce
portability issues. These should be tested for with different service
pack versions. Server software developed at Sysdrone is also developed
for Linux servers. Linux is available in a wide array of different
distributions such as Red Hat or Ubuntu. Although same software is
typically available on different distributions, some of core software
can differ. These can be tested as well with different virtual machines
running on different distributions.

Some server software can also be developed for both Windows and Linux
operating systems. In case the software is portable, the test suites are
typically written portable as well. The same test suites can be then
tested on different virtual machines with different operating systems.
If there are some platform-specific test suites, it is possible to
specify these to particular virtual machines. Test results can be
combined as a one report to ease the verification process.

The possible issues with 32- and 64-bit implementations are similar to
the ones encountered with desktop software projects. For more details,
refer to section 7.3.

### <a id="sec7.5">7.5 Chapter Summary</a>

Performing automatic test suites on multiple platforms would not require
additional test planning or writing as the functionality is typically
the same on all supported platforms. Different platforms can be added to
TeamCity’s agent pool so all the required platforms can be tested
automatically.

Web-based software projects can and should be tested on unit,
integration, system and acceptance test levels. Tools such as Jasmine
can be used on unit and integration levels. Tools such as Selenium can
be used on system and acceptance test levels. Tests should be performed
on multiple browsers on different platforms to comprehensively verify
the functionality of the software.

Desktop software projects typically use .NET framework for both the
actual software and test suites. Thus the existing test suites can be
executed on all platforms where the software will be executed. Mono
framework can provide support for other platforms beside Windows.
Virtual machines can be used to verify the functionality on different
hardware architecture such as between 32- and 64-bit computers.

In a lot of cases the server software developed at Sysdrone are similar
to desktop software projects. However desktop software is not typically
developed for Linux operating systems whereas server software can run on
both Windows or Linux or just either one.

### <a id="sec8">8 Summary</a>

The most important question of this thesis was: "How can Sysdrone use
automatic testing to detect and mitigate portability issues in its
software development process?" At Sysdrone testing is very important
because of the extensive requirements due to laws and standards related
to medical devices. Testing is already performed extensively and is
automated to a high degree. This is a very good situation for
introducing portability testing.

There are a number of steps Sysdrone can do to enhance their testing
processes:

Use TeamCity to control a number of virtual machines with different
operating systems. These virtual machines have their own build agents
which build the software and perform automatic test suites. As done
already today, unit tests which are fast to execute can be run upon each
commit and longer acceptance tests can be run nightly. The virtual
machines can be used to perform both Windows and Linux test suites
developed with C\# and PHP languages used typically at Sysdrone.

One of the most usually encountered portability problems are differences
between various browser vendors and their software versions. Sysdrone
already uses Selenium to perform acceptance tests but these are
currently only performed with Mozilla Firefox browser. These same test
suites can performed on multiple different browsers with Selenium. These
browsers also include mobile browsers on mobile platforms such as iOS
and Android.

In addition to running existing Selenium acceptance tests with different
browsers, Sysdrone would also benefit from unit testing JavaScript code.
Acceptance tests are also important but testing various detailed
functionality with acceptance tests is overly complicated and much
slower. There are various JavaScript unit testing frameworks but one of
the most popular is Jasmine. Unit tests written with these frameworks
should also be executed on all supported platforms. Preferably they are
executed upon each commit as are other unit tests.

First supporting question was: "What is automatic testing, why is it
important and how it can be done?" Automatic testing is a well
researched subject and there weren’t any new discoveries made during the
writing of this thesis. Fortunately automation of tests is already well
understood at Sysdrone so there wasn’t need to argue in favor of
increasing the automation.

Second supporting question was: "What is portability, what kind of
problems are related to it and how can these issues be detected
automatically?" Portability is a complex concept. A lot of the books and
scientific articles related to portability were concerned about the
hardware portability. Hardware portability has become less of problem
recently as higher-level programming languages have become increasingly
popular and they help abstract out the hardware differences. Many
portability issues of today are of software nature. One of the most
frequently encountered is the issue of browser incompatibility.

At the beginning of writing this thesis I expected that there would be a
lot of research done into practical portability issues. Unfortunately
finding such research was surprisingly difficult. However during the
writing I found out that it isn’t required that these portability issues
are deeply understood in theory before they can be detected. Testing
portability issues proved to be easier than I expected because the
existing test suites can be simply executed on all supported platforms.
This is good news also because it doesn’t require that much of
additional resources. After the automatic portability testing
environments have been setup for the first time, they can be used in
many different projects without a lot of setup overhead.

Typically manual acceptance tests are executed on at least most of the
supported platforms. This however is insufficient because some
portability issues happen at a very low level and these can be hard or
at least labor-intensive to detect in acceptance tests. It is beneficial
to perform all the available tests on all supported platforms to detect
the problems at an early stage and fix them as quickly as possible.

In retrospective, the subject of this thesis was overly broad. If I were
to start the thesis again, I would constraint the subject to a more
limited area such as portability issues in web browsers. More limited
subject would have allowed me to delve deeper into the issues. However
even with this broad subject, writing the thesis was very educational.
Even though I already had some experience of automated tests, my
knowledge is now both broader and deeper.


## <a id="sec9">9 References</a>

[<a id="intro_to_software_testing">1</a>]
Ammann, P. \& Offutt, J., 2008. Introduction to software testing, p. 5, 215. New York, New York: Cambridge University Press.

[<a id="mac_cli_installer">2</a>]
Apple, Mac OS X Developer Library, installer(8) Mac OS X Manual Page, available at <a href="https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man8/installer.8.html">https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man8/installer.8.html</a>, 10.2.2012.

[<a id="apple_confirms_switch">3</a>]
AppleInsider, Apple confirms switch to Intel, available at <a href="http://www.appleinsider.com/articles/05/06/06/apple_confirms_switch_to_intel.html">http://www.appleinsider.com/articles/05/06/06/apple_confirms_switch_to_intel.html</a>, 16.12.2011

[<a id="apple_core_solo_duo">4</a>]
AppleInsider, Apple unveils Mac mini Core Duo, available at <a href="http://www.appleinsider.com/articles/06/02/28/apple_unveils_mac_mini_core_duo.html">http://www.appleinsider.com/articles/06/02/28/apple_unveils_mac_mini_core_duo.html</a>, 16.12.2011.

[<a id="apple_core_2_duo">5</a>]
AppleInsider, A closer look at Apple's Core 2 Duo MacBook Pro, available at <a href="http://www.appleinsider.com/articles/06/10/31/a_closer_look_at_apples_core_2_duo_macbook_pro.html">http://www.appleinsider.com/articles/06/10/31/a_closer_look_at_apples_core_2_duo_macbook_pro.html</a>, 16.12.2011.

[<a id="aptget_cli_installer">6</a>]
APT-RPM, apt-get(8) - Linux man page, available at <a href="http://linux.die.net/man/8/apt-get">http://linux.die.net/man/8/apt-get</a>, 10.2.2012.

[<a id="international_date_line">7</a>]
Ariel, A. \& Berger, N.A., 2006. Plotting the globe: stories of meridians, parallels, and the international, p. 142. Westport, Connecticut: Praeger Publishers.

[<a id="osx_only_on_mac_hardware">8</a>]
Ars Technica, Appeals court: Apple can continue to restrict OS X to Mac hardware, available at <a href="http://arstechnica.com/apple/2011/09/appeals-court-apple-can-continue-to-restrict-os-x-to-mac-hardware/">http://arstechnica.com/apple/2011/09/appeals-court-apple-can-continue-to-restrict-os-x-to-mac-hardware/</a>, 27.05.2012.

[<a id="vmware_installer_testing">9</a>]
Attivio, Inc., Attivio Technical Series: Automating Installation Testing, available at <a href="http://www.attivio.com/blog/56-java-development/223-technical-series-automating-installation-testing.html">http://www.attivio.com/blog/56-java-development/223-technical-series-automating-installation-testing.html</a>, 10.2.2012.

[<a id="f22_outstanding">10</a>]
Australian Strategic Policy Institute, Is The JSF good enough?, available at <a href="http://www.aspi.org.au/publications/publication_details.aspx?ContentID=56&pubtype=6">http://www.aspi.org.au/publications/publication_details.aspx?ContentID=56&pubtype=6</a>, 10.11.2011.

[<a id="bf3_sales_figures">11</a>]
Battlefield 3 Blog, Battlefield 3 Xbox 360 sales top PlayStation 3 and PC combined, available at <a href="http://bf3blog.com/2011/11/battlefield-3-xbox-360-sales-top-playstation-3-and-pc-combined">http://bf3blog.com/2011/11/battlefield-3-xbox-360-sales-top-playstation-3-and-pc-combined</a>, 5.1.2012.

[<a id="problem_solving_using_c">12</a>]
Binu, A., 2010. Problem Solving and Computer Programming Using C, p. 6-7. New Delhi, India: University Science Press.

[<a id="managing_the_test_process">13</a>]
Black, R., 2002. Managing the Test Process: Practical Tools for Managing Hardware and Software Testing, p. 7-8. Wiley Publishing. ISBN 0-471-22398-0

[<a id="blizzard_insider">14</a>]
Blizzard Insider, StarCraft II Beta Retrospective, available at <a href="http://us.battle.net/sc2/en/blog/39345">http://us.battle.net/sc2/en/blog/39345</a>, 9.12.2011.

[<a id="software_engineering_economics">15</a>]
Boehm, B.W., 1981. Software engineering economics, p. 37. Upper Saddle River, New Jersey: Prentice Hall.

[<a id="software_portability_brown">16</a>]
Brown, P.J., 2003. Encyclopedia of Computer Science, 4th Edition, p. 1633-1634, available at <a href="http://dl.acm.org/citation.cfm?id=1074100.1074809">http://dl.acm.org/citation.cfm?id=1074100.1074809</a>. Chichester, UK: John Wiley and Sons Ltd. ISBN: 0-470-86412-5

[<a id="rspec_book">17</a>]
Chelimsky, D., Astels, D., Dennis, Z., Hellesøy, A., Helmkamp, B. \& North, D., 2010. The RSpec Book: Behaviour-Driven Development with RSpec, Cucumber, and Friends, p. 153. The Pragmatic Programmers.

[<a id="mastering_software_quality_assurance">18</a>]
Chemuturi, M., 2010. Mastering Software Quality Assurance: Best Practices, Tools and Technique for Software, p. 273. J. Ross Publishing. ISBN-13: 978-1604270327

[<a id="f22_flight">19</a>]
CNN, This Week At War - Feb 24, 2007, available at <a href="http://transcripts.cnn.com/TRANSCRIPTS/0702/24/tww.01.html">http://transcripts.cnn.com/TRANSCRIPTS/0702/24/tww.01.html</a>, 10.11.2011.

[<a id="critical_code">20</a>]
Committee for Advancing Software-Intensive Systems Producibility, National Research Council, Critical Code - Software Producibility For Defense, p. 87-91. Washington, District of Columbia: The National Academies Press.

[<a id="eec_medical_device">21</a>]
Council of the European Communities, Council Directive 93/42/EEC of 14 June 1993 concerning medical devices, available at <a href="http://eur-lex.europa.eu/LexUriServ/LexUriServ.do?uri=CELEX:31993L0042:En:HTML">http://eur-lex.europa.eu/LexUriServ/LexUriServ.do?uri=CELEX:31993L0042:En:HTML</a>, 20.1.2012.

[<a id="systematic_testing_book">22</a>]
Craig, R.D. \& Jaskiel, S.P., 2002. Systematic software testing, p. 101. Norwood, Massachusetts: Artech House Publishers.

[<a id="programming_the_eniac">23</a>]
da Cruz, F., Columbia University Computing History: Programming the ENIAC, available at <a href="http://www.columbia.edu/cu/computinghistory/eniac.html">http://www.columbia.edu/cu/computinghistory/eniac.html</a>, 30.12.2011.

[<a id="dijkstra">24</a>]
Dijkstra, E.W., Notes on Structured Programming, available at <a href="http://www.cs.utexas.edu/users/EWD/ewd02xx/EWD249.PDF">http://www.cs.utexas.edu/users/EWD/ewd02xx/EWD249.PDF</a>, 10.11.2011.

[<a id="automated_software_testing">25</a>]
Dustin, E., Rashka, J. \& Paul, J., 1999. Automated Software Testing: Introduction, Management, and Performance, p. 40-41. Addison-Wesley Professional.

[<a id="recovery_testing_engel">26</a>]
Engel, A., 2010. Verification, Validation and Testing of Engineered Systems (Wiley Series in Systems Engineering and Management), Chapter 5.4.3. Wiley-Blackwell. ISBN-13: 978-0470527511

[<a id="rpm_cli_installer">27</a>]
Ewing, M., Johnson, J. \& Troan, E., rpm(8) - Linux man page, available at <a href="http://linux.die.net/man/8/rpm">http://linux.die.net/man/8/rpm</a>, 10.2.2012.

[<a id="the_humble_dialog_box">28</a>]
Feathers, M., The Humble Dialog Box, available at <a href="http://www.objectmentor.com/resources/articles/TheHumbleDialogBox.pdf">http://www.objectmentor.com/resources/articles/TheHumbleDialogBox.pdf</a>, 9.2.2012.

[<a id="mobile_html5">29</a>]
Firtman, M., Mobile HTML5 - compatibility tables for iPhone, Android, BlackBerry, Symbian, iPad and other mobile devices, available at <a href="http://mobilehtml5.org/">http://mobilehtml5.org/</a>, 16.12.2011.

[<a id="fitnesse">30</a>]
FitNesse, Two Minute Example, available at <a href="http://fitnesse.org/FitNesse.UserGuide.TwoMinuteExample">http://fitnesse.org/FitNesse.UserGuide.TwoMinuteExample</a>, 15.12.2011.

[<a id="continuous_integration">31</a>]
Fowler, M., Continuous Integration, available at <a href="http://martinfowler.com/articles/continuousIntegration.html">http://martinfowler.com/articles/continuousIntegration.html</a>, 20.6.2011.

[<a id="fda_medical_device">32</a>]
U.S. Food and Drug Administration, Is The Product A Medical Device?, available at <a href="http://www.fda.gov/MedicalDevices/DeviceRegulationandGuidance/Overview/ClassifyYourDevice/ucm051512.htm">http://www.fda.gov/MedicalDevices/DeviceRegulationandGuidance/Overview/ClassifyYourDevice/ucm051512.htm</a>, 20.1.2012.

[<a id="bsd_cli_installer">33</a>]
The FreeBSD Project, PKG\_ADD(1) FreeBSD General Commands Manual, available at <a href="http://www.freebsd.org/cgi/man.cgi?query=pkg_add&sektion=1">http://www.freebsd.org/cgi/man.cgi?query=pkg_add&sektion=1</a>, 10.2.2012.

[<a id="programming_languages">34</a>]
Gabbrielli, M. \& Martini, S., 2006. Programming Languages: Principles and Paradigms, p. 414, 417. Springer London Dordrech Heidelberg New York. ISBN: 978-1-84882-913-8.

[<a id="cpa_software_portability">35</a>]
Garen, K., Software Portability: Weighing Options, Making Choices, available at <a href="http://www.nysscpa.org/cpajournal/2007/1107/perspectives/p10.htm">http://www.nysscpa.org/cpajournal/2007/1107/perspectives/p10.htm</a>, 5.1.2012.

[<a id="al_gore">36</a>]
Gore, A. Presentation given at Nordic Business Forum in Jyväskylä, Finland, 30.9.2011.

[<a id="apple_bans_eucalyptus">37</a>]
Guardian, The, Apple backtracks on iPhone sex ban, available at <a href="http://www.guardian.co.uk/technology/blog/2009/may/24/iphone-ban-eucalyptus">http://www.guardian.co.uk/technology/blog/2009/may/24/iphone-ban-eucalyptus</a>, 16.6.2012.

[<a id="software_portability_evaluation">38</a>]
Hakuta, M. \& Ohminami, M., A Study of Software Portability Evaluation, available at <a href="http://www.mendeley.com/research/study-software-portability-evaluation/">http://www.mendeley.com/research/study-software-portability-evaluation/</a>, 30.12.2011.

[<a id="unit_test_frameworks">39</a>]
Hamill, P., 2004. Unit Test Frameworks, p. 51-52. O'Reilly Media. ISBN-13: 978-0596006891.

[<a id="automated_acceptance_testing_using_fit">40</a>]
Hanssen, G.K. \& Haugset, B., 2009. Automated Acceptance Testing Using Fit, FIND COMPLETE REFERENCE INFORMATION FROM IEEEXPLORE.

[<a id="automated_acceptance_testing">41</a>]
Haugset, B. \& Hanssen, G.K., 2008. Automated Acceptance Testing: A Literature Review and an Industrial Case Study, published in Agile '08 Conference on 4-8 Aug. 2008. Available at <a href="http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=4599450">http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=4599450</a>. ISBN: 978-0-7695-3321-6

[<a id="tdd_stdd_atdd">42</a>]
Hayes, J.H., Dekhtyar, A. \& Janzen, D.S., 2009. Towards Traceable Test-Driven Development, published in Traceability in Emerging Forms of Software Engineering ICSE Workshop on 18 May 2009. ISBN: 978-1-4244-3741-2

[<a id="functional_tests_selenium">43</a>]
Holmes, A. \& Kellogg, M., 2006. Automating Functional Tests Using Selenium. Published in Agile Conference, 2006. Print ISBN: 0-7695-2562-8. Available at <a href="http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=1667589">http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=1667589</a>, 9.2.2012.

[<a id="swebok_testing">44</a>]
IEEE Computer Society, Guide to the Software Engineering Body of Knowledge (SWEBOK), Chapter 5, available at <a href="http://www.computer.org/portal/web/swebok/html/ch5#Ref2">http://www.computer.org/portal/web/swebok/html/ch5#Ref2</a>, 10.11.2011.

[<a id="ieee_terminology">45</a>]
IEEE Computer Society, 1990. IEEE Standard Glossary of Software Engineering Terminology. E-ISBN: 0-7381-0391-8. Available at <a href="http://ieeexplore.ieee.org/servlet/opac?punumber=2238">http://ieeexplore.ieee.org/servlet/opac?punumber=2238</a>, 26.1.2012.

[<a id="gm_naa_io">46</a>]
Illing, G. \& Peitz, M., 2006. Industrial Organization and The Digital Economy, p. 42. Cambridge, Massachusetts: MIT Press. ISBN-13: 978-0-262-09041-4.

[<a id="selenium_mobile_support">47</a>]
InfoWorld, Selenium test suite to add mobile apps, available at <a href="http://www.infoworld.com/d/application-development/selenium-test-suite-add-mobile-apps-011">http://www.infoworld.com/d/application-development/selenium-test-suite-add-mobile-apps-011</a>, 20.5.2012.

[<a id="idc_mobile_surpasses_wireline">48</a>]
International Data Corporation, Press Release: More Mobile Internet Users Than Wireline Users in the U.S. by 2015 - Sep 12th, 2011, available at <a href="http://www.idc.com/getdoc.jsp?containerId=prUS23028711">http://www.idc.com/getdoc.jsp?containerId=prUS23028711</a>, 16.12.2011.

[<a id="teamcity">49</a>]
JetBrains, TeamCity - Features, available at <a href="http://www.jetbrains.com/teamcity/features/index.html#Build_Infrastructure">http://www.jetbrains.com/teamcity/features/index.html#Build_Infrastructure</a>, 18.5.2012.

[<a id="portability_of_c_programs">50</a>]
Johnson, S.C. \& Ritchie, D.M., Portability of C Programs and the UNIX System, available at <a href="http://cm.bell-labs.com/who/dmr/portpap.html">http://cm.bell-labs.com/who/dmr/portpap.html</a>, 5.1.2012.

[<a id="software_defect_removal_efficiency">51</a>]
Jones, C., 1996. Software defect-removal efficiency, p. 94. Published in Computer Volume 29 Issue 4 by IEEE Computer Society. ISSN: 0018-9162. Available at <a href="http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=488361">http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=488361</a>, 26.1.2012.

[<a id="jquery_mobile_test_lab">52</a>]
jQuery Mobile, jQuery Mobile 1.0.1 Released, available at <a href="http://jquerymobile.com/blog/2012/01/26/jquery-mobile-1-0-1-released/">http://jquerymobile.com/blog/2012/01/26/jquery-mobile-1-0-1-released/</a>, 16.6.2012.

[<a id="linux_kernel_loc">53</a>]
The Linux Foundation, Linux Kernel Development, available at <a href="http://www.linuxfoundation.org/docs/lf_linux_kernel_development_2010.pdf">http://www.linuxfoundation.org/docs/lf_linux_kernel_development_2010.pdf</a>, 3.11.2011.

[<a id="testing_computer_software">54</a>]
Kaner, C., Falk, J.L. \& Nguyen, H.Q., 1999. Testing Computer Software, Second Edition. New York, New York: John Wiley \& Sons, Inc. ISBN: 0471358460

[<a id="exploratory_testing_keynote">55</a>]
Kaner, C., Exploratory Testing - Keynote at QAI November 17, 2006, available at <a href="http://www.kaner.com/pdfs/ETatQAI.pdf">http://www.kaner.com/pdfs/ETatQAI.pdf</a>, 11.11.2011.

[<a id="f22_lockheed">56</a>]
Lockheed Martin, F-22 Raptor, available at <a href="http://www.lockheedmartin.com/products/f22/">http://www.lockheedmartin.com/products/f22/</a>, 10.11.2011.

[<a id="static_code_analysis">57</a>]
Louridas, P., 2006. Static Code Analysis, published in IEEE Software Volume 23 Issue 4. ISSN: 0740-7459. Available at <a href="http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=1657940">http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=1657940</a>, 27.1.2012.

[<a id="software_reliability">58</a>]
Lyu, M.R., 1996. Handbook of Software Reliability Engineering, chapters 1 \& 6. IEEE Computer Society Press \& McGraw Hill. ISBN: 0-07-039400-8. Also made freely available by the author at <a href="http://www.cse.cuhk.edu.hk/~lyu/book/reliability/">http://www.cse.cuhk.edu.hk/~lyu/book/reliability/</a>, 17.2.2012.

[<a id="windows_2003_loc">59</a>]
Maraia, V., 2005. The Build Master: Microsoft's Software Configuration Management Best Practices. Addison-Wesley Professional.

[<a id="tdd">60</a>]
Martin, R.C., 2007. Professionalism and Test-Driven Development, published in IEEE Software Volume 24 Issue 3. Available at <a href="http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=4163026">http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=4163026</a> ISSN: 0740-7459.

[<a id="immoral_manual_testing">61</a>]
Martin, R.C., 2007. TDD with Acceptance Tests and Unit Tests, available at <a href="http://blog.objectmentor.com/articles/2007/10/17/tdd-with-acceptance-tests-and-unit-tests">http://blog.objectmentor.com/articles/2007/10/17/tdd-with-acceptance-tests-and-unit-tests</a>, 3.6.2012.

[<a id="clean_code">62</a>]
Martin, R.C., 2009. Clean Code: A Handbook of Agile Software Craftsmanship, p. 121-122. Boston, Massachusetts: Pearson Education Inc.

[<a id="microsoft_ui_automation">63</a>]
McCaffrey, J., Automating UI Tests In WPF Applications, available at <a href="http://msdn.microsoft.com/en-us/magazine/dd483216.aspx">http://msdn.microsoft.com/en-us/magazine/dd483216.aspx</a>, 3.6.2012.

[<a id="user_interface_testing">64</a>]
Memon, A.M., Pollack, M.E. \& Soffa, M.L., 1999. Using a Goal-Driven Approach to Generate Test Cases for GUIs, available at <a href="http://www.cs.purdue.edu/homes/xyzhang/spring07/Papers/test-gui.pdf">http://www.cs.purdue.edu/homes/xyzhang/spring07/Papers/test-gui.pdf</a>, 9.12.2011.

[<a id="ms_cli_installer">65</a>]
Microsoft, Standard Installer Command-Line Options, available at <a href="http://msdn.microsoft.com/en-us/library/windows/desktop/aa372024(v=vs.85).aspx">http://msdn.microsoft.com/en-us/library/windows/desktop/aa372024(v=vs.85).aspx</a>, 10.2.1012.

[<a id="windows_xp_support_lifecycle">66</a>]
Microsoft, Microsoft Support Lifecycle, available at <a href="http://support.microsoft.com/lifecycle/?c2=1173">http://support.microsoft.com/lifecycle/?c2=1173</a>, 3.6.2012.

[<a id="windows_vista_support_lifecycle">67</a>]
Microsoft, Microsoft Support Lifecycle, available at <a href="http://support.microsoft.com/lifecycle/?c2=11732">http://support.microsoft.com/lifecycle/?c2=11732</a>, 3.6.2012.

[<a id="windows_7_support_lifecycle">68</a>]
Microsoft, Microsoft Support Lifecycle, available at <a href="http://support.microsoft.com/lifecycle/?c2=14019">http://support.microsoft.com/lifecycle/?c2=14019</a>, 3.6.2012.

[<a id="windows_server_support_lifecycle">69</a>]
Microsoft, Microsoft Support Lifecycle, available at <a href="http://support.microsoft.com/lifecycle/?c2=1163">http://support.microsoft.com/lifecycle/?c2=1163</a>, 3.6.2012.

[<a id="windows_service_pack_incompatibility">70</a>]
Microsoft, Some programs have compatibility issues with Service Pack 1 for Windows 7 and for Windows Server 2008 R2, available at <a href="http://support.microsoft.com/kb/2492938/">http://support.microsoft.com/kb/2492938/</a>, 3.6.2012.

[<a id="mono">71</a>]
Mono Project, Support Platforms, available at <a href="http://www.mono-project.com/Supported_Platforms">http://www.mono-project.com/Supported_Platforms</a>, 26.1.2012.

[<a id="mono_nunit">72</a>]
Mono Project, NUnit, available at <a href="http://www.mono-project.com/NUnit">http://www.mono-project.com/NUnit</a>, 10.6.2012.

[<a id="art_of_software_testing">73</a>]
Myers, G.J., 2004. The Art Of Software Testing, Second Edition. Hoboken, New Jersey: John Wiley \& Sons, Inc.

[<a id="mars_climate_orbiter">74</a>]
National Aeronautics and Space Administration, 1999. Mars Climate Orbiter Mishap Investigation Board Phase I Report, p. 6 \& 13, available at <a href="http://sunnyday.mit.edu/accidents/MCO_report.pdf">http://sunnyday.mit.edu/accidents/MCO_report.pdf</a>, 2.12.2011.

[<a id="assembly_example">75</a>]
National University of Singapore, Assembly Examples, available at <a href="http://staff.science.nus.edu.sg/~phywjs/CZ101/assembly-examples/programs.html">http://staff.science.nus.edu.sg/~phywjs/CZ101/assembly-examples/programs.html</a>, 5.1.2012.

[<a id="nunit_example">76</a>]
NUnit, NUnit Quick Start, available at <a href="http://www.nunit.org/index.php?p=quickStart&r=2.6">http://www.nunit.org/index.php?p=quickStart&r=2.6</a>, 23.2.2012.

[<a id="nunit_forms">77</a>]
NUnitForms, NUnitForms - windows.forms unit testing, available at <a href="http://nunitforms.sourceforge.net/">http://nunitforms.sourceforge.net/</a>, 3.6.2012.

[<a id="domain_specific_visual_languages">78</a>]
Oglesby, D., Schloegel, K., Bhatt, D. \& Engstrom, E., 2001. A Pattern-based Framework to Address Abstraction, Reuse, and Cross-domain Aspects in Domain Specific Visual Languages, available at <a href="http://w3.isis.vanderbilt.edu/OOPSLA2K1/Papers/Oglesby.pdf">http://w3.isis.vanderbilt.edu/OOPSLA2K1/Papers/Oglesby.pdf</a>, 23.12.2011.

[<a id="art_of_unit_testing">79</a>]
Osherove, R., 2009. The Art Of Unit Testing with Examples in .NET, p. 4. Greenwich, Connecticut: Manning Publications Co.

[<a id="how_we_test_software_at_microsoft">80</a>]
Page, A., Johnston, K. \& Rollison, B.J., 2008. How We Test Software at Microsoft. Microsoft Press. ISBN-13: 978-0735624252

[<a id="recovery_testing_perry">81</a>]
Perry, W.E., 2006. Effective Methods for Software Testing, Third Edition. Indianapolis, Indiana: Wiley Publishing, Inc. ISBN-13: 978-0-7645-9837-1

[<a id="php_platforms">82</a>]
PHP Group, The, PHP: platforms, available at <a href="https://wiki.php.net/platforms">https://wiki.php.net/platforms</a>, 11.6.2012.

[<a id="zamm">83</a>]
Pirsig, R.M., 1974. Zen and the Art of Motorcycle Maintenance, Chapter 20. New York City, New York: William Morrow and Company.

[<a id="apple_bans_page3">84</a>]
RegHardware, Apple bans Page 3 from iPhone app, available at <a href="http://www.reghardware.com/2009/05/05/the_sun_app_ban/">http://www.reghardware.com/2009/05/05/the_sun_app_ban/</a>, 16.6.2012.

[<a id="rspec">85</a>]
RSpec, RSpec.info: Home, available at <a href="http://rspec.info">http://rspec.info</a>, 15.12.2011.

[<a id="usability_testing">86</a>]
Rubin, J. \& Chisnell, D, 2008. Handbook of Usability Testing: How to Plan, Design and Conduct Effective Tests, 2nd Edition, p. 21. Indianapolis, Indiana: Wiley Publishing Inc.

[<a id="selenium_ios_android">87</a>]
Selenium, WebDriver support for Mobile browsers, available at <a href="http://code.google.com/p/selenium/wiki/WebDriverForMobileBrowsers">http://code.google.com/p/selenium/wiki/WebDriverForMobileBrowsers</a>, 20.5.2012.

[<a id="selenium">88</a>]
SeleniumHQ, Selenium - Web Browser Automation, available at <a href="http://seleniumhq.org/">http://seleniumhq.org/</a>, 15.12.2011.

[<a id=".net_platform_agnostic">89</a>]
Seth, G., Moving from 32-bit to 64-bit application development on .NET Framework, available at <a href="http://blogs.msdn.com/b/gauravseth/archive/2006/03/07/545104.aspx">http://blogs.msdn.com/b/gauravseth/archive/2006/03/07/545104.aspx</a>, 10.6.2012.

[<a id="differences_between_win_and_mac_safari">90</a>]
Stack Overflow, stopping key event bubbling in safari 4 windows, available at <a href="http://stackoverflow.com/questions/1678273/stopping-key-event-bubbling-in-safari-4-windows">http://stackoverflow.com/questions/1678273/stopping-key-event-bubbling-in-safari-4-windows</a>, 27.05.2012.

[<a id="statcounter_browser_shares">91</a>]
StatCounter, Top 5 Browsers on Nov 2011, available at <a href="http://gs.statcounter.com/#browser-ww-monthly-201111-201111-bar">http://gs.statcounter.com/#browser-ww-monthly-201111-201111-bar</a>, 16.12.2011.

[<a id="statcounter_mobile_os_shares">92</a>]
StatCounter, Top 8 Mobile OSs from Jan to Dec 2011, available at <a href="http://gs.statcounter.com/#mobile_os-ww-monthly-201101-201112">http://gs.statcounter.com/#mobile_os-ww-monthly-201101-201112</a>, 12.1.2012.

[<a id="from_eniac_to_univac">93</a>]
Stern, N. 1981. From ENIAC to UNIVAC: An Appraisal of the Eckert-Mauchly Computer. Bedford, Massachusetts: Digital Press.

[<a id="sd_software_development_process">94</a>]
Sysdrone Oy, Software Development Process description, an internal document, 5.12.2011.

[<a id="teamcity_nodejs">95</a>]
Tar Pit, The, Having Jasmine tests results in TeamCity via node.js (on windows) invoked from powershell, available at <a href="http://blog.goneopen.com/2011/09/having-jasmine-tests-results-in-teamcity-via-node-js-on-windows-invoked-from-powershell/">http://blog.goneopen.com/2011/09/having-jasmine-tests-results-in-teamcity-via-node-js-on-windows-invoked-from-powershell/</a>, 18.5.2012.

[<a id="early_electronic_computers">96</a>]
University of Manchester, Early Electronic Computers, available at <a href="http://www.computer50.org/mark1/contemporary.html">http://www.computer50.org/mark1/contemporary.html</a>, 5.1.2012.

[<a id="security_testing_and_assessment">97</a>]
U.S. Department of Commerce, National Institute of Standards \& Technology, 2008. Technical Guide to Information Security Testing and Assessment, available at <a href="http://csrc.nist.gov/publications/nistpubs/800-115/SP800-115.pdf">http://csrc.nist.gov/publications/nistpubs/800-115/SP800-115.pdf</a>, 2.12.2011.

[<a id="nist_economic_impact">98</a>]
U.S. Department of Commerce, National Institute of Standards \& Technology, 2002. Planning Report 02-3: The Economic Impacts of Inadequate Infrastructure for Software Testing, available at <a href="http://www.nist.gov/director/planning/upload/report02-3.pdf">http://www.nist.gov/director/planning/upload/report02-3.pdf</a>, 17.11.2011.

[<a id="usertesting.com">99</a>]
UserTesting.com, UserTesting.com - Low Cost Usability Testing, available at <a href="http://www.usertesting.com/">http://www.usertesting.com/</a>, 9.12.2011.

[<a id="systematic_software_testing">100</a>]
Sestoft, P. 2008. Systematic software testing, Version 2, available at <a href="http://www.itu.dk/~sestoft/papers/softwaretesting.pdf">http://www.itu.dk/~sestoft/papers/softwaretesting.pdf</a>, 17.11.2011.

[<a id="f22_cost">101</a>]
United States Air Force, FY 2011 Budget Estimates, p. 15, available at <a href="http://www.saffm.hq.af.mil/shared/media/document/AFD-100128-072.pdf">http://www.saffm.hq.af.mil/shared/media/document/AFD-100128-072.pdf</a>, 10.11.2011.

[<a id="toward_credible_testing_certification">102</a>]
Wakid, S.A., Kuhn, D.R. \& Wallace, D.R., 2002. Toward Credible IT Testing and Certification, published in IEEE Software Volume 16 Issue 4. ISSN: 0740-7459. Available at <a href="http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=776947">http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=776947</a>, 3.2.2012.

[<a id="why_is_testing_hard">103</a>]
Whittaker, J.A., 2000. What Is Software Testing? And Why Is It So Hard?, published in IEEE Software Volume 17 Issue 1. ISSN: 0740-7459. Available at <a href="http://ieeexplore.ieee.org/search/srchabstract.jsp?tp=&arnumber=819971">http://ieeexplore.ieee.org/search/srchabstract.jsp?tp=&arnumber=819971</a>, 27.1.2012.

[<a id="iso13485">104</a>]
Wichelecki, S., Understanding ISO 13485, published in Quality Magazine on January 2, 2008. Available at <a href="http://www.qualitymag.com/Articles/Feature_Article/BNP_GUID_9-5-2006_A_10000000000000225133">http://www.qualitymag.com/Articles/Feature_Article/BNP_GUID_9-5-2006_A_10000000000000225133</a>, 26.1.2012.

[<a id="need_for_iso13485">105</a>]
Willett, N., 2011. Quality Management: The Need for ISO 13485, published in Quality Magazine on January 1, 2011. Available at <a href="http://www.qualitymag.com/Articles/Feature_Article/BNP_GUID_9-5-2006_A_10000000000000964284">http://www.qualitymag.com/Articles/Feature_Article/BNP_GUID_9-5-2006_A_10000000000000964284</a>, 18.6.2012.

[<a id="tdd_defect_reduction">106</a>]
Williams, L., Maximilien E.M. \& Vouk, M., 2003. Test-driven Development as a Defect-Reduction Practice, published in Software Reliability Engineering International Symposium on 17-20 November 2003. ISBN: 0-7695-2007-3

[<a id="microsoft_automated_unit_tests">107</a>]
Williams, L., Kudrjavets, G. \& Nagappan, N., 2009. On the Effectiveness of Unit Test Automation at Microsoft, published in 20th International Symposium on Software Reliability Engineering on 16-19 November 2009. ISSN: 1071-9458, E-ISBN: 978-0-7695-3878-5, Print ISBN: 978-1-4244-5375-7. Available at <a href="http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=5362086">http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=5362086</a>, 23.2.2012.

[<a id="teamcity_jstestdriver">108</a>]
You Can't Write Perfect Software, Running Jasmine Tests in a Continuous Integration Build (with TeamCity), available at <a href="http://benshepheard.blogspot.com/2011/05/running-jasmine-tests-in-continuous.html">http://benshepheard.blogspot.com/2011/05/running-jasmine-tests-in-continuous.html</a>, 18.5.2012.
