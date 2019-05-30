# Overview

Xavier Brazeau 2019-05-30

Kronos Automation tool to configure the virtual machines (Nodes).

This repo is to be called remotely by a server on the node using the command: chef-solo -c ./solo.rb -j node.json

Installs:
	-Chrome
	-Firefox
	-Notepad++
	-Zulu 8

Uninstalls:
	-All oracle packages

#Vocabulary

-'cookbook'	- Directory with all the necessary files to achieve a task (scripts, files, variables, etc...)
-'Resource'	- Ruby script with a specific format compiled by the chef workstation to achieve a task
		  (ex : retrieve a file/remote_file, execute a powershell script, execute .exe/.msi, etc...)
 
# Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
	-> 'attributes' stores variables used by the cookbooks
	-> 'Files' 	files needed by the cookbook
	-> 'recipes'	Contains the resource scripts to be executed
	-> 'templates'	Used to create custom dynamic resources

- `data_bags/` - Store data bags and items in .json in the repository.
	-> N/A
- `roles/` - Store roles in .rb or .json in the repository.
	-> N/a
- `environments/` - Store environments in .rb or .json in the repository.
	->N/a

#Repository files

-'node.json' : 	Json file used to indicate in what order to execute the resource scripts,
		and from what cookbook they are to be retrieved from. node.json's path must be
		indicated using the -j flag when calling the chef-solo command

-'solo.rb' :	Mandatory configuration file which indicates the path of all the directories. 
		solo.rb's path must be indicated using the -c flag when calling the chef-solo command

# Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.
