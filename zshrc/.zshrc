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

# Initialize Zoxide, a Zsh plugin for navigating directories
eval "$(zoxide init zsh --cmd cd)"


# Set the PATH variable to include the .local/bin and bin directories
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Define some aliases
alias ll="ls -al"
alias rm="trash"
alias shx="sudo hx"

