4kgeneral (version 2)
=====================

Turn-based strategy game made originally for the 2012 Java 4k competition.

http://java4k.com/index.php?action=games&method=view&gid=400

Note: The entire campaign has changed since the Java 4k version. To
play the original campaign you need to compile the version from the
branch called version_1.

Instructions
============

Click friendly (blue) unit to select, then click a hex to attack or
move to.  Repeat for as many units as you want to move or attack with.
Proceed to the next turn by clicking the button in the upper right
corner.

A unit that has already been attacked in the current turn is easier
to attack (no risk for your unit, greater chance of eliminating it).

Artillery can attack enemy units up to 3 hexes away. Other units can
only attack adjacent hexes.

Enemy units far away are not seen.

Engineers can move into river hexes to let other units cross (the only
way to cross rivers). They are also better than other units at
attacking cities.

You win by occupying all cities on the map. This means you need to
leave a unit behind to guard each city you take, it is not enough
to simply pass through them to win, you must have a unit there.

After 15 turns a scenario ends in failure and is restarted.

Complete all 12 scenarios to win the campaign.


Development
===========

Git tag *java4k* points at a version of the code that is virtually
identical to the version committed to the competition.

The *master* branch will be only for commits (if any) that keep the
final jar size below the original limit of 4096 bytes. Other branches
might be created to work on expanded versions ignoring the size limit.

You need a *env.yourhostname* and *make.yourhostname* to use the
Makefile and shell scripts. You can use at the included example.make
and example.env as templates (notice the backwards names). You will
also need a recent version of python pre-3.0 (eg version 2.7).

Yes, I know that using the C pre-processor (cpp) with java is not the
way you normally do it. It was an easy way to inject the image bitmap
data into the java file, and since I was using it anyway I started
using it to do conditional compilation of debug code etc as well.

debug.sh compiles and launches the game as a Java application (not applet)
with debugging enabled and also some extra shortcut keys helpful
for debugging and scenario construction, eg:

ENTER - win level and start next in campaign
m - next random map (and restart level)
M - previous random map (and restart level)
f - next random friendly units setup (and restart level)
F - previous random friendly units setup (and restart level)
e - next random enemy units setup (and restart level)
E - previous random enemy units setup (and restart level)
ESC - quit

Scenario Design
---------------
The random map, friendly, and enemy setup values output when
a level begins (that you can change with the special debug
keys m, M, f, F, e, E) can be inserted in the campaign variable
in G.cppjava. The 4th level (level == 3 in the source code, of
course) is hardcoded to add some friendly units also on the right side
of the map. Other than that any scenario setup can be used in any
position in the campaign. To have a campaign longer than 12 scenarios,
increase the LAST_CAMPAIGN_SCENARIO constant.

C/SDL Desktop Port
==================
Using even more preprocessor-hacks the code also can be compiled with
a C compiler and SDL 2.0. Running *make general4c* should make the
desktop version if you have *cmake* and *SDL2* and *python2* installed.

Currently the C port use the random function from stdlib rather than
trying to mimic the java.util.Random algorithm, so the scenarios
are different.

JavaScript Port
===============
A few lines of perprocessor-hacks allow the code in G.cppjava to also
run in a web browser, rendering the game as a HTML Canvas. To build
this version run *make html/general4.js*. Open *html/general4js.html*
to play. As above you will need python2 to build this version.

TODO
====
- Support running general4c from directory not including font.bmp.

License
=======
(C) Copyright 2012, 2013, 2014 Pelle Nilsson

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met: 

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer. 
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

FONT
====
The bitmap font in font.bmp used in the C port is made by gnsh and
available here under the Creative Commons Zero license:
http://opengameart.org/content/bitmap-font-0