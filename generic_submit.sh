#!/bin/sh
#Script to generically submit a task to the queue
#
error_path=$HOME/qsub_error_files
output_path=$HOME/qsub_error_files

echo -e "\nPlease enter a 10 character job name\n"
read name
if [ "${#name}" -ge "11" ]; then
        echo -e "Error - job name must be no more than 10 characters\n"
        exit
fi
echo -e "\nDo you wish to be emailed job updates? Please type Yes if so\n"
read email_updates
if [ "$email_updates" = "Yes" ]; then
  echo -e "\nPlease enter your email address\n"
  read email_address
  big_M="-M $email_address"
  little_m="-m abe"
fi
echo -e "\nPlease enter your command\n"
read cmd
temp_script=/tmp/$RANDOM.sh
echo $cmd > $temp_script
final=$(qsub -N "$name" -e "$error_path" -o "$output_path" "$big_M" "$little_m" "$temp_script")
#echo qsub -N "$name" -e "$error_path" -o "$output_path" "$big_M" "$little_m" "$temp_script"
echo $final