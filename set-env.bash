asdf_update_golang_env() {
  local go_bin_path
  go_bin_path="$(asdf which go 2>/dev/null)"
  if [[ -n "${go_bin_path}" ]]; then
    abs_go_bin_path="$(readlink -f "${go_bin_path}")"

    export GOROOT
    GOROOT="$(dirname "$(dirname "${abs_go_bin_path}")")"

    if [[ -z "${GOPATH+x}" ]]; then
      export GOPATH
      GOPATH="$(dirname "${GOROOT}")/packages"
    fi

    if [[ -z "${GOBIN+x}" ]]; then
      export GOBIN
      GOBIN="$(dirname "${GOROOT}")/bin"
    fi
  fi
}
asdf_update_golang_env
