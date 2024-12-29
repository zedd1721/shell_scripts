#!/bin/bash

<<note

Script that organizes files in a directory by file types.

note

#function to check Directory Exist or not
check_directory() {
        dir=$1
        echo -e "\n"
        if [ ! -d $dir ]; then
                echo -e "Directory does not exist!! \n"
                exit 1
        elif [ -z "$dir" ]; then
                echo -e "You have not entered directory!! \n"
                exit 1

        else
                echo -e "Proceeding with directory: $dir \n"
        fi
}

#function to create folder if they exist or not
create_folder() {
        dir=$1
        for folder in "Documents" "Images" "TextFiles" "Others"; do
                if [ -d "$dir/$folder" ]; then
                        echo "Folder Already Exist: $folder"
                else
                        mkdir $dir/$folder
                        echo "Folder Created: $folder"
                fi
        done
        echo -e "\n"

}

#Function to organize files according to its type.
organize_files() {
        dir=$1

        txtFile=0
        imageFile=0
        documentFile=0
        otherFile=0
        for file in "$dir"/*; do
                if [ -f "$file" ]; then
                        ext="${file##*.}"

                        if [ "$ext" == "txt" ]; then
                                mv "$file" "$dir/TextFiles/"
                                ((txtFile++))
                        elif [ "$ext" == "jpg" ] || [ "$ext" == "png" ]; then
                                mv "$file" "$dir/Images/"
                                ((imageFile++))
                        elif [ "$ext" == "pdf" ] || [ "$ext" == "doc" ]; then
                                mv "$file" "$dir/Documents/"
                                ((documentFile++))
                        else
                                mv "$file" "$dir/Others/"
                                ((otherFile++))
                        fi
                fi
        done
        echo "Moved $txtFile text files to TextFiles"
        echo "Moved $imageFile image files to Images"
        echo "Moved $documentFile PDF files to Documents"
        echo "Moved $otherFile files to Others"
        echo -e "\n"
        echo "All files moved into their desired Folder....."

}

#Main Script
check_directory "$1"

create_folder "$1"

organize_files "$1"
