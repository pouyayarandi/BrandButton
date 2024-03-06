XCODEBUILD = xcodebuild
DOCC = xcrun docc

SCHEME = BrandButton
DEVICE = iPhone 15 Pro
OS = latest
DESTINATION = 'platform=iOS Simulator,OS=$(OS),name=$(DEVICE)'
ARGS = -scheme $(SCHEME) -destination $(DESTINATION)

OUTPUT_PATH = .build
DOCC_ARCHIVE = $$(find $(OUTPUT_PATH) -type d -name 'BrandButton.doccarchive')
GH_PAGES_PATH = 'https://pouyayarandi.github.io/BrandButton/'

.PHONY: build test doc

build:
	$(XCODEBUILD) build $(ARGS)

test:
	$(XCODEBUILD) test $(ARGS)

doc:
	$(XCODEBUILD) docbuild $(ARGS) -derivedDataPath $(OUTPUT_PATH) && \
	$(DOCC) process-archive transform-for-static-hosting $(DOCC_ARCHIVE) \
	--output-path docs \
	--hosting-base-path $(GH_PAGES_PATH)
