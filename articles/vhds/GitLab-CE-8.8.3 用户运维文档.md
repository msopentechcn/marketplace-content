##### 使用putty远程登录服务器

	下载 linux 端的远程工具 putty 
	下载后解压并打开 putty.exe，并输入您的服务器 IP 及端口，端口一般默认为 22
	用户默认具有 sudo 权限

##### 程序安装位置

	软件名称			路径地址 
	GitLab			   /usr/sbin/apache2

##### 系统服务启动和停止

	服务启动，停止，重启操作
	GitLab:          sudo gitlab-ctl (start|stop|restart)

##### log缺省查看地址

	GitLab:          /var/log/gitlab

##### 其它

	GitLab config:	/etc/gitlab/gitlab.rb