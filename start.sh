#/bin/bash
export x=0
export f=0
export clipLength=30
export frameData=""
export clip=0
frames=("")
while sleep 1;
do
	python camera.py;
	export filename="tape/"$(date +%s)".log";
	frames[$x]=$filename
	export jsonFile=$filename".json";
	jp2a --width=180 image.jpg > $filename;
	echo "";
	cat $filename
	if [ $f -eq $clipLength ];
	then
		echo "saving json video";
		echo -n "{ \"config\": { \"columns\": 180 }, \"frames\": [" > $jsonFile;
		while [ $f -gt -1 ];
		do
			echo -n "\"" >> $jsonFile;
			#wc -l < ${frames[$(expr $x - $f)]} | tr -d '\n';
			echo -n "$(wc -l < ${frames[$(expr $x - $f)]})" >> $jsonFile;
			#cat ${frames[$(expr $x - $f)]} >> $jsonFile;
			echo -n "\"," >> $jsonFile;
			export f=$(($f - 1))
		done	
		echo "]}" >> $jsonFile;
		export f=0;
		export clip=$(($clip + 1))
		cd tape
		ls | grep -P "\.log$" | xargs -d "\n" rm
		cd ../
	fi
	echo -n "$clip:[$f/$clipLength] ${frames[$x]} "
	export x=$(($x + 1))
	export f=$(($f + 1))
done
