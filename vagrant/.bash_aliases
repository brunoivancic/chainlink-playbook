# Update latest changes to bash, like new aliases
update_bash () {
    . ~/.bashrc
}

# Boot up ETH client quickly
run_eth () {
    docker start -i eth
}

# Stop ETH client quickly
stop_eth () {
    docker start -i eth
}

# Stop all node & eth containers
stop_all () {
    docker stop secondary && docker stop chainlink && docker stop eth
}

# Boot up chainlink node quickly
# Remember to wait for ETH client to boot&sync first, before entering
# credentials and booting up Chainlink
run_chainlink () {
    docker start -i chainlink
}

# Stop main node quickly
stop_chainlink () {
    docker stop chainlink
}

# Boot up secondary chainlink node quickly
# Remember to wait for ETH client to boot&sync first, before entering
# credentials and booting up Chainlink
run_secondary () {
    docker start -i secondary
}

# Stop secondary node quickly
stop_secondary () {
    docker stop secondary
}

# Stop both nodes
stop_nodes() {
    docker stop chainlink && docker stop secondary
}

# Switch to main Chainlink node
# WARNING: USE WITH CAUTION
# Both nodes should be running
switch_main () {
    docker restart secondary -t 0 && docker attach chainlink
}

# Switch to secondary Chainlink node
# WARNING: USE WITH CAUTION
# Both nodes should be running
switch_secondary () {
    docker restart chainlink -t 0 && docker attach secondary
}

# Connect to main node's container
chainlink_cli () {
    docker exec -it chainlink /bin/bash
}

# Connect to secondary node's container
secondary_cli () {
    docker exec -it secondary /bin/bash
}

# For quick screen usage
alias chainlink='screen -S chainlink -c ~/.screenrc-chainlink -d -R'

# Navigation
alias home='cd ~'
alias vagrant='cd /vagrant'
