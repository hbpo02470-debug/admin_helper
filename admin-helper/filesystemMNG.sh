echo -e "\e[47m\e[31mPWD:`pwd`\e[0m"
echo -e "\e[47m\e[31mCurrent User:$USER\e[0m"
echo -e "\e[47m\e[31mThis is filesystem Manager\e[0m"

PS3="Select Item:"

select CHOICE in "System Disk information" "Mounted Disk Usage" "User Home DIR Usage" "Flie in X Disk Usage" "Delete file's With More X DIsk space Usage" "File accessed Among X days Ago" "file Modified Among X dayes Ago" "Exit"; do
	case $REPLY in 
		1)
		       	lsblk | grep sd
		        ;;
		2)
		       	df -lh | grep sd
			;;
		3)
		       	du -sh /home/$USER
			;;
		4) 
			read -p "Enter Size Kb" findsize
			find /home/poria -type f -size +"$findsize"k -exec ls -lh {} \;
			2>/dev/null | awk '{print $9":"$5}'>./output/$findsize-fileSize 
			;;
		5)    
		      	read -p "Enter Size in Kb :" delfile
			find /home/poria -type f -size +"$delfile"k -exec rm {} \; 2> /dev/null
			;;	
		6)    
		      	read -p "Enter Days (0-60)" atime
			find / -type f -atime -"$atime" > ./output/$atime-fileSize 2>/dev/null
			echo "done"
			;;
		7)
			read -p "Enter Days (0-60)" mtime
                        find / -type f -mtime -"$mtime" ./output/$mtime-filesize 2>/dev/null
                        echo "done"
			;;
		8)	
			clear
			echo $choice | tar [a-z] [A-Z]
			exit
			;;
		*)
		       	echo "Incorrect Choice"
		        exit
		        ;;
	esac
done

