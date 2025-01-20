function __fish_kubeconfig_completions
    ls $HOME/.kube/configs/
end
complete -f -c kubeconfig -a "(__fish_kubeconfig_completions)" -n "not __fish_seen_subcommand_from (__fish_kubeconfig_completions)"
