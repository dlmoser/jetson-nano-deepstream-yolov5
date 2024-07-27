# Jetson Nano DeepStream YOLOv5

## Overview
This repository provides a quick start guide to developing DeepStream-based applications using the Jetson Nano. Given that the Jetson Nano is now considered a legacy device by NVIDIA and Ultralytics, many existing tutorials are outdated and may not work. The latest available JetPack version for the Jetson Nano is 4.6.1, which ships with Python 3.6.9, a version no longer supported by Ultralytics.

## Getting Started

### Build the Docker Image
To build the Docker container, use the following command. Note that this process can take a while:

```sh
docker build -t jetson_nano_yolov5 -f .devcontainer/Dockerfile .
```
If you prefer, you can contact me for a pre-built Docker image.

### Run the Docker Container
To run the Docker container and connect to its bash interface, use:
```sh
docker run -it --rm --net=host --runtime=nvidia -v ${PWD}:/app jetson_nano_yolov5 bash
```

### Running the DeepStream Example
Once inside the container, you can start a DeepStream example application by running
```sh
deepstream-app -c deepstream_app_config
```
This command initiates the inference using an off-the-shelf YOLOv5 model on an NVIDIA example video and streams it via RTSP over your network.

### Viewing the RTSP Stream
On your host machine, you can display the video stream using VLC player. Follow these steps:
1. Open VLC player.
2. Go to `File` -> `Open Network`.
3. Enter the URI: `rtsp://<jetson-nano-ip>:8552/ds-test`.
   
You should now see the example video with bounding boxes.
