#!/bin/bash
dport=1192
ip_lines_threshold=2000
date=`date +%Y%m%d` ; echo delegated-apnic-${date}

echo !
echo ! IP Address 情報取得
echo

wget http://ftp.apnic.net/stats/apnic/delegated-apnic-${date}

echo !
echo ! IP Address 情報整形
echo !

grep "apnic|JP|ipv4" delegated-apnic-${date} | awk -F "|" '{ print $4"/"32-log($5)/log(2) }' > ip-list-${date}.txt

echo !
echo ! IP Address 行数確認
echo !

ip_lines=`cat  ip-list-${date}.txt  | wc -l`
echo ip_lines : ${ip_lines}

if [ ${ip_lines} -lt ${ip_lines_threshold} ] ; then
        echo "ip-list-${date}.txt の行数が${ip_lines_threshold}行以下のため中断します。"
        exit 1
fi


echo !
echo ! IPTABLES 更新
echo !


echo ! IPTABLES クリア
iptables -F


echo ! IPTABLES 固定設定
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
#iptables -A INPUT -m state -state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT

echo ! ipv4jp 許可
while read line
do
    #echo "LINE : $line"
    iptables -A INPUT -p udp -s $line --dport $dport -j ACCEPT
done < ip-list-${date}.txt


echo ! ipv4jp 以外ドロップ
iptables -A INPUT -p udp -s 0/0 --dport $dport -j DROP


echo !
echo ! IPTABLES 表示
echo !

iptables --list -n
#iptables-save
