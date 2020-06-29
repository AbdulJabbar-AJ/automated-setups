### Initial Server Setup

#### Performs
- Create a new user with same name group
- Adds user to sudo group
- Moves authorised keys from root to new user's home .ssh diretory
- Allows SSH access via new user

#### Options
- Username
  - Usage `--username $USER` or `-u $USER`
- Password
  - Will be prompted for password


#### A note on ssh authentication
These are the default settings in /etc/ngnix/nginx.conf when creating droplet with ssh key from DO dashboard.
  - PermitRootLogin yes
  - PasswordAuthentication no
  - ChallengeResponseAuthentication no
  - UsePAM yes

This is acceptable as it allows root access but prevents password authentication
