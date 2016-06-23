#How to use these images

Using these is very similar to using the official Python images from `docker-library`. To build a
Docker image for your own application project, just create a Dockerfile like this:

```
FROM jython:2.5.3-onbuild
CMD ["jython-all", "./your-script.py"]
```

The build will then `COPY` a `requirements.txt`, `RUN pip install` on it, and copy the contents of the
current directory into /usr/src/app. To build and run, use

```
$ docker build -t my-python-app .
$ docker run -it --rm --name my-running-app my-python-app
```

For interactive work, or for running a single script, you can just use

```
$ docker run -it --rm jython:2.5.3
```

respectively

```
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp jython:2.5.3 jython your-script.py
```


##Using jip to add Java libraries

If, for example, you would like to use `SQLAlchemy` with Postgres, `pytz` and `tzlocal`, you would use:

requirements.txt:
```
SQLAlchemy == 0.8  # latest version to support Python 2.5
https://pypi.python.org/packages/source/p/pytz/pytz-2015.4.tar.gz#md5=417a47b1c432d90333e42084a605d3d8  # bz2 module is missing in Jython 2.5.3
tzlocal
```

Dockerfile:
```
FROM jython:2.5.3-onbuild

RUN jip install org.postgresql:postgresql:9.4-1203-jdbc42 \
    && jip install net.sourceforge.htmlunit:htmlunit:2.18 \
    && jython-all -c "print 'processed jars'"

CMD ["jython-all", "your-script.py"]
```
