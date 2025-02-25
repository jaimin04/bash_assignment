{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
kaprekar_routine() \{\
    local num=$1\
    local count=0\
\
    while [ "$num" -ne 6174 ]; do\
        # Convert the number to a 4-digit string with leading zeros if needed\
        printf -v num "%04d" $num\
\
        ascending=$(echo $num | grep -o . | sort | tr -d '\\n')\
        descending=$(echo $num | grep -o . | sort -r | tr -d '\\n')\
\
        num=$((descending - ascending))\
        count=$((count + 1))\
\
        if [ "$num" -eq 0 ]; then\
            echo "Kaprekar's routine stuck at 0. No convergence to 6174."\
            return\
        fi\
    done\
\
    echo "It took $count iterations to reach Kaprekar's constant (6174)."\
\}\
\
# Input validation and exception handling\
read -p "Enter a 4-digit number: " input\
\
# Check if the input is a valid 4-digit number\
if ! [[ "$input" =~ ^[0-9]\{4\}$ ]]; then\
    echo "Error: Please enter a valid 4-digit number."\
    exit 1\
fi\
\
# Check if all digits are the same (e.g., 1111)\
digits=$(echo $input | grep -o . | sort -u | wc -l)\
if [ "$digits" -eq 1 ]; then\
    echo "Error: All digits are the same. Kaprekar's routine is not applicable."\
    exit 1\
fi\
\
kaprekar_routine $input\
}