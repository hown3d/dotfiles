function __proxyDisconnect -a name
    set socket_file "/tmp/.ssh-$name"
    ssh -S $socket_file -O exit $name
end
function proxyDisconnect -a filter
    set jumphosts (string split " " (__jumphosts $filter))
    for host in $jumphosts
        __proxyDisconnect $host
    end
end
