## Current dotfiles (and special requirements)

* Git - dotfiles/gitconfig  
* Vim - dotfiles/vimrc (Vim 7.3+ with ruby support for Command-T Vim plugin)

## Installation

1. Get dotfiles:

    ```
    git clone git://github.com/tourist/dotfiles.git
    ```

2. Make symbolic links:
       
    ```bash
    ln -s ~/dotfiles/gitconfig ~/.gitconfig  
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ```

3. Check Vim version and features:
   * version and ruby support with *vim --version* or *:version* inside Vim

4. If necessary compile and install Vim 7.3+ version with ruby support:
   * handy list of available [vim compile flags]
   * e.g. for Webfaction account I've used (worked also on my Mac OS X 10.6.8):

    ```bash
    hg clone https://vim.googlecode.com/hg/ ~/vim/
    cd ~/vim/
    ./configure --with-features=big --enable-cscope --enable-rubyinterp --enable-pythoninterp --prefix=$HOME
    make install
    ```
    
    after installation in your home dir you can add alias to new Vim inside ~/.bash_profile
    
    ```
    alias vi=~/bin/vim
    alias vim=~/bin/vim
    ```

5. Install [Vundle] for Vim.

6. Call *:BundleInstall* inside Vim to install all plugins and see what's missing.

7. "rake make" inside Command-T plugin:

    ```bash
    cd ~/.vim/bundle/command-t
    rake make
    ```

## TODO

* Installation script (?)
* Vim plugins list

[Vundle]:https://github.com/gmarik/vundle
[vim compile flags]:http://drchip.0sites.net/astronaut/vim/vimfeat.html