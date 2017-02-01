# The Bash Scripts i need to live

## The file functions
The `functions` file is supposed to be sourced from `.profile` or `.bashrc`

### Now clobbers rm!
The script now creates a function called rm that overrides bashs built-in function. This rm takes a BTRFS snapshot of the current mount-point if possible when ever you run rm -r something.

### The aliases rg and rank
- rg Recursively Grep, just grep -R, because i use it all the time
- rank answers the question "what is the most common line in this stream" ie `dmesg |cut -c 16- |rank`

## timestamp Just how long has this execution been stuck?
Prefix date and time to every line of output.
`slowrunningprogram | timestamp`

## the weird cd-functions
These are slightly dangerous functions for creating directories and lugging foles around
### mkcd 
When you want to create a dir and then go to it

### cpcd and mvcd
Creates a directory named after the first argument, then moves or copies all files specified in the following arguments to it, usefull when you have accidentally exploded a tar-file in the wrong spot

    tar -vxf projectwithoutroot.tar #Ooooh crap!
    mkdir project
    mvcd project project*.txt

### mkmvcd mkcpcd
what these do should be evident from the previous commands


## ifind the universal insensitive finder
It finds things like i expect it to work.
ifind foo  searches for *foo* in the current directory (and decendants) 
ifind .. foo searches for *foo* in one directory above the current

## mk: Make in parent folders
mk tries to make things upwards

cd to parent directory untill it finds a Make file, then it runs make with the argument sent to mk.

ie `mk build-all` will `cd ..` untill it finds a file called Makefile (or untill it hits the root-directory), then it will then run `make build-all`.

## ss the Do-The-Right-Thing-With-Any-File-Or-Directory-Command
(yes it clobbers Socket Statistics, no i never use Socket Statistics command)

called ss, because it is on the home row and allso s is the first letter of my first name, narcisistic, like a baws.
ss lists content of a directory opens a text-file in less, runs file-magic and stat on non-text-files and what ever else I might have crammed in there.

## watchforchange The coninious abomination tool
Uses the shell bindings for inotify, inotify-tools  to execute a command when ever a file in the curent directory changes
My typical use of it is to run an editor in one terminal and then `watchforchange "python3 -m unittest discover"` in another window

