filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

noweave -latex -delay $1 > $1.tex
notangle -R$filename.py $1 > $1.py

cp $1.tex ../../../documents/
