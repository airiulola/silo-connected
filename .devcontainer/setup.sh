#!/bin/bash

# stop on first error
set -e

# Setup Go environment variables 
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# Confirm Go installation
INSTALLED_GO_VERSION=$(go version)
echo "Go version ${INSTALLED_GO_VERSION} is installed"

echo "Getting development tools"
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/rakyll/hey@latest

echo "Getting dependencies for the vscode-go plugin"
# Update the installation commands for tools, replacing `go get -u` with `go install` and specifying versions where necessary
go install github.com/acroca/go-symbols@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install github.com/haya14busa/goplay/cmd/goplay@latest
go install github.com/mdempsky/gocode@latest
go install github.com/ramya-rao-a/go-outline@latest
go install github.com/rogpeppe/godef@latest
go install github.com/sqs/goreturns@latest
go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
go install github.com/zmb3/gogetdoc@latest
go install golang.org/x/lint/golint@latest
go install golang.org/x/tools/cmd/gorename@latest
