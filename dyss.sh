#安装ss
apt  update
apt  upgrade
apt   install     shadowsocks



#添加cron服务
echo   '@reboot  setsid     ssserver   -c  /etc/ss.json'  >>      /var/spool/cron/crontabs/root




#循环执行
for i in {1000..1010}
do
	    echo  '"'$i'"':'"'$RANDOM'"',  >>  tmp.txt
    done


#插入数列到ss.json
sed  -i   '8 r tmp.txt' ./ss.json






#把最后一行的逗号去掉
sed -i   '19s/.$//'    ss.json

#拷贝ss.json到/etc/ss.json
cp     ss.json    /etc/ss.json



#显示配置
cat    /etc/ss.json




#删除tmp.txt
rm    tmp.txt



#运行ssserver,显示数列
setsid   ssserver    -c    /etc/ss.json


#安装bbr
chmod   +x bbr.sh
./bbr.sh
