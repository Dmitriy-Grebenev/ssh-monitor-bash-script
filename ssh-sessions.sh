#!/bin/bash

# Get the list of users with SSH sessions
users=$(who | grep -E 'pts|tty' | awk '{print $1}')

# Loop through the users and get their processes
for user in $users; do
  echo "Sessions for $user:"
  ps -u $user -o pid,tty,cmd | grep sshd
done

# Here's how the script works:

# The who command lists all logged-in users and their sessions.
# We use grep and awk to filter out only the users who have SSH sessions. 
# Specifically, we look for lines that contain "pts" or "tty", 
# which are the device names used by SSH sessions.

# We loop through the list of SSH users and use the ps command to get information about their processes. 
# The -u option specifies the user whose processes we want to see, 
# and the -o option lets us specify the output format. 
#bWe're interested in the process ID (pid), the terminal device (tty), and the command line (cmd).
# We use grep to filter out only the lines that contain "sshd", which is the name of the SSH server process. 
# This gives us a list of the user's SSH sessions, along with the process IDs.
