#!/bin/bash
VID=$(aws ec2 describe-volumes | jq -r '.Volumes[].VolumeId')
for VOL in $VID 
do
    SIZE=$(aws ec2 describe-volumes --volume-ids $VOL | jq -r '.Volumes[].Size')
    if [ $SIZE -gt 1 ]; then
        echo "Dont delete $VOL as size is $SIZE"
    else
        echo "Lets delete $VOL as size is $SIZE"
        aws ec2 delete-volume --volume-id $VOL
    fi
done
