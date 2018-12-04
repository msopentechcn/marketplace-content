# Azure 市场虚拟机镜像发布指南 [[中文版本](https://market-publish.azure.cn/documentation/article/imagepublishguide/)]

This article, define some base concepts of Azure Marketplace. Step 2, walks you through preparing the virtual hard disks (VHDs) that you will deploy to the Azure Marketplace. Your VHDs are the foundation of your SKU. The process differs depending on whether you are providing a Linux-based or Windows-based SKU. This article covers both scenarios. 本文定义了 Azure 市场的一些基本概念，步骤 2 将引导服务商完成虚拟硬盘 (VHD) 的准备工作，并将其部署到 Azure 市场。 VHD 是 SKU 的基础，其基于 Linux 或 Windows 的镜像制作过程并不一样，本文对这两种情况都做了介绍。 

After published, the image will be visible on both [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn). 镜像发布后，在[Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国入口](https://portal.azure.cn)上都可以看到。


## 1. Prerequisites and preparations，先决条件和准备

1.1 Register as an Azure China Marketplace service provider. Please refer to [ISV Onboarding Guide](https://market-publish.azure.cn/documentation/article/publishguideen/).注册成为 Azure 市场服务商。 请参考[Azure 市场服务商指南](https://market-publish.azure.cn/documentation/article/publishguideen/)

1.2 Prepare the pre-publish data and VM image file. Please refer to  [VM Image Creation Guide](https://market-publish.azure.cn/documentation/article/imageguideen/).准备发布前资料和虚拟机镜像文件，请参考[虚拟机镜像制作指南](https://market-publish.azure.cn/documentation/article/imageguideen/)

1.3 After the image is created and tested locally, please upload it to the Azure storage account. Note that you can use tools like Powershell or Azure-cli for testing.像制作完成并本地测试后，需要上传到 Azure 存储账户。注意测试可以利用Powershell或Azure-cli等工具。


## 2. Publishing the image to Azure China Marketplace on Publishing Portal，通过发布平台将镜像发布到 Azure 中国市场
To publish an image offer to Publishing Portal, you should first login [Publishing Portal](https://market-publish.azure.cn/) based on section 1.1(bug) **Prerequisites and preparations**. 为了将镜像发布到发布平台，首先，你需要根据1.1部分的介绍登录到[发布平台](https://market-publish.azure.cn/)。

Then, you can begin the publishing process by clicking the menu 'publish'->'VM image' with [Publish VM images](https://market-publish.azure.cn/vhd/index) as below steps.  其次，你需要点击页面菜单中的“发布”->“虚拟机镜像”，也就是[发布虚拟机镜像](https://market-publish.azure.cn/vhd/index)，然后开始镜像发布过程。


### 2.1 Define Offers and SKU，定义产品/服务和 SKU

In this section, you learn to define the offers and their associated SKUs. 在本部分中，会了解如何定义产品/服务及其关联的 SKU。

Publisher, Offer and SKU can define an unique VM image in Azure Marketplace.
An offer is a "parent" to all of its SKUs. You can have multiple offers. How you decide to structure your offers is up to you. When an offer is pushed to staging, it is pushed along with all of its SKUs. Carefully consider your SKU identifiers, because they will be visible in the URL: 在 Azure 市场中，发布者、产品/服务和 SKU 可以唯一地定义一个虚拟机镜像，产品/服务是其所有 SKU 的“父级”，发布者可以拥有多个产品/服务并决定如何构造产品/服务。 将产品/服务推送到待发布环境时，它会随其所有的 SKU 一起推送。 请仔细考虑 SKU ID，因为它们会被显示在 URL 中：

 - Azure 市场: https://market.azure.cn/zh-cn/marketplace/apps/{Publisher}.{OfferIdentifier}{SKUidentifier}?tab=Overview
 - Azure 管理平台: https://portal.azure.cn/#blade/Microsoft_Azure_Marketplace/GalleryFeaturedMenuItemBlade/selectedMenuItemId/home 

A SKU is the commercial name for a VM image and is the smallest purchasable unit of an offer. A VM image contains one operating system disk and zero or more data disks. It is essentially the complete storage profile for a virtual machine. One VHD is needed per disk. Even blank data disks require a VHD to be created. SKU 是虚拟机镜像的商业名称并且并且是产品/服务的最小购买单位，一个虚拟机镜像包含一个操作系统磁盘以及零个或多个数据磁盘，它实质上是虚拟机的完整存储配置文件。 每个磁盘都需要一个 VHD，即使空白数据磁盘也需要创建 VHD。


### 2.2 Login Marketplace and select publishing function，登录 Azure 市场选择发布功能
 - Sign in to the [Publishing Portal](https://market-publish.azure.cn/) by using your seller account. 使用发布商账号登录到[发布平台](https://market-publish.azure.cn/)。
 - Select the Virtual Machines tab of the Publishing Portal in menu Publishing. 在发布菜单中选择发布虚拟机镜像。 

### 2.3 Select Publisher ID，选择服务商 ID
This dropdown allows you to choose the publisher profile you want to publish this offer under. Note that this field is locked once an offer goes live. 服务商 ID 下拉框允许你选择将产品/服务在哪个发布商下发布。注意一旦产品/服务请求被提交，这个字段变不能再被修改。

### 2.4 Fill in an Offer name，填写产品/服务的名称
In the prompted entry field (Service ID), enter your offer name. The offer name is typically the name of the product or service that you plan to sell in the Azure Marketplace.  在提示输入字段中（服务 ID）输入产品/服务的名称，产品/服务的名称一般是销售商计划在 Azure 市场售卖的产品或服务的名称。

The offer name can only contain  Lowercase letters, Digital number, '-' or '_'. The name cannot end in a dash and can have a maximum of 50 characters. Note that this field is locked once an offer goes live. 产品/服务的名称只能包含小写字母、数字、短横线或下划线，并且只能以小写字母或数字结尾，长度不超过50个字符或25个汉字。注意一旦产品/服务请求被提交，这个字段变不能再被修改。

### 2.5 Fill in a SKU，填写SKU
After you have filled in the offer name, you need to define and identify your SKUs. As a publisher, you can have multiple offers, and each offer can have multiple SKUs under it.  填写完产品/服务名称后，你需要定义 SKU ID。作为同一个发布者，你可以拥有多个产品/服务，每个产品/服务下面可以包含多个 SKU。

The SKU requires an identifier, which is used in the URL. The identifier must be unique within your publishing profile, but there is no risk of identifier collision with other publishers. The SKU name can only contain  Lowercase letters, Digital number, '-' or '_'. Note that this field is locked once an offer goes live. SKU 需要一个 ID 用在URL中，这个 ID 在发布平台中必须是唯一的。 SKU 的名称可以包含小写字母、数字、短横线和下划线。注意一旦产品/服务请求被提交，这个字段变不能再被修改。(bug)

### 2.6 Fill in an image name(bug)，填写镜像中英文名称
This is the display name for your offer. This is the name that will show up in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn). It can have a maximum of 50 Non-Chinese characters or 25 Chinese characters. Guidance here is to include a recognizable brand name for your product. Dont include your company name here unless that is how it is marketed. If you are marketing this offer at your own website, ensure that the name is exactly how it shows up in your website. 镜像名称是产品/服务的对外显示名称，显示在[Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国管理平台](https://portal.azure.cn)上，它不能超过25个汉字或50个字符。请尽量包含一个可识别的商标名称，不要包含公司名称，除非您在使用公司名称作为一种营销方式。 如果你同时在你自己的网站上销售这一产品/服务，请将镜像名称同你自己网站上产品名称保持一致。


### 2.7 Fill in the version of image，填写镜像版本
Note that the version is for the image but not for the software. If you want to make the version of software visible, you can fill the software version in the title or description form. The VM image version needs to follow the [semantic version](http://semver.org/) format. Versions should be of the form X.Y.Z, where X, Y, and Z are integers like 1.0.0. Images in different SKUs can have different major and minor versions. Versions within a SKU should only be incremental changes. 请注意版本号是镜像版本号，而不是软件版本号。如果你想让用户能够看到软件版本号，你可以在镜像显示名称或详细描述里加入版本号信息。镜像版本号需要遵守[semantic version](http://semver.org/)格式。版本号应当是类似‘X.Y.Z’格式，这里‘X’、‘Y’、‘Z’都是数字，比如‘1.0.0’。不同 SKU 的镜像有不同的主版本和次版本号，每次变更，版本号应当逐次增加。

### 2.8 Upload logos，上传logo

All the logos uploaded in the Publishing Portal should follow the below guidelines:所有上载到发布平台上的 logo 需要遵循以下规范：

 - The Azure design has a simple color palette. Keep the number of primary and secondary colors on your logo low. Azure的设计有一个简单的调色板，请尽量限制 logo 上的主要和次要颜色数。

 - The theme colors of the Azure portal are white and black. Hence avoid using these colors as the background color of your logos. Use some color that would make your logos prominent in the Azure portal. We recommend simple primary colors. If you are using transparent background, then make sure that the logos/text are not white or black or blue. Azure入口的主题色是白色和黑色，因此，尽量避免使用这些颜色作为logo的背景颜色。请使用一些能使你的 logo 在 Azure门户中更突出的颜色，我们推荐简单的主颜色；如果您使用的是透明背景，请确保 logo 或文本不是白色、黑色或蓝色。

 - Do not use a gradient background on the logo. 不要在 logo 上使用渐变背景色。

 - Avoid placing text, even your company or brand name, on the logo. The look and feel of your logo should be 'flat' and should avoid gradients. 避免在 logo 上放置文字，甚至你的公司或商标名称。Logo 的外观看起来应该平整，应该避免渐变的颜色。
 
 - The logo should not be stretched. Logo 不要拉伸变形。
 - Logo must conform to the pixels (115x115 and 255x115). Logo 必须符合像素（115x115,255x115）。（bug）

### 2.9 Upload other pictures，上传其它图片
The first picture will show up in the detailed page in Azure Portal and Azure China Marketplace. And the other pictures will only show up in  Azure China Marketplace. For the pictures guidelines, please refer to the section of **Upload logos** and the pictures must conform to the pixels (533x324). 第一张图片会在 Azure 门户和 Azure 中国市场的镜像详细页上显示，其它的图片只会出现在 Azure 中国市场的镜像详细页上。对于图片的规范，请参阅上一节**上传logo**，并且图片必须符合像素（533x324）。(bug)

### 2.10 Select a pricing model，选择定价模式
There are currently 2 kinds of pricing models supported, Free Trial and Bring-Your-Own-License (BYOL). 有两种定价模式，免费和BYOL。

For Free Trial(bug), Microsoft will charge the infrastructure costs and no software licensing costs are charged. Please refer to [Virtual machines prices](https://www.azure.cn/pricing/details/virtual-machines/)。对于免费模式，微软将仅收取基础设施的费用，不收取软件许可费。请参阅 [虚拟机价格](https://www.azure.cn/pricing/details/virtual-machines/)。

For BYOL, the publisher can manage the licensing of the software running on the VM. Microsoft will only charge the infrastructure costs. In this mode, customers need get license from the publisher via email, telephone or other contacts. You can specify if you want to provide a free trial for your customers. The free trial selections are 30/90 days or no free trial after deploying the VM. 对于 BYOL 模式，发布者可以管理运行在虚拟机上的软件的许可证，微软只会收取基础设施费用。在这种模式下，客户需要通过电子邮件、电话或其他联系方式从服务商那里获得许可证，服务商可以指定是否为客户提供免费试用；从部署虚拟机开始算，免费试用期为30天、90天或无试用期。

### 2.11 Select categories，选择分类
Select up to 3 categories from the provided list that your offer can be best associated with. The selected categories will be used to map your offer to the product categories available in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn). 从类别列表中选择和镜像相关的最多3个类别，所选类别将用于将您的产品/服务对应到 [Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国管理平台](https://portal.azure.cn)的产品类别中。

### 2.12 Fill in EULA url，填写最终用户协议 EULA
We suggest that the EULA url is put on the home website of your company. 我们建议最终用户协议的 url 地址放到服务商公司的网站上。

### 2.13 Fill in summary description for your SKU，填写摘要描述
Summary descriptions are visible to customers, so you should make them easily readable.
The lenth is at most no more than 100 Chinese characters or 200 Non-Chinese characters. 摘要描述对客户是可见的，所以最好便于阅读，长度最多不超过100个汉字或200个非字符。 

### 2.14 Fill in a description for your SKU，填写详细描述
The descriptions are visible to customers. It can be edited in rich text editor mode, also it can be added with html code by clicking the 'HTML' tag in the rich text editor.  详细描述对客户是可见的，它可以在富文本编辑器模式下编辑，也可以通过在富文本编辑器中单击“HTML”标签来直接添加HTML代码。请注意这个编辑器不能添加图片，图片需要在“上传图片”中单独上传。（bug）

### 2.15 Fill in recommendation machine size，填写虚拟机推荐配置
Commonly we suggest that you can select 3 sizes due to appearance issue of Azure portal. 从 Azure 管理平台的显示等方面考虑，通常我们建议您选择3种虚拟机推荐配置。

### 2.16 Fill in the file address of VHD，填写 VHD 文件地址
In order to get access authority, the address should be shared access signature(SAS) URI created for the operating system VHD, or the container access policy  of the storage in the URI should be set 'Blob' or 'Container'. 为了获得 VHD 文件的访问权限，该地址应该是 VHD 的共享访问签名（SAS）的 URI 地址，或者将 URI 地址所在的存储容器的访问策略属性设置为“Blog”或“容器”。 

### 2.17 Fill in the url of Data Disk，填写数据磁盘 url 地址
If the image need attach a Data Disk when VM is deployed, please fill in the URI of the disk. For the URI format or guidelines, please refer to the section **Fill in the file address of VHD**.  如果在部署虚拟机时映像需要附加数据磁盘，请填写磁盘的 URI，对于URI格式或规范，请参考**填写 VHD 文件地址**。 

### 2.18 Fill in the ports of VHD，填写 VHD 端口号
When the VM is deployed, the default port service is provided. Note that port number 22 is the default SSH landing port for the Linux virtual machine, and port number 3389 is a remote login port of the Windows virtual machine, which does not need to be added manually.  部署虚拟机时，将提供缺省端口服务，请注意，端口号22是Linux虚拟机默认的SSH登陆端口，端口号3389是Windows虚拟机的远程登录端口，这两个端口号不需要手动添加。

### 2.19 Select if the image type is OSS，选择镜像类型是否是开源
You can specify if the image type is open-source software(OSS). 可以指定镜像类型是否为开源。

### 2.20 Fill in technical support and customer service contact，填写技术支持和客服信息
Please leave technical support and customer service contact.请留下技术支持和客服联系方式。

## 3. Updating and deleting the image from Azure China Marketplace，从 Azure 中国市场更新和删除镜像
After submit your publishing request to Publishing Portal, you can easily edit, update and delete the offers.  在向发布平台提交您的发布请求后，您可以轻松地编辑、更新和删除这些产品/服务。 

### 3.1 Find the place where you can edit, update and delete the offers，找到编辑、更新和删除这些产品/服务的地方
Login [Publishing Portal](https://market-publish.azure.cn), click the publisher link at the top right corner of the page. You will find all the offers you submitted or published. 登录[发布平台](https://market-publish.azure.cn)，点击页面右上角的服务商链接，可以发现所有已经提交或发布的产品/服务。

### 3.2 Click edit, delete or upgrade button to continue，点击编辑、更新或删除按钮
（below bugs）
- The steps are easy and you can fill in the forms following the steps and tips in the page. 这些功能的步骤比较简洁，你可以根据页面提示填写表单。
- In editing function, editing function is only used for editing and displaying offer content, and can not be modified for offer itself. So service providers ID, service ID, SKU, the raw VHD file and version numbers can not be modified. 编辑功能中，编辑功能只用于编辑展现产品内容，对于产品/服务本身不能修改，因此服务商ID、服务ID、SKU、原始 VHD 文件以及版本号均不能修改。
- The function of publishing a new version, is mainly for the upgrading of the offer itself, so service provider ID, service ID can not be changed, but be sure to upload the new VHD file (in fact, the new VHD file can be consistent with the existing VHD file), and the version number must be higher than the existing version. 发布新版本功能，发布新版本功能主要用于产品/服务本身的升级，所以服务商ID、服务ID、SKU 不能修改，但一定要上传新的 VHD 文件（实际上新的 VHD 文件可以和现有 VHD 文件一致），并且版本号一定要比现有版本高。

## 4. Approval of the image，镜像上架审批
After you have submitted the image, the operator of the platform then can get the request on Publishing Portal. But only you have clicked the button "apply for publishing", the operator can drive your request into publishing process. Before "apply for publishing", you can check, edit and upgrade the image to make the image more perfect.  在服务商提交镜像申请后，管理员便可以在发布平台看到申请。但只有你点击按钮“申请上架”之后，平台管理员才能开始驱动上架流程，在点击“申请上架”之前，你可以检查、编辑和升级镜像，使之更完美。 (bug)

After you have applied the publishing request, you can wait for the approval of image which is operated by the operator of Azure China Marketplace. If there is no big problems, it can be finished in around two weeks and you will receive an email from the operator.  在申请镜像发布后，你可以等待 Azure 中国市场管理员的审批，如果没有大问题，审批可以在两周内完成，并且你会收到管理员的邮件。 

Once the operator contacts you and has notified you that the VM offer has been in staging state and can be tested by the publisher, you should test the staging image in various use-case scenarios in Azure Portal. If the image is tested good, you should give feedback to the operator and confirm the result of the test.  一旦平台管理员联系您并通知您虚拟机产品/服务处于待上架状态，并且可以由发布者测试，您应该登录 Azure 管理平台，对镜像进行各种用例场景下的测试。如果镜像测试良好，您应该反馈给平台管理员并确认测试结果。 

After VM offer in staging is approved, the image publishing process is completed and the image will show up in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn).  在待上架状态的虚拟机产品/服务被批准后，镜像发布过程完成，镜像将会显示在 [Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国管理平台](https://portal.azure.cn)上。
