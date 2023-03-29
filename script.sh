#! /bin/sh

git diff --oneline --name-status --no-renames HEAD^ | grep 'A' | awk '{print $2}' >> files
git diff --oneline --name-status --no-renames HEAD^ | grep 'M' | awk '{print $2}' >> files

rows=$(cat files | wc -l)
counter=1

while [ $counter -le $rows ]
do
	
	file=$(cat files | awk "FNR == $counter" )
	if [ "$file" != "first" ]
	then
		cp $file temp/
	else
		echo "This is $file"
	fi
	counter=`expr $counter + 1`

done
	
