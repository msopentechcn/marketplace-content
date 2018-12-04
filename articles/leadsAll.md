---
title: Azure 市场销售商机 | Azure
description: Azure 市场销售商机
services: 
author: siwlv
manager: wayi
ms.assetid: 
ms.service: multiple
ms.tgt_pltfrm: na
ms.devlang: na
ms.topic: articles
ms.date: 05/17/2018
ms.author: siwlv
---


# Azure 市场销售商机（LEADS GENERATION）
> [!div class="op_single_selector"]
> * [中文](https://docs.azure.cn/zh-cn/articles/azure-marketplace/leadsguide)
> * [英文](https://docs.azure.cn/en-us/articles/azure-marketplace/leadsguide)

Customers are the center of any good business. In the transformation of today’s product acquisitions, marketers need to focus on connecting with customers directly and building a relationship. This is why generating high-quality leads is a vital tool for your sales cycle. With the Cloud Partner Portal, we have enabled you to programmatically receive customer contact information immediately after a customer expresses interest or deploys your product. In this document, we will go through all you need to know about these generated leads, how to connect them to your CRM system, and how to integrate them into sales pipeline.

今天，好的生意是围绕顾客展开的，如果想要有一个良好的销售转化，营销人员需要专注于直接与客户建立联系并维护良好的客户关系，这就是为什么生成高质量的销售商机（LEADS GENERATION）会成为您销售周期的重要工具，Azure 市场便提供了这样的工具。在 Azure 市场，一旦有客户部署您的产品，您可以立即接收到客户联系信息（通过可编程方式）。在本文中，我们将详细介绍这些生成的销售商机，如何将它们连接到您的 **Azure 表**或 **SalesForce CRM 系统**，以及如何将它们集成到销售管道中。

These leads are customers that are deploying your products from the Marketplace. Whether your product is listed on Azure Marketplace or AppSource, you will be able to receive leads of your customers interested in your product.

Azure 市场的销售商机是从[Azure 市场](https://market.azure.cn)上部署你的产品的客户信息。当合作伙伴在 Azure 市场发布镜像或 ARM 模板的时候，如果对产品进行了销售商机管理的配置（请参考[虚拟机镜像发布指南](https://docs.azure.cn/articles/azure-marketplace/imagepublishguide)和[ARM 模板发布指南](https://docs.azure.cn/articles/azure-marketplace/armpublishguide)），当用户在 Azure 市场部署您的产品并接受您的销售商机协议的时候，您将能够接收到该客户的销售商机信息。本文中，销售商机和销售线索表示同一含义，一般销售线索用代表更具体的内容。

## 1. 销售商机的配置

目前，Azure 市场支持将销售商机存储到 “Azure 表” 或 “SalesForce CRM 系统” 中。当然前提条件是，您需要在 Azure 门户有账号和订阅，或者在 SalesForce 系统中有账号，并且在 Azure 或 SalesForce 中生成连接字符串。

### 1.1 Azure 表连接字符串获取

This document provides you with instructions on how to setup your Azure Table so that Microsoft can provide you with sales leads. Azure Table is the best default choice for if you want to do something custom with how you store your leads.

本节为您提供如何设置 Azure 表以及获取连接字符串的说明，以便 Azure 市场可以为您提供销售商机，一般来说，我们推荐 Azure 表成为您的首选。

#### 1.1.1 如果您还没有 Azure 账号，请通过[Azure试用申请表](https://www.azure.cn/pricing/1rmb-trial-full/?form-type=identityauth)获取。

#### 1.1.2 通过 Azure 账号登录[Azure 门户](https://portal.azure.cn)，然后生成存储账号，如下图所示。存储价格请参考 [存储定价](https://www.azure.cn/pricing/details/storage/)

![LeadsAzureTableStorage](https://i.imgur.com/LGl5vwV.png)

#### 1.1.3 Next, copy the connection string for the key and paste it into the Storage Account Connection String field on the Cloud Partner Portal. 拷贝连接字符串，如下图所示

![LeadsAzureTableConnString](https://i.imgur.com/g7O843V.png)

You can use [Azure storage explorer](https://archive.codeplex.com/?p=azurestorageexplorer)(third party app) or any other tool to see the data in your storage table or export the data. 您可以利用[Azure存储资源管理器](https://archive.codeplex.com/?p=azurestorageexplorer)或任何其它的工具查看存储表中的数据。



### 1.2 SalesForce CRM 连接字符串获取

#### 1.2.1 点击“Setup”菜单
![salesforce-setup](https://i.imgur.com/59bg2BI.png)
#### 1.2.2 生成包含连接字符串的销售线索表格
点击导航条“Build->Customize->Leads->Web-to-Lead”，选择对应的项目，然后点击“Generate”，生成“Web-to-Lead” 表格。
![salesforceWebToLead](https://i.imgur.com/KLgiCRH.png)
#### 1.2.3 获取需要的连接字符串
如下图“Web-to-Lead” 表格所示，“oid”对应的“value”就是所需要的连接字符串，请拷贝这个字符串。
![salesforceOID](https://i.imgur.com/wG307m7.png)
#### 1.2.4 查看SalesForce CRM系统中现有的销售线索列表
回到首页，点击“Lead”菜单，然后选择“All Open Leads”，可以查看所有的销售线索。
![salesforceLeadsMenu](https://i.imgur.com/4jmC6q9.png)
![salesforceLeadsList](https://i.imgur.com/n6c5SEQ.png)

#### 1.3 Azure 市场端连接字符串配置


## 2. 销售商机如何获得 
Customer consents to sharing their information after clicking the “Get it now” button. This lead is an initial interest lead, where we share a customer who has expressed interest in getting your product and is the top of the acquisition funnel.

如下图所示，客户同意在点击“立即部署”按钮后分享他们的信息，这是客户表示对产品有兴趣的初始的销售线索，经过客户的授权后，我们会将这个兴趣记录到您指定的位置，这是兴趣漏斗数据的顶部。

![sample-leads](https://i.imgur.com/MocUkHt.png)

Customer clicks “Purchase” in the Azure Portal when they are officially acquiring your product. This lead is an active lead, where we share a customer who has an Azure Subscription and has started to deploy your actual product.

销售商机非常重要，但目前只支持 [Azure 市场](https://market.azure.cn)，[Azure 门户](https://portal.azure.cn)暂不支持。

What next?
Once the technical set up is in place, you should incorporate these leads into your current sales & marketing strategy and operational processes. We are very interested in better understanding your overall sales process and want to work closely with you on providing high-quality leads and enough data to make you successful. We welcome your feedback on how we can optimize and enhance the leads we send you with additional data to help make these customers successful. Please let us know if you’re interested in providing feedback and suggestions to enable your sales team to be more successful with Marketplace Leads.

如果销售商机设置到位，建议您把这些销售线索纳入到您目前的销售营销战略和操作流程，我们非常有兴趣更好地了解您的整体销售过程，得到您的反馈，并希望与您密切合作。

## 3. 销售线索数据内容和格式

### 3.1 Lead Source
Each lead you receive will have data passed in these specific fields. Since you will get leads from multiple steps along each customers' acquisition journey, the best way to handle the leads is to de-duplicate and personalize the follow-ups. This way each customer is getting an appropriate message, and you are creating an unique relationship every time.

销售线索中的主要的字段有 Source，Action和Offer。

#### 3.1.1 Source 主要包括如下字段

	“AzureMarketplace”,
	“AzurePortal”,
	“TestDrive”, 
	“SPZA” (acronym for AppSource)

目前对于 Source，Azure 中国市场只支持“AzureMarketplace”。

#### 3.1.2 Actions 字段解析如下
	
 - “INS” – Stands for Installation. This is on Azure Marketplace or AppSource whenever a customer hits the button to acquire your product.代表安装。这会发生在当客户点击“立即部署”按钮以获取你的产品的时候。

 - “PLT” – Stands for Partner Led Trial. This is on AppSource whenever a customer hits the Contact me button.代表合作伙伴的销售商机尝试。这会发生在 AppSource 中当客户点击“请联系我”的按钮的时候。目前暂不支持。

 - “DNC” – Stands for Do Not Contact. This is on AppSource whenever a Partner who was cross listed on your app page gets requested to be contacted. We are sharing the heads up that this customer was cross listed on your app, but they do not need to be contacted.代表请不要联系。只会在 AppSource 中出现。目前暂不支持。

 - “Create” – This is inside Azure Portal only and is whenever a customer purchases your offer to their account.这表示当一个客户在 Azure 门户中购买您的产品的时候。目前暂不支持。

 - “StartTestDrive” – This is for Test Drives only and is whenever a customer starts their test drive. 这用于“Test Drives”，目前暂不支持。

#### 3.1.3 Offers字段是您的产品/服务的 ID，“.”之前和之后分别代表发布者和产品/服务名称

	“arraynetworks.ArrayLoadBalancervAPV”,
	“yungoalbj.redhatredhatenus730”,
	“yuntalk.joomlazhcncentos”



### 3.2 CustomerInfo，用户信息
举例如下：
	{
		"FirstName":"Dashan",
		"LastName":"Liang",
		"Email":"ldashan@microsoft.com",
		"Phone":"1234567890",
		"Country":"CN",
		"Company":"Microsoft",
		"Title":"CTO"
	}

Note: Not all data will be available for each lead
We are actively working on enhancing leads, so if there is a data field that you do not see here but would like to have, please send us your feedback. 注意，对每条销售线索来说，不是所有的数据都一定能得到，如果您有什么疑问，请[联系我们](https://market-publish.azure.cn/contact/feedback)。
