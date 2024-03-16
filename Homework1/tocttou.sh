#######################################################################################################
# this is a bash implementation of the tocttou vulnerability for werewolves 
# run this script everytime before a new game starts - it reads the publically available nextround file
# to find the next possible moderator file which will be generated; it will keep polling the creation of
# the file using a `tail -f` command - this opens the file and keeps the file descriptor open to follow
# contents of the file, if new text is added
#######################################################################################################
#!/bin/bash

nextGame=$(cat /home/moderator/log/nextround)

while true
do
        tail -f /home/moderator/log/${nextGame}m.log
        if [ $? -eq 1 ]; then
                continue
        else
                nextGame=$(cat /home/moderator/log/nextround)
        fi
done
