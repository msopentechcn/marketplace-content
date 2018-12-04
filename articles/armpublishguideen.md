---
title: Azure Marketplace ARM template Publishing Guide | Azure
description: Azure Marketplace ARM template Publishing Guide
services: 
author: siwlv
manager: wayi
ms.assetid: 
ms.service: multiple
ms.tgt_pltfrm: na
ms.devlang: na
ms.topic: articles
ms.date: 04/18/2018
ms.author: siwlv
---

# Azure Marketplace ARM template Publishing Guide
> [!div class="op_single_selector"]
> * [Chinese](https://docs.azure.cn/zh-cn/articles/azure-marketplace/armpublishguide)
> * [English](https://docs.azure.cn/en-us/articles/azure-marketplace/armpublishguide)
This article, define some base concepts of Azure Marketplace in China. Step 2, walks you through preparing the ARM template that you will deploy to the Azure Marketplace. You can easily publish your ARM template to the Azure Marketplace by following these steps.

The scope of **Azure Marketplace** in this article is all in mainland China.

After published, the ARM template will be visible on both [Azure Marketplace](https://market.azure.cn/) and [Azure portal](https://portal.azure.cn).

## 1. Prerequisites and preparations

1.1 First, register as an Azure Marketplace service provider. Please refer to [Azure Market Service Provider Guide](https://docs.azure.cn/articles/azure-marketplace/publishguide).

1.2 Secondly, prepare the pre-publish data and ARM template file. Please refer to [Understand the structure and syntax of Azure Resource Manager templates](https://docs.azure.cn/azure-resource-manager/resource-group-authoring-templates).

1.3 Then, after the image is created and tested locally, please upload it to the Azure storage account. Note that you can use tools like Powershell or Azure-cli for testing. Please refer to [创建和部署第一个 Azure 资源管理器模板](https://docs.azure.cn/azure-resource-manager/resource-manager-create-first-template).

## 2. Publishing the ARM template to Azure Marketplace in China on Publishing Portal

To publish an ARM template offer to Publishing Portal, you should first login [Publishing Portal](https://market-publish.azure.cn/) based on section 1.1 **Prerequisites and preparations**.

Then, you can begin the publishing process by clicking the menu 'publish'->'ARM template' with [Publish ARM template](https://market-publish.azure.cn/vhd/index) as below steps.

### 2.1 Define Offers and SKU

A SKU is the commercial name for an ARM template offer and is the smallest purchasable unit of an offer. An ARM template may contain virtual machines, storage accounts, virtual networks, web apps, databases, database servers, or 3rd party services. It is essentially the complete profile for a resource group or a cluster.

Publisher, Offer and SKU can define an unique ARM offer in Azure Marketplace.
An offer is a "parent" to all of its SKUs. You can have multiple offers. How you decide to structure your offers is up to you. When an offer is pushed to staging, it is pushed along with all of its SKUs. Carefully consider your SKU identifiers, because they will be visible in the URL:

 - Azure Marketplace: https://market.azure.cn/marketplace/apps/{Publisher}.{OfferIdentifier}{SKUidentifier}?tab=Overview
 - Azure Portal: https://portal.azure.cn/#blade/Microsoft_Azure_Marketplace/GalleryFeaturedMenuItemBlade/selectedMenuItemId/home 

### 2.2 Login Marketplace and select publishing function
 - Sign in to the [Publishing Portal](https://market-publish.azure.cn/) by using your seller account.
 - Select the **ARM template** tab of the Publishing Portal in menu Publishing.

### 2.3 Select Publisher ID
This dropdown allows you to choose the publisher profile you want to publish this offer under. Note that this field is locked once an offer goes live.

### 2.4 Fill in an Offer Id
In the prompted entry field (Offer Id), enter your offer name. The offer Id is typically the name of the product or service that you plan to sell in the Azure Marketplace.

The offer Id can only contain  Lowercase letters, Digital number, '-' or '_'. The Id cannot end in a dash and can have a maximum of 50 characters. Note that this field is locked once an offer goes live.

### 2.5 Fill in an Image Name and its English Name of ARM template
This is the display name for your offer. This is the name that will show up in [Azure Marketplace](https://market.azure.cn/) and [Azure portal](https://portal.azure.cn) in China. It can have a maximum of 50 Non-Chinese characters or 25 Chinese characters. Guidance here is to include a recognizable brand name for your product. Don't include your company name here unless that is how it is marketed. If you are marketing this offer at your own website, ensure that the name is exactly how it shows up in your website.

### 2.6 Fill in the Offer Version of ARM template
Note that the version is for the ARM template but not for the software. If you want to make the version of software visible, you can fill the software version in the title or description form. The ARM template version needs to follow the [semantic version](http://semver.org/) format. Versions should be of the form X.Y.Z, where X, Y, and Z are integers like 1.0.0. Versions within an offer should only be incremental changes.

### 2.7 Upload Icons

he icons include 'Main' and 'Wide' types.All the logos uploaded in the Publishing Portal should follow the below guidelines:

 - The Azure design has a simple color palette. Keep the number of primary and secondary colors on your logo low.

 - The theme colors of the Azure portal are white and black. Hence avoid using these colors as the background color of your logos. Use some color that would make your logos prominent in the Azure portal. We recommend simple primary colors. If you are using transparent background, then make sure that the logos/text are not white or black or blue.
 - Avoid placing text, even your company or brand name, on the logo. The look and feel of your logo should be 'flat' and should avoid gradients.
 
 - The logo should not be stretched.
 - Logo must conform to the pixels (115x115 and 255x115).

### 2.8 Upload other Screenshots pictures with Cover and More Screenshots
The Cover picture will show up in the detailed page in Azure Portal and Azure Marketplace. And the other More Screenshots pictures will only show up in  Azure Marketplace. For the pictures guidelines, please refer to the section of **Upload logos** and the pictures must conform to the pixels (533x324).

### 2.9 Select a pricing model
There are currently 2 kinds of pricing models supported, Free Trial and Bring-Your-Own-License (BYOL)

For Free Trial, Microsoft will charge the infrastructure costs and no software licensing costs are charged. Please refer to [Azure Service Prices](https://www.azure.cn/pricing/).

For BYOL, the publisher can manage the licensing of the software running on the ARM. Microsoft will only charge the infrastructure costs. In this mode, customers need get license from the publisher via email, telephone or other contacts. You can specify if you want to provide a free trial for your customers. The free trial selections are 30/90 days or no free trial after deploying the ARM offer.

### 2.10 Select Category
Select up to 3 categories from the provided list that your offer can be best associated with. The selected categories will be used to map your offer to the product categories available in [Azure Marketplace](https://market.azure.cn/) and [Azure portal](https://portal.azure.cn) in China.

### 2.11 Fill in EULA(End User License Agreement) url
We suggest that the EULA url is put on the home website of your company.

### 2.12 Fill in Privacy Statement
We suggest that the EULA url is put on the home website of your company.

### 2.13 Fill in Summary description
Summary descriptions are visible to customers, so you should make them easily readable.The lenth is at most no more than 100 Chinese characters or 200 Non-Chinese characters.

### 2.14 Fill in a Description
The descriptions are visible to customers. It can be edited in rich text editor mode, also it can be added with html code by clicking the 'HTML' tag in the rich text editor.

### 2.15 Select Collect user information
If you want to collect users' information, you need to provide Azure storage connection string, we will store users' data into your storage table.

### 2.16 Upload ARM template file
If your ARM template is composed of multiple files, please upload the master template file to here, other template files or installation packages should be uploaded as attachments.

### 2.17 Upload ARM template attachments
Upload various other template files or installation packages referenced by the main template file.

### 2.18 Add Useful Links
You can add some useful documents, such as GUIDE documents.These links will be displayed after the description of the image.

### 2.19 Select if the ARM template resources are OSS
You can specify if the ARM template resources are open-source software(OSS).  Please note that if the ARM template references the virtual machine, make sure that if the software in the virtual machine is open source or not.

### 2.20 Fill in technical support and customer service contact
Please leave technical support and customer service contact.


## 3. Updating and deleting the image from Azure Marketplace
After submit your publishing request to Publishing Portal, you can easily edit, update and delete the offers.

### 3.1 Find the place where you can edit, update and delete the offers
Login [Publishing Portal](https://market-publish.azure.cn), click the publisher link at the top right corner of the page. You will find all the offers you submitted or published. 登录[发布平台](https://market-publish.azure.cn)

### 3.2 Click edit, delete or ‘publish new version’ button to continue
- The steps are easy and you can fill in the forms following the steps and tips in the page.
- In editing function, editing function is only used for editing and displaying offer content, and can not be modified for offer itself, so service providers ID, service ID, ARM template files and version numbers can not be modified.
- The function of publishing a new version, is mainly for the upgrading of the offer itself, so service provider ID, service ID can not be changed, but be sure to upload the new ARM template file (in fact, the new template can be consistent with the existing template file), and the version number must be higher than the existing version.

## 4. Approval of the ARM template
After you have submitted the ARM template, the operator of the platform then can get the request on Publishing Portal. But only you have clicked the button "apply for publishing", the operator can drive your request into publishing process. Before "apply for publishing", you can check, edit and upgrade the ARM template to make the it more perfect.

After you have applied the publishing request, you can wait for the approval of image which is operated by the operator of Azure Marketplace. If there is no big problems, it can be finished in around two weeks and you will receive an email from the operator.

Once the operator contacts you and has notified you that the offer has been in staging state and can be tested by the publisher, you should test the staging offer in various use-case scenarios in Azure Portal. If the offer is tested good, you should give feedback to the operator and confirm the result of the test.

After ARM offer in staging is approved, the publishing process is completed and the offer will show up in [Azure Marketplace](https://market.azure.cn/) and [Azure portal](https://portal.azure.cn).




