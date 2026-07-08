clear
echo -e "\e[47m\e[31mPWD:`pwd`\e[0m"
echo -e "\e[47m\e[31mCurent user:$USER\e[0m"
echo -e "\e[1mWelcom To Linux Manager\e[0m\nYour Option IS: 
1.Process Manager
2.File Manaer
3.Package Manager
4.About
\n\e[36mPlize Select Your Choice :\e[0m"
read arg

case $arg in 
	1)
		bash processMNG.sh
                ;;
        2)
		bash filesystemMNG.sh
		;;
	3)
		bash packageMNG.sh
		;;
	4)
		echo -e "\n\nThis app written By\e[1mPoria bayatloo\e[0mjust for training"
		echo -e "\e[1mEnjoy...\e[0m\n\n"
		;;
        *)     
		echo "Incorrect choice"
esac
	

