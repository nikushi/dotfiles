dotfiles
===
## before install
install Vundle https://github.com/gmarik/vundle

mkdir autoload directory for vim

    mkdir -p ~/.vim/autoload

## How to install

Install homesick and register me

    gem install homesick
    homesick clone git@path.to.github.prj/dotfiles.git

Next, you can now link its contents into your home dir:

    homesick symlink dotfiles

## How to register new dotfiles on your mac into github's repository

You can resiter new dotfiles or you've updated the exsiting files. Just do as follow:

First, add newfiles to your git repository and push these.

    cp ~/.newfile ~/prj/dotfiles/; cd ~/prj/dotfiles/
    git add .newfile
    git commit -m Add
    git push origin master

Next, run `homesick pull dotfiles` to sync to your Mac.

    homesick pull dotfiles

