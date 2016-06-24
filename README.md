# A collection of dockerfiles

* **jython/2.5.3** Jython 2.5.3 on Java 8. Having a nicely setup Jython installation in a current Linux distribution is not as straightforward as one might think. This attempt installs directly from the installer jar and adds a matching virtualenv, easy_install, pip and jip setup. Jython 2.5.3 is old, admittedly, but it is a dependable workhorse in many regards.
* **jython/2.5.3/onbuild** Based on the former, this adds copying the current directory to `/usr/src/app` and running `pip install` using `requirements.txt`, modelled after the official python images.
