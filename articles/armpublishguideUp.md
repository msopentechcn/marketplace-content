
# Azure Marketplace ARM template Publishing Guide，Azure 市场 ARM 模板发布指南

This article, define some base concepts of Azure Marketplace. Step 2, walks you through preparing the ARM template that you will deploy to the Azure Marketplace. You can easily publish your ARM template to the Azure Marketplace by following these steps. 本文定义了 Azure 市场的一些基本概念，步骤 2 将引导服务商完成 ARM 模板的准备工作，并将其部署到 Azure 市场。 您只要遵循以下步骤，就能轻松地将您的 ARM 模板发布到 Azure 市场。

After published, the ARM template will be visible on both [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn). ARM 模板发布后，在[Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国入口](https://portal.azure.cn)上都可以看到。

## 1. Prerequisites and preparations，先决条件和准备

1.1 First, register as an Azure China Marketplace service provider. Please refer to [Azure Market Service Provider Guide](https://review.docs.azure.cn/en-us/articles/azure-marketplace/publishguide?branch=master).首先，注册成为 Azure 市场服务商。 请参考 [Azure 市场服务商指南](https://market-publish.azure.cn/Documentation/publishguide/) 。

1.2 Secondly, prepare the pre-publish data and ARM template file. Please refer to [Understand the structure and syntax of Azure Resource Manager templates](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-authoring-templates). 其次，准备发布前资料和 ARM 模板文件，请参考 [了解 ARM 模板的结构和语法](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-group-authoring-templates)。

1.3 Then, after the image is created and tested locally, please upload it to the Azure storage account. Note that you can use tools like Powershell or Azure-cli for testing. Please refer to [创建和部署第一个 Azure 资源管理器模板](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-create-first-template). 再次，ARM模板制作完成后需要进行本地测试，注意测试可以利用Powershell或Azure-cli等工具，请参考 [Create and deploy your first ARM template](https://docs.azure.cn/zh-cn/azure-resource-manager/resource-manager-create-first-template)。

## 2. Publishing the ARM template to Azure China Marketplace on Publishing Portal，通过发布平台将 ARM 模板发布到 Azure 中国市场

To publish an ARM template offer to Publishing Portal, you should first login [Publishing Portal](https://market-publish.azure.cn/) based on section 1.1 **Prerequisites and preparations**. 为了将 ARM 模板产品发布到发布平台，首先，你需要根据1.1部分的介绍登录到[发布平台](https://market-publish.azure.cn/)。

Then, you can begin the publishing process by clicking the menu 'publish'->'ARM template' with [Publish ARM template](https://market-publish.azure.cn/vhd/index) as below steps.  其次，你需要点击页面菜单中的“发布”->“ARM 模板”，也就是[发布 ARM 模板](https://market-publish.azure.cn/zh-cn/vhd/arm)，然后开始 ARM 模板发布过程。

### 2.1 Define Offers and SKU，定义产品/服务和 SKU

A SKU is the commercial name for an ARM template offer and is the smallest purchasable unit of an offer. An ARM template may contain virtual machines, storage accounts, virtual networks, web apps, databases, database servers, or 3rd party services. It is essentially the complete profile for a resource group or a cluster.  SKU 是 ARM 模板产品的商业名称并且并且是产品/服务的最小购买单位，一个 ARM 模板可以包含虚拟机、存储帐户、虚拟网络、Web 应用、数据库服务器和第三方服务等多个构件，它实质上是资源组的完整配置文件。 

Publisher, Offer and SKU can define an unique ARM offer in Azure Marketplace.
An offer is a "parent" to all of its SKUs. You can have multiple offers. How you decide to structure your offers is up to you. When an offer is pushed to staging, it is pushed along with all of its SKUs. Carefully consider your SKU identifiers, because they will be visible in the URL: 在 Azure 市场中，发布者、产品/服务和 SKU 可以唯一地定义一个 ARM 产品，产品/服务是其所有 SKU 的“父级”，发布者可以拥有多个产品/服务并决定如何构造产品/服务。 将产品/服务推送到待发布环境时，它会随其所有的 SKU 一起推送。 请仔细考虑 SKU ID，因为它们会被显示在 URL 中：

 - Azure 市场: https://market.azure.cn/zh-cn/marketplace/apps/{Publisher}.{OfferIdentifier}{SKUidentifier}?tab=Overview
 - Azure 管理平台: https://portal.azure.cn/#blade/Microsoft_Azure_Marketplace/GalleryFeaturedMenuItemBlade/selectedMenuItemId/home 

### 2.2 Login Marketplace and select publishing function，登录 Azure 市场选择发布功能
 - Sign in to the [Publishing Portal](https://market-publish.azure.cn/) by using your seller account. 使用发布商账号登录到[发布平台](https://market-publish.azure.cn/)。
 - Select the **ARM template** tab of the Publishing Portal in menu Publishing. 在发布菜单中选择发布 **ARM 模板**。 

### 2.3 Select Publisher ID，选择服务商 ID
This dropdown allows you to choose the publisher profile you want to publish this offer under. Note that this field is locked once an offer goes live. 服务商 ID 下拉框允许你选择将产品/服务在哪个发布商下发布。注意一旦产品/服务请求被提交，这个字段变不能再被修改。

### 2.4 Fill in an Offer name，填写产品/服务的名称
In the prompted entry field (Service ID), enter your offer name. The offer name is typically the name of the product or service that you plan to sell in the Azure Marketplace. 在提示输入字段中（服务 ID）输入产品/服务的名称，产品/服务的名称一般是销售商计划在 Azure 市场售卖的产品或服务的名称。

The offer name can only contain  Lowercase letters, Digital number, '-' or '_'. The name cannot end in a dash and can have a maximum of 50 characters. Note that this field is locked once an offer goes live. 产品/服务的名称只能包含小写字母、数字、短横线或下划线，并且只能以小写字母或数字结尾，长度不超过50个字符或25个汉字。注意一旦产品/服务请求被提交，这个字段变不能再被修改。

### 2.5 Fill in an ARM template name，填写 ARM 模板中英文名称
This is the display name for your offer. This is the name that will show up in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn). It can have a maximum of 50 Non-Chinese characters or 25 Chinese characters. Guidance here is to include a recognizable brand name for your product. Don't include your company name here unless that is how it is marketed. If you are marketing this offer at your own website, ensure that the name is exactly how it shows up in your website. ARM 模板名称是产品/服务的对外显示名称，显示在[Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国管理平台](https://portal.azure.cn)上，它不能超过25个汉字或50个字符。请尽量包含一个可识别的商标名称，不要包含公司名称，除非您在使用公司名称作为一种营销方式。 如果你同时在你自己的网站上销售这一产品/服务，请将 ARM 模板名称同你自己网站上产品名称保持一致。

### 2.6 Fill in the version of ARM template，填写 ARM 模板版本
Note that the version is for the ARM template but not for the software. If you want to make the version of software visible, you can fill the software version in the title or description form. The ARM template version needs to follow the [semantic version](http://semver.org/) format. Versions should be of the form X.Y.Z, where X, Y, and Z are integers like 1.0.0. Versions within an offer should only be incremental changes. 请注意版本号是 ARM 模板版本号，而不是软件版本号。如果你想让用户能够看到软件版本号，你可以在 ARM 模板显示名称或详细描述里加入版本号信息。镜像版本号需要遵守[semantic version](http://semver.org/)格式。版本号应当是类似‘X.Y.Z’格式，这里‘X’、‘Y’、‘Z’都是数字，比如‘1.0.0’，每次变更，版本号应当逐次增加。

### 2.7 Upload logos，上传logo

All the logos uploaded in the Publishing Portal should follow the below guidelines:所有上载到发布平台上的 logo 需要遵循以下规范：

 - The Azure design has a simple color palette. Keep the number of primary and secondary colors on your logo low. Azure的设计有一个简单的调色板，请尽量限制 logo 上的主要和次要颜色数。

 - The theme colors of the Azure portal are white and black. Hence avoid using these colors as the background color of your logos. Use some color that would make your logos prominent in the Azure portal. We recommend simple primary colors. If you are using transparent background, then make sure that the logos/text are not white or black or blue. Azure入口的主题色是白色和黑色，因此，尽量避免使用这些颜色作为logo的背景颜色。请使用一些能使你的 logo 在 Azure门户中更突出的颜色，我们推荐简单的主颜色；如果您使用的是透明背景，请确保 logo 或文本不是白色、黑色或蓝色。
 - Do not use a gradient background on the logo. 不要在 logo 上使用渐变背景色。
 - Avoid placing text, even your company or brand name, on the logo. The look and feel of your logo should be 'flat' and should avoid gradients. 避免在 logo 上放置文字，甚至你的公司或商标名称。Logo 的外观看起来应该平整，应该避免渐变的颜色。
 
 - The logo should not be stretched. Logo 不要拉伸变形。
 - Logo must conform to the pixels (115x115 and 255x115). Logo 必须符合像素（115x115,255x115）。

### 2.8 Upload other pictures，上传其它图片
The first picture will show up in the detailed page in Azure Portal and Azure China Marketplace. And the other pictures will only show up in  Azure China Marketplace. For the pictures guidelines, please refer to the section of **Upload logos** and the pictures must conform to the pixels (533x324). 第一张图片会在 Azure 门户和 Azure 中国市场的镜像详细页上显示，其它的图片只会出现在 Azure 中国市场的镜像详细页上。对于图片的规范，请参阅上一节**上传logo**，并且图片必须符合像素（533x324）。

### 2.9 Select a pricing model，选择定价模式
There are currently 2 kinds of pricing models supported, Free Trial and Bring-Your-Own-License (BYOL). 有两种定价模式，免费和BYOL。

For Free Trial(bug), Microsoft will charge the infrastructure costs and no software licensing costs are charged. Please refer to [Azure Service Prices](https://www.azure.cn/pricing/)。对于免费模式，微软将仅收取基础设施的费用，不收取软件许可费。请参阅 [Azure 服务价格](https://www.azure.cn/pricing/)。

For BYOL, the publisher can manage the licensing of the software running on the ARM. Microsoft will only charge the infrastructure costs. In this mode, customers need get license from the publisher via email, telephone or other contacts. You can specify if you want to provide a free trial for your customers. The free trial selections are 30/90 days or no free trial after deploying the ARM offer. 对于 BYOL 模式，发布者可以管理运行在 ARM 上的软件的许可证，微软只会收取基础设施费用。在这种模式下，客户需要通过电子邮件、电话或其他联系方式从服务商那里获得许可证，服务商可以指定是否为客户提供免费试用；从部署 ARM 产品开始算，免费试用期为30天、90天或无试用期。

### 2.10 Select categories，选择分类
Select up to 3 categories from the provided list that your offer can be best associated with. The selected categories will be used to map your offer to the product categories available in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn). 从类别列表中选择和 ARM 模板相关的最多3个类别，所选类别将用于将您的产品/服务对应到 [Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国管理平台](https://portal.azure.cn)的产品类别中。

### 2.11 Fill in EULA url，填写最终用户协议 EULA
We suggest that the EULA url is put on the home website of your company. 我们建议最终用户协议的 url 地址放到服务商公司的网站上。

### 2.12 Fill in summary description，填写摘要描述
Summary descriptions are visible to customers, so you should make them easily readable.
The lenth is at most no more than 100 Chinese characters or 200 Non-Chinese characters. 摘要描述对客户是可见的，所以最好便于阅读，长度最多不超过100个汉字或200个非字符。 

### 2.13 Fill in a description，填写详细描述
The descriptions are visible to customers. It can be edited in rich text editor mode, also it can be added with html code by clicking the 'HTML' tag in the rich text editor.  详细描述对客户是可见的，它可以在富文本编辑器模式下编辑，也可以通过在富文本编辑器中单击“HTML”标签来直接添加HTML代码。请注意这个编辑器不能添加图片，图片需要在“上传图片”中单独上传。

### 2.14 Upload ARM template file，上传 ARM 模板文件
If your ARM template is composed of multiple files, please upload the master template file to here, other template files or installation packages should be uploaded as attachments. 如果您的 ARM 模板由多个文件组成，请将主模板文件上传到这里，引用的其它模板文件或安装包等作为附件上传。

### 2.15 Upload ARM template attachments，上传 ARM 模板附件
Upload various other template files or installation packages referenced by the main template file. 上传主模板文件引用的各种其它模板文件或安装包等。

### 2.16 Select if the ARM template resources are OSS，选择 ARM模板 资源是否是开源
You can specify if the ARM template resources are open-source software(OSS).  Please note that if the ARM template references the virtual machine, make sure that if the software in the virtual machine is open source or not.  可以指定 ARM 模板以及所引用的软件资源是否为开源。请注意，如果 ARM 模板引用了虚拟机，请确认虚拟机中的软件是否为开源。

### 2.17 Fill in technical support and customer service contact，填写技术支持和客服信息
Please leave technical support and customer service contact.请留下技术支持和客服联系方式。


## 3. Updating and deleting the image from Azure China Marketplace，从 Azure 中国市场更新和删除镜像
After submit your publishing request to Publishing Portal, you can easily edit, update and delete the offers.  在向发布平台提交您的发布请求后，您可以轻松地编辑、更新和删除这些产品/服务。 

### 3.1 Find the place where you can edit, update and delete the offers，找到编辑、更新和删除这些产品/服务的地方
Login [Publishing Portal](https://market-publish.azure.cn), click the publisher link at the top right corner of the page. You will find all the offers you submitted or published. 登录[发布平台](https://market-publish.azure.cn)，点击页面右上角的服务商链接，可以发现所有已经提交或发布的产品/服务。

### 3.2 Click edit, delete or ‘publish new version’ button to continue，点击编辑、发布新版本或删除按钮
- The steps are easy and you can fill in the forms following the steps and tips in the page. 这些功能的步骤比较简洁，你可以根据页面提示填写表单。
- In editing function, editing function is only used for editing and displaying offer content, and can not be modified for offer itself, so service providers ID, service ID, ARM template files and version numbers can not be modified. 编辑功能中，编辑功能只用于编辑展现产品内容，对于产品/服务本身不能修改，因此服务商ID、服务ID、ARM 模板文件以及版本号均不能修改。
- The function of publishing a new version, is mainly for the upgrading of the offer itself, so service provider ID, service ID can not be changed, but be sure to upload the new ARM template file (in fact, the new template can be consistent with the existing template file), and the version number must be higher than the existing version. 发布新版本功能，发布新版本功能主要用于产品/服务本身的升级，所以服务商ID、服务ID不能修改，但一定要上传新的 ARM 模板文件（实际上新的模板文件可以和现有模板文件一致），并且版本号一定要比现有版本高。

## 4. Approval of the ARM template，ARM 模板上架审批
After you have submitted the ARM template, the operator of the platform then can get the request on Publishing Portal. But only you have clicked the button "apply for publishing", the operator can drive your request into publishing process. Before "apply for publishing", you can check, edit and upgrade the ARM template to make the it more perfect.  在服务商提交 ARM 模板申请后，管理员便可以在发布平台看到申请。但只有你点击按钮“申请上架”之后，平台管理员才能开始驱动上架流程，在点击“申请上架”之前，你可以检查、编辑和升级 ARM 模板，使之更完美。

After you have applied the publishing request, you can wait for the approval of image which is operated by the operator of Azure China Marketplace. If there is no big problems, it can be finished in around two weeks and you will receive an email from the operator.  在申请提交后，你可以等待 Azure 中国市场管理员的审批，如果没有大问题，审批可以在两周内完成，并且你会收到管理员的邮件。 

Once the operator contacts you and has notified you that the offer has been in staging state and can be tested by the publisher, you should test the staging offer in various use-case scenarios in Azure Portal. If the offer is tested good, you should give feedback to the operator and confirm the result of the test.  一旦平台管理员联系您并通知您产品处于待上架状态，并且可以由发布者测试，您应该登录 Azure 管理平台，对产品进行各种用例场景下的测试。如果镜像测试良好，您应该反馈给平台管理员并确认测试结果。 

After ARM offer in staging is approved, the publishing process is completed and the offer will show up in [Azure China Marketplace](https://market.azure.cn/zh-cn) and [Azure China portal](https://portal.azure.cn).  在待上架状态的ARM 产品/服务被批准后，发布过程完成，ARM 产品便会显示在 [Azure 中国市场](https://market.azure.cn/zh-cn) 和 [Azure 中国管理平台](https://portal.azure.cn)上。




