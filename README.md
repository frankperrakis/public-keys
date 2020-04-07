# public-keys
My public ssh and gpg keys 

Make sure **gpg** and **curl** is installed in your system before attempting any of the following 

## To import all my ssh and gpg keys
Fetch and run the script 
```shell
sh -c "$(curl -fsSL https://gitlab.com/frankper/public-keys/-/raw/master/install_frank.sh)"
```
## To import only my ssh keys
```shell
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/authorized_keys >> ~/.ssh/authorized_keys
```
## To import only my gpg keys
### From Ubuntu GPG keyserver
```shell
# yubikey
curl -sSL https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xa59e931a849979fc | gpg --import -
# gpg card 001 
curl -sSL https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5faddad63d31b26a | gpg --import -
# gpg card 002
curl -sSL https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x1e81e951285219b0 | gpg --import -
# gpg card 003.v2-v3
curl -sSL https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x1ebbdb2a2fe0dc7d | gpg --import -
```
### From my gitlab repo
```shell
# yubikey 
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.yubikey.asc  | gpg --import -
# gpg card 001 
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.gpg001.asc | gpg --import -
# gpg card 002 
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.gpg002.asc | gpg --import -
# gpg card 003 
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.gpg003.v2-v3.asc | gpg --import -
```