### Initial Nginx Setup

#### Performs
- Installs Nginx
- Opens firewall ports 80 and 443 for Nginx web server
- Sets up global TLS encryption config (without installing certificates)
- Creates a default server code block in .../sites-available/default, routes all to 403 forbidden
- Restarts nginx

#### Requires
- A TLS certificates on machine
- Manually edit nginx.conf file for cert paths

#### Notes
- This setup only works if server serves one primary url, would have to configure differently if serving various urls from one server
