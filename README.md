# GLIBC Alpine Docker

This docker is a small container built upon an Alpine Linux Container that include GOSU, it also packages in a custom build of glibc, glibc-bin and glibc-i18n. It is designed to be used as a base for other packages that need to be build using glibc.

To build it you will need to first have an mirror for your glibc apk files, if you do not have a signed mirror then you can provide the override --allow-unsigned in the environment file however this is not wise.

```
make build
```
