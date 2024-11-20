# TODO: Things to improve on the project

* Fix: Automatization => Create default user
* Fix: Bash Script: create_default_user.sh does not take .env file correctly
* Fix: Problem with permission Verdaccio Struct folders. Now, on the creation of the struct folder all them are given any permission using chmod 777, which it is not a good solution... but work for now.
* Add: Add a section on start_verdaccio.sh script which allow the creation of a custom image of Verdaccio suing the Dockerfile.

# Template project to Verdaccio

Verdaccio is a private NPM Packages Manager. If you are looking for a way to publish your NPM Packges in a private way, verdaccio is a solution.

The following project have a base template to configure and stand up a Verdaccio docker container.


## QUICK START 

If you only want to make Verdaccio work quickly without dealing with configurations follow these steps:

1. Rename file .env.template to .env
2. Give executation permission to file: start_verdaccio.sh

```sh
chmod +x start_verdaccio.sh
```

3. Execute the bash script: start_verdaccio.sh

```sh
./start_verdaccio.sh
```

## Files explain

The next point talk about how to deal with differents files and the meaning of them.

### .env.template File

You must rename this file to ".env". We have the following variables:

* COMPOSE_PROJECT_NAME: This will be the name tha you see on your docker container
* RECREATE_STRUCT_FOLDER: Told to bash script "start_verdaccio.sh" re-create from scracth the verdaccio struct folders. TRUE => Any files/folders under the name verdaccio on your project will be delete
* HOST_PORT: Port for the application
* MAX_USERS: Max number of users
* CREATE_DEFAULT_USER: Told to bash script "start_verdaccio.sh" to create a default user
* VERDACCIO_DEFAULT_USER_NAME: Default Verdaccio User Name
* VERDACCIO_DEFAULT_USER_PASSWORD: Default Verdaccio Password
* VERDACCIO_DEFAULT_USER_EMAIL: Default Verdaccio User Email

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


### Dockerfile

This file is not need it. This file is used to generate a custom version of Verdaccio container where curl is installed. You can use it as base point if you want to create a custom image of Verdaccio with something that default image do not have.

### start_verdaccio.sh

This file is used to automatize the whole process to get Verdaccio working on your computer. To be able use it make the following:

1. Make file executable

```sh
chmod +x start_verdaccio.sh
```
2. Execute the file

```sh
./start_verdaccio.sh
```

If the whole process work correctly in a few seconds you must have a Verdaccio Docker Container Running on your computer.


### Folder scripts

Inside this folder you will find a list of bash script used by the general script: start_verdaccio.sh