#!/bin/bash

notes_path=$(cat notes_path.txt)
local_repo_path=$notes_path
#remote_repo=$(cat remote_repo.txt)
git_cmd_base="git --git-dir $local_repo_path/.git --work-tree $local_repo_path/"

path=$notes_path/$(date +%Y)/$(date +%b | tr A-Z a-z)
echo $path

if [ ! -d $path ]
then
    mkdir -p $path
fi

txt_file_path=$path/$(date +%_d).txt

gedit --new-window $txt_file_path
read -p "continue?"

$git_cmd_base add $txt_file_path
cmt_msg_date="$(date +%_d) $(date +%b)"
#echo $cmt_msg_date
$git_cmd_base commit -m "$cmt_msg_date"
$git_cmd_base push origin master