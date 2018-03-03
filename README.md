# Dockerfile for FreshRSS

This file is destined to configure a virtual environment for FreshRSS. It is
based on Centos 6.

**Please note it is only for developers or testing!** It is assumed you know Docker and you have already installed it on your computer. If it's not the case, please refer to [the official website](http://www.docker.com/).

If you have any trouble using this image and if the **answer is NOT in this document**, feel free to contact me at
dev@marienfressinaud.fr.


## In 3 steps:

```
$ docker pull marienfressinaud/freshrss
$ git clone https://github.com/marienfressinaud/FreshRSS.git FreshRSS
$ docker run -t -i -v /path/to/FreshRSS:/var/www/html -p 8080:80 marienfressinaud/freshrss
```

In case of trouble, please refer to the rest of this document.


## In details
### Get the FreshRSS image

First get the Docker image on your PC:

```
$ docker pull marienfressinaud/freshrss
```

Or if you prefer to build it yourself:

```
$ git clone https://github.com/marienfressinaud/docker-freshrss.git docker-freshrss
$ docker build -t marienfressinaud/freshrss docker-freshrss
```

### Get FreshRSS

Note that the image does NOT include FreshRSS source code! You should first get the code
from GitHub:

```
$ git clone https://github.com/marienfressinaud/FreshRSS.git FreshRSS
```

### Run a FreshRSS container

To use FreshRSS image, you should run it and mount your local FreshRSS
directory in the corresponding running container. Do not forget to map port
```8080``` (or any other) to port ```80```:

```
$ docker run -t -i -v /path/to/FreshRSS:/var/www/html -p 8080:80 marienfressinaud/freshrss
```


## Install FreshRSS
Last step is to install FreshRSS. Don't worry, you will not have to do that
next time.

1. Open a web browser on [127.0.0.1:8080](http://127.0.0.1:8080)
2. Use sqlite database
3. Once FreshRSS is installed, enjoy!

Changes about feeds (e.g. adding a feed, refresh items) are not saved when
the container is stopped!


## Configure an alias

The command line to start FreshRSS container is a bit long. You can add an alias in
your ```~/.bashrc```:

```
alias start-freshrss='docker run -t -i -v /path/to/FreshRSS:/var/www/html -p 8080:80 marienfressinaud/freshrss'
```

Remember to reload ```~/.bashrc``` information with ```source ~/.bashrc```.


### Keep container in background
You may have no need of a shell. You can change ```-t``` argument by ```-d```:

```
alias start-freshrss='docker run -d -i -v /path/to/FreshRSS:/var/www/html -p 8080:80 marienfressinaud/freshrss'
```
