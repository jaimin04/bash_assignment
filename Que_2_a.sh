{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
target_dir="$\{1:-.\}"\
\
# Check if the directory exists\
if [ ! -d "$target_dir" ]; then\
    echo "Error: Directory '$target_dir' not found."\
    exit 1\
fi\
\
echo -e "Name\\t\\tType\\t\\tSize (KB)"\
\
# Iterate through files and directories\
find "$target_dir" -mindepth 1 -maxdepth 1 | while read -r item; do\
    # Get the name, type, and size of each item\
    name=$(basename "$item")\
    if [ -d "$item" ]; then\
        type="Directory"\
        size=$(du -sk "$item" | cut -f1)\
    elif [ -f "$item" ]; then\
        type="File"\
        size=$(du -k "$item" | cut -f1)\
    else\
        type="Other"\
        size=0\
    fi\
\
    echo -e "$name\\t\\t$type\\t\\t$size"\
done\
}