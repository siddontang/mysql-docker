all: build

build:
	@docker build -t siddontang/mysql .

clean:
	@docker rmi siddontang/mysql
