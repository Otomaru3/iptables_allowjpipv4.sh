# iptables_allowjpipv4.sh

iptablesをFlushします。
iptablesのセーブはしません。

## 実行例


```
bash:~/tmp$ 
bash:~/tmp$ bash --version
GNU bash, version 4.4.19(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
bash:~/tmp$ 
bash:~/tmp$ 
bash:~/tmp$ iptables --version
iptables v1.6.1
bash:~/tmp$ 
bash:~/tmp$ 
bash:~/tmp$ git clone https://github.com/Otomaru3/iptables_allowjpipv4.sh.git
Cloning into 'iptables_allowjpipv4.sh'...
remote: Enumerating objects: 18, done.
remote: Counting objects: 100% (18/18), done.
remote: Compressing objects: 100% (16/16), done.
remote: Total 18 (delta 2), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (18/18), done.
bash:~/tmp$ 
bash:~/tmp$ ll
total 12
drwxrwxr-x  3 user user 4096 Mar 16 08:58 ./
drwxr-xr-x 12 user user 4096 Mar 13 17:15 ../
drwxrwxr-x  3 user user 4096 Mar 16 08:58 iptables_allowjpipv4.sh/
bash:~/tmp$ 
bash:~/tmp$ 
bash:~/tmp$ cd iptables_allowjpipv4.sh/
bash:~/tmp/iptables_allowjpipv4.sh$ 
bash:~/tmp/iptables_allowjpipv4.sh$ 
bash:~/tmp/iptables_allowjpipv4.sh$ ll
total 20
drwxrwxr-x 3 user user 4096 Mar 16 08:58 ./
drwxrwxr-x 3 user user 4096 Mar 16 08:58 ../
drwxrwxr-x 8 user user 4096 Mar 16 08:58 .git/
-rw-rw-r-- 1 user user   95 Mar 16 08:58 README.md
-rw-rw-r-- 1 user user 1284 Mar 16 08:58 iptables_allowjpipv4.sh
bash:~/tmp/iptables_allowjpipv4.sh$ 
bash:~/tmp/iptables_allowjpipv4.sh$ 
bash:~/tmp/iptables_allowjpipv4.sh$ chmod u+x iptables_allowjpipv4.sh 
bash:~/tmp/iptables_allowjpipv4.sh$ 
bash:~/tmp/iptables_allowjpipv4.sh$ sudo ./iptables_allowjpipv4.sh 
delegated-apnic-20200316
!
! IP Address 情報取得

--2020-03-16 08:58:49--  http://ftp.apnic.net/stats/apnic/delegated-apnic-20200316
Resolving ftp.apnic.net (ftp.apnic.net)... 202.12.29.205, 2001:dc0:2001:11::205
Connecting to ftp.apnic.net (ftp.apnic.net)|202.12.29.205|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3124119 (3.0M) [text/plain]
Saving to: ‘delegated-apnic-20200316’

delegated-apnic-20200316            100%[================================================================>]   2.98M  69.3KB/s    in 24s     

2020-03-16 08:59:13 (129 KB/s) - ‘delegated-apnic-20200316’ saved [3124119/3124119]

!
! IP Address 情報整形
!
!
! IP Address 行数確認
!
ip_lines : 4309
!
! IPTABLES 更新
!
! IPTABLES クリア
! IPTABLES 固定設定
! ipv4jp 許可
! ipv4jp 以外ドロップ
!
! IPTABLES 表示
!
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     udp  --  1.0.16.0/20          0.0.0.0/0            udp dpt:1192
ACCEPT     udp  --  1.0.64.0/18          0.0.0.0/0            udp dpt:1192
ACCEPT     udp  --  1.1.64.0/18          0.0.0.0/0            udp dpt:1192
ACCEPT     udp  --  1.5.0.0/16           0.0.0.0/0            udp dpt:1192
<--- snip --->
ACCEPT     udp  --  223.252.112.0/20     0.0.0.0/0            udp dpt:1192
DROP       udp  --  0.0.0.0/0            0.0.0.0/0            udp dpt:1192

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
bash:~/tmp/iptables_allowjpipv4.sh$ 
bash:~/tmp/iptables_allowjpipv4.sh$ 
bash:~/tmp/iptables_allowjpipv4.sh$ 

```
