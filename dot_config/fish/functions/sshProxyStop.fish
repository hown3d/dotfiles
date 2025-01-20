function proxyDisconnect -a filter
    set jumphosts (string split " " (__jumphosts $filter))
    for host in $jumphosts
        __proxyDisconnect $host
    end
end
