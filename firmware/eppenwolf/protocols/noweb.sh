filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

#git clone https://github.com/ifigueroap/noweb-minted
#sudo ln -s /path/to/noweb-minted/noweb-minted /usr/local/bin
#sudo ln -s /path/to/noweb-minted/guessPygmentizeLexer.py /usr/local/bin
# bugs

# git clone https://bitbucket.org/romildo/pygnoweb/
# -filter $PWD/pygnoweb/pygnoweb.py


noweave  -latex -delay $1 > $1.tex
notangle -R$filename.py $1 > $1.py

cp $1.tex ../../../documents/
