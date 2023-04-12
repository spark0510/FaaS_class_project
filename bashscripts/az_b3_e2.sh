#!/bin/bash
for i in $(seq 10)
do
        EXECUTE=$(date +"%s.%N") && wsk action invoke bench3 -i --result >> output_az_b3_e2.json
	named=$(docker ps --filter "name=bench3" --format "{{.Names}}")
	START=$(docker inspect --format='{{.State.StartedAt}}' $named)
	CREATED=$(docker inspect --format='{{.Created}}' $named)

	START_TIME=$(date --date=$START +"%s.%N")
	CREATED_TIME=$(date --date=$CREATED +"%s.%N")

	TIME1=$(echo "scale=3; $CREATED_TIME-$EXECUTE" | bc)
	TIME2=$(echo "scale=3; $START_TIME-$CREATED_TIME" | bc)

	echo "$EXECUTE" >> execute_az_b3_e2.txt
	echo "$CREATED_TIME" >> create_az_b3_e2.txt
	echo "$START_TIME" >> start_az_b3_e2.txt

	echo "$TIME1" >> time1_az_b3_e2.txt
	echo "$TIME2" >> time2_az_b3_e2.txt

	docker rm -f $named
	docker rmi spark77/b-1
done
