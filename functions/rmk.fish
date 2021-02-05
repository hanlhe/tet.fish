function rmk --description 'Remove key from known_hosts' --argument-names line
    sed -i.bak -e {$line}d $HOME/.ssh/known_hosts
end
