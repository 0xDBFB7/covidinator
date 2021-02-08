
#run save_all_files
rm -r mathematica/
wget https://www.wolframcloud.com/obj/therobotist/down.zip 
unzip down.zip "*/*" -d mathematica/
mv mathematica/all/* mathematica/
rm -r mathematica/all
rm down.zip
