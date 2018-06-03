# Version Control your Home Directories
The reason I created this repository that I got really tired of making all my
home directories on different linux distributions.

The master branch contains only the things which I use on every distribution.
Each Other branches contain the things which I use on that distro.
This way I just need to checkout that branch if I get a plain new machine. 

## Getting started
When you get a new plain home directory somewhere just clone this repository
out and move everything to your home directory's root folder.

As of the fact, that it's a plain directory you even don't have your ssh keys
 generated.
I will use id_rsa now.

To Generate one:
```
ssh-keygen -t rsa -b 4096 -N '' -C "your_email@host.domain" -f ~/.ssh/id_rsa
```

If you have an ssh key somewhere, just copy it to the right place, rewriting
the id_rsa and id_rsa.pub files.


Do not forget to add the right permissions to the folders.

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
```

After your id_rsa.pub file has been added to your github account, then you
are able to clone the repo out.

I suggest cloning out the repo into a new directory and then moving
everything to your home directory's root folder.

```
cd ~/
git clone git@github.com:your_username/home_dirs.git ./
mv $(ls -A home_dirs/) .
rm -rf home_dirs/
```

That's all now you can checkout the branch of the distros you want,
setup your distro on a new branch, or modify earliers!
Have Fun!

## Nice to know
I use vim as my default editor, so on the machine there should be vim and
ssh installed. 
The repo contains a .vimrc, to have a something to edit the commit files.

Also I like to config my global git settings immediately.
```
git config --global user.name "Your Name"
git config --global user.email your_email@host.domain
git config --global core.editor vim
git config --global core.autocrlf false
```

It can happen that you have cloned your repository via HTTPS, I recommend
using SSH instead.
You can check the connection with the command:
```
ssh -vT git@github.com
```

And if maybe you have used HTTPS switch to SSH with:
```
git remote remove origin
git remote add origin git@github.com:hajnalmt/home_dirs.git
git branch --set-upstream-to origin/master
```
Good Luck!

## Authors
* **Mate Hajnal** - *Initial work* - [hajnalmt](https://github.com/hajnalmt)

See also the list of
[contributors](https://github.com/hajnalmt/home_dirs/graphs/contributors)
who participated in this project.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details.
