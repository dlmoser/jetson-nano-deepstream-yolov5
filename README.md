## Build docker image from Docker file
`docker build -t jetson_nano_yolov5 -f .devcontainer/Dockerfile .`

## Run docker container from image
`docker run -it --rm --net=host --runtime=nvidia -v ${PWD}:/app jetson_nano_yolov5 bash`