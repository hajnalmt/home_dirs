# Cygwin64 related branch
The reason I created this repository that I got really tired of making all my
home directories on different linux distributions.

This branch contains the cygwin64 related general files. To check my personal
one checkout cygwin64_mine branch.

## Getting started
If you have already made the git setup written in master branch.
There are some things it's good for you to add in cygwin.

#### My used packages
Git, GVim, Expect, Rsync, Tmux, Tcl, Vim

#### Good to know
###### git commit, vim Warning
If you do not install Git and you are using the default Windows one, then
you will get some terminal warnigns with commiting. 
Issue:
```
git commit
Vim warning: output is not to a terminal
Vim warning: input is not from a terminal
```
To avoid it add the correct vim path to git config:
<code>git config --global core.editor "C:/cygwin64/bin/vim.exe"</code>

Note that don't use <code>cygdrive</code> in the path as <code>.gitconfig</code> can't recognize it. And if you are using 32-bit vim, then the path should be <code>C:/cygwin/bin/</code>

## Authors
* **Mate Hajnal** - *Initial work* - [hajnalmt](https://github.com/hajnalmt)

See also the list of
[contributors](https://github.com/hajnalmt/home_dirs/graphs/contributors)
who participated in this project.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details.
