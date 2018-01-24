

# Azure China Marketplace VM Image Publishing Guide [[中文版本](https://market-publish.azure.cn/documentation/article/imagepublishguide/)]

You can easily publish your image to Azure China Marketplace by following steps below.


## Prerequisites and preparations

1. Register as an Azure China Marketplace service provider. Please refer to [ISV Onboarding Guide](https://market-publish.azure.cn/documentation/article/publishguideen/).
2. Prepare the pre-publish data and VM image file. Please refer to  [VM Image Creation Guide](https://market-publish.azure.cn/documentation/article/imageguideen/).
3. After the image is created and tested locally, please upload it to the Azure storage account. Note that you can use tools like Powershell or Azure-cli for testing.

> [AZURE.NOTE] Note: The property of the Azure storage container where the VM image file is located should be set as "Public Blob", or there will be “no image found” error when it is published on Azure China Marketplace.

## Publish the VM image

Enter [Azure Marketplace publishing homepage](https://market-publish.azure.cn/Vhd/Index), and publish VM image in three steps:

1. VM image publishing application. Service Providers click "Publish" in Azure China Marketplace Publish Page, fill in the application form, complete the information related to the image, and then apply for release.

2. Image review and testing. The Azure China Marketplace team reviews the VM images that have been submitted for application. After the verification, the team informs the service provider of the re-testing and verification of the images by email. The service provider needs to inform the Azure China Marketplace team of the results.

3. Official release of the image. After service providers pass the test, the Azure China Marketplace team will double confirm and formally release it. After the release is completed, the system will notify the service provider of the result by email. In general, it takes about 3-5 business days from the final review of the image to posting it in Azure Portal and Azure China Marketplace.




### VM content publishing form

AClick "Publish" -> "Virtual Machine Image" as shown below in Azure China Marketplace Publishing homepage:：

![doc_homepage](./media/imageguide/imagepublish.png)

Among them, "*" is a required item, and "?" is help-related information.

### VM form content specification
As images need to be published to Azure Portal and Azure China Marketplace, following the specification helps users find and sort your images.

| **项目名称** | **规范描述** | **例子** |
| --- | --- | --- |
| 服务商ID |此处不用手动填写，系统会自动加载入驻信息，选择即可||
| 服务ID |此服务ID与服务商ID在 Azure 系统中组合成一个唯一标识。只能包含小写字母、数字、减号或下划线组成，发布后不可修改。|windows-server-2016,sql-server-2016|
| SKU | 用于描述语言，级别，收费模式等，发布后不可修改。 只能包含小写字母，数字，减号或下划线。 | datacenter_zh-cn ||
| 名称 | 推荐格式：软件名称-版本号-其余信息。 |ImageName-7.2-SC-UTF8 (Openlogic CentOS 7.2)|
| 英文名称 | 镜像英文名称 ||
| 版本号 | 镜像当前版本号，注意不是软件自身版本号 ||
| 上传图标 | 此处上传图片用于Logo展示，像素必须按要求上传（115x115,255x115）||
| 上传其他图片 | 封面：用于 Azure 门户及 Azure 市场中产品详细页，一般为产品架构图。<br/> 更多图片：用于 Azure 市场中产品详细页面。 两处图片像素必须按要求上传<br/>图片大小：像素必须为：533x324 ||
| 类别 | 选择与镜像对应的类别，最多支持3个||
| 用户协议网址 | 地址一般为用户和ISV之间的使用协议、license等使用事项及收费情况的地址 ||
| 来源网站 | 一般填写该镜像中的主要软件所在的主站地址 ||
| 简要描述 | 简要描述该服务的基本功能、特点和适用范围，最多不超过50汉字或100个英文字母。 ||
| 详细描述 | 一般包含该镜像的产品详情、使用说明和技术详情等，支持富文本编辑，可以采用多种文字格式。请在技术详情中对端口功能进行说明 ||
| VHD文件的地址 | 要发布的vhd文件在 Azure 上的url地址。假如url中“mystorage”是 Azure 中的存储账号，"vhds"是容器名称，则注意"vhds"在 Azure 的storage中必须设置为"公共Blob"属性。 |  |
| 平台 | 如果没有可选择操作系统，选择“其它发行版”方可手工填写。 ||
| 端口 | 镜像部署时，缺省提供的端口服务。注意端口号22为Linux虚拟机缺省的ssh登陆端口，端口号3389为Windows虚拟机缺省的远程登录端口，不需要手动添加。 ||
| 帮助文档 | 用户帮助文档的url地址。||
| 软件包 | 主要的软件安装包，一般需要包含软件版本信息，以逗号分隔。 | tomat-5.5.3,php-5.3.1 |
| 标签 | 包括镜像所属的软件类目、主要特征或主要软件等，以逗号分隔。 | crm,project management,lamp |
| 开源 | 如果开源则勾选 ||
| 联系方式 | 请留下技术支持及客服的联系方式 ||



