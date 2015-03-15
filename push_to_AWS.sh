# !/bin/bash
# $n == string of command line option entered numbered 1 -> n

# Takes two inputs:
#   1) the name of the s3 bucket
#   2) the name of the folder to upload there.

bucket_url="s3://$1"
system_folder="./$2/"

echo "Fixin' to push $system_folder to $bucket_url"
echo "Is this correct (y/n)? :"
read decision

if [[ "$decision" == "y" ]]; then
    echo As you wish ...
    echo
    echo ............................... Begining Remove ...............................
    aws s3 rm $bucket_url --recursive
    echo ............................... Begining Upload ...............................
    aws s3 cp $system_folder $bucket_url --recursive --exclude .git/*
    echo ..................................... DONE ....................................
else
    echo Process Halted
fi
