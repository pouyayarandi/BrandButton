XCODEBUILD = xcodebuild
SCHEME = BrandButton
DEVICE = iPhone 15 Pro
OS = latest
DESTINATION = 'platform=iOS Simulator,OS=$(OS),name=$(DEVICE)'

build:
	$(XCODEBUILD) build \
		-scheme $(SCHEME) \
		-destination $(DESTINATION)

test:
	$(XCODEBUILD) test \
		-scheme $(SCHEME) \
		-destination $(DESTINATION)
