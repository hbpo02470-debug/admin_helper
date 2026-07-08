clear
echo -e "\e[47m\e[31mPWD:`pwd`\e[0m"
echo -e "\e[47m\e[31mCurrent User:$USER\e[0m"
echo -e "\e[47m\e[31mThis is Process Manager\e[0m"

PS3="Select Item... :"

select CHOICE in "Top 5 CPU% Usage" "Process More X CPU Usage" "Process More X Memory Usage" "Zombie Process" "kill Process" "Exit";do

        case $REPLY in
		1)
		       echo -e 	"\e[31m$CHOICE :\e[0m\n"
		       top -b -n 1 | head -n 12 | tail -n 6 
		      ;;

                2)     read -p "Enter Your CPU Usage % (Like 10.0)" cpuUsage
			echo '   PID  USER      PR   NI   VIRT  RES   SHR    S   %CPU %MEM TIME+COMMAND'
			top -b -n 1 |sed '1,6d'|awk -v cpu=$cpuUsage '{if($9>=cpu)print $0}'
			;;

		3)     read -p "Enter Your Usage Memory usage % (Like 10.0)" memUsage
                        echo '   PID  USER      PR   NI  VIRT  RES    SHR    S   %CPU  %MEM  TIME+COMMAND'
                        top -b -n 1 |sed '1,6d'|awk -v mem=$memUsage '{if($10>=mem)print $0}'
                        ;;

 		4)     echo "Your Zombie process :"
			ps aux | awk {'print $8'}|grep -c Z
			;;

		5)     read -p "Enter your process ID :" pid
			kill -9 $pid 2>/dev/null
			if [ $? -ne 0 ]
			then echo "PID NOT FOUND"
			else 
				echo "Process $pid killed ..."
			fi
			;;
		6)      clear
			echo $choice | tr [a-z] [A-Z]
			exit
			;;	
		*)
		       echo "Incorrect Choice"
	               break   
		       ;;
        esac
done

