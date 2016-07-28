##### 使用putty远程登录服务器

	1、下载 linux 端的远程工具 putty。 
	2、下载后解压并打开 putty.exe，并输入您的服务器 IP（或DNS域名地址）及端口，端口一般默认为 22。
	3、使用部署虚拟机的时候生成的用户名登录，此用户名具有sudo权限，进入Linux后如果需要root权限，可以执行： sudo passwd

##### 程序安装位置
 
	软件名称 			 路径地址   
	solr6.0.1 			/opt/solr-6.0.1/ 

##### 系统服务启动、停止和重启

	系统缺省为未启动，手动操作如下，请用 root 账号或使用 sudo执行。
	/opt/solr-6.0.1/bin/solr start {单机模式} 或者 
	/opt/solr-6.0.1/bin/solr start -e -e cloud -noprompt {cloud模式}

##### log缺省查看地址

	在生成的索引实例中设置，参考下面索引测试用例。

##### 单机模式下生成索引的测试用例

  比如生成product索引，以下为root权限操作或采用sudo操作。

	1、生成配置文件
		cd /opt/solr-6.0.1/
		cd server/solr； mkdir product  
		cp -r configsets/basic_configs/conf/ product/  
	
	2、生成product core	
		/opt/solr-6.0.1/bin/solr create_core -c product
		或者在浏览器的"Core Admin"中"Add Core"，填写内容如下：
			name: product
			instanceDir: product
			dataDir: data
			config: solrconfig.xml
			schema: schema.xml
		刷新浏览器url地址便可以看到product的索引core。
		注意product实例在solr的索引实例的根目录/opt/solr-6.0.1/server/solr。
		在 product/conf/solrconfig.xml 进行各种设置。