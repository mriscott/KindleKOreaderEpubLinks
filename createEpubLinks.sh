#!/bin/sh
# Name: Create Epub Links
# Author: IronGeek

# options

# command to start koreader
koreader="/mnt/us/koreader/koreader.sh --asap"
# location of epubs
docs="/mnt/us/documents"
# location of kterm
kterm="/mnt/us/extensions/kterm/bin/kterm.sh" 
# no of books to dispaly per page
pagesize=10

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
echo "$n ) $x"
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
rm "$x"
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
	echo Creating link for $f
	test -f "$f.sh" && continue
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
echo "1) Create links"
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

if [ "$1" = "" ]
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
	dobook "$f"
done
fi
