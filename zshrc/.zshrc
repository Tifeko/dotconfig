# Set the REPOS variable to the path where your Git repositories will be stored
REPOS=~/.repos

# Create the repository directory if it doesn't exist
mkdir -p $REPOS

# Install Znap, a Zsh plugin manager
if ! [[ -r $REPOS/znap ]]; then
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $REPOS/znap
fi
source $REPOS/znap/znap.zsh

# Install zsh-autocomplete, a Zsh plugin for auto-completion
if ! [[ -r $REPOS/marlonrichert/zsh-autocomplete ]]; then
  znap install marlonrichert/zsh-autocomplete
fi
source $REPOS/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Check if Starship is installed, and install it if not
if ! [[ -r /usr/local/bin/starship ]]; then
  curl -sS https://starship.rs/install.sh | sh
fi

# Initialize Starship, a shell prompt theme
eval "$(starship init zsh)"


# Check if Zoxide is installed, and install it if not
if ! [[ -r ~/.local/bin/zoxide ]]; then
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# Set the PATH variable to include the .local/bin and bin directories
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

eval "$(zoxide init --cmd cd zsh)"

# Define some aliases
if [[ -r /bin/eza ]] then
  alias ls="eza"
  if ! [[ -r $REPOS/eza ]] then
    git clone https://github.com/eza-community/eza.git $REPOS/eza
  fi
  export FPATH="$REPOS/eza/completions/zsh:$FPATH"
elif [[ -r $HOME/.local/bin/eza ]] then
  alias ls="eza"
  if ! [[ -r $REPOS/eza ]] then
    git clone https://github.com/eza-community/eza.git $REPOS/eza
  fi
  export export FPATH="$REPOS/eza/completions/zsh:$FPATH"
else 
  curl https://raw.githubusercontent.com/Tifeko/install_scripts/main/eza.sh -o eza.sh
  chmod +x eza.sh
  ./eza.sh
fi

alias ll="ls -al"
if [[ -r /bin/trash ]] then
  alias rm="trash"
elif [[ -r ~/.local/bin/trash ]] then
  alias rm="trash"
else
  cd /tmp
  curl https://raw.githubusercontent.com/Tifeko/install_scripts/main/trash-cli.sh -o trash-cli.sh
  chmod +x trash-cli.sh
  ./trash-cli.sh
  cd $HOME
fi
alias cls=clear
alias ff="find . | grep"
if [[ -r /bin/xsel ]] then
  alias pbcopy='xsel --input --clipboard'
  alias pbpaste='xsel --output --clipboard'
elif [[ -r ~/.local/bin/xsel ]] then
  alias pbcopy='xsel --input --clipboard'
  alias pbpaste='xsel --output --clipboard'
fi

if [[ -r /bin/hx ]]; then
  alias helix=hx
  alias shx="sudo hx"
elif [[ -r ~/.local/bin/hx ]]; then
  alias helix=hx
  alias shx="sudo hx"
elif [[ -r /bin/helix ]]; then
  alias helix=hx
  alias shx="sudo helix"
elif [[ -r ~/.local/bin/helix ]]; then
  alias helix=hx
  alias shx="sudo hx"
else
  curl https://raw.githubusercontent.com/Tifeko/install_scripts/main/helix.sh -o helix.sh
  chmod +x helix.sh
  ./helix.sh
fi

if [[ -r /bin/bat ]]; then
  alias cat=bat
elif [[ -r ~/.local/bin/bat ]] then
  alias cat=bat
elif [[ -r /bin/batcat ]] then
  alias cat=batcat
elif [[ -r ~/.local/bin/batcat ]] then
  alias cat=batcat
fi

if [[ -r /bin/fastfetch ]] then
  fastfetch
  alias neofetch=fastfetch
fi
