
sed -i '1 i\%' $1

sed -i 's/G38.2/G38.5/g' $1

sed -i '/^M3 S*/a G4 P10;' $1


sed -i -e "\$a%" $1