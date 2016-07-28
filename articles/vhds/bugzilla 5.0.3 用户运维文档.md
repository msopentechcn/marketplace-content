##### 使用putty远程登录服务器

	下载 linux 端的远程工具 putty 
	下载后解压并打开 putty.exe，并输入您的服务器 IP 及端口，端口一般默认为 22

##### 程序安装位置

	软件名称 			路径地址 
    httpd 2.4.6         /usr/lib64/httpd
	bugzilla 5.0.3 	    /var/www/bugzilla
	mariadb 5.5.47 	    /var/lib/mysql 

##### 系统服务启动和停止

	服务启动，停止，重启操作 
	mariadb:          service mariadb (start|stop|restart) 


##### log缺省查看地址

	mariadb:          /var/log/mariadb  
	httpd:            /var/log/httpd

注意，mysql缺省只记录error-log，如果需要记录全部log，请在/etc/my.cnf配置文件中增加log地址，例如：

	general_log=ON  
	general_log_file=/var/log/mariadb/mariadb.log

##### 其它

	