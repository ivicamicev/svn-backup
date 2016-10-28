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

read_lines=`cat $list_repos`
	for line in $read_lines ; do
		svnadmin dump $repo_path/$line | gzip -9 > $backup_path/$line-$(date +"%Y-%m-%d-%T").dump.gz
	done

echo "Finish"
