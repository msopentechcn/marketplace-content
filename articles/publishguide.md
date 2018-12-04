---
title: Azure 市场服务商指南 | Azure
description: Azure 市场服务商指南
services: 
author: siwlv
manager: wayi
ms.assetid: 
ms.service: multiple
ms.tgt_pltfrm: na
ms.devlang: na
ms.topic: articles
ms.date: 05/14/2018
ms.author: siwlv
---

# Azure 市场服务商指南
> [!div class="op_single_selector"]
> * [中文](https://docs.azure.cn/zh-cn/articles/azure-marketplace/publishguide)
> * [英文](https://docs.azure.cn/en-us/articles/azure-marketplace/publishguide)
本指南描述了了 Azure 市场的基本概况，并概述了 Azure 合作伙伴从入驻 Azure 市场到产品发布所需遵循的基本流程和注意事项。

## 1. 文档适用范围
- 本指南适用于希望通过由世纪互联运营的 Microsoft Azure，在 Azure 市场提供虚拟机镜像、ARM模版及定制服务等产品，并面向中国大陆境内用户提供服务的 Azure 合作伙伴。
- 本指南的目标读者为熟悉基本 Azure 平台的业务决策者、 IT 专业人员和开发人员（包括 DBA、SecOps、DevOps 等专家角色）。
- 本指南不适用于提供非虚拟机镜像或定制服务类产品的服务商（如 SaaS 服务供应商，API 服务商等）。

## 2. 什么是 Azure 市场
[Azure 市场](https://market.azure.cn/)由世纪互联运营，是 Azure 合作伙伴产品及服务的统一展现门户，Azure 市场是一个镜像仓库，它是 Azure 云业务的核心引擎之一，是 Azure 合作伙伴为 Azure 客户提供最佳解决方案和服务的连接平台。 

从产品形态来讲，Azure 市场可以为 Azure 合作伙伴发布镜像类应用、 ARM 模板以及定制服务三种产品/服务。

对于独立软件服务商（ISV）来说，可以很容易地成为 Azure 合作伙伴，并在 Azure 平台发布您的产品/服务。加入 Azure 市场以及发布 Azure 合作伙伴 的产品/服务不收取任何费用。

## 3. 加入 Azure市场 的好处
Azure 市场能够为 Azure 合作伙伴带来新的业务渠道和用户，通过提供推广支持、刺激需求和联合进行市场营销，Azure市场 产品组合可成为云业务引擎的核心，同时大幅度简化软件推广、管理和部署的难度。 

充分利用 Azure 市场的功能来扩展业务，可以生成潜在顾客和销售商机；提高业务价值并增加与现有客户及新客户的交易规模，并降低销售周期；了解执行的内容、所生成的潜在顾客以及最大程度优化市场活动的方式。

对 Azure 用户来说，用户在 Azure 市场和 [Azure 入口](https://portal.azure.cn)能够很容易地查找、获取和使用在 Azure 平台上构建并经过充分测试产品/服务。 Azure 镜像可以帮助 Azure 用户快速创建虚拟机实例，ARM 模板可以帮助 Azure 用户一键部署集群，Azure 定制服务可以帮助 Azure 用户寻求合适的基于 Azure 的丰富的解决方案。

## 4. 商务模式

Azure 市场目前支持免费，及自带许可证（BYOL，Bring Your Own License）模式，目前暂不支持现收现付（PAYG，Pay As You Go）模式。请注意，无论何种模式下，Azure 市场都不会直接对客户单独计取许可证费用，但客户部署虚拟机镜像或 ARM 模板，都需要支付订阅消费的 Azure 资源费用。

下表描述了 Azure 市场当前支持的商务模式，一个产品/服务可以包括使用不同定价模型的 SKU。对于定制服务，客户可以直接联系定制服务服务商寻求合适的解决方案。

| **定价模型** | **说明** | **适用对象** |
| --- | --- | --- |
| 免费 | 免费SKU。不会因客户使用产品/服务而向其收取 Azure 市场费用，也不能向用户收取产品费用。 | 虚拟机镜像，ARM 模板|
| 免费试用 | SKU 有限时间免费推广版。在试用期期间，将不会因客户使用产品而向其收取 Azure 市场费用。 在试用期到期后，将自动基于标准费率向使用产品的客户进行收费。 Azure 市场当前无法阻止用户创建针对免费试用产品的多个订阅，为客户提供免费试用产品创建订阅的服务商可以提供适当的限制条件。 | 虚拟机镜像，ARM 模板 |
| BYOL | 自带许可 (BYOL) SKU。 许可证费用由客户和服务商协商确定，且不因客户在 Azure 市场中使用该产品/服务而向客户收取 Azure 市场费用。 | 虚拟机镜像，ARM 模板 |

## 5. 注册成为 Azure 市场服务商的先决条件

### 请仔细阅读 Azure 市场服务商协议
本 [Azure 市场服务商协议](https://docs.azure.cn/articles/azure-marketplace/publishagreement)阐述了服务商与 Azure 市场以及 Azure 门户的运营方世纪互联的关系，Azure 合作伙伴在注册成为 Azure 市场服务商、在 Azure 市场发布产品/服务或参与 Azure 市场活动时，必须遵守本协议。

### 请仔细阅读 Azure 市场参与政策
请仔细阅读 [Azure 中国市场参与政策](https://docs.azure.cn/articles/azure-marketplace/isvpolicy)，Azure 合作伙伴在注册成为 Azure 市场服务商、在 Azure 市场发布产品/服务或参与 Azure 市场活动时，必须始终遵守本文件中规定和/或提及的政策。

### 已经注册 Azure 中国账号
请提前注册Azure 中国账号，成为 Azure 合作伙伴，
Azure 账号类似：someone@example.partner.onmschina.cn。如果尚未申请，可在如下地址申请：[ Azure 试用申请表](https://www.azure.cn/pricing/1rmb-trial-full/?form-type=identityauth)（注册时请选择“企业申请”）。

### 发布符合规范的产品/服务
服务商需要以发布符合 Azure 市场规范的产品为前提，如果您注册成为 Azure 市场服务商以后超过三个月而未发布合适的产品/服务，则 Azure 市场有权注销您的 Azure 市场服务商账号。

Azure 市场产品/服务应利用或扩展 Azure 服务（例如计算、网络或存储），应按现有 Azure 市场类别进行分类（例如数据库、网络等）。产品/服务必须包括可公开访问的用户使用条款、隐私策略的 URL，让客户能够通过此 URL 获取帮助。 对于试用，试用期间必须提供支持，且不额外收取费用。

## 6. 成为 Azure 市场服务商
请首先登录到[发布平台](https://market-publish.azure.cn/)，然后[注册成为 Azure 市场服务商](https://market-publish.azure.cn/ISV/New)，请认真填写服务商注册信息，注册信息如下图所示。

![publisher1](https://i.imgur.com/zOex0YT.png)


### 6.1 Azure 中国账号
Azure 中国账号就是您登录 Azure 市场的账号，请注意这个账号不可以更改。

### 6.2 公司注册名称
公司注册名称，必须使用注册地址位于中国境内的合法运营实体进行注册，需要是公司营业执照上面的公司名称，不能随意填写。这个名称会有专门的法务人员进行审核。

### 6.3 服务商 ID
服务商 ID 是您的公司在 Azure 系统中的唯一标识，只能包含小写字母，数字，减号或下划线。服务商 ID 主要用于 Azure 市场和 Azure 门户内部的服务商管理使用，一般不显示出来。

### 6.4 公司简称
公司简称一般用于显示作用，可能在 Azure 用户和 Azure 市场中都会用到，请仔细命名这个名称，包括最多15个汉字或30个英文字母。

### 6.5 公司英文简称
公司简称的英文版本，最多30个英文字母。英文简称也请仔细命名，Azure 市场和 Azure 门户都支持英文版本，因此这个名称也可以用于显示的作用。

### 6.6 联系人信息
包括联系人姓名、联系人电话和联系人邮箱，请如实填写。请注意联系人信息只会在 Azure 服务商账号中查看，服务商发布的每个产品/服务需要单独填写客服支持信息。

### 6.7 公司信息
包括公司网站、公司邮箱、公司电话和公司详细地址，请如实填写。

### 6.8 双软认证编号 或 机构代码 ID
注意双软认证编号或组织机构代码和营业执照号码不同，具体请向服务商所在公司的相关部门咨询。

### 6.9 营业执照扫描上传
营业执照扫描件是最重要的注册信息之一。营业执照扫描件需要完整、清晰，支持 JPG 或 PNG格式上传，文件尺寸请不要超过 2M 大小，否则可能上传失败。 营业执照扫描件会有专门人员进行严格审核。

### 6.10 产品信息
产品信息目前都不是必填项，但是请认真填写，因为这可以大大增加服务商的可信度，加快审核进度。

### 6.11 服务商管理
Azure 市场服务商账号分为两种，管理员账号和普通账号。服务商登录 Azure 市场后，可以点击页面右上角的[**账号**](https://market-publish.azure.cn/me)，进入“用户信息管理”页面；点击“修改”，可以修改服务商信息；点击“管理用户”，可以更改账号权限或删除账号。


## 7. 在 Azure 市场制作和发布产品/服务

### 7.1 构建用于发布的虚拟机镜像、ARM 模板或定制服务

- 制作虚拟机镜像的详细过程，请参考： [Azure 市场虚拟机镜像制作指南](https://docs.azure.cn/articles/azure-marketplace/imageguide)，镜像制作完成并测试后，需要上传到 Azure 存储账户。
- 制作 ARM 模板的详细过程，请参考： [Azure 市场 ARM 模板制作指南](https://docs.azure.cn/articles/azure-marketplace/armguide)，ARM 模板文件制作完成后，可以存放到 Azure 存储账号或非 Azure 存储账号，建议存放到 Azure 存储账号中。
- 对于定制服务，您需要准备好解决方案相关的文档资源等


### 7.2 预发布

预发布是指在“沙箱”环境中模拟实际产品发布，在发布之前，请确认您已经获得服务商账号。请参考文档[Azure 市场虚拟机镜像发布指南](https://docs.azure.cn/articles/azure-marketplace/imagepublishguide)、[Azure 市场 ARM 模板发布指南](https://docs.azure.cn/articles/azure-marketplace/armpublishguide)以及[Azure 市场定制服务发布指南](https://docs.azure.cn/articles/azure-marketplace/customizedpublishguide)。

- 使用服务商账户登录发布门户。
- 填写发布申请表单，包括镜像、 ARM 模板文件或定制服务，并提交。提交后，可以点击页面右上角的**账号**，进入“用户信息管理”页面，继续点击“未上架服务”，可以对提交的产品/服务继续修改完善，请注意此时发布申请还没有真正向 Azure 市场发出。如果信息完善了，请点击“申请上架”，申请上架发布。
- 审核通过后，Azure 市场团队会通过邮件通知服务商进行预发布的产品/服务的测试和验证。
- 服务商测试完毕后，需将测试结果告知 Azure 市场团队进行确认。

### 7.3 正式发布

- 服务商测试通过后，Azure 市场团队将对您的产品进行最后确认并发布到 Azure 市场。
- 发布完成后，将会通过邮件方式通知您的产品已经正式发布。
- 您可在 Azure 市场和 Azure 门户查看到您已发布的镜像或 ARM 模板；定制服务由于不能够直接部署到 Azure，因此只能在 Azure 市场上展示。

## 8. Azure 市场支持渠道

 - 您可以联系 [Azure 市场技术支持](https://market-publish.azure.cn/contact/feedback)
 - 或通过 [Azure 客服支持](https://www.azure.cn/support/contact/)寻求帮助。 
 - 还可以通过[常见问题](https://docs.azure.cn/articles/azure-marketplace/faq-common)寻求解答。

