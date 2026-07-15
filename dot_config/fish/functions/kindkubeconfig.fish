function kindkubeconfig -a name
    set __name $name
    if test -z "$__name"
        set __name $(kind get clusters | fzf --bind one:accept )
    end
    kind export kubeconfig -n $__name
end
