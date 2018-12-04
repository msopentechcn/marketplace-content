---
title: Azure 市场用户指南 | Azure
description: Azure 市场用户指南
services: 
author: siwlv
manager: wayi
ms.assetid: 
ms.service: multiple
ms.tgt_pltfrm: na
ms.devlang: na
ms.topic: articles
ms.date: 05/25/2018
ms.author: siwlv
---

# Azure 市场用户指南
> [!div class="op_single_selector"]
> * [中文](https://docs.azure.cn/zh-cn/articles/azure-marketplace/userguide)
> * [英文](https://docs.azure.cn/en-us/articles/azure-marketplace/userguide)
本指南描述了了 Azure 市场的基本概况，并概述了用户使用 Azure 产品所需遵循的基本流程和注意事项。


## 1. Azure市场介绍
How do I get started in Azure Marketplace? 
Visit the Azure Marketplace web-based storefront and browse through the wide range of quality enterprise applications and solutions that are certified and optimized to run on Azure. Azure Marketplace can also be accessed through Azure Management Portal under ‘Create a Resource’. Click here to learn more.
[Azure 市场](https://market.azure.cn/)由世纪互联运营，是 Azure 合作伙伴产品及服务的统一展现门户，Azure 市场是一个镜像仓库，它是 Azure 云业务的核心引擎之一，是 Azure 合作伙伴为 Azure 客户提供最佳解决方案和服务的连接平台。 Azure 市场的运营范围为中国大陆（不包括港澳台）。

What are the key benefits of Azure Marketplace? 
Azure Marketplace is the store for IT Pros and Developers to discover technical applications built for or built on Azure. Instantly gain access to 140 global markets and solutions and offerings from our 300K+ partner ecosystem. It combines Microsoft Azure's ecosystem of solutions and services into a single, unified platform for you to discover, trial and buy solutions in a just a few clicks.
Azure 市场可以为IT专业认识和开发者提供构建于 Azure 平台上的各类应用，它包含了构建 IT 基础所需要的操作系统、安全类应用、网络设备、存储、数据库等到 Web 应用、数据分析、项目管理工具、监控软件、管理软件等应用系统的各个方面，其中也包含了大量的 Microsoft 第一方应用。您可以利用 Azure 市场丰富的产品，迅速构建出基于 Azure 平台的基础架构、应用系统或开发系统。 Azure 市场是 Microsoft Azure 平台生态体系的重要组成部分。 


## 2. Azure市场产品购买

How do I purchase products from the Azure Marketplace? 
You can find Azure Marketplace offers via the web-based storefront, in the Microsoft Azure Management portal, or via the Azure Marketplace Command Line Interface (CLI). Once logged into the Azure Marketplace, you can discover and buy Microsoft and Partner solutions. Please note: Prepaid credits and other forms of Monetary Commitment cannot be used to pay for software license fees (except those listed here), but can be used to pay associated Azure usage charges.

[Azure 市场](https://market.azure.cn/) 的产品包括镜像、ARM 模板和定制服务三种产品形式，用户点击其中的镜像和 ARM 产品，可以通过 [Azure 门户](https://market.azure.cn/) 将产品部署到 Azure 平台。定制服务本身不能够直接部署到 Azure 平台，但您可以通过“联系服务商”和服务商或集成商取得联系，获取定制化的解决方案或帮助。

Azure 市场目前支持免费，及自带许可证（BYOL，Bring Your Own License）模式，目前暂不支持现收现付（PAYG，Pay As You Go）模式。请注意，在 BYOL 模式下，Azure 市场不会直接对客户单独收取许可证费用，客户需要主动联系服务商支付许可证费用，但客户部署虚拟机镜像或 ARM 模板，都需要支付订阅中消费的 Azure 资源费用。

下表描述了 Azure 市场当前支持的商务模式，一个产品/服务可以包括使用不同定价模型的 SKU。对于定制服务，客户可以直接联系定制服务服务商寻求合适的解决方案。

| **定价模型** | **说明** | **适用对象** |
| --- | --- | --- |
| 免费 | 免费SKU。不会因客户使用产品/服务而向其收取 Azure 市场费用，也不能向用户收取产品费用。 | 虚拟机镜像，ARM 模板|
| 免费试用 | SKU 有限时间免费推广版。在试用期期间，将不会因客户使用产品而向其收取 Azure 市场费用。 在试用期到期后，将自动基于标准费率向使用产品的客户进行收费。 Azure 市场当前无法阻止用户创建针对免费试用产品的多个订阅，为客户提供免费试用产品创建订阅的服务商可以提供适当的限制条件。 | 虚拟机镜像，ARM 模板 |
| BYOL | 自带许可 (BYOL) SKU。 许可证费用由客户和服务商协商确定，且不因客户在 Azure 市场中使用该产品/服务而向客户收取 Azure 市场费用。 | 虚拟机镜像，ARM 模板 |

Can I choose which Microsoft Azure region(s) my Azure Marketplace purchase will be deployed? 
Customers have the option of deploying to any Azure datacenter region that a publisher enables. You can select data center locations closest to their services to optimize performance and manage budget. 
If I accidentally delete an Azure Marketplace purchase, can I “undo” the action? 
No, deletions are final. If you accidentally delete a subscription, you can easily restart it by purchasing again, but will lose any unused functionality or prepaid services so take care when deleting a subscription.

Will I be warned if I try to delete an Azure Marketplace purchase that is in use by one of my applications? 
No, Azure will not warn you if you delete a purchase that your application depends on.
If my Azure Marketplace purchase has any dependencies on other assets such as an Azure website, will I have to manage them? 
Dependencies are not automatically managed for Azure Marketplace offerings. Please carefully review the description of your Azure Marketplace purchase before using it to determine if there are any dependencies you need to be aware of prior to deploying the solution.
Can I buy Azure Marketplace solutions from an Azure Cloud Solution Provider? 
Currently, only free and bring-your-own-license (BYOL) Marketplace offers are available to Azure CSP and Open customers.

请注意，您可以将产品部署到“中国北部”或“中国东部”数据中心。如果您删除了您部署的产品，被删除的产品将不能恢复，如果您删除了您的订阅，则订阅中所有部署的产品和服务也都将失效，请小心操作您的部署。 另外，很多产品依赖于别的产品或服务，比如 Azure website，如果您删除了被依赖的产品或服务，Azure 平台不会进行警告，所以当您购买产品或服务的时候，使用前请仔细阅读您购买的产品说明，或从服务商获取帮助，以判断是否有这种依赖。

## 3. 镜像查找和部署

### 3.1 部署产品的先决条件

首先您需要一个有 Azure 账号，如果没有，可以 [申请试用账号](https://www.azure.cn/pricing/1rmb-trial?v=b)。 如果不使用试用账号，也可以 [申请预付费账号](https://www.azure.cn/pricing/pia/)

### 3.2 查找产品镜像
Azure 市场可以通过两种方式查找产品镜像，一种是通过 [Azure 市场](https://market.azure.cn)主页，另一种是通过 [Azure 门户](https://portal.azure.cn/)。

[Azure 市场](https://market.azure.cn) 主页包含“所有产品”、“服务商”等菜单，以及“热门推荐”、“热门应用类别”、“免费专区”等模块，几个主要模块如下。

- 所有产品。页面中提供了对 Azure 市场中所有产品和服务的浏览、过滤和查询等功能，包含了虚拟机镜像、ARM 模板以及定制服务等产品，并按不同分类展示。 Azure 用户可以根据需要轻松查找到合适的产品与服务。

- 服务商。页面中链接到 Azure 市场服务商产品管理门户，用于服务商进行产品发布、更新、升级等的维护管理。

- 免费专区。包含了所有的免费应用，包括多个开源应用。请注意，这里的“免费”指的是许可证免费。

登录 [Azure 门户](https://portal.azure.cn/)，点击左上角的“创建资源”并“查看全部”，如下图所示，其中包含了所有的镜像和 ARM 模板，但不包括定制服务：

![IbizaHomepage](https://i.imgur.com/ExQAXly.png)

![IbizaHomepageEn](https://i.imgur.com/jdPEfFi.png)

“创建资源”`Create a resource` “查看全部” `See all`


### 3.3 查看产品的详细信息	

当您单击产品分类中的一个产品图标或者标题时，将打开产品的详细信息页面。在这里，可以了解到该产品更为详细的使用说明，例如：

![MarketWordpress](https://i.imgur.com/srq1z2l.png)

![MarketWordpressEn](https://i.imgur.com/f1f8JYx.png)

对于每一个产品而言，其许可证是否免费以及价格，请仔细阅读使用说明，对于非免费许可证的情况，请联系服务商咨询。另外，请特别注意其中的“法律条款”和“隐私策略”。

### 3.4 部署虚拟机镜像

单击镜像详细信息页面中顶部的"立即部署"按钮，登录到 Azure 门户，单击"创建"按钮，进入虚拟机创建页面。下面主要对前三步的参数配置进行说明。

![ImageDeploy1](https://i.imgur.com/brs4XTV.png)

![ImageDeploy1En](https://i.imgur.com/dJ9VlCh.png)

#### 第一步配置：
- `名称`表示虚拟机名称，请输入 1-64 个字符。
- `VM 磁盘类型`表示虚拟机磁盘类型。
- `用户名`表示创建的虚拟机登录用户名。
- `身份验证类型`表示登录验证类型，可以是`SSH 公钥`或者`密码`。
- `密码`和`确认密码`表示当使用密码验证方式时使用的密码。注意，密码由小写字母、大写字母、数字、特殊符号中至少由 3 种组成，长度至少 12 位。
- `订阅`表示您要使用您帐户中的哪个订阅来创建资源。
- `资源组`表示要资源要创建到哪个资源组内。
- `位置`表示资源要创建的位置。

- `名称` - `Name`
- `VM 磁盘类型` - `VM disk type`
- `用户名` - `User name`
- `身份验证类型` - `Authentication type`
- `SSH 公钥` - `SSH Public Key`
- `密码` - `Password`。
- `订阅` - `Subscription`
- `资源组` - `Resource group`
- `位置` - `Location`

#### 第二步配置：

此步配置虚拟机的计算单元，及相应价格，相关 Azure 计算单元的描述，请参见 [Azure 计算单元 (ACU)](https://docs.azure.cn/virtual-machines/windows/acu)。

#### 第三步配置：

![ImageDeploy2](https://i.imgur.com/eiZLb8w.png)

![ImageDeploy2En](https://i.imgur.com/j4ROH0z.png)

- `高可用性`表示是否将此虚拟机加入到`可用性集`中，添加的方法是：依次点击`可用性集`、`新建`，并设置一个可用性集名称，如`wordpress-avset`单击`确定`。
- `存储`中的`使用托管的磁盘`表示是否使用托管磁盘，相关托管磁盘的描述，建议选择托管磁盘。请参见 [Azure 托管磁盘概述](https://docs.microsoft.com/azure/virtual-machines/windows/managed-disks-overview)
- `虚拟网络`表示要使用的虚拟网络，相关虚拟网络描述，请参见 [Azure 虚拟网络](https://docs.azure.cn/virtual-network/virtual-networks-overview)。
- `子网`表示要使用的虚拟网络中的哪个子网（子网划分），相关子网的详情，请参见 [添加、更改或删除虚拟网络子网](https://docs.azure.cn/virtual-network/virtual-network-manage-subnet)。
- `公共 IP 地址`表示选择要创建的公共 IP 地址，相关公共 IP 地址详情，请参见 [为 Azure 网络接口添加、更改或删除 IP 地址](https://docs.azure.cn/virtual-network/virtual-network-network-interface-addresses)。
- `网络安全组`表示要添加的网络安全组，关于网络安全组详情，请参见 [网络安全组（NSG）简介](https://www.azure.cn/blog/2017/08/04/NSCIntro)。
- `扩展`表示要为此虚拟机添加的扩展插件，一般用于自动化部署等。
- `正在监视`表示是虚拟机的诊断选项。

- `高可用性``High availability`
- `可用性集``Availability set`
- `新建``Create New`
- `确定``OK`。
- `存储``Storage`
- `使用托管的磁盘``Use managed disks`
- `虚拟网络``Virtual network`
- `子网``Subnet`
- `公共 IP 地址``Public ip address`
- `网络安全组``Network security group`
- `扩展``Extensions`
- `正在监视``Monitoring`


以上步骤配置完成后，第四步中检查核对参数概要无误后，点击底部`确定`按钮，即可开始部署。
 
如果您想了解更多使用门户创建虚拟机信息，也可以参看 [使用 Azure 门户创建 Linux 虚拟机](https://docs.azure.cn/virtual-machines/linux/quick-create-portal)和[使用 Azure 门户创建 Windows 虚拟机](https://docs.azure.cn/virtual-machines/windows/quick-create-portal) 章节。


## 4. 部署 ARM 模板

部署 ARM 模板的步骤和部署虚拟机镜像类似，但由于 ARM 模板参数可以由开发者自定义，因此不同的 ARM 模板参数一般不同，如下图 [服网 LNMP 集群](https://market.azure.cn/marketplace/apps/Servinet.lnmp_cluster_mysql_paas?tab=Overview) 的配置参数，其参数的含义可以通过参数名称右方的提示符进行提示。

![ImageDeploy3](https://i.imgur.com/haZ7gUh.png)

![ImageDeploy3En](https://i.imgur.com/Gq5ZWOh.png)

 
 
