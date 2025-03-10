
#!/user/bin/env bash
sudo apt update && sudo apt install nodejs npm

# Install pm2 which is a production process manager for NOde.js with a built-in load balancer
sudo npm install -g pm2

# Stop any instance of our application running currently
pm2 stop SimpleApplication

# Change directory into folder where application is donwloaded
cd SimpleApplication/

# Install application dependencies
npm install
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

# Start the applicatin with the process name SimpleApplication using pm2
pm2 start ./bin/www --name SimpleApplication
