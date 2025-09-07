#!/bin/sh
# Name: Create Epub Links
# Author: IronGeek

# options

# command to start koreader
koreader="/mnt/us/koreader/koreader.sh --asap"
# location of epubs
docs="/mnt/us/documents"

# do not change below here

touch "$0"
cd "$docs"
for f in *.epub
do 
test -f "$f.sh" && continue
echo Creating link for $0
sh="$f.sh"
opf=$(unzip -p  "$f"  META-INF/container.xml |grep rootfile |sed 's/^.*full-path="//;s/".*$//'|grep -v rootfiles )
unzip -p "$f" $opf |sed 's/></>\
</g' >contents.obp
title=$(grep dc:title contents.obp|sed 's!</dc:title.*$!!;s!.*>!!')
echo "#!/bin/sh" >"$sh"
echo "# Name: $title" >>"$sh"
author=$(grep dc:creator contents.obp|sed 's!</dc:creator.*$!!;s!.*>!!'|head -1)
echo "# Author: $author"  >>"$sh"
echo "# Last-opened: 0" >> "$sh"
echo "# Icon: $docs/$f.jpg" >> "$sh"
echo 'timestamp=$(date +%s)' >> "$sh"
echo 'sed -i "s/^# Last-opened:.*/# Last-opened: $timestamp/" "$0"' >> "$sh"
echo "$koreader \"$docs/$f\"" >> "$sh"
icon=$(grep jpeg contents.obp|grep cover|sed 's/.*href=.//;s/".*//;s/.*=//;s/^\s*//;s/\s$//')
test ! -z "$icon" && unzip -p "$f" "*$icon" > "$f.jpg"
rm contents.obp
done
