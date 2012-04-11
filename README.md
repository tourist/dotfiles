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
   * for ubuntu installing ```vim-nox``` should be sufficient
   * handy list of available [vim compile flags]
   * e.g. for Webfaction account I've used (worked also on my Mac OS X 10.6.8):

    ```bash
    hg clone https://vim.googlecode.com/hg/ ~/vim/
    cd ~/vim/
    ./configure --with-features=big --enable-cscope --enable-rubyinterp --enable-pythoninterp --prefix=$HOME --with-python-config-dir=/usr/local/lib/python2.7/config
    make install
    ```
    
    If you got problems with plugins written in python you might have wrong version of Python compiled into Vim (I had some problems with rope because Vim compiled with Python2.4 and Rope gave SyntaxErrors).
    
    Check Python version in Vim:
    ```
    vim --version | tr '-' '\n' | grep python
    ```
    
    Compile with proper version on your system (this may vary heavy depending on OS)
    
    Some tips about this:  
    http://www.tumblr.com/tagged/python-support  
    http://tartley.com/?p=1355
    
    For Webfaction multiple Python version I wanted to use newest 2.x version which was 2.7. I've used:
    ```
    ./configure --with-features=big --enable-cscope --enable-rubyinterp --enable-pythoninterp --prefix=$HOME vi_cv_path_python=/usr/local/bin/python2.7
    ```
    Same as before but with vi_cv_path_python defined
    
    after installation in your home dir you can add alias to new Vim inside ~/.bash_profile
    
    ```
    alias vi=~/bin/vim
    alias vim=~/bin/vim
    ```
    
    or change PATH setting to look for vim in home dir first e.g.
    
    ```
    export PATH=$HOME/bin:$PATH
    ```

5. Install [Vundle] for Vim.

6. Call *:BundleInstall* inside Vim to install all plugins and see what's missing.

7. "rake make" inside Command-T plugin:

    ```bash
    cd ~/.vim/bundle/command-t
    rake make
    ```

8. For flake8 support:

    ```
    pip install flake8
    ```

## TODO

* Installation script (?)
* Vim plugins list

[Vundle]:https://github.com/gmarik/vundle
[vim compile flags]:http://drchip.0sites.net/astronaut/vim/vimfeat.html