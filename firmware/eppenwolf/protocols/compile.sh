filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

#git clone https://github.com/ifigueroap/noweb-minted
#sudo ln -s /path/to/noweb-minted/noweb-minted /usr/local/bin
#sudo ln -s /path/to/noweb-minted/guessPygmentizeLexer.py /usr/local/bin
# bugs

# git clone https://bitbucket.org/romildo/pygnoweb/
# -filter $PWD/pygnoweb/pygnoweb.py

noweave  -latex -delay $1 > ../../../documents/$filename.tex
notangle -R$filename.py $1 > $filename.py
# cp pygnoweb/pygnoweb.sty ../../../documents/
# cp pygnoweb/pygstyle.sty ../../../documents/
#

# pweave $1 -o ../../../documents/$filename.tex -f texminted
# pweave runs the file. This is highly unwanted.
