#!/bin/bash

# Database credentials
user=""
password=""
host="localhost"
db_name=""

# Other options
backup_path="/backup"
date=$(date +"%d-%b-%Y")

# Dump database into SQL file
mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql

# upload to dropbox
$backup_path/dropbox_uploader.sh upload $backup_path/$db_name-$date.sql $db_name-$date.sql