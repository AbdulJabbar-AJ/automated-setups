# Automated Setups

The scripts and document in this repo were originally intended to add a level of automation to Digital Ocean Droplet (DO) setups when adding a server from their web UI. If you want a more automated, comprehensive, and customisable solution, then I suggest you check out DO's API and/or CLI docs.

This repo is for `Ubuntu v18.04` and upwards, using `Bash` scripts. They may work on other versions or distributions of linux, but I cannot confirm this.

The `Initial Server Setup` and `Zsh and Oh My Zsh Setup` are independent from one another, however they are included in the same repo as I tend use the first script as root to set up the server, then log in as a normal user and perform zsh setup.

------
## Initial Server Setup  
This script can be used when you have already provided your ssh key to DO/your cloud provider. If you are using DO, you must select the correct ssh key when creating a new droplet. If you are using a different cloud provider, much of the same, make sure you have provided your ssh key and your provider can run some scripts or other mechanism to pass your key to the ~/.ssh/authorized_keys file in the root user.

#### Usage
When you run the script, you will be prompted for 2 things; username and password.

To run the script from file, download and enter the command:

    bash initial_server_setup.sh

To run the script without downloading the file, enter the command:

    curl -Lo initial_server_setup.sh https://raw.githubusercontent.com/AbdulJabbar-AJ/automated-setups/master/initial_server_setup.sh && bash initial_server_setup.sh && rm initial_server_setup.sh

------

## ZSH and Oh My Zsh Setup

#### Usage

To run the script from file, download and enter the command:

    bash zsh_setup.sh

To run the script without downloading the file, enter the command:

    curl -Lo zsh_setup.sh https://raw.githubusercontent.com/AbdulJabbar-AJ/automated-setups/master/zsh_setup.sh && bash zsh_setup.sh && rm zsh_setup.sh



#### Themes
The default theme is `robbyrussell`. If you wish to change the theme, you must specify a valid Oh My Zsh pre-installed theme.

A list of themes can be found in the [Oh My Zsh GitHub Docs](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)


To change the theme, use the `-t` or `-theme` flag followed by the theme name. For example:

  * `bash zsh_setup.sh -t [THEME_NAME]`
  * `bash zsh_setup.sh -theme [THEME_NAME]`

Alternatively, just add the `-t` or `-theme` flag, and you will be prompted to enter a theme name.

You may want to log out and log back in again for changes to take affect.



If you want to use the script without downloading the file, you can use the following command, replacing [THEME_NAME] with your theme.

    curl -Lo zsh_setup.sh https://raw.githubusercontent.com/AbdulJabbar-AJ/automated-setups/master/zsh_setup.sh && bash zsh_setup.sh -t [THEME_NAME] && rm zsh_setup.sh
