# vyos-buildbot

Experimental VyOS (>=1.2.0) build bot. 

Build artifacts can be found in the [releases](https://github.com/Jamesits/vyos-buildbot/releases) page. Note that they are **not tested** so I don't guarantee that they will boot at all. The version number is just for reference, they don't strictly follow these of the official releases.

If you want to build it at home, a prebuilt Docker build environment is offered to speed up your building process.

CI Status:

| Target               | CI                                                                                                                                                                                                                               | Artifact                                                                                     | Estimated Build Time | 
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------| --- |
| Builder Docker Image | [![Build Status](https://dev.azure.com/nekomimiswitch/General/_apis/build/status/vyos-builder?branchName=master)](https://dev.azure.com/nekomimiswitch/General/_build/latest?definitionId=84&branchName=master) | [Docker Hub](https://hub.docker.com/r/jamesits/vyos-builder) | 1 hour |
| Image                | [![Build Status](https://dev.azure.com/nekomimiswitch/General/_apis/build/status/vyos-release?branchName=master)](https://dev.azure.com/nekomimiswitch/General/_build/latest?definitionId=85&branchName=master) | Go to CI or releases to download | 40 min |

Branches:

* [![](https://images.microbadger.com/badges/version/jamesits/vyos-builder:crux.svg)](https://microbadger.com/images/jamesits/vyos-builder:crux "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/jamesits/vyos-builder:crux.svg)](https://microbadger.com/images/jamesits/vyos-builder:crux "Get your own image badge on microbadger.com")
* [![](https://images.microbadger.com/badges/version/jamesits/vyos-builder:current.svg)](https://microbadger.com/images/jamesits/vyos-builder:current "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/jamesits/vyos-builder:current.svg)](https://microbadger.com/images/jamesits/vyos-builder:current "Get your own image badge on microbadger.com")

Reference: 
* https://pgfitzgerald.wordpress.com/2019/02/11/how-to-build-a-vyos-1-2-0-iso-image/
