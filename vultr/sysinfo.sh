
s version
showOsVersion() {
    if [ -f /etc/redhat-release ];then
        os_version=`cat /etc/redhat-release`
    elif [ -f /etc/lsb-release ];then
        os_version=`awk -F '"' '/DISTRIB_DESCRIPTION/{print $2}' /etc/lsb-release`
    else
        os_version=`awk -F'"' '/PRETTY_NAME/{print $2}'  /etc/os-release`
    fi
    bit=$(getconf LONG_BIT)
    echo "操作系统: $os_version $bit位"
}

showNetInfo() {
    out_ip=`curl -s ehd4.f3322.net/ip.php`
    inner_ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|grep -v ".*\.0\.1"|awk '{print $2}'|tr -d "addr:"`
    gateway=`netstat -rn | grep "^0.0.0.0" | awk '{print $2}'`
    dns_server=`cat /etc/resolv.conf | sed 's/nameserver //g'`
    echo "外网ip: $out_ip"
    echo "内网ip: $inner_ip"
    echo "网关：$gateway"
    echo "DNS：$dns_server"
}

showDiskInfo() {
    lsblk |awk '/disk/{print $1" "$4}'
    df -hlT |egrep '^/dev/|^Filesystem|/$' |egrep -v '^/dev/loop'
}

showMemInfo() {
    echo "物理内存:  `free -m |awk '/Mem/{printf ("共%.2fG, 已用%.2fG, 可用%.2fG\n", $2/1024, $3/1024, $4/1024)}'`"
    echo "交换内存:  `free -m |awk '/Swap/{printf ("共%.2fG, 已用%.2fG, 可用%.2fG\n", $2/1024, $3/1024, $4/1024)}'`"

    #内存数量、频率
    if [ -e /usr/sbin/dmidecode ];then
    dmidecode -t memory |awk '/Size.*MB/{print "条 "$2/1024 "GB"}' |uniq -dc
    dmidecode|grep -A16 "Memory Device"|awk '/Speed.*MHz/{print "频率 "$2 $3}' |uniq -dc
    dmidecode -t memory |awk '/DDR/{print "接口 "$2}' |uniq -dc
    echo "插槽数量: `dmidecode -t memory |grep Size |wc -l`"
    fi
}

showCpuInfo() {
    echo "CPU型号:  `cat /proc/cpuinfo |grep "name" |cut -f2 -d: |uniq`"
    echo "CPU物理个数:  `cat /proc/cpuinfo | grep "physical id"| sort| uniq| wc -l`"
    echo "CPU逻辑个数:  `cat /proc/cpuinfo| grep "processor"| wc -l`"
}

########################################################################################################
echo
echo "********系统信息**********"
showOsVersion

hostname=$(hostname)
version=$(cat /proc/version|sed 's/(.*$//g')
echo "主机名称: ${hostname}"
echo "内核版本: $version"

if [ -e /usr/sbin/dmidecode ];then
    product_name=$(dmidecode | grep 'Product Name' |uniq | sed 's/.*://g')
    machine_name=$(dmidecode|sed -n '/System Information/{n;p;}'|sed 's/^.*://g')
    machine_sn=$(dmidecode|sed -n '/System Information/{n;n;n;n;p;}'|sed 's/^.*: //g')
    echo "产品名称: $product_name"
    echo "硬件名称: $machine_name"
    echo "硬件序号: $machine_sn"
fi

echo
echo "********CPU**********"
showCpuInfo

echo
echo "********内存**********"
showMemInfo

echo 
echo "********磁盘**********"
showDiskInfo

echo
echo "********网络**********"
showNetInfo
