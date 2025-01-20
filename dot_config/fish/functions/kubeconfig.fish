function kubeconfig -a file
    if test -z "$file"
        set file $(ls $HOME/.kube/configs | fzf --preview="bat $HOME/.kube/configs/{}")
    end
    set --export KUBECONFIG $HOME/.kube/configs/$file
end
