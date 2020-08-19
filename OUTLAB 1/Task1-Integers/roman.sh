#! /bin/bash

get_roman(){
    n=$1
    ans=""
    size=${#num[@]}
    for((i=size-1;i>=0;i--));do
        val=${num[$i]}
        cnt=$((n/val))
        n=$((n%val))
        for((j=1;j<=cnt;j++));do
            ans=$ans${Roman[$i]}
        done
    done
}

num=(1 4 5 9 10 40 50 90 100)
Roman=(I IV V IX X XL L XC C)
get_roman $1
echo $ans
