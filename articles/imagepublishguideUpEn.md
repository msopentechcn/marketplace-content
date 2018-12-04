# Azure China Marketplace VM Image Publishing Guide [[中文版本](https://market-publish.azure.cn/documentation/article/imagepublishguide/)]

This article, define some base concepts of Azure Marketplace. Step 2, walks you through preparing the virtual hard disks (VHDs) that you will deploy to the Azure Marketplace. Your VHDs are the foundation of your SKU. The process differs depending on whether you are providing a Linux-based or Windows-based SKU. This article covers both scenarios. 

After published, the image will be visible on both [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn).


## 1. Prerequisites and preparations

1.1 Register as an Azure China Marketplace service provider. Please refer to [ISV Onboarding Guide](https://market-publish.azure.cn/documentation/article/publishguideen/).

1.2 Prepare the pre-publish data and VM image file. Please refer to  [VM Image Creation Guide](https://market-publish.azure.cn/documentation/article/imageguideen/).

1.3 After the image is created and tested locally, please upload it to the Azure storage account. Note that you can use tools like Powershell or Azure-cli for testing.


## 2. Publishing the image to Azure China Marketplace on Publishing Portal
To publish an image offer to Publishing Portal, you should first login [Publishing Portal](https://market-publish.azure.cn/) based the section 1 **Prerequisites and preparations**.

Then, you can begin the publishing process by clicking the menu 'publish'->'VM image' with [Publish VM images](https://market-publish.azure.cn/vhd/index) as below steps.  


### 2.1 Define Offers and SKU

In this section, you learn to define the offers and their associated SKUs.

Publisher, Offer and SKU can define an unique VM image in Azure Marketplace.
An offer is a "parent" to all of its SKUs. You can have multiple offers. How you decide to structure your offers is up to you. When an offer is pushed to staging, it is pushed along with all of its SKUs. Carefully consider your SKU identifiers, because they will be visible in the URL:

 - Azure.cn: https://market.azure.cn/zh-cn/marketplace/apps/{Publisher}.{OfferIdentifier}{SKUidentifier}?tab=Overview
 - Azure portal: https://portal.azure.cn/#blade/Microsoft_Azure_Marketplace/GalleryFeaturedMenuItemBlade/selectedMenuItemId/home 

A SKU is the commercial name for a VM image and is the smallest purchasable unit of an offer. A VM image contains one operating system disk and zero or more data disks. It is essentially the complete storage profile for a virtual machine. One VHD is needed per disk. Even blank data disks require a VHD to be created.


### 2.2 Login Marketplace and select publishing function
 - Sign in to the [Publishing Portal](https://market-publish.azure.cn/) by using your seller account.
 - Select the Virtual Machines tab of the Publishing Portal in menu Publishing. 

### 2.3 Select Publisher ID
This dropdown allows you to choose the publisher profile you want to publish this offer under. Note that this field is locked once an offer goes live.

### 2.4 Fill in an Offer name
In the prompted entry field (Service ID), enter your offer name. The offer name is typically the name of the product or service that you plan to sell in the Azure Marketplace. 

The offer name can only contain  Lowercase letters, Digital number, '-' or '_'. The name cannot end in a dash and can have a maximum of 50 characters. Note that this field is locked once an offer goes live.

### 2.5 Fill in a SKU
After you have filled in the offer name, you need to define and identify your SKUs. As a publisher, you can have multiple offers, and each offer can have multiple SKUs under it.  

The SKU requires an identifier, which is used in the URL. The identifier must be unique within your publishing profile, but there is no risk of identifier collision with other publishers. The SKU name can only contain  Lowercase letters, Digital number, '-' or '_'.

### 2.6 Fill in a image name
This is the display name for your offer. This is the name that will show up in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn). It can have a maximum of 50 Non-Chinese characters or 25 Chinese characters. Guidance here is to include a recognizable brand name for your product. Dont include your company name here unless that is how it is marketed. If you are marketing this offer at your own website, ensure that the name is exactly how it shows up in your website.

### 2.7 Fill in the version of image
Note that the version is for the image but not for the software. If you want to make the version of software visible, you can fill the software version in the title or description form. The VM image version needs to follow the [semantic version](http://semver.org/) format. Versions should be of the form X.Y.Z, where X, Y, and Z are integers like 1.0.0. Images in different SKUs can have different major and minor versions. Versions within a SKU should only be incremental changes.

### 2.8 Upload logos

All the logos uploaded in the Publishing Portal should follow the below guidelines:

 - The Azure design has a simple color palette. Keep the number of primary and secondary colors on your logo low.

 - The theme colors of the Azure portal are white and black. Hence avoid using these colors as the background color of your logos. Use some color that would make your logos prominent in the Azure portal. We recommend simple primary colors. If you are using transparent background, then make sure that the logos/text are not white or black or blue.

 - Do not use a gradient background on the logo.

 - Avoid placing text, even your company or brand name, on the logo. The look and feel of your logo should be 'flat' and should avoid gradients.
 
 - The logo should not be stretched.

### 2.9 Upload other pictures
The first picture will show up in the detailed page in Azure Portal and Azure China Marketplace. And the other pictures will only show up in  Azure China Marketplace. For the pictures guidelines, please refer to the section of **Upload logos**.

### 2.10 Select a pricing model
There are currently 2 kinds of pricing models supported, Free Trial and Bring-Your-Own-License (BYOL).

For Free Trial, Microsoft will charge the infrastructure costs and no software licensing costs are charged. Please refer to [Virtual machines prices](https://www.azure.cn/pricing/details/virtual-machines/)

For BYOL, the publisher can manage the licensing of the software running on the VM. Microsoft will only charge the infrastructure costs. In this mode, customers need get license from the publisher via email, telephone or other contacts. You can specify if you want to provide a free trial for your customers. The free trial selections are 30/90 days or no free trial after deploying the VM.

### 2.11 Select categories
Select up to 3 categories from the provided list that your offer can be best associated with. The selected categories will be used to map your offer to the product categories available in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn).

### 2.12 Fill in EULA url
We suggest that the EULA url is put on the home website of your company.

### 2.13 Fill in Chinese title (name) and an English title for your SKU
The titles are visible to customers.

### 2.14 Fill in summary description for your SKU
Summary descriptions are visible to customers, so you should make them easily readable.
The lenth is at most no more than 50 Chinese characters or 100 Non-Chinese characters.

### 2.15 Fill in a description for your SKU
The descriptions are visible to customers. It can be edited in rich text editor mode, also it can be added with html code by clicking the 'HTML' tag in the rich text editor. 

### 2.16 Fill in recommendation machine size
Commonly we suggest that you can select 3 sizes due to appearance issue of Azure portal.

### 2.17 Fill in the file address of VHD
In order to get access authority, the address should be shared access signature(SAS) URI created for the operating system VHD, or the container access policy  of the storage in the URI should be set 'Blob' or 'Container'.

### 2.18 Fill in the url of Data Disk
If the image need attach a Data Disk when VM is deployed, please fill in the URI of the disk. For the URI format or guidelines, please refer to the section **Fill in the file address of VHD**.

### 2.19 Fill in the ports of VHD
When the VM is deployed, the default port service is provided. Note that port number 22 is the default SSH landing port for the Linux virtual machine, and port number 3389 is a remote login port of the Windows virtual machine, which does not need to be added manually.

### 2.20 Select if the image type is OSS
You can specify if the image type is open-source software(OSS).

### 2.21 Fill in technical support and customer service contact
Please leave technical support and customer service contact.

## 3. Updating and deleting the image from Azure China Marketplace
After submit your publishing request to Publishing Portal, you can easily edit, update and delete the offers.

### 3.1 Find the place where you can edit, update and delete the offers
Login [Publishing Portal](https://market-publish.azure.cn), click the publisher link at the top right corner of the page. You will find all the offers you submitted or published.

### 3.2 Click edit, delete or upgrade button to continue
The steps are easy and you can fill in the forms following the steps and tips in the page. 

## 4. Approval of the image
After you have submitted the image, the operator of the platform then can get the request on Publishing Portal. But only you have clicked the button "apply for publishing, 申请上架", the operator can drive your request into publishing process. Before "apply for publishing, 申请上架", you can edit the image to make the image more perfect. 

After you have applied the publishing request, you can wait for the approval of image which is operated by the operator of Azure China Marketplace. If there is no big problems, it can be finished in around two weeks and you will receive an email from the operator.

Once the operator contacts you and has notified you that the VM offer has been in staging state and can be tested by the publisher, you should test the staging image in various use-case scenarios in Azure Portal. If the image is tested good, you should give feedback to the operator and confirm the result of the test.

After VM offer in staging is approved, the image publishing process is completed and the image will show up in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn).
