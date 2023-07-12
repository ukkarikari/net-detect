#!/bin/bash

# ========================================================
#	this script scans availible wifi networks
#	and triggers a command once a network with a
#	certain word is chosen
#	by ukkarikari
# ========================================================


#recieve network handle to scan
echo -n "enter network name: "
read target

#main routine
while true ; do

	# nmcli scan and stores all availible networks 
	# to the file "net_buffer" in plain text
	nmcli dev wifi > /tmp/net_buffer

	#conditional checks if the name of the target network
	#shows up in the net_buffer file
	if grep -q -i $target /tmp/net_buffer; then
		
		echo -n "target network has been detected!!"
		
		# payload activated
		./payload.sh
		
		#clear net_buffer file
		echo -n "" > /tmp/net_buffer


	else 
		echo "target network not detected"
	fi
	
	#wait for next scan
	sleep 30
done
