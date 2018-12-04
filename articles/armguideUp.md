# Azure China Marketplace ARM Creating Guide，Azure 市场 ARM 模板制作指南

This guide introduces the Azure China Marketplace ISV on the main process of creating, uploading ARM template to Azure and testing preparation before publishing. 本指南为 Azure 市场独立软件供应商介绍 ARM 模板制作、上传到 Azure 以及发布前测试准备的主要过程。

## Pre-requisites for creating a ARM template，ARM 模板制作先决条件

### Download needed tools & applications，下载需要用到的工具和应用
The following tools should be prepared before the start:在开始之前应当准备下面的工具：

 - You may use test or deployment tool PowerShell, please refer to [How to install and configure Azure PowerShell](https://docs.azure.cn/zh-cn/powershell-install-configure), 您可能用到测试或部署工具 PowerShell，请参考 [如何安装和配置 Azure PowerShell](https://docs.azure.cn/zh-cn/powershell-install-configure)。
 - Create and develop ARM templates usually through Visual Studio. For ARM template development tools, please refer to [Create and deploy Azure resource groups through Visual Studio](https://docs.azure.cn/zh-cn/azure-resource-manager/vs-azure-tools-resource-groups-deployment-projects-create-deploy) and [Use Visual Studio Code extension to create Azure Resource Manager template](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-vscode-extension). 制作和开发 ARM 模板，一般是通过 Visual Studio 进行，ARM 模板开发工具请参考 [通过 Visual Studio 创建和部署 Azure 资源组](https://docs.azure.cn/zh-cn/azure-resource-manager/vs-azure-tools-resource-groups-deployment-projects-create-deploy) 和 [使用 Visual Studio Code 扩展创建 Azure 资源管理器模板](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-vscode-extension)。
 - For simple ARM, it can also be developed directly with a text editor. 对于简单的 ARM ，也可以采用文本编辑器直接开发。

### ARM knowledge and reference，ARM 知识了解和参考
For ARM overview please refer to [Azure Resource Manager overview](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-overview). ARM 的概要信息请参考 [Azure 资源管理器概述](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-overview)。

For the introductory development of ARM templates, it is recommended to refer to and practice [Create and deploy your first Azure Resource Manager template](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-create-first-template) and [Understand the structure and syntax of Azure Resource Manager templates](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-authoring-templates). ARM 模板的入门开发，建议参考并实践 [创建和部署第一个 Azure 资源管理器模板](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-create-first-template) 以及 [了解 Azure Resource Manager 模板的结构和语法](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-authoring-templates)。

### Resources of reference sample, 参考样例资源
[Azure Quickstart Templates samples](https://azure.microsoft.com/en-us/resources/templates/) and [Documentation of Azure Quickstart Templates samples](https://github.com/azure/azure-quickstart-templates). Please note that if the PowerShell script downloaded from the website to the local area cannot be executed, it may be due to the Windows security isolation. In the properties page of the script file, select "unblock" to unlock the file and execute it again. [Azure 快速启动模板样例](https://azure.microsoft.com/en-us/resources/templates/)以及[Azure 快速启动模板样例文档](https://github.com/azure/azure-quickstart-templates)。请注意，从网站下载到本地的 PowerShell 脚本如果不能执行，可能的原因是由于 Windows 安全隔离导致，可以在脚本文件的属性页中，选择“unblock”，将文件解锁，然后再执行。

## Special attention to ARM template development , ARM 模板开发特别注意事项
There are some areas that need special attention during the development of the ARM template. Please refer to the following for details: ARM 模板开发的过程中，有一些需要特别注意的地方，具体请参考如下：

### 1. API version list

 For resources API related information, please refer to [Define resources in Azure Resource Manager templates](https://docs.microsoft.com/zh-cn/azure/templates/).  You can see the resource API information of Reference node in the following figure. 资源 API 相关信息，请参考 [Define resources in Azure Resource Manager templates](https://docs.microsoft.com/zh-cn/azure/templates/)，可以在下图中查看 Reference 节点的资源 API 信息。
![ARM 资源](https://i.imgur.com/X9uQdmj.png)

 Since the version of the resource API will be in the process of dynamic update, generally we need to use its latest version. You can manually check the version number of the resource in the Azure portal, as shown in the following figure. 由于资源 API 版本会处于动态更新过程中，一般我们需要用其最新版本，可以人工在 Azure 入口中查看资源版本号，如下图所示。

![resourceBrowser](https://i.imgur.com/Gu1nPCA.png)

At the same time, we recommend that you can get the latest API Version information dynamically by using the resource function, please refer to [用于 Azure Resource Manager 模板的 providers 资源函数](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-template-functions-resource#providers). 同时，我们推荐使用资源函数的方式动态获取最新 API Version 信息，参见 [用于 Azure Resource Manager 模板的 providers 资源函数](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-template-functions-resource#providers)。例如，对于存储账号的API version，可以采用如下方法获得：

	"apiVersion": "[providers('Microsoft.Storage','storageAccounts').apiVersions[0]]"


### 2. 虚拟机登录认证方式, Login authentication method of VM
In addition to the username-password mode of VM login, it is strongly recommended to support the way of certificate and SSH key login. Please refer to part of **certificate** and **osProfile** of [Azure virtual machine scale sets FAQs](https://docs.azure.cn/zh-cn/virtual-machine-scale-sets/virtual-machine-scale-sets-faq) and example [101-vm-sshkey GitHub QuickStart Template](https://github.com/Azure/azure-quickstart-templates/blob/master/101-vm-sshkey/azuredeploy.json). 除了支持虚拟机登录的用户名密码方式，强烈建议同时支持证书或 SSH 密钥登录的方式。请参考 [Azure 虚拟机规模集常见问题解答](https://docs.azure.cn/zh-cn/virtual-machine-scale-sets/virtual-machine-scale-sets-faq) 中的证书以及osProfile部分以及案例 [101-vm-sshkey GitHub 快速入门模板](https://github.com/Azure/azure-quickstart-templates/blob/master/101-vm-sshkey/azuredeploy.json)。

### 3.	allowedValues
一般Azure云平台中心的虚拟机的类型是比较齐全的，但是有时候会有一定的变化，比如会增加新的虚拟机型号。在 ARM 模板中，可以用 “allowedValues” 指定允许选择的虚拟机大小，但这样有时候会错过Azure平台上新增加的虚拟机型号，所以一般建议选择使用“excludedValues”。虚拟机型号请参考 [常规用途 Linux 虚拟机大小](https://docs.azure.cn/zh-cn/virtual-machines/Linux/sizes-general)，[常规用途 Windows 虚拟机大小](https://docs.azure.cn/zh-cn/virtual-machines/Windows/sizes-general)，及其 [虚拟机价格](https://www.azure.cn/pricing/details/virtual-machines/)。

### 4. Resource dependency. 资源依赖关系
Since the ARM template is resource-centric, you need to pay special attention to the dependencies between resources and understand the sequence of the processes generated by these resources. For example, in the following example, you can set up ARM for WebSite in Azure (refer to the use case Wordpress ARM template in Azure Portal). 由于 ARM 模板是以资源为中心进行组织的，所以需要特别注意资源之间具有依赖关系，并理解这些资源产生的过程先后顺序，例如下例中对于 Azure 中建立 WebSite 的 ARM (参考 Azure Portal 中用例 Wordpress ARM 模板)。 
	
	The connection test process (type "config") dependsOn PHP configuration (type "config"); PHP configuring dependsOn php software installation (type "extensions"); php software installation depends on the site (type "Microsoft.Web/sites/"). 连接测试过程(type "config") dependsOn php配置(type “config”)；php 配置 dependsOn php 软件安装(type "extensions")； php 软件安装依赖于 Web 站点(type "Microsoft.Web/sites/") 。
	Without a strict relationship definition of resource dependence, the creation of WebSite can sometimes be successful, but it is not stable and often fails, and it is difficult to find the cause. 如果没有严格的资源依赖的关系定义，WebSite 的创建有时候也能成功，但并不稳定并且经常会失败，且难以查找原因。

 How to use a dependency relationship, please refer to [Conditionally deploy a resource in an Azure Resource Manager template](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-define-dependencies). 依赖关系如何使用参见 [定义在 Azure Resource Manager 模板中部署资源的顺序](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-define-dependencies)。

### 5. Extensions issues. Extensions 问题
ARM often needs to use the Extensions script. Because the Extensions script is executed when the virtual machine is created, the script usually needs to be downloaded and executed over the network. If the script is placed on an external network (such as Github), download failure or slow situation often occur in practice. Therefore, we recommend putting scripts on the Azure cloud platform.  ARM 中经常需要用到 Extensions 脚本，Extensions 脚本由于是在虚拟机创建时得到执行，因此脚本通常需要通过网络下载并执行；如果脚本放在外网（例如 Github），实践中经常容易出现下载失败或缓慢的情况。因此我们建议将脚本放到 Azure 云平台。

### 6. VHD 镜像引用
If you need to reference VHD image in your ARM template, you first need to publish this image on the [Azure Marketplace Publishing Platform](https://market-publish.azure.cn/)(Hide release, the image is only published but not shown in Azure Portal). After the image is published successfully, you need to obtain the published image information from the Azure Marketplace support staff. The following four items need to be used in the template and referenced in ARM. 如果在 ARM 模板中需要引用 VHD 镜像，首先需要先在 [Azure 市场发布平台](https://market-publish.azure.cn/)发布这个镜像（隐藏发布，镜像只是发布了但并不在Azure Portal中显示），镜像发布成功后，需要向 Azure 市场支持人员获取已发布的镜像信息，主要包括 ARM 模板中需要用到的如下四项，并在 ARM 中引用。
	"storageProfile": {
    	"imageReference": {
       		"publisher": "abcpublisher",
       		"offer": "abcimage",
       		"sku": "standard",
       		"version": "latest"
    	}
	}

 For ARM template parameters, please refer to [ARM template parameters](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-templates-parameters). [ARM 模板参数](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-templates-parameters)


## ARM template testing deployed to Azure platform. ARM 模板部署到 Azure 平台的测试
Under PowerShell, login to Azure platform in ARM mode and deploy ARM template. For detailed ARM deployment and test methods, please refer to [Deploy resources with ARM templates and Azure PowerShell](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-template-deploy). 在 PowerShell 下，以 ARM 模式下登录到 Azure 平台，并部署 ARM 模板。详细的 ARM 部署和测试方法请参考 [使用 ARM 模板和 Azure PowerShell 部署资源](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-template-deploy)。
