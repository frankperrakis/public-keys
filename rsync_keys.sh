#!/usr/bin/env bash
# sync backup scripts in repo
# tested in Ubuntu 20.04 ,fedora 31
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

DeleteRun () {
    for folder in ${TargetFolderForDeletion[@]};do
        for file in ${FilesForDeletion[@]};do
            colorprintf red "Deleting ${file} in ${folder}"
            rm ${folder}/${file}
            colorprintf orange "Deleted ${file} in ${folder}"
            colorprintf cyan "Copy new ${file} in ${folder}"
            cp $source_folder/${file} ${folder}/
            colorprintf green "Copied new ${file} in ${folder}"
        done
    done
}

ExitMessage () {
duration=$(echo "$(date +%s.%N) - $start_time" | bc)
# execution_time=`colorprintf  "%.2f seconds" $duration`
colorprintf purple "${pick_name} Done in $(colorprintf  "%.2f seconds" ${duration})"
colorprintf green "Completed $pick_name"
}

SetTime (){
# set time 
start_time=$(date +%s.%N)
current_time=$(date +'%T-%d/%m/%Y')
}
GitCommitGithub (){
cd $TargetFolderForDeletion
git add . 
git commit -m "Automated Sync ${current_time}"
git push 
}

GitCommitGitlab (){
cd $source_folder
git add . 
git commit -m "Automated Sync ${current_time}"
git push 
}

SetTime
# set local location
local_location="$(echo $(pwd))"
# set script name below
pick_name="Sync Public Keys Script"
colorprintf green "Running $pick_name"
# unset variables
unset TargetFolderForDeletion
unset FilesForDeletion
# define main source of truth 
source_folder=~/projects/personal/public-keys
colorprintf purple "Source of trust is $source_folder"
# define folder targets for deletion 
declare -a TargetFolderForDeletion=(~/projects/personal/public-keys-github)
# define files for deletion 
declare -a FilesForDeletion=(rsync_keys.sh authorized_keys install_frank.sh README.md gpg-keys-urls)

DeleteRun
GitCommitGithub
GitCommitGitlab
ExitMessage

