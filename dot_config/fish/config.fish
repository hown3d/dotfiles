### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/hoehl/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

set --export --prepend PATH "/Users/hoehl/.cargo/bin"
set --export --prepend PATH /Users/hoehl/go/bin
set --export GOPATH /Users/hoehl/go
#set --export DOCKER_HOST "unix:///Users/hoehl/.lima/docker-rootful/sock/docker.sock"
set --export DOCKER_HOST "unix:///Users/hoehl/.orbstack/run/docker.sock"
set --export DOCKER_BUILDKIT 1
set -x TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
set -gx PATH $PATH $HOME/.krew/bin
set --export EDITOR $(which nvim)

fzf_configure_bindings --directory=\cf
# eval (minikube docker-env)

starship init fish | source
