#!/usr/bin/env bash
################################################################################
# Name           | Description                                   | Version
################################################################################
# local_setup.sh | Moves environment specific files             | 1
#                | from var/<environment>/terraform to           |
#                | components/terraform and removes copied files |
################################################################################
# Usage - run from top level of repo ./componenets/scripts/local_setup.sh

################################################################################
# Script prompt
################################################################################
echo
echo -e "\033[1;34m Local Terraform Setup \033[0m"
echo ----------------------------------------------------------
echo 1. Move variables to terraform directory               
echo 2. Move variables into variables directory             
echo
read -p "Enter a corresponding number from the list above: " MOVE_OPTION
read -p "Enter environment name: " ENVIRONMENT

################################################################################
# variables
################################################################################
TERRAFORM_DIRECTORY="components/terraform"
variables_DIRECTORY="var/$ENVIRONMENT/terraform"

################################################################################
# Directory Check
################################################################################
echo
echo "Current Terraform directory: $TERRAFORM_DIRECTORY"
[ ! -d "$TERRAFORM_DIRECTORY" ] && echo "Directory $TERRAFORM_DIRECTORY DOES NOT exists."
echo "Current Terraform variables directory: $variables_DIRECTORY"
[ ! -d "$variables_DIRECTORY" ] && echo "Directory $variables_DIRECTORY DOES NOT exists."

################################################################################
# Move Block
################################################################################
if [ $MOVE_OPTION -eq 1 ]
then
    mv $variables_DIRECTORY/* $TERRAFORM_DIRECTORY/.
elif [ $MOVE_OPTION -eq 2 ]
then
    mv $TERRAFORM_DIRECTORY/*auto.tfvars* $variables_DIRECTORY/.
    mv $TERRAFORM_DIRECTORY/backend.tf $variables_DIRECTORY/.
else
    echo 'Invalid option, exiting script'
fi
