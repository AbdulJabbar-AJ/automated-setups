### Nginx Site Setup

#### Performs
 --- Ignore flags --- | Task
- -q -sdo ----- | Confirms $DO_PROJ_NAME, $DO_PROJ_ID variables
- ------------- | Creates named nginx config file
- ------------- | Create symbolic link to file in sites-enabled directory
- -ns --------- | Creates static assets directory with permissions and copies Nginx "hello world" file
- -sdo -------- | Creates Digital Ocean URL resource based on $URL and $DO_PROJ_IP
- ------------- | Populates Nginx config file
- ------------- | Restarts Nginx

#### Requires
- doctl to be installed
- run with `sudo`

#### Flags
- Main URL
  - Set this if it's the main url for the site, not a sub-domain
  - Usage `--main-url` or `m`
- Non-static
  - Set this flag if the contents are not plain static files, i.e. a Docker project
  - Usage `--non-static` or `-ns`
- Quiet
  - Set this flag to skip DO project check and prompt
  - Usage `--quiet` or `-q`
- Skip DO Stuff
  - Set this flag to skip all Digital Ocean stuffs, i.e. If domain already exists, or for test runs
  - Usage `--skip-do` or `-sdo`										

#### Options
- URL
  - The url, without the protocol or 'www'
  - Usage `--url abd.xyz` or `-u abc.xyz`
- Port
  - Only is `-ns` flag is set, port for Docker projects
  - Usage `--port 0000` or `-p 0000`


#### Examples
- For static site
	- `sudo bash nginx_site_setup.sh -m? -q? -u abc.xyz`
	- `sudo bash nginx_site_setup.sh -m? -q?` ==> Prompt for url
- For Docker project
 - `sudo bash nginx_site_setup.sh -ns -q? -url abc.xyz -p 8000`
 - `sudo bash nginx_site_setup.sh -ns -q?` ==> Prompt for url & port

? = optional


--- 
** Still need way of finding ip address of target droplet
