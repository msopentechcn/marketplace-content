##### 使用putty远程登录服务器

	1、下载 linux 端的远程工具 putty。 
	2、下载后解压并打开 putty.exe，并输入您的服务器 IP（或DNS域名地址）及端口，端口一般默认为 22。
	3、使用部署虚拟机的时候生成的用户名登录，此用户名具有sudo权限，进入Linux后如果需要root权限，可以执行： sudo passwd

##### 程序安装位置
 
	软件名称 			 路径地址
	tomcat8.0.35		/opt/apache-tomcat-8.0.35/  
	apache2.4.20 		/opt/apache  
	mysql5.6.30 		/usr/local/mysql 

##### 系统服务启动、停止和重启

	系统缺省为开机启动，手动操作如下，请用 root 账号或使用 sudo执行。
	tomcat:         service tomcatd (start|stop|restart) 
	mysql:          service mysql (start|stop|restart) 
	httpd:          service httpd (start|stop|restart)

##### log缺省查看地址

	tomcat:			/opt/apache-tomcat-8.0.35/logs/ 
	mysql:          /data/mysqldb/  
	httpd:          /opt/apache/logs/

注意，mysql缺省只记录error-log，如果需要记录全部log，请在/etc/my.cnf配置文件中增加log地址，例如：

	general_log=ON  
	general_log_file=/data/mysqldb/mysql.log

##### 其它
