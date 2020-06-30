### Doctl Add Domain

#### Performs
Confirms $DO_PROJ_NAME, $DO_PROJ_ID variables
Creates Digital Ocean URL resource based on $URL and $DO_PROJ_IP

#### Requires
- doctl to be installed
- don't run as `sudo`

#### Flags
- Quiet
  - Set this flag to skip DO project check and prompt
  - Usage `--quiet` or `-q`


#### Options
- URL
  - The url, without the protocol or 'www'
  - Usage `--url abd.xyz` or `-u abc.xyz`
- IP Address
    - The IP address of the Digital Ocean droplet. Currently there's no stable way to reteive this from DO or the the shell.
    - Usage `--ip-address 00.00.00.00` or `-ip 00.00.00.00`

