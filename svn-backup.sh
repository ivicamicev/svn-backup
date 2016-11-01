#!bin/bash
# Autor: Ivica Micev

#TODO:
#mount nfs share first - mount nfs-server-ip:/volume/folder /mnt/nfs
# Where to backup / Backup Location
backup_path="/mnt/nfs" 

#Path to repositoryies
repo_path="/var/www/repos" 

#Create list of your repositories for backing up, in this case this list should be in same directory wth this script
list_repos="repositories.txt" 

echo "Start backing up"

cat $list_repos | while read LINE
	do
		svnadmin dump $repo_path/$LINE | gzip -9 > $backup_path/$LINE-$(date +"%Y-%m-%d-%T").dump.gz
	done

echo "Finish"
