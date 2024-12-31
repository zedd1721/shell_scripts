#!/bin/bash

#function to check Directory Exist or not
check_dir_string() {
        dir=$1
        find_text=$2
        replace_text=$3
        echo -e "\n"
        if [ ! -d $dir ]; then
                echo -e "Directory does not exist!! \n"
                exit 1
        elif [ -z "$dir" ] || [ -z "$find_text" ] || [ -z "$replace_text" ]; then
                echo -e "You have to enter <directory> <FindText> <ReplaceText> !! \n"
                exit 1

        else
                echo -e "Proceeding with directory: $dir \n"
        fi
}

#Function to find all text files and replace the text
find_replace() {
        dir=$1
        find_text=$2
        replace_text=$3

        for file in "$dir"/*.txt;
        do
                original=$(cat "$file")

                sed -i "s/$find_text/$replace_text/g" "$file"

                new=$(cat "$file")

                if [ "$original" != "$new" ]; then
                        echo "Modified File: $(basename "$file")"
                fi

        done


}


#Main Script

check_dir_string "$1" "$2" "$3"
find_replace "$1" "$2" "$3"
