# docker-obs [![Circle CI](https://circleci.com/gh/Spoon4/docker-obs.svg?style=shield)](https://circleci.com/gh/Spoon4/docker-obs)

A Docker image with [Open Broadcaster Software][obs] container to stream video content.

## Usage

#### Build Docker image

From [Docker Hub][dockerhub]

```
	$ docker pull spoon4/docker-obs
```

or from the source file

```
	$ docker build --rm -t spoon4/docker-obs:latest .
```


#### Start Open Broadcaster Software

Run the `start.sh` or set a bash alias
	
```	
	$ alias obs='docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/obs/.Xauthority --device /dev/dri --net=host spoon4/docker-obs'
```

[obs]: https://obsproject.com
[dockerhub]: https://hub.docker.com/r/spoon4/docker-obs
