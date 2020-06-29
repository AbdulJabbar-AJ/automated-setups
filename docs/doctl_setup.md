### Doctl Setup

#### Performs
- Installs doctl command line tools
- Authenticate Digital Ocean account
- Installs doctl completions for ZSH

#### Requires
- A valid DO API Token, will be prompted to enter

#### Flags and Options
- Context
  - Name of authenticating user/machine:
  - Usage `--context $CONTEXT_NAME` or `-c $CONTEXT_NAME`
- Distro
  - System to be installed on, default is linux-amd64
  - Usage `--distro $DISTRO` or `-d $DISTRO`
- Version
    - Version of doctl to be installed, default is 1.45.1
    - Usage `--version 0.00.0` or `-v 0.00.0`
- Darwin (flag)
    - Set this flag if installing on a mac
    - Usage `--darwin`
    - Don't user with -d option
