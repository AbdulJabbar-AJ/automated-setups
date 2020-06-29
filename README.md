# Automated Setups

The scripts in this repo are intended for use with Digital Ocean (DO) Droplets when using their Ubuntu OS image. They may be usable or modified to be used on any other setup.

The `Initial Server Setup` should always be run first on a new server, and you must have a valid SSH key selected when creating the droplet.

Each script has a corresponding 'doc' file in the `docs` folder, which serves instructions on how to use the scripts.

# Remote Usage
If you'd like to run any of these scripts without manually downloading the file, you can use curl or wget or something similar, as these scripts are public.

Here is an example usage. Make sure to replace $SCRIPT with the correct script name, and add any flags or options before the `&& rm script.sh`. This will also delete the script after running it.

`curl -Lo script.sh https://raw.githubusercontent.com/AbdulJabbar-AJ/automated-setups/master/scripts/$SCRIPT.sh && bash script.sh && rm script.sh`


