for x in `ls $(pwd)/` 
do
	if [ -d $x ]
		then stow -v $x --adopt
	fi
done

git restore .
