#/bin/sh
cd "$(dirname "$0")"
gfwb64=`curl -k https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt`
gfwid64=`curl -k https://raw.githubusercontent.com/tanst/mygfwlist/master/add.ini | sed 's/^/||/g'`
gfwd64=`echo "${gfwb64}" | base64 -d`
echo -e "${gfwd64}\n${gfwid64}" | base64 > mygfwlist.txt
