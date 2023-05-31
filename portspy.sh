#!/bin/bash

#header design
echo -e "
              \e[1;5;33m     Welcome to \e[0m \e[1;5;31m
                   ███████████                      █████     █████████                      
                  ░░███░░░░░███                    ░░███     ███░░░░░███                     
                   ░███    ░███  ██████  ████████  ███████  ░███    ░░░  ████████  █████ ████
                   ░██████████  ███░░███░░███░░███░░░███░   ░░█████████ ░░███░░███░░███ ░███ 
                   ░███░░░░░░  ░███ ░███ ░███ ░░░   ░███     ░░░░░░░░███ ░███ ░███ ░███ ░███ 
                   ░███        ░███ ░███ ░███       ░███ ███ ███    ░███ ░███ ░███ ░███ ░███ 
                   █████       ░░██████  █████      ░░█████ ░░█████████  ░███████  ░░███████ 
                   ░░░░░         ░░░░░░  ░░░░░        ░░░░░   ░░░░░░░░░   ███░░░    ░░░░░███ 
                                                                         ░███       ███ ░███ 
                                                                         █████     ░░██████  
                                                                        ░░░░░       ░░░░░░   \e[0m
                                                                  \e[1;5;33m           by Bikramjeetx\e[0m\n"
echo -e "\e[1;3;4;5;7;31mPlease choose an option:\e[0m \n"
echo -e "\e[1;36m1. Basic Scan     2 OS Detection     3. Vulnerability Scan     4. Script Scan     5.Full Scan     6. Exit\e[0m \n"


# READING & STORING USER INPUT
read -p "Enter your choice: " input
echo


#PERFORMING BASIC SCAN
basic_scan() {
        read -p "Enter the target IP address: " target
        echo -e "\e[1;5;91mPerforming Basic Port Scan...\e[0m"
        echo

#MAKING DIRECTORY
        mkdir -p "$PWD/$target"
        cd "$PWD/$target" || exit

#PERFORMING NMAP SCAN
        nmap -p- "$target" > basic_scan.txt
        
        cd ..
        echo -e "\e[1;5;92mBasic Port Scan completed. Results saved in $PWD/basic_scan.txt\e[0m"
        echo
}



#PERFORMING OS DETECTION
os_detection() {
        read -p "Enter the target IP address: " target
        echo -e "\e[1;5;91mPerforming OS Detection...\e[0m"
        echo

#CHECKING AND MAKING DIRECTORY
        if [ ! -d "$PWD/$target" ]; then
             mkdir -p "$PWD/$target"
             cd "$PWD/$target" || exit
        fi

#PERFORMING NMAP SCAN
        nmap -O "$target" > OS_scan.txt
        
        cd ..
        echo -e "\e[1;5;92mOS Scan completed. Results saved in $PWD/OS_scan.txt\e[0m"
        echo
}



#PERFORMING VULNERABILITY SCAN
vul_scan() {
        read -p "Enter the target IP address: " target
        echo -e "\e[1;5;91mPerforming Vulnerability Scan...\e[0m"
        echo

#CHECKING AND MAKING DIRECTORY
        if [ ! -d "$PWD/$target" ]; then
             mkdir -p "$PWD/$target"
             cd "$PWD/$target" || exit
        fi

#PERFORMING NMAP SCAN
        nmap -p- --script-vuln "$target" > vuln_scan.txt
        
        cd ..
        echo -e "\e[1;5;92mVulnerability Scan completed. Results saved in $PWD/vuln_scan.txt\e[0m"
        echo
}



#PERFORMING SCRIPT SCAN
script_scan() {
        read -p "Enter the target IP address: " target
        echo -e "\e[1;5;91mPerforming Script Scan...\e[0m"
        echo

#CHECKING AND MAKING DIRECTORY
       if [ ! -d "$PWD/$target" ]; then
             mkdir -p "$PWD/$target"
             cd "$PWD/$target" || exit
        fi

#PERFORMING NMAP SCAN
        nmap -sC "$target" > script_scan.txt
        
        cd ..
        echo -e "\e[1;5;92mScript Scan completed. Results saved in $PWD/script_scan.txt\e[0m"
        echo
}



#PERFORMING FULL SCAN
full_scan() {
        read -p "Enter the target IP address: " target
        echo -e "\e[1;5;91mPerforming Full Scan. This may take a while...\e[0m"
        echo

#CHECKING AND MAKING DIRECTORY
       if [ ! -d "$PWD/$target" ]; then
             mkdir -p "$PWD/$target"
             cd "$PWD/$target" || exit
        fi

#PERFORMING NMAP SCAN
        nmap -p- -A "$target" -v > full_scan.txt
        
        cd ..
        echo -e "\e[1;5;92mFull Scan completed. Results saved in $PWD/full_scan.txt\e[0m"
        echo
}


# performing actions based on provided input
case $input in
    1)
        basic_scan
        ;;
    2)
        os_detection
        ;;
    3)
        vul_scan
        ;;
    4) 
        script_scan
        ;;
    5)  
        full_scan
        ;;

    6)  
        echo -e "\e[38;5;82m Exiting...\e[0m"
        ;;
    *)
        echo -e "\e[1;5;31mInvalid Input! Please select a valid option...\e[0m"
        ;;

esac                                                  


perform_task() {
    echo -e "\e[1;3;4;5;7;31mPlease choose an option:\e[0m \n"
    echo -e "\e[1;36m1. Basic Scan     2 OS Detection     3. Vulnerability Scan     4. Script Scan     5.Full Scan     6. Exit\e[0m \n"

    # READING & STORING USER INPUT
    read -p "Enter your choice: " input
    echo
    case $input in
    1)
        basic_scan
        ;;
    2)
        os_detection
        ;;
    3)
        vul_scan
        ;;
    4) 
        script_scan
        ;;
    5)  
        full_scan
        ;;
    6)  
        echo -e "\e[38;5;82m Exiting...\e[0m"
        ;;
        
    *)
        echo -e "\e[1;5;31mInvalid Input! Please select a valid option...\e[0m"
        ;;

esac        

another_task_or_exit
}

#ASKING FOR FURTHER TASKS
another_task_or_exit() {
    read -p "Do you want to perform another task? (Y/N): " choice
    echo
    case $choice in
        [Yy]) 
            perform_task ;; #function for further task
        [Nn]) 
            echo -e "\e[38;5;82mExiting...\e[0m" ;;  # If the choice is N or n, exit the script
        *) 
            echo -e "\e[1;5;31mInvalid input! Please enter Y or N.\e[0m" ; 
            another_task_or_exit ;;  # If the choice is neither Y nor N, ask again
    esac
 }

 another_task_or_exit
