NAME=linguee
BINDIR=artifact
RELEASEDIR=release
VERSION=$(shell git describe --tags || echo "unknown")
GOBUILD=go build

build:
	GOARCH=amd64 GOOS=darwin $(GOBUILD) -o $(BINDIR)/$(NAME) .

prepare_assets:
	mkdir -p $(BINDIR)
	mkdir -p $(RELEASEDIR)
	cp ./assets/* $(BINDIR)/
	sed -i 's/WORKFLOW_VERSION/$(VERSION)/g' $(BINDIR)/info.plist

zip_artifact:
	chmod +x $(BINDIR)/linguee
	cd $(BINDIR) && zip -r "../$(RELEASEDIR)/alfred.alfredworkflow" "./" && cd -

release: prepare_assets build zip_artifact

clean:
	rm $(BINDIR)/*