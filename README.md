# ARia on heroKU


This is a fork of [this](https://github.com/xinxin8816/heroku-ariang-21vianet) repository.

## Changes
* Static RClone
* Static Aria2
* Offline DHT & DHT6 files
* Direct access to *Download* folder

## Hoe to deploy

* Clone this project and navigate to its folder

* Create a Heroku account
* Intall Heroku-CLI
  ```bash
  curl https://cli-assets.heroku.com/install.sh | sh
  ```
* Login in to heroku
  ```bash
    heroku login -i
  ```
  Enter email and password to proceed. 

* Login to heroku container section
  ```bash
    heroku container:login
  ```
  No credentials required.
  
* Create a new app on Heroku
  ```bash
    heroku create app <your-app-name>
  ```
* Create ENV variables
  ```bash
    heroku config:set -a <your-app-name> ARIA2C_SECRET=<your-secret>
    heroku config:set -a <your-app-name> HEROKU_APP_NAME=<your-app-name>
  ```
* Create Optional ENV variables for RClone
  ```bash
    heroku config:set -a <your-app-name> RCLONE_CONFIG=<single-line-config> # Replace all linebreaks with \n
    heroku config:set -a <your-app-name> RCLONE_DESTINATION=/               # Set root folder as destination
  ```  
* Build Docker Image
  ```bash
    docker build -t arku .   # We named the image arku, feel free to name it whatever you like
  ```
* Tag the created image in the way that Heroku understand
  ```bash
    docker tag arku registry.heroku.com/<your-app-name>/web
  ```
* Push the image to Heroku
  ```bash
    docker push registry.heroku.com/<your-app-name>/web     
  ```
* Release the container
  ```bash
    heroku container:release web -a <your-app-name>
  ```
* Open up the GUI
  ```bash
    http://<your-app-name>.herokuapp.com   
  ```
  #### Using Heroku dashboard and clicking "Open App" opens up the GUI with HTTPS schema and cause error so use HTTP
