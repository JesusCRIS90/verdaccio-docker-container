# TODO: UPDATE THIS FILE

# Template project to Verdaccio

Verdaccio is a private NPM Packages Manager. If you are looking for a way to publish your NPM Packges in a private way, verdaccio is a solution.

The following project have a base template to configure and stand up a Verdaccio docker container.

The next point talk about how to deal with differents files and the meaning of them.

### verdaccio folder

Inside this folder you will have: config, plugins and storage folder. These folder are used by docker as persistent storage volumen to the container. So, each time that you "DOWN" or "UP" the container the information will be there.

Be careful!!! If you changes the names of this folder, you must also change it on the docker-compose.yaml file.

### .env.template File

You must rename this file to ".env". For now, the unique variable defined is the name of the docker container that you want to see when stand up the service. So, put the name that you want.

### config.verdaccio.template.yaml File

This file have a basic configuration used by verdaccio. You only need to change the name to "config.yaml" and move the file onto the path: verdaccio/config.

To a better configuration use the verdaccio documentation or ask to CHAT-GPT.

### docker-compose.yaml File

This file is used to create and stand up Verdaccio Docker Container.

You can use the following command:

* To stand up the container:
```
docker-compose up -d
```
* To stand down the container:
```
docker-compose down
```
* To create and stand up the container:
```
docker-compose up --build -d
```

### docker-compose.yaml - Commented Code

* Generate a Custom Docker Image of Verdaccio

If you want to generate a custom image of Verdaccio you must uncomment and commet some lines of the code. These lines must have the following aspect:

```yaml
version: '3.6'

services:
  verdaccio:
    build:
      context: .
      dockerfile: Dockerfile
    # image: verdaccio/verdaccio:latest
    ... rest of code
```

In this case you must use the command to regenerate the docker image.
```
docker-compose up --build -d
```

* Generate a Custom User when Docker container is created

In this case you must uncomment the following line of code:
```yaml
      - './entrypoint.sh:/entrypoint.sh'
    entrypoint: ["/entrypoint.sh"]
```

This told the docker-compose file that execute the bash script file. Be sure that you have this file on the root path.


### Dockerfile

This file is not need it. This file is used to generate a custom version of Verdaccio container where curl is installed. You can use it as base point if you want to create a custom image of Verdaccio with something that default image do not have.

### entrypoint.sh

This file is used to generate a default user when the container is created. But for now, it seem do not work correctly. So, used under you responsibility.