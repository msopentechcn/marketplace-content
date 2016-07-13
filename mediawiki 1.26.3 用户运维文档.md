##### 使用putty远程登录服务器

	下载 linux 端的远程工具 putty 
	下载后解压并打开 putty.exe，并输入您的服务器 IP 及端口，端口一般默认为 22
	数据库的管理地址为：http://{DnsName}/phpmyadmin/ 

##### 程序安装位置

	软件名称 			路径地址 
	Apache2.4 			/usr/local/apache2 
	php5.4 				/usr/local/php5.4 
	mysql5.5 			/var/lib/mysql 
	mediawiki 1.26.3 	/opt/mediawiki

##### 系统服务启动和停止

	服务启动，停止，重启操作 
	mysql:          service mysql (start|stop|restart) 
	httpd:          service httpd (start|stop|restart)

##### log缺省查看地址

	mysql:          /data/mysqldb/  
	httpd:          /opt/apache/logs/

注意，mysql缺省只记录error-log，如果需要记录全部log，请在/etc/my.cnf配置文件中增加log地址，例如：

	general_log=ON  
	general_log_file=/data/mysqldb/mysql.log


##### 其它

	