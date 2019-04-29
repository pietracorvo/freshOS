# Fresh OS

This bash scipt is used to auto configure **UBUNTU 18.04 LTS** after a fresh install. The configuration includes:

- activation of third party repos
- addition of external PPAs
- installation of my favourised packages
- configurate debfoster (to keep a clean OS)
- tweak ubuntu (kill annyoing beeps, format prompt, etc.)
- configure firefox (build custom profile, change settings, import bookmarks, add plug-ins)
- registration with perosnal accounts (eg. github)

To build a fresh OS, just execute the main script **fresh.OS** from its location with the bash. 
It starts minor scipts in the folders (e.g. **configFirefox**, **installPackages**, etc.) which handle all the work. Personal data (my favourised configurations, the package names to be installed, my firefox bookmarks, etc.) is also placed in these folders together with the scipts which process them. The single subscripts are build in a modular style and can also be executed seperately.

Also some logging functionality is implemented which prints some crucial information about the running processes and their status to the terminal. Pipe it to a file to log the script efficiently.

Note that the tasks I do after a fresh ubunut install are a pure matter of taste and have no claim of universality or correctness. (Don't blame me, if this script kills your system!)
