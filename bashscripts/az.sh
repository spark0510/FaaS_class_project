#!/bin/bash
./az_b1_e1.sh
./az_b2_e1.sh
mv *.txt *.json e1/
zip -r e1.zip e1
aws s3 cp e1.zip s3://spark7-bucket-01
rm -rf e1.zip e1


./az_b1_e2.sh
./az_b3_e2.sh
mv *.txt *.json e2/
zip -r e2.zip e2
aws s3 cp e2.zip s3://spark7-bucket-01
rm -rf e2.zip e2


./az_b1_e3.sh
./az_b2_e3.sh
./az_b3_e3.sh
mv *.txt *.json e3/
zip -r e3.zip e3
aws s3 cp e3.zip s3://spark7-bucket-01
rm -rf e3.zip e3


./az_b1_e4.sh
mv *.txt *.json e4/
zip -r e4.zip e4
aws s3 cp e4.zip s3://spark7-bucket-01
rm -rf e4.zip e4

