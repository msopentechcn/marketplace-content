# Azure 市场 ARM 模板制作指南

本指南为 Azure 市场独立软件供应商介绍 ARM 模板制作、上传到 Azure、 以及发布前测试准备的主要过程。

ARM 的概要信息请参考 [Azure Resource Manager 概述](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-overview)。

ARM 模板的入门开发，建议参考并实践 [创建和部署第一个 Azure 资源管理器模板](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-create-first-template) 以及 [了解 Azure Resource Manager 模板的结构和语法](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-authoring-templates)。制作和开发 ARM 模板，一般是通过 Visual Studio 进行，ARM 模板开发工具请参考 [通过 Visual Studio 创建和部署 Azure 资源组](https://docs.azure.cn/zh-cn/azure-resource-manager/vs-azure-tools-resource-groups-deployment-projects-create-deploy) 和 [使用 Visual Studio Code 扩展创建 Azure 资源管理器模板](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-vscode-extension)。对于简单的 ARM ，也可以采用文本编辑器直接开发。

您可能用到的测试或部署工具，请参考 [如何安装和配置 Azure PowerShell](https://docs.azure.cn/zh-cn/powershell-install-configure)。

### 一些参考案例
[Azure Quickstart Templates](https://github.com/azure/azure-quickstart-templates) 或 [Azure 快速启动模板](https://azure.microsoft.com/zh-cn/resources/templates/)。请注意，从网站下载到本地的 PowerShell 脚本如果不能执行，可能的原因是由于 Windows 安全隔离导致，可以在脚本文件的属性页中，选择“unblock”，将文件解锁，然后再执行。

## ARM 模板开发特别注意事项


### 1. API version list

资源 API version 版本会处于动态更新过程中，一般我们需要用其最新版本，可以人工在 portal 中查看资源版本号，如下图所示。

![resourceBrowser](https://i.imgur.com/Gu1nPCA.png)

同时，我们推荐使用资源函数的方式动态获取最新 API Version 信息，参见 [用于 Azure Resource Manager 模板的 providers 资源函数](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-template-functions-resource#providers)。例如，对于存储账号的API version，可以采用如下方法获得： 

	"apiVersion": "[providers('Microsoft.Storage','storageAccounts').apiVersions[0]]"

### 2. 虚拟机登录认证方式
除了支持虚拟机登录的用户名密码方式，强烈建议同时支持证书或 SSH 密钥登录的方式。请参考 [证书以及 SSH 密钥认证](https://docs.azure.cn/zh-cn/virtual-machine-scale-sets/virtual-machine-scale-sets-faq) 中的证书以及osProfile部分以及案例 [101-vm-sshkey GitHub 快速入门模板](https://github.com/Azure/azure-quickstart-templates/blob/master/101-vm-sshkey/azuredeploy.json)。

### 3.	allowedValues
一般Azure云平台中心的虚拟机的类型是比较齐全的，但是有时候会有一定的变化，比如会增加新的虚拟机型号。在 ARM 模板中，可以用 “allowedValues” 指定允许选择的虚拟机大小，但这样有时候会错过Azure平台上新增加的虚拟机型号，所以一般建议选择使用“excludedValues”。虚拟机型号请参考 [常规用途 Linux 虚拟机大小](https://docs.azure.cn/zh-cn/virtual-machines/Linux/sizes-general)，[常规用途 Windows 虚拟机大小](https://docs.azure.cn/zh-cn/virtual-machines/Windows/sizes-general)，及其 [虚拟机价格](https://www.azure.cn/pricing/details/virtual-machines/)。

### 4. 资源依赖关系
由于 ARM 模板是以资源为中心进行组织的，所以需要特别注意资源之间具有依赖关系，并理解这些资源产生的过程先后顺序，例如下例中对于 Azure 中建立 WebSite 的 ARM (参考 Azure Portal 中用例 Wordpress ARM 模板)。 
	
	连接测试过程(type "config") dependsOn php配置(type “config”)；php 配置 dependsOn php 软件安装(type "extensions")； php 软件安装依赖于 Web 站点(type "Microsoft.Web/sites/") 。
	如果没有严格的资源依赖的关系定义，WebSite 的创建有时候也能成功，但并不稳定并且经常会失败，且难以查找原因。

依赖关系如何使用参见 [定义在 Azure Resource Manager 模板中部署资源的顺序](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-define-dependencies)。

### 5. Extensions 问题
ARM 中经常需要用到 Extensions 脚本，Extensions 脚本由于是在虚拟机创建后时候得到执行，因此脚本通常需要通过网络下载并执行；如果脚本放在外网（例如 Github），实践中经常容易出现下载失败或缓慢的情况。因此我们建议将脚本放到 Azure 云平台。

### 6. VHD 镜像引用
如果在 ARM 模板中需要引用 VHD 镜像，首先需要先在 [Azure 市场发布平台](https://market-publish.azure.cn/) 或 [Azure 市场镜像发布页](https://market-publish.azure.cn/vhd/index) 发布这个镜像（隐藏发布，镜像只是发布了但并不在Azure Portal中显示），镜像发布成功后，需要向 Azure 市场支持人员获取已发布的镜像信息，主要包括 ARM 模板中需要用到的如下四项，并在 ARM 中引用。
	"storageProfile": {
    	"imageReference": {
       		"publisher": "abcpublisher",
       		"offer": "abcimage",
       		"sku": "standard",
       		"version": "latest"
    	}
	}

 ARM 模板参数请参考 [ARM 模板参数](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-templates-parameters)


## ARM 模板部署到 Azure 平台的测试
在 PowerShell 下，以 ARM 模式下登录到 Azure 平台，并部署 ARM 模板。详细的 ARM 部署和测试方法请参考 [使用 ARM 模板和 Azure PowerShell 部署资源](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-template-deploy)。
