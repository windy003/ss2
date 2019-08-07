#安装ss
apt   install     shadowsocks



#添加cron服务
echo   'setsid     ssserver   -c  /etc/ss.json'  >>      /var/spool/cron/crontabs/root




#循环执行
for i in {1000..1010}
do
	    echo  '"'$i'"':'"'$RANDOM'"',  >>  tmp.txt
    done


#插入数列到ss.json
sed  -i   '8 r tmp.txt' ./ss.json


#找到timeout所在的行,并赋值给var2,
#然后减2赋值给var3
var=`grep  -n timeout  ss.json`

var2=${var:0:2}
echo    ${var2}


var3=$((var2-2))
echo    ${var3}






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




