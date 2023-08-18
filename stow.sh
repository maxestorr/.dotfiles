for x in `ls $(pwd)/` 
do
	if [ -d $x ]
		then stow -v $x
	fi
done
