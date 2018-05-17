# Cygwin64 related branch
The reason I created this repository that I got really tired of making all my
home directories on different linux distributions.

This branch contains the cygwin64 related general files. To check my personal
one checkout cygwin64_mine branch.

## Getting started
If you have already made the git setup written in master branch.
There are some things it's good for you to add in cygwin.

### git commit, vim Warning
To avoid vim terminal Warning-s at git commits.
Issue:
```
git commit
Vim warning: output is not to a terminal
Vim warning: input is not from a terminal
```
Use the cygwin bash.exe instead of the mintty.exe:
1. Right click on the shortcut of czgwin, change it from
<code>C:\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico</code> - to
<code>C:\cygwin64\bin\bash.exe --login -i</code>
2. Add the correct vim path to git config:
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
