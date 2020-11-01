# docker image name
DOCKER_IMAGE = wolffaxn/genisoimage

# base directory
BASE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

build:
	# build docker image
	docker build -t $(DOCKER_IMAGE) .

	@echo Successfully built: $(DOCKER_IMAGE)
	@echo

run:
	# run docker image
	docker run --rm -it -v ${BASE_DIR}:/tmp -w /tmp wolffaxn/genisoimage \
		genisoimage \
		-rock \
		-joliet \
		-volid \
		cidata \
		-output iso/nocloud.iso \
		cidata
