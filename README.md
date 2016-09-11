[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/index.php/irc/
[podcasturl]: https://www.linuxserver.io/index.php/category/podcast/

[![linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# lsioarmhf/hydra
[![](https://images.microbadger.com/badges/image/lsioarmhf/hydra.svg)](http://microbadger.com/images/lsioarmhf/hydra "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/lsioarmhf/hydra.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/lsioarmhf/hydra.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io-armhf/lsioarmhf-nzbhydra)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io-armhf/job/lsioarmhf-nzbhydra/)
[hub]: https://hub.docker.com/r/lsioarmhf/hydra/

NZBHydra is a meta search for NZB indexers and the "spiritual successor" to NZBmegasearcH. It provides easy access to a number of raw and newznab based indexers. [hydra](https://github.com/theotherp/nzbhydra)

[![hydra](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/hydra-icon.png)][hydraurl]
[hydraurl]: https://github.com/theotherp/nzbhydra

## Usage

```
docker create --name=hydra \
-v <path to data>:/config \
-v <nzb download>:/downloads \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 5075:5075 lsioarmhf/hydra
```

**Parameters**

* `-p 5075` - the port(s)
* `-v /config` - Where hydra should store config files
* `-v /downloads` - NZB download folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone EG. Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it hydra /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 
`IMPORTANT... THIS IS THE ARMHF VERSION`

The web interface is at `<your ip>:5075` , to set up indexers and connections to your nzb download applications.


## Info

* To monitor the logs of the container in realtime `docker logs -f hydra`.


## Versions

+ **11.09.16:** Add layer badges to README.
+ **07.09.16:** Initial Release.
