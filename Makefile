
NAME=glenux/mdhero
all: build run

build:
	docker build -t $(NAME) .

	#		--build-arg "BUNDLE_BITBUCKET__ORG=$(BUNDLE_BITBUCKET__ORG)" \


run:
	docker run --rm -p 4000:4000 -p 4001:4001 -t $(NAME)

install:

