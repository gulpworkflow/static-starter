#!/usr/bin/env bash

# Formatting stuff
bold=$(tput bold)
normal=$(tput sgr0)

# Download gulp-starter
echo -e "\n--> Download gulp-starter\n"
curl -L https://github.com/ripestudios/gulp-workflow/archive/master.zip > gulp-workflow-master.zip

# Unzip gulp-starter
echo -e "\n--> Extract\n"
unzip gulp-workflow-master.zip

# Get static starter repository
echo -e "\n--> Downloading Static Starter\n"
# curl -L https://github.com/ripestudios/gulp-starter/archive/master.zip > gulp-starter-master.zip
git clone git@github.com:ripestudios/src--static-site.git

# Get Submodules
echo -e "\n--> Getting Submodules\n"
cd src--static-site
git submodule init
git submodule update
touch remove.md

# Remove git module meta
echo -e "\n--> Removing Submodule meta\n"

# Remove git directory
rm -rf .git

# Remove all git module meta
find . -type f -name ".git" -exec rm -f {} \;
find . -type f -name ".gitmodules" -exec rm -f {} \;

# Copy Contents and remove
cp -r ./src ../

# Choose if user would like to install node modules
while true; do
  read -p "${bold}Would you like to install node modules? *Warning the install is around 200MB* (yes/no)${normal}" yn
  case $yn in
    # If yes download run npm install
    [Yy]* ) echo -e "\n--> Install node modules\n"; npm install; break;;
    # If not exit
    [Nn]* ) break;;
    * ) echo "${bold}Please answer yes or no.${normal}";;
  esac
done

# Remove install scripts
echo -e "\n--> Removing install files\n"
cd ../
rm -rf gulp-workflow-master.zip
# rm -rf ./script

# Install Complete
echo -e "${bold}Install Complete${normal}"
echo -e "${bold}Enjoy!${normal}"