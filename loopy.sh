#start timemachine backup
/usr/bin/tmutil startbackup
sleep 5

#DEFINE YOUR DRIVE HERE
drive=Jupiter

/usr/bin/tmutil status | grep "Running = 0;" &>/dev/null
 tmstatus=$( echo $? )   
until [ $tmstatus = "0" ]
do
   /usr/bin/tmutil status | grep "Running = 0;" &>/dev/null  #refresh output to check at the beginning
   tmstatus=$( echo $? )   #refresh "tmstatus" to read again @until and finish the loop if possible
sleep 5
  if [[ $tmstatus = "1" ]]
  then
    continue
  elif [[ $tmstatus = "0" ]]
  then
echo "break"
    diskutil unmount $drive
sleep 2
osascript -e 'display notification "Success!" with title "Timemachine backup finished and drive unmounted"
sound
name "Sosumi"'
    break
  fi
done
