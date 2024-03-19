set --export --prepend PATH "$HOME/.cargo/bin"
set --export --prepend PATH "$HOME/go/bin"
set -gx PATH $PATH $HOME/.krew/bin
set --export EDITOR $(which nvim)

fzf_configure_bindings --directory=\cf


alias kubectx="kubectl ctx"
alias kubens="kubectl ns"


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

direnv hook fish | source

starship init fish | source
