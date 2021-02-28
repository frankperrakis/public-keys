Table of Contents
=================

   * [public-keys](#public-keys)
      * [To import all my ssh and gpg keys](#to-import-all-my-ssh-and-gpg-keys)
      * [To import only my ssh keys](#to-import-only-my-ssh-keys)
      * [To import only my gpg keys](#to-import-only-my-gpg-keys)
         * [From Ubuntu GPG keyserver](#from-ubuntu-gpg-keyserver)
         * [From my gitlab repo](#from-my-gitlab-repo)
   * [repo tree](#repo-tree)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)
# public-keys
My public ssh and gpg keys 

Make sure **gpg** and **curl** is installed in your system before attempting any of the following 

## To import all my ssh and gpg keys
Fetch and run the script 
```shell
curl -fsSL https://gitlab.com/frankper/public-keys/-/raw/master/install_frank.sh | bash -s -- -a

```
## To import only my ssh keys
```shell
curl -fsSL https://gitlab.com/frankper/public-keys/-/raw/master/install_frank.sh | bash -s -- -s
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
curl -fsSL https://gitlab.com/frankper/public-keys/-/raw/master/install_frank.sh | bash -s -- -g
```
# repo tree
```shell
0 directories, 9 files
.
├── authorized_keys
├── frank.perrakis.gpg001.asc
├── frank.perrakis.gpg002.asc
├── frank.perrakis.gpg003.v2-v3.asc
├── frank.perrakis.yubikey.asc
├── gpg-keys-urls
├── install_frank.sh
├── README.md
└── rsync_keys.sh
```