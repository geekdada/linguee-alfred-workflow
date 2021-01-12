NAME=linguee
BINDIR=artifact
RELEASEDIR=release
VERSION=$(shell git describe --tags || echo "unknown")
GOBUILD=CGO_ENABLED=1 go build -trimpath -ldflags '-X "main.version=$(VERSION)" \
		-w -s -buildid='

build:
	GOARCH=amd64 GOOS=darwin $(GOBUILD) -o $(BINDIR)/$(NAME)

prepare_assets:
	mkdir -p $(BINDIR)
	mkdir -p $(RELEASEDIR)
	cp ./assets/* $(BINDIR)/
	sed -i '' 's/WORKFLOW_VERSION/$(VERSION)/g' $(BINDIR)/info.plist

zip_artifact:
	chmod +x $(BINDIR)/$(NAME)
	cd $(BINDIR) && zip -r "../$(RELEASEDIR)/alfred.alfredworkflow" "./" && cd -

release: prepare_assets build zip_artifact

clean:
	rm $(BINDIR)/*
	rm $(RELEASEDIR)/*