################################################################
# Dd                                                           #
################################################################

# default console editor (e.g. used by git)
EMACS_MIN=/home/darko/Radovi/Linux/.emacs/.emacs_min.el
export EDITOR="emacs -nw -q --load "${EMACS_MIN}

# change color for directories 'ls' display: perm=style;fb;bg
# export LS_COLORS="$LS_COLORS:ow=4;34:tw=4;34:"

################ alias

alias ls=exa
alias emin="emacs -nw -q --load "${EMACS_MIN}
alias cat=bat

################ GOLANG

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:/usr/local/go/bin:$PATH

################ ENV VARS

# used with "machine github.com login <username> password <token>" in /home/darko/.netrc
export GOPRIVATE=github.com/ultravioletrs/clients,github.com/ultravioletrs/cocos,github.com/ultravioletrs/manager,github.com/ultravioletrs/agent

export UV_DIR=~/go/src/github.com/ultravioletrs
export MF_DIR=~/go/src/github.com/mainflux
export JUPYTER_DIR=~/Radovi/AppDev/Python/jupyter-notebooks

################ PATH

export PATH=$PATH:~/.local/bin
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$GOPATH/src/github.com/mainflux/mainflux/build/
export PATH=$PATH:/usr/local/bin/tool
export PATH=$PATH:/opt/amiga/bin

export DENO_INSTALL="/home/darko/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

################ fzf

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

################ NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

################ KUBECTL

# source <(kubectl completion bash)
# export KUBE=/home/darko/Radovi/Mainflux/kube
# export KUBECONFIG=${KUBE}/ashvin-prod-kubeconfig.yaml:${KUBE}/ashvin-test-00-kubeconfig.yaml:${KUBE}/mainflux-demo-kubeconfig.yaml:${KUBE}/ashvin-dev-00-kubeconfig.yaml
# alias k="kubectl"
# complete -F __start_kubectl k
# alias km="kubectl -n mf"
# complete -F __start_kubectl km

# alias h='helm'
# source <(helm completion bash)
# complete -o default -F __start_helm h

################ WASM

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
# Wasmer
export WASMER_DIR="/home/darko/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

################ Haskell

[ -f "/home/darko/.ghcup/env" ] && source "/home/darko/.ghcup/env" # ghcup-env
