XCODEBUILD = xcodebuild
SCHEME = BrandButton
DEVICE = iPhone 15 Pro
OS = latest
DESTINATION = 'platform=iOS Simulator,OS=$(OS),name=$(DEVICE)'
ARGS = -scheme $(SCHEME) -destination $(DESTINATION)

build:
	$(XCODEBUILD) build $(ARGS)

test:
	$(XCODEBUILD) test $(ARGS)
