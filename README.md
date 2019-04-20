# vyos-buildbot

Experimental vyos 1.2.0 build bot. 

A prebuilt Docker build environment is offered to speed up your building process.

CI Status:

| Target               | CI                                                                                                                                                                                                                               | Artifact                                                                                     | Estimated Build Time | 
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------| --- |
| Builder Docker Image | [![Build Status](https://dev.azure.com/nekomimiswitch/VyOS/_apis/build/status/VyOS-builder%20Docker%20image?branchName=master)](https://dev.azure.com/nekomimiswitch/VyOS/_build/latest?definitionId=47&branchName=master) | [Docker Hub](https://hub.docker.com/r/jamesits/vyos-builder) | 1 hour |
| Image                | [![Build Status](https://dev.azure.com/nekomimiswitch/VyOS/_apis/build/status/VyOS?branchName=master)](https://dev.azure.com/nekomimiswitch/VyOS/_build/latest?definitionId=48&branchName=master)                                | Go to CI or releases to download | 40 min |

Branches:

* [![](https://images.microbadger.com/badges/version/jamesits/vyos-builder:crux.svg)](https://microbadger.com/images/jamesits/vyos-builder:crux "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/jamesits/vyos-builder:crux.svg)](https://microbadger.com/images/jamesits/vyos-builder:crux "Get your own image badge on microbadger.com")
* [![](https://images.microbadger.com/badges/version/jamesits/vyos-builder:current.svg)](https://microbadger.com/images/jamesits/vyos-builder:current "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/jamesits/vyos-builder:current.svg)](https://microbadger.com/images/jamesits/vyos-builder:current "Get your own image badge on microbadger.com")

Reference: 
* https://pgfitzgerald.wordpress.com/2019/02/11/how-to-build-a-vyos-1-2-0-iso-image/
