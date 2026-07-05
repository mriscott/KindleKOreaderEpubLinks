#!/bin/sh
# Name: Create Epub Links
# Author: IronGeek
# Icon: data:image/png;base64,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

# options

# command to start koreader
koreader="/mnt/us/koreader/koreader.sh --asap"
# location of epubs
docs="/mnt/us/documents"
# location of kterm
kterm="/mnt/us/extensions/kterm/bin/kterm.sh" 
# no of books to dispaly per page
pagesize=10
# uncomment to keep epub when deleting links
#keepepub=y
# do not change below here

timestamp=$(date +%s)
touch $0
test -z "$1" && test -e "$kterm" && "$kterm" -e "$0 i"   && exit


choose(){
n=0
for x in *.epub */*.epub */*/*.epub
do 
case "$x" in 
  *"*"*)
   continue;
   ;;
  *) 
  ;;
esac
if [ "$1" = "d" ] 
then
action="delete"
test -e "$x.sh" || continue
else
action="link"
test -e "$x.sh" &&  continue
fi
name=${x/.epub/}
test -e "$x.sh" && name=$(grep Name: "$x.sh"|sed 's/# Name://')
echo "$n ) $name"
n=$(($n+1))
if [ $(( $n % $pagesize )) = 0 ]
then
echo Press return
read p
test -z "$p" || break
fi 
done
if [ $n = 0 ]
then
echo No available books
exec $0 i
fi 
echo "b) back"
echo "q) exit"
if [ "$p" = "" ]
then
echo Enter no of book to $action:
read y
else
y=$p
fi
if [ "$y" = "b" ]
then
exec $0 i
fi
if [ "$y" = "q" ]
then
exit
fi

n=0
for x in *.epub */*.epub */*/*.epub
do 
case "$x" in 
  *"*"*)
   continue;
   ;;
  *) 
  ;;
esac
if [ "$1" = "d" ] 
then
test -e "$x.sh" || continue
else
test -e "$x.sh" &&  continue
fi
if [ "$n" = "$y" ]
then
if [ "$1" = "d" ] 
then
rm "$x.sh"
rm "$x.jpg"
test -z "$keepepub" && rm "$x"
if [ "$docs" != "/mnt/us/documents" ]
  then
   b=$(basename "$x.sh")
   rm "/mnt/us/documents/$b"
fi
else
dobook "$x"
fi
fi
n=$(($n+1))
done
choose $1
}
dobook(){
	f="$1"
	test -f "$f.sh" && continue
	echo Creating link for $f
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
	if [ $docs != "/mnt/us/documents" ]
	then
	  cp "$f.sh" /mnt/us/documents
  	fi
}
cd "$docs"
if [ "$1" = "i" ]
then
echo Choose an option
echo "0) Create links for all"
echo "1) Choose links to create"
echo "2) Delete links"
echo "q) exit "
read x
if [ "$y" = "q" ]
then
exit
fi
exec $0 $x
fi

if [ "$1" = "1" ]
then
choose 
fi
if [ "$1" = "2" ]
then
choose  d
fi

if [ "$1" = "0" ]
then 
echo Creating all links

for x in *.epub */*.epub */*/*.epub
do 
case "$x" in 
  *"*"*)
   continue;
   ;;
  *) 
  ;;
esac
	dobook "$x"
done
echo Done
fi
