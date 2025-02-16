
YATERR:
	terraform providers lock -net-mirror=https://terraform-mirror.yandexcloud.net -platform=<название_платформы_1> -platform=<название_платформы_2> yandex-cloud/yandex


build:
	export CGO_ENABLED=0
	export GOOS=linux

	@echo "  >  Building hi service ...."
	go build -o ./cmd/hi/service ./cmd/hi

	@echo "  >  Push router to docker ...."
	docker build -t hi -f ./cmd/hi/Dockerfile . 
	docker tag hi:latest ta01rus/hi:latest 
	docker push ta01rus/hi:latest 

	@echo "  >  Remove build cshe ...."
	rm ./cmd/hi/service
