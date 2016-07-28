### 二、用户运维文档
	标题： DedeCMS 5.7 用户运维文档

##### 使用putty远程登录服务器

	1，下载 linux 端的远程工具 putty 
	2，下载后解压并打开 putty.exe，并输入您的服务器 IP 及端口，端口一般默认为 22
	3，使用部署虚拟机的时候生成的用户名登录，此用户名具有sudo权限，进入linux后如需要root权限，可以执行：sudo passwd
	DedeCMS访问地址为：http://{DnsName}.chinacloudapp.cn/
	DedeCMS管理后台访问地址为：http://{DnsName}.chinacloudapp.cn/dede/login.php

##### 程序安装位置

	软件名称 			路径地址 
	默认根目录 			/opt/apache/htdocs 
	Apache2.4.0 		/opt/apache 
	php5.6.22 			/opt/php 
	mysql5.6.30 		/usr/local/mysql 
	DedeCMS 5.7		 	/opt/apache/htdocs

##### 系统服务启动和停止

	服务启动，停止，重启操作 
	mysql:          service mysql (start|stop|restart) 
	httpd:          service httpd (start|stop|restart)

注意，如果mysql service重启出错，需要kill掉其他mysql进程。

##### log缺省查看地址

	mysql error log:    /data/mysqldb/ 
	httpd:          	/opt/apache/log

注意，mysql缺省只记录error-log，如果需要记录全部log，请在/etc/my.cnf配置文件中增加log地址，例如：

	general_log=ON  
	general_log_file=/data/mysqldb/mysql.log

##### 其它
	