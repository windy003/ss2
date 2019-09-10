
#定位timeout一行t1,定义数据最后一行t2
t1=$(grep -n "timeout"  /etc/ss.json | cut -d ":" -f 1)
echo $t1
let  t2=$t1-2
echo $t2


#加上/etc/ss.json数据中最后一行的逗号,用单引号包含双引号来引入变量
sed -i  ''"${t2}"'s/$/&,/' /etc/ss.json



#获取数据最后一行的端口号t3
t3=`awk -F'"'  'NR=='"$t2"' {print$2}'  /etc/ss.json`
echo $t3


#定义端口号+1  t4
let t4=$(($t3+1))
echo  $t4


#定义端口号+5  t5
let t5=$(($t3+5))
echo  $t5





#循环执行生成数据到tmp.txt
for i in $(seq $t4 $t5)

do
	echo  '"'$i'"':'"'$RANDOM'"',  >>  tmp.txt
		        done



#把最后一行的逗号去掉
sed -i   '5s/.$//'   tmp.txt





#把tmp.txt文件输入到/etc/ss.json
sed  -i   ''"$t2"' r tmp.txt' /etc/ss.json


#删除tmp.txt
rm   tmp.txt

#显示文件
cat   /etc/ss.json
