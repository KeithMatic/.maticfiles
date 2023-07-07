#!/usr/bin/env zsh

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install zsh
brew install fish
brew install bash-completion2

# Switch to using brew-installed bash as default shell

# if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#   echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#   chsh -s "${BREW_PREFIX}/bin/bash";
# fi;
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2



# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Install formulae        
brew install lazygit         
brew install libxdmcp        
brew install msgpack         
brew install six            
brew install fmt             
brew install libgit2         
brew install libxext         
brew install ncurses         
brew install sqlite
brew install bat             
brew install fnm             
brew install libice          
brew install libxmu          
brew install neovim          
brew install stow
brew install bdw-gc          
brew install fzf             
brew install libidn2         
brew install libxt           
brew install neovim-remote   
brew install tldr
brew install brotli          
brew install gcc             
brew install libmpc          
brew install libzip          
brew install oh-my-posh      
brew install trash-cli
brew install c-ares          
brew install gettext         
brew install libnghttp2      
brew install llvm@15         
brew install oniguruma       
brew install ca-certificates 
brew install gh              
brew install libsm           
brew install lolcat          
brew install openssl@1.1     
brew install tree-sitter
brew install ccls            
brew install libssh2         
brew install lsd             
brew install openssl@3       
brew install unibilium
brew install clipboard       
brew install glow            
brew install libtermkey      
brew install lua             
brew install pcre2           
brew install wget
brew install cmake           
brew install libtool         
brew install luajit          
brew install pkg-config      
brew install xclip
brew install coreutils       
brew install go              
brew install libunistring    
brew install luarocks        
brew install pnpm            
brew install xorgproto
brew install deno      
brew install libuv           
brew install luv             
brew install pygments        
brew install xz
brew install docutils               
brew install libvterm        
brew install lz4             
# brew install python@3.11     
brew install zoxide
brew install exa             
brew install icu4c           
brew install libx11          
brew install m4              
brew install readline        
brew install zstd
brew install exercism        
brew install isl             
brew install libxau          
brew install mpdecimal       
brew install rich-cli
brew install figlet          
brew install jq              
brew install libxcb          
brew install mpfr            
brew install rustup-init
brew install autojump    

# Install casks
brew install --cask alt-tab
brew install --cask miniconda                                 
brew install --cask font-victor-mono-nerd-font                             
brew install --cask maccy
brew install --cask fig                                     
brew install --cask mos
brew install --cask font-caskaydia-cove-nerd-font           
brew install --cask mpv
brew install --cask font-fantasque-sans-mono-nerd-font      
brew install --cask open-in-code
brew install --cask font-fira-code-nerd-font                
brew install --cask openinterminal
brew install --cask font-hasklug-nerd-font                  
brew install --cask tabby
brew install --cask font-hurmit-nerd-font                   
brew install --cask ueli
brew install --cask font-inconsolata-nerd-font              
brew install --cask visual-studio-code
brew install --cask font-iosevka-nerd-font                  
brew install --cask vscodium
brew install --cask font-jetbrains-mono-nerd-font           
brew install --cask wezterm-nightly
brew install --cask font-meslo-lg-nerd-font                 
brew install --cask yattee
brew install --cask font-ubuntu-nerd-font

# Remove outdated versions from the cellar.
brew cleanup
