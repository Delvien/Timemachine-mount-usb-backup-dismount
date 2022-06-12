#DEFINE YOUR DRIVE HERE
drive=Jupiter

#Check if $drive is mounted
/usr/sbin/diskutil info $drive | grep "Mounted:                   Yes"$>/dev/null
#puts the 1 or 0 into the variable
diskmountedyes=$( echo $? )

#variable for check if disk is even present on the system
notplugged=$(diskutil info $drive 2>&1)

#Check if disk is present - if not - errors with a notification (Monterrey or greater,
#have not tested with older versions
#continues if drive is plugged in - if not mounted mount it and start the loopy script
#OR if drive is already mounted then just start the loopy script

if [[ $notplugged = "Could not find disk: $drive" ]]
then
osascript -e 'display notification "External drive not plugged in" with title "Timemachine backup failed to start" sound name "Sosumi"'
exit
elif [[ $diskmountedyes == 1 ]]
then
    diskutil mount $drive
     sleep 10
    /usr/local/bin/loopy.sh
elif [[ $diskmountedyes == 0 ]]
then
 echo "Disk mounted ... starting backup"
 echo "starting backup now...after 5s sleep"
     sleep 5
    /usr/local/bin/loopy.sh
else
exit
fi

