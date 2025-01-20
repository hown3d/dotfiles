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
    end
end
