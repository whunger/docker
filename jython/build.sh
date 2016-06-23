#!/bin/sh
docker build --rm -t jython:2.5.3 2.5.3/
docker build --rm -t jython:2.5.3-onbuild 2.5.3/onbuild/
