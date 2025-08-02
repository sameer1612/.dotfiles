function port-kill
    if test (count $argv) -eq 0
        echo "Usage: port-kill <port>"
        return 1
    end

    set port $argv[1]
    set pids (lsof -ti :$port)

    if test -z "$pids"
        echo "No process found on port $port"
    else
        echo "Killing PID(s): $pids on port $port"
        for pid in $pids
            kill -9 $pid
        end
    end
end
