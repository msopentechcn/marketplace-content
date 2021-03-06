

# Azure 市场虚拟机镜像发布指南 [[English Version](https://market-publish.azure.cn/documentation/article/imagepublishguideen/)]

Azure 市场上发布虚拟机镜像，您只要遵循以下步骤，就能轻松地将您的镜像发布到 Azure 市场。


## 先决条件和准备

1. 首先，注册成为 Azure 市场服务商。 请参考 [服务商入驻指南](https://market-publish.azure.cn/Documentation/publishguide/) 。
2. 其次，准备发布前资料和虚拟机镜像文件，参考 [虚拟机镜像制作指南](https://market-publish.azure.cn/Documentation/imageguide/)。
3. 再次，镜像制作完成并本地测试后，需要上传到 Azure 存储账户。注意测试可以利用Powershell或Azure-cli等工具。

> [AZURE.NOTE] 注意: 虚拟机镜像文件所在的 Azure 存储容器的属性应该设置为“公共Blob”，否则在 Azure 市场上发布的时候会出现找不到镜像的错误。

## 发布虚拟机镜像

进入发布页面 [Azure 市场发布主页](https://market-publish.azure.cn/Vhd/Index)，发布虚拟机镜像，分三步完成：

1. 虚拟机镜像发布申请。服务商在 Azure 市场发布页点击“发布”，填写发布申请表单，完善镜像相关的资料内容，然后申请上架。
2. 镜像审核和测试。 Azure 市场团队会对申请上架的虚拟机镜像进行审核，审核通过后， Azure 团队会通过邮件通知服务商进行镜像的再次测试和验证，服务商需将测试结果告知 Azure 市场团队。
3. 镜像正式发布。服务商测试通过后，Azure 市场团队进行最后确认，并正式上架。上架发布完成后，系统会通过邮件方式通知服务商上架结果。一般而言，从镜像审核通过最终测试到展示在 Azure 门户及 Azure 市场大概需要3-5个工作日。



### 虚拟机内容发布表单

Azure 市场发布主页点击 “发布”——>“虚拟机镜像”，如下图：

![doc_homepage](./media/imageguide/imagepublish.png)

其中，带“*”的为必填项目，“？”为帮助信息。

### 虚拟机表单内容规范
由于镜像需要发布到 Azure 门户和 Azure 市场当中，因此遵循规范有利于用户对您的镜像的查找、排序操作等。

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



