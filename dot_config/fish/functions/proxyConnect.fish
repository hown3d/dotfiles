function __readSSHHosts
    cat $HOME/.ssh/config | grep "Host " | cut -d ' ' -f2
end

function __proxyConnect -a name
    set socket_file "/tmp/.ssh-$name"
    if test -e $socket_file
        echo "$name SSH Proxy already connected"
    else
        echo "connecting to $name jumphost"
        ssh $name -fN -M -S $socket_file
    end
end

function __ssh_forward_port -a name
    grep -A 10 "Host $name" $HOME/.ssh/config | grep DynamicForward | head -n1 | \sed 's/^ *//' | cut -d ' ' -f2
end

function __subshell -a name
    set port (__ssh_forward_port $name)
    set --export http_proxy socks5h://127.0.0.1:$port
    set --export HTTP_PROXY $http_proxy
    set --export https_proxy $http_proxy
    set --export HTTPS_PROXY $http_proxy
    exec $SHELL
end

function __jumphosts -a filter
    set -l all_jumphosts (__readSSHHosts)
    if not test -z "$filter"
        for host in (string split "," $filter)
            set -l host_with_prefix "jump-$host"
            if not contains $host_with_prefix $all_jumphosts
                echo "$host is not a valid jumphost"
                continue
            end
            set -a jumphosts $host_with_prefix
        end
        echo $jumphosts
        return
    end
    echo $all_jumphosts
end

function proxyConnect -a filter
    set jumphosts (string split " " (__jumphosts $filter))
    for host in $jumphosts
        __proxyConnect $host
        __subshell $host
    end
end
