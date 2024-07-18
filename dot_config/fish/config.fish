set --export --prepend PATH "$HOME/.cargo/bin"
set --export --prepend PATH "$HOME/go/bin"
set --export --prepend PATH "$HOME/bin"
set --export --prepend PATH /opt/homebrew/opt/gnu-tar/libexec/gnubin
set --export --prepend PATH /opt/homebrew/opt/gnu-sed/libexec/gnubin
set -gx PATH $PATH $HOME/.krew/bin
set --export EDITOR $(which nvim)
set --export GOPATH $(go env GOPATH)
set --export JAVA_HOME "/opt/homebrew/Cellar/openjdk/22.0.1"

fzf_configure_bindings --directory=\cf


alias kubectx="kubectl ctx"
alias kubens="kubectl ns"
alias lg="lazygit"


gardenctl completion fish | source
gardenctl rc fish -p gctl | source
alias g="gardenctl"
alias gtv='gardenctl target view -o yaml'
alias gtc='gardenctl target control-plane'
alias gtc-='gardenctl target unset control-plane'
alias gk='eval (gardenctl kubectl-env fish)'
alias gp='eval (gardenctl provider-env fish)'
alias gcv='gardenctl config view -o yaml'
alias gt='gardenctl target'
alias gtd='gardenctl target --garden dev'
alias gtt='gardenctl target --garden tst'
alias gtp='gardenctl target --garden prd'
alias gg='eval $(history | grep -E "gardenctl target|g target|gtp|gtd|gtt" | grep -v history | uniq | fzf --height 40% --info inline --border --preview-window up,1,border-horizontal)'

stackit completion fish | source

direnv hook fish | source

starship init fish | source
