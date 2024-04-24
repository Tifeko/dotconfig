# Created by newuser for 5.9

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

[[ -r ~/Repos/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] ||
	znap install marlonrichert/zsh-autocomplete
source ~/Repos/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd cd)"

alias ll="ls -al"
alias rm="trash"
alias shx="sudo hx"
