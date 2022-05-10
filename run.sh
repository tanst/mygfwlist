#/bin/sh
cd "$(dirname "$0")"
gfwb64=$(curl -s -k https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt)
add=$(curl -s -k https://raw.githubusercontent.com/tanst/mygfwlist/master/add.ini | sed 's/^/||/g')
del=$(curl -s -k https://raw.githubusercontent.com/tanst/mygfwlist/master/del.ini | sed 's/^/||/g')
gfwd64=$(echo "${gfwb64}" | base64 -d)
echo -e "${gfwd64}\n${add}" >temp.txt
awk '!x[$0]++' temp.txt >gfwlist.txt
for i in $del; do
    sed -i "/$i/d" gfwlist.txt
done
base64 gfwlist.txt > mygfwlist.txt
rm temp.txt
