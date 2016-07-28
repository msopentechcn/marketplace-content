##### 使用SSH、WEB方式登录服务器
    1、下载 linux 端的远程工具 putty。 
	2、下载后解压并打开 putty.exe，并输入您的服务器 IP（或DNS域名地址）及端口，端口一般默认为 22。
	3、使用部署虚拟机的时候生成的用户名登录，此用户名具有sudo权限，进入Linux后如果需要root权限，可以执行： sudo passwd
	4、使用WEB方式管理易客CRM，管理地址为：http://{DnsName}/YKcrm/index.php

##### 程序安装位置

	软件名称 			路径地址 
	YKCRM 			    /data/src/apache/htdocs/YKcrm
	Apache1.3.8 		/data/src/apache 
	php5.2.17 			/data/soft/php
	mysql5.1.72			/data/soft/mysql 

##### 系统服务启动和停止

	服务启动，停止，重启操作（如果mysqld操作服务报错，请kill掉mysql多余的进程，再进行重启操作）
	mysql:          service mysqld (start|stop|restart) 
	httpd:          service httpd (start|stop|restart)

##### log缺省查看地址

    YKCRM 			/data/src/apache/htdocs/YKcrm/logs
    Apache          /data/src/apache/logs
	mysql:          /var/log/mysqld.log
