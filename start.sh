
#/bin/bash
export x=0
export f=0
frames=("")
while sleep 1;
do
	python camera.py;
	export filename="tape/"$(date +%s)".log";
	frames[$x]=$filename
	export jsonFile=$filename".json";
	jp2a --width=180 image.jpg > $filename;
	if [ $f -eq 30 ];
	then
		echo "saving json video";
		echo "{ config: { columns: 180 }, frames: [" > $jsonFile;
		while [ $f -gt -1 ];
		do
			echo $($x - $f);
			echo "\"" >> $jsonFile;
			cat ${frames[$(expr $x - $f)]} >> $jsonFile;
			echo "\"," >> $jsonFile;
			export f=$(($f - 1))
		done	
		echo "]}" >> $jsonFile;
		export f=0;
	fi
	cat $filename
	echo "$x:$f ${frames[$x]}"
	export x=$(($x + 1))
	export f=$(($f + 1))
done
