# Timemachine-mount-usb-backup-then-dismount
#A shell script utility that checks to see if your USB drive is attached, mount if not mounted, then run a pre-setup time machine backup, after the backup is done, it unmounts the drive.

This could be cleaner, but I don't do much scripting, and I'm not a programmer :)

There are two scripts here, the first being check-drives.sh which does the following:

check-drive.sh
1) Check if drive is present at all, error out with an on-screen notification
2) Check if drive is present but not mounted, mount it, then start loop script
3) If drive is already present and mounted, then start loop script

loopy.sh
1) Starts timemachine backup and waits 5 seconds
2) Checks if timemachine is running and loops to keep checking
3) Once loop shows timemachine is not running anymore it unmounts the defined drive and shows on-screen notification

Things you must know:

1) At minimum you must place loopy.sh in /usr/bin/local. If you do not, make sure to change check-drives.sh to point to the directory you put loopy.sh in.

2) You HAVE to define your drive name (check comments in both scripts.)

3) You can change the script however you want, as long as you dont try to sell it. (people try the darndest things)

PS: I am not responsible if you run this and blow up your machine. Troubleshooting is your responsibility. 

WHAT THIS SCRIPT DOES NOT DO:

It doesnt dismount your drive without running the script. Period. A scenario I would imagine would be: plug in your macbook into a dock which has the timemachine disk attached to it, your cronjob or manual run of this script isnt ran yet, you unplug and it doesnt eject the disk properly causing corruption.
Dont do this. Be smart, know the limitations of the script.
