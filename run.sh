#/bin/sh
cd "$(dirname "$0")"
gfwb64=$(curl -s -k https://raw.githubusercontent.com/Loyalsoldier/domain-list-custom/release/gfwlist.txt)
gfwid64=$(curl -s -k https://raw.githubusercontent.com/tanst/mygfwlist/master/add.ini | sed 's/^/||/g')
del=$(curl -s -k https://raw.githubusercontent.com/tanst/mygfwlist/master/del.ini | sed 's/^/||/g')
gfwd64=$(echo "${gfwb64}" | base64 -d)
echo -e "${gfwd64}\n${gfwid64}" >temp.txt
sort temp.txt | uniq >gfwlist.txt
for i in $del; do
    sed -i "/$i/d" gfwlist.txt
done
cat gfwlist.txt | base64 >mygfwlist.txt
rm temp.txt
