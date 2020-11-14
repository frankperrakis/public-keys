#!/usr/bin/env bash
# Script to install all of Frank's ssh and gpg keys 
# tested in Ubuntu 20.04 ,fedora 31, wsl2

# Function to print in specified color
colorprintf () {
    case $1 in
        "red") tput setaf 1;;
        "green") tput setaf 2;;
        "orange") tput setaf 3;;
        "blue") tput setaf 4;;
        "purple") tput setaf 5;;
        "cyan") tput setaf 6;;
        "gray" | "grey") tput setaf 8;;
        "white") tput setaf 7;;
    esac
    echo "$2";
    tput sgr0
}

check_dependencies () {
colorprintf red "Checking Dependencies"
for dep in ${dependencies[@]}; do 
  if ! type "${dep}" > /dev/null; then
    colorprintf red "${dep} does not exist in your system ,script will now exit"
    exit 0 
  fi 
done
}

ssh_auth_keys () {
colorprintf red "Installing SSH Auth Keys"
touch $HOME/.ssh/authorized_keys
colorprintf white "$(curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/authorized_keys | xargs -0 echo | grep -i "ssh-rsa" -B 1 | grep -vE 'ssh-rsa|^--$')"
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/authorized_keys >> $HOME/.ssh/authorized_keys
}

gpg_keys () {
colorprintf red "Installing All GPG Keys"
for key in ${gpgKeyNames[@]}; do 
  curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.${key}.asc | gpg --import - 
done 
}

# set script name below 
pick_name="Script to install Frank's ssh/gpg keys"
colorprintf orange "Running $pick_name"
# declare dependencies
declare -a dependencies=(curl wget gpg)
# declare gpg key names
declare -a gpgKeyNames=(gpg001 gpg002 yubikey gpg003.v2-v3)

check_dependencies
ssh_auth_keys
gpg_keys

colorprintf green "$pick_name Done"