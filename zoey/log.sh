#!/bin/bash

notes_path=$(cat notes_path.txt)
local_repo_path=$notes_path
remote_repo=$(cat remote_repo.txt)
git_cmd_base="git --git-dir $local_repo_path"

path=$notes_path/$(date +%Y)/$(date +%b | tr A-Z a-z)

if [ ! -d $path ]
then
    mkdir -p $path
fi

txt_file_path=$path/$(date +%_d).txt

gedit $txt_file_path

$git_cmd_base add .
$cmt_msg_date="$(date +%_d) $(date +%b)"
$git_cmd_base commit -m "$cmt_msg_date"
$git_cmd_base push origin master