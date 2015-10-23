# docker-obs

A Docker image with [Open Broadcaster Software][obs] container to stream video content.

## Usage

#### Build Docker image

	$ docker build --rm -t docker-obs:latest .

#### Start Open Broadcaster Software

	$ chmod a+x start.sh
	$ ./start.sh

or
	
	$ alias obs='docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/obs/.Xauthority --device /dev/dri --net=host docker-obs'

[obs]: https://obsproject.com