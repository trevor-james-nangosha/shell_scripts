#! /usr/bin/bash

# echo command
echo "hello world"

# variables
# they are uppercase by convention
# note that there are no spaces between the variable declaration and the initialisation
NAME="nangosha trevor james" 
echo ${NAME}

# user input 
read -p "Enter your name: " USER_ENTERED_NAME
echo "hello $USER_ENTERED_NAME nice to meet you."

# conditionals
# if 
if [ "$USER_ENTERED_NAME" == "nangosha" ]
then
    echo "your name is nangosha"
fi

# if-else
# you can also do elif
if [ "$USER_ENTERED_NAME" == "nangosha" ]
then
    echo "your name is nangosha"
else
    echo "your name is not nangosha."
fi

# comparisons
# we have some operators

# HERE IS A LIST OF SOME COMMON OPERATORS 
# -eq checks if two values are equal
# -ne checks if two values are not equal
# -gt greater than
# -lt less than
# -ge greater than or equal
# -le less than or equal

NUMBER_ONE=8
NUMBER_TWO=48
if [ "$NUMBER_TWO" -lt  "$NUMBER_ONE" ]
then
    echo "$NUMBER_ONE is greater than $NUMBER_TWO"
else
    echo "$NUMBER_ONE is less than $NUMBER_TWO"
fi

# FILE CONDITIONS 
# these are some common file operations
# -d file if the file is a directory
# -e file if the file exists(this is not so portable hence -f is normally preffered)
# -f file if the string provided is a file
# -g file if the group id is set on a file 
# -r file if the file is readable
# -s file true if the file has a non zero size 
# -u true if the user id is set on a file

FILE="test.txt"
if [ -f "$FILE" ]
then  
    echo "$FILE is a file."
else  
    echo "$FILE is not a file."
fi


# CASE STATEMENTS
read -p "are you in Makerere????? y/n " ANSWER
case "$ANSWER" in 
    [yY] | [yY][eE][sS])
    echo "you must attend freshers' ball"
    ;;
    [nN] | [nN][oO])
    echo "go the hell to kyambogo."
    ;;
*)
    echo "invalid input."
    ;;
esac

# LOOPS
# a simple for loop 
NAMES="trevor james nangosha"
for NAME in $NAMES
    do
        echo "hello $NAME"
done

# for loop to rename files . fun stuff
FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES
do 
    echo "renaming $FILE to new-$FILE "
    mv $FILE $NEW-$FILE
done

# WHILE LOOP 
# READ THROUGH A FILE LINE BY LINE 
LINE=1
while read -r CURRENT_LINE
do
    echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "./new-one.txt"

# FUNCTIONS
# A SIMPLE FUNCTION
function sayHello(){
    echo "hello world"
}

sayHello

# function with parameters
# we use positional parameters
function greet(){
    echo "hello, i am  $1 and i am $2"
}

greet "nangosha" "21"

# CREATE FOLDER AND WRITE TO A FILE 
mkdir hello 
touch "hello/world.txt"
echo "hello world">> "hello/world.txt"
echo "done writing to the file."