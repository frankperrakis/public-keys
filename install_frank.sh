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
# set script name below 
pick_name="Install Franks ssh/gpg keys"
colorprintf orange "Running $pick_name"

colorprintf red "Installing SSH Auth Keys"
# ssh auth keys 
touch $HOME/.ssh/authorized_keys
colorprintf white "$(curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/authorized_keys | xargs -0 echo | grep -i "ssh-rsa" -B 1 | grep -vE 'ssh-rsa|^--$')"
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/authorized_keys >> $HOME/.ssh/authorized_keys

colorprintf red "Installing All GPG Keys"
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.yubikey.asc  | gpg --import - 
# gpg card 001 
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.gpg001.asc | gpg --import - 
# gpg card 002 
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.gpg002.asc | gpg --import - 
# gpg card 003 
curl -sSL https://gitlab.com/frankper/public-keys/-/raw/master/frank.perrakis.gpg003.v2-v3.asc | gpg --import - 

colorprintf green "$pick_name Done"
