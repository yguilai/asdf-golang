asdf_update_golang_env() {
  local go_bin_path
  go_bin_path="$(asdf which go 2>/dev/null)"
  if [[ -n "${go_bin_path}" ]]; then
    export GOROOT
    GOROOT="$(dirname "$(dirname "${go_bin_path:A}")")"

    if [[ -z "${GOPATH+x}" ]]; then
      export GOPATH
      GOPATH="$(dirname "${GOROOT:A}")/packages"
    fi

    if [[ -z "${GOBIN+x}" ]]; then
      export GOBIN
      GOBIN="$(dirname "${GOROOT:A}")/bin"
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_golang_env
