FROM nvcr.io/nvidia/deepstream-l4t:6.0.1-samples

# Install necessary packages and tools
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        python3-pip \
        cmake \
        protobuf-compiler \
        libprotoc-dev \
        python-gi-dev \
        python-gst-1.0 \
        gstreamer1.0-python3-plugin-loader && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade setuptools and install Python dependencies
RUN pip3 install --no-cache-dir \
    setuptools \
    protobuf==3.18.1 \
    cython==0.29.36 \
    numpy \
    psutil \
    ipython 

# upgrade pip
RUN apt update && pip3 install --upgrade pip

# Copy the whl files from the dependency folder to the container
COPY dependencies/torchvision-0.11.0a0+fa347eb-cp36-cp36m-linux_aarch64.whl /tmp/
COPY dependencies/opencv_python-4.10.0-cp36-cp36m-linux_aarch64.whl /tmp/

# install torch vision and opencv-python
RUN pip3 install /tmp/torchvision-0.11.0a0+fa347eb-cp36-cp36m-linux_aarch64.whl /tmp/opencv_python-4.10.0-cp36-cp36m-linux_aarch64.whl

# Clone YOLOv5 repository and checkout specific version
RUN git clone https://github.com/ultralytics/yolov5 && \
    cd yolov5 && \
    git checkout tags/v6.0 -b legacy-6.0 && \
    sed -i 's/torch>=1.7.0/#torch>=1.7.0/g' requirements.txt && \
    sed -i 's/torchvision>=0.8.1/#torchvision>=0.8.1/g' requirements.txt && \
    pip3 install --no-cache-dir -r requirements.txt


ENV CUDA_VER=10.2
# Download git repo deepstream-yolo and change to commit f9c7a4d
RUN git clone https://github.com/marcoslucianops/DeepStream-Yolo.git \
    && cd DeepStream-Yolo \
    && git checkout f9c7a4d 
    # && make -C nvdsinfer_custom_impl_Yolo 


# create the /app folder 
RUN mkdir /app
WORKDIR /app

# RUN apt-get install -y x11-apps

# Needed for X11 forward. 
# COPY build_with_ip.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/build_with_ip.sh && echo "source /usr/local/bin/build_with_ip.sh" >> /etc/bash.bashrc

# FROM nvcr.io/nvidia/deepstream-l4t:6.0.1-samples

# # WORKDIR /opt/nvidia/deepstream/deepstream-6.0
# # RUN git clone -b v1.1.1 https://github.com/NVIDIA-AI-IOT/deepstream_python_apps.git

# # Install g++ compiler
# RUN apt-get update && \
#     apt-get install -y build-essential && \
#     apt-get clean

# RUN apt-get install -y python3-pip

# RUN apt install -y cmake

# RUN pip3 install --upgrade setuptools

# RUN pip3 install protobuf==3.18.1

# RUN apt-get install -y protobuf-compiler libprotoc-dev


# RUN pip3 install cython==0.29.36

# RUN pip3 install numpy==1.19.4

# RUN git clone https://github.com/ultralytics/yolov5
# WORKDIR yolov5
# RUN git checkout tags/v6.0 -b legacy-6.0
# RUN sed -i 's/torch>=1.7.0/#torch>=1.7.0/g' requirements.txt
# RUN sed -i 's/torchvision>=0.8.1/#torchvision>=0.8.1/g' requirements.txt
# RUN pip3 install --no-cache-dir -r requirements.txt

# RUN pip3 install psutil

# RUN pip3 install ipython

# # python gstreamer dependencies
# RUN apt install -y python-gi-dev python-gst-1.0 gstreamer1.0-python3-plugin-loader




# RUN apt-get update

# RUN apt-get install -y libopenblas-base libopenmpi-dev

# RUN wget https://nvidia.box.com/shared/static/fjtbno0vpo676a25cgvuqc1wty0fkkg6.whl -O torch-1.10.0-cp36-cp36m-linux_aarch64.whl

# RUN pip3 install torch-1.10.0-cp36-cp36m-linux_aarch64.whl

# RUN git clone https://github.com/ultralytics/yolov5

# RUN cd yolov5

# RUN sed -i 's/torch>=1.8.0/#torch>=1.8.0/g' requirements.txt

# RUN pip3 install onnx==1.11.0 --user --verbose

# RUN wget -O onnxruntime_gpu-1.11.0-cp36-cp36m-linux_aarch64.whl https://nvidia.box.com/shared/static/pmsqsiaw4pg9qrbeckcbymho6c01jj4z.whl

# RUN pip3 install onnxruntime_gpu-1.11.0-cp36-cp36m-linux_aarch64.whl
