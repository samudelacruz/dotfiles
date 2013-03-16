## Instruction for installation

**NOTE**: If you have existing files in `$HOME/.vim` or `$HOME/.vimrc`, make sure you take appropriate backups before performing any of the following steps.

**NOTE**: Be sure your vim is compiled with python support

```sh
$ vim --version | grep python
```
if python has a + then its ok, if not install it from brew our use [macvim](https://code.google.com/p/macvim/)
```sh
$ brew install vim
```

You will need [pylint](http://www.logilab.org/857) or [pyflakes](https://pypi.python.org/pypi/pyflakes)for install you can do this

```sh
$ pip install pylint
$ pip install pyflakes
```
or
```sh
$ easy_install pylint
$ easy_install pyflakes
```
 - Install Vundle, as per their [instructions](https://github.com/gmarik/vundle) :

```sh
$ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

 - Next, get my dotfiles & use install.sh

```sh
$ git clone git://github.com/samudelacruz/dotfiles.git
$ dotfiles/install.sh
```
##Usage

after install [Vundle](https://github.com/gmarik/vundle) open .vimrc file

```sh
$ mvim .vimrc
or
$ vim .vimrc
```
and execute this command
```sh
:BundleInstall
```

This will install all the vundle compatible repositories

you need compatible fonts with powerline, for unix I use Inconsolota you can found it here among others [powerline-fonts](https://github.com/Lokaltog/powerline-fonts) repository, for Windows I use [consolas-powerline-vim](https://github.com/eugeneching/consolas-powerline-vim) the font configuration is at .vim/bundle/vim-misc/vimrc.vim, it automaticly selects between Inconsolata and consolas looking if the system is unix or windows

Extra thanks to [Mitchell Hashimoto](https://github.com/mitchellh) and [Paul Irish](https://github.com/paulirish) for the ideas
