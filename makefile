PHONY: archive
archive:
	${MAKE} -C src archive	

PHONY: publish
ifeq ($(version),)
publish: 
	@echo "Must pass in a version parameter; 'make version=... publish'"
	@exit 1
else
publish:
	./upload-github-release-assets.sh github_api_token=${TOKEN} owner=wburningham repo=fonts tag=${version} filename=./src/RebeccaHandwriting.zip
	./upload-github-release-assets.sh github_api_token=${TOKEN} owner=wburningham repo=fonts tag=${version} filename=./src/WesHandwriting.zip
endif

# upload-github-release-assets.sh
# https://gist.github.com/stefanbuck/ce788fee19ab6eb0b4447a85fc99f447
