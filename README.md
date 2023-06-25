# R in docker for the lab

This repo is to ensure reproducibility of the lab. This [tutorial](http://ropenscilabs.github.io/r-docker-tutorial/) helped us to build and maintain this repo, many thanks.

Associated with docker images: https://hub.docker.com/r/hcp4715/rdock

## About docker

Please see [here](https://www.docker.com/resources/what-container) for why using docker.

## How to use docker images

### Step 1: install docker

Linux (ubuntu): https://docs.docker.com/engine/install/ubuntu/

Windows 10: https://docs.docker.com/docker-for-windows/install/

Mac OS: https://docs.docker.com/docker-for-mac/install/

**Make sure that docker was successfully installed on your machine**

### Step 2: pull this image form dock hub

```
docker pull hcp4715/rdock:sperel           # This is the image for SPEReliability project
```

### Step 3: run the docker image

```
docker run -e PASSWORD=hulab1234 --cpus=4 -it --rm -p 8787:8787 -v /home/hcp4715/docker/workingDir:/home/rstudio/work hcp4715/rdock:sperel 
```

docker run ---- Run a docker image in a container

-e PASSWORD=hulab1234 ---- set a password for rstudio, you can set your own password.

-it ---- Keep STDIN open even if not attached

--rm ---- Automatically remove the container when it exits

--cpus=4 ---- Number of cores will be used by docker. Make sure that your machine has more thread than the number here.

-v ---- Mount a folder to the container

/home/hcp4715/docker/workingDir ---- The directory of a local folder where I stored my data. [For Linux]

/d/hcp4715/docker/workingDir ---- The directory of a local folder under drive D. It appears as D:\hcp4715\docker_R in windows system.

/home/rstudio/work ---- The directory inside the docker image (the mounting point of the local folder in the docker image). Note that the docker container itself likes a mini virtual linux system, so the file system inside it is linux style.

-p ---- Publish a container’s port(s) to the host

hcp4715/rdock:sperel ---- The docker image to run. Note that you shoud include the tag `:cmdstanr` part, otherwise docker will instead use "hcp4715/rstudio_bayes:latest".

**After running the code above, you shall see output as below:**

```
[s6-init] making user provided files available at /var/run/s6/etc...exited 0.
[s6-init] ensuring user provided files have correct perms...exited 0.
[fix-attrs.d] applying ownership & permissions fixes...
[fix-attrs.d] done.
[cont-init.d] executing container initialization scripts...
[cont-init.d] userconf: executing... 
[cont-init.d] userconf: exited 0.
[cont-init.d] done.
[services.d] starting services
[services.d] done.
...
```

### Step 4: Access Rstudio in browser.
Then, open your broswer (e.g., firefox, chrome), and try one of the following url in the address:

`localhost:8787`

`http://192.168.99.100:8787`


You will be asked to input username and password

Username: rstudio
Password: hulab1234

Now, you will see the familiar interface of rstudio! In the broswer!

### Step 4: test the iamge

Run the code below to test whether the image works
```
# load the libraries
library(tidyverse)
```

### Build docker image from Dockerfile

```
docker build -t your_user_name/your_docker_image_name:your_tag -f Dockerfile .
```

Replace the `your_user_name/your_docker_image_name:your_tag` part with your own information. For example, I used`docker build -t hcp4715/rstudio_bayes:cmdstanr -f Dockerfile .`


### Final note

Docker is not perfect (yet). 