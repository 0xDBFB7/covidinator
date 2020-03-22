TITLES=$(curl -s "http://0.0.0.0/w/api.php?action=query&format=json&list=allpages&category=covid" | jq '.query.allpages[].title' | sed 's/\"//g')

echo $TITLES

for title in $TITLES
do

php /var/www/wiki/w/maintenance/getText.php $title | pandoc -t mediawiki -o $title.md

done