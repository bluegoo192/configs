function eacp
    git add .
    git commit -am $argv
    git push | tail -n -1 | set _status
    echo "status: " $_status
end
