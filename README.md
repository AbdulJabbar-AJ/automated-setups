# Automated Setups

The scripts in this repo are intended for use with Digital Ocean (DO) Droplets when using their Ubuntu OS image. They may be usable or modified to be used on any other setup.

The `Initial Server Setup` should always be run first on a new server, and you must have a valid SSH key selected when creating the droplet.

------
## Initial Server Setup  
This script can be used when you have already provided your ssh key to DO/your cloud provider. If you are using DO, you must select the correct ssh key when creating a new droplet. If you are using a different cloud provider, much of the same, make sure you have provided your ssh key and your provider can run some scripts or other mechanism to pass your key to the ~/.ssh/authorized_keys file in the root user.

# Remote Usage
If you'd like to run any of these scripts without manually downloading the file, you can use curl or wget or something similar. Here is an example usage, make sure to add any flags or options before the '
    
    curl -Lo script.sh https://raw.githubusercontent.com/AbdulJabbar-AJ/automated-setups/master/scripts/initial_server_setup.sh && bash script.sh && rm script.sh




#### Usage
When you run the script, you will be prompted for 2 things; username and password.

To run the script from file, download and enter the command:

    bash initial_server_setup.sh

To run the script without downloading the file, enter the command:

    

------

## ZSH and Oh My Zsh Setup

#### Usage

To run the script from file, download and enter the command:

    bash zsh_setup.sh

To run the script without downloading the file, enter the command:

    curl -Lo zsh_setup.sh https://raw.githubusercontent.com/AbdulJabbar-AJ/automated-setups/master/scripts/zsh_setup.sh && bash zsh_setup.sh && rm zsh_setup.sh



#### Themes
The default theme is `robbyrussell`. If you wish to change the theme, you must specify a valid Oh My Zsh pre-installed theme.

A list of themes can be found in the [Oh My Zsh GitHub Docs](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)


To change the theme, use the `-t` or `--theme` flag followed by the theme name. For example:

  * `bash zsh_setup.sh -t [THEME_NAME]`
  * `bash zsh_setup.sh --theme [THEME_NAME]`

Alternatively, just add the `-t` or `--theme` flag, and you will be prompted to enter a theme name.


If you want to use the script without downloading the file, you can use the following command, replacing [THEME_NAME] with your theme.

    curl -Lo zsh_setup.sh https://raw.githubusercontent.com/AbdulJabbar-AJ/automated-setups/master/scripts/scripts/zsh_setup.sh && bash zsh_setup.sh -t [THEME_NAME] && rm zsh_setup.sh
