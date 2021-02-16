version = $(shell git describe --tags)

vet:
	go mod tidy
	go fmt ./...
	golint -set_exit_status ./...
	go vet ./...
	go test -race ./...

docs:
	# pkg.go.dev is only updated after someone has requested the version: https://stackoverflow.com/a/61974058/4353819
	curl https://sum.golang.org/lookup/github.com/shortcut/wsdl2go@$(version)

version:
	@echo $(version)

release:
	@./contrib/release.sh

.PHONY: vet docs version