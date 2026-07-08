clear
PS3="Select Item... :"
echo -e "\e[47m\e[31mPWD:`pwd`\e[0m"
echo -e "\e[47m\e[31mCurrent User:$USER\e[0m"
echo -e "\e[47m\e[31mThis is Package Manager\e[0m"


select CHOICE in "Updating Repository list" "Install package Info" "Repare package manager" "EXit";
do 
	case $REPLY in 
		1)
			sudo pacman -Sy
			;;
		2)
			read -p "Enter Package Name" pkgName
			sudo pacman -Si $pkgName > ./output/$pkgName-info
			echo "information in /output"
			;;
		3)	sudo pacman -Syu
			echo ""
			;;
		4) 	clear
			echo "By"
			exit
			echo ""
			;;
		*)
			echo "Incorrect Choice"
			break
			;;
	esac
done



