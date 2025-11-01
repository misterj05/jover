There are a few shadps4 ebuilds out there in the wild, I just felt they were
messy (no offense) or too complicated. So I tried to keep this one as simple
and as easy to read as possible.

If a dependency is available in ::gentoo, it is grabbed from there, otherwise
this ebuild uses the bundled shadps4 dependencies.

There might be issues surrounding this so I need people to test, shadps4 has
a lot of forks of these dependencies, some of which this ebuild does not use
currently, I'm unsure if this breaks the program but from what I've tested
so far, it seems fine.
