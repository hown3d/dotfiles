function kubeconfig -a file
    set __file $file
    if test -z "$__file"
        set __file $(ls $HOME/.kube/configs | fzf --preview="bat $HOME/.kube/configs/{}")
    end
    set --export KUBECONFIG $HOME/.kube/configs/$__file
end
