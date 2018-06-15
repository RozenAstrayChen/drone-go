dc:
	#docker-compose up -d
	docker-compose up
dcs:
	docker-compose stop 
ng:
	ngrok http 80

build:
ifneq ($(DRONE_TAG),)
	go build -v -ldflags "-X main.version=$(DRONE_TAG)" -a -o release/linux/amd64/hello
else
	go build -v -ldflags "-X main.version=$(DRONE_COMMIT)" -a -o release/linux/amd64/hello
endif

#testing...