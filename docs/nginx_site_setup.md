### Nginx Site Setup

#### Performs
- Creates named nginx config file
- Create symbolic link to file in sites-enabled directory
- Creates static assets directory with permissions and copies Nginx "hello world" file
- Populates Nginx config file
- Restarts Nginx

#### Requires
- run with `sudo`

#### Flags
- Main URL
  - Set this if it's the main url for the site, not a sub-domain
  - Usage `--main-url` or `-m`
- Non-static
  - Set this flag if the contents are not plain static files, i.e. a Docker project
  - Usage `--non-static` or `-ns`

#### Options
- URL
  - The url, without the protocol or 'www'
  - Usage `--url abd.xyz` or `-u abc.xyz`
- Port
  - Only is `-ns` flag is set, port for Docker projects
  - Usage `--port 0000` or `-p 0000`
- User
    - Enter the name of the user for directory permissions
    Usage `--user abduljabbar` or `-us abduljabbar`


