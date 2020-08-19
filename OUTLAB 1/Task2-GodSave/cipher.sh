#! /bin/bash

#Function for getting position of alphabet
get_pos(){
    var=$(echo -n $1 | od -An -tuC)
    var=$((var-96))
    return $var
}

#Function to get the key
get_key(){
    for((key=0;key<26;key++));do
        deciphered=""
        for word in $1;do
            for((i=0;i<${#word};i++));do
                get_pos ${word:$i:1}
                pos=$?
                decrypt_pos=$(((pos+key-1)%26+1))
                decrypted_letter=${reference[$decrypt_pos]}
                deciphered=$deciphered$decrypted_letter
            done
            deciphered=$deciphered" "
        done
        isKey=$(echo $deciphered | egrep -i "Mary|Queen|Majesty" | wc -l)
        if [ $isKey -ne 0 ];then
            return $key
        fi
    done
}

if [ $# -ne 1 ];then
    echo "Usage: ./cipher.sh <url>"
    exit 1
fi
wget -q -O encrypted.txt $1
last_line=$(tail -n 1 encrypted.txt | tr "[:upper:]" "[:lower:]") #convert line to lower case
reference=()
cnt=1
for i in {a..z};do
    reference[$cnt]=$i
    ((cnt++))
done #Making an array of alphabets
get_key "$last_line"
key=$? #key is stored
decrypt_set="["${reference[$key+1]}"-za-"${reference[$key]}${reference[$key+1]^^}"-ZA-"${reference[$key]^^}"]"  #conversion set for decryption
cat encrypted.txt | tr "[a-zA-Z]" $decrypt_set > deciphered.txt # Making deciphered.txt
echo "PS. Give me the names." | tr $decrypt_set "[a-zA-Z]" >> encrypted.txt #adding additional line in encrypted.txt



