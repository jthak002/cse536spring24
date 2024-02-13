### HOMEWORK 1
---------------
#### STEP 1 : SETUP Multipass
[Docs](docs/multipass.md)

#### STEP 2 : SETUP Tailscale
[Docs](docs/tailscale.md)
#### STEP 3 : SETUP for Werewolves

- Download werewolves  : ``` wget https://jedcrandall.github.io/courses/cse536spring2024/werewolves-spring24.tgz ```

![Alt text](docs/img/werewolves/werewolves-wget.png)

- Extract the folder ``` tar -xzvf werewolves-spring24.tgz ```

![Alt text](docs/img/werewolves/werewolves-extract.png)

- Change working directory to extracted folder path

- Run ```./install.sh```

![Alt text](docs/img/werewolves/werewolves-install.png)
- Install python2 as the project requires python  2: ```sudo apt install python2```

![Alt text](docs/img/werewolves/werewolves-python2.png)

- Run server.py

![Alt text](docs/img/werewolves/werewolves-runserver.png)


##### POSSIBLE ERRORS

1. Unable to locate python2

Cancel installation and run ```sudo apt update``` and ```sudo apt upgrade```
![image](https://github.com/jthak002/cse536spring24/assets/12949012/61225d01-7b02-413a-8a41-d998214bfba3)
