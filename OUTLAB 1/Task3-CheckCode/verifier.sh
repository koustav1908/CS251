#! /bin/bash

if [ $# -ne 3 ];then
    echo "Usage: ./verifier.sh <source file> <testcases url> <cut-dirs arg>"
    exit 1
fi

wget -q -r -nH -np -R"index.html*" --cut-dirs=$3 $2
cat $1 >  program.cpp
g++ program.cpp

mkdir verifier/my_outputs/

for ((i=0;i<=9;i++));do
    input="verifier/inputs/"$i".in"
    ./a.out < $input > "verifier/my_outputs/"$i".out"
done

echo "Failed testcases are:" > feedback.txt

for ((i=0;i<=9;i++));do
    true_op="verifier/outputs/"$i".out"
    program_op=""verifier/my_outputs/"$i".out""
    diff $true_op $program_op &> /dev/null
    if [ $? -ne 0 ];then
        echo $i >> feedback.txt
    fi
done

isFailed=$(cat feedback.txt | egrep "[0-9]" | wc -l)
if [ $isFailed -ne 0 ];then
    echo "Some testcases failed"
else
    echo "All testcases passed!"
fi
