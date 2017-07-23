


function systeminfo(){ 
   
	#用户名 
	com_username=$(cat /etc/passwd | awk 'BEGIN {FS = ":"}$3 == 1000{ print $1}')
	#系统信息
	#系统名称 
	com_codename=$(cat /etc/lsb-release 2>/dev/null|awk -F "=" ' $1 == "DISTRIB_ID" {print $2}'|tr '[A-Z]' '[a-z]')
	#数字号
	com_release=$(cat /etc/lsb-release 2>/dev/null|awk -F "=" ' $1 == "DISTRIB_RELEASE" {print $2}')

}
