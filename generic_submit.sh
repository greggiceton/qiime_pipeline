#!/bin/sh
#Script to generically submit a task to the queue
#
echo -e "\nPlease enter a 10 character job name\n"
read name
echo -e "\nDo you wish to be emailed job updates? Please type Yes if so\n"
read email_updates
if [$email_updates = Yes] then
  echo -e "\nPlease enter your email address\n"
  read email_address
  final_options = "-m abe -M $email_address"
fi
echo -e "\nPlease enter your command\n"
read cmd
qsub -N "$name" "$final_options" "cmd"
