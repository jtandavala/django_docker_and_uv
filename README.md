# Django with docker using UV


This repository contains the source code for a  project [django](https://www.djangoproject.com/) set up with [docker](https://www.docker.com/)  and [uv](https://docs.astral.sh/uv/). The goal is to showcase how uv can be used for project management in a Django environment, while leveraging Docker for containerization. This setup demonstrates a modern and efficient workflow for developing and managing Django applications.


# How to run the project

Before running the project make sure you have docker and docker compose installed.

1. clone the project
```
$ git clone https://github.com/tandavala-py/django_docker_and_uv.git
```

2. cd to the directory

```
$ cd django_docker_and_uv
```

3. rename the the file ```.env.sample``` to ```.env```

4. run the project

```
docker compose up --build --watch
```
