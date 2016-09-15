# 在 Azure 镜像市场上发布虚拟机镜像

Azure上发布虚拟机镜像过程比较简单，您只要遵循以下步骤，就能轻松地将您的镜像发布到 Azure 镜像市场。

## 先决条件和准备

1. 您需要一个有 Azure 账户。（如果还没有，[请到这里购买](https://www.azure.cn/pricing/pia/)）
2. 如果您需要申请试用账号，[请访问这里](https://www.azure.cn/pricing/1rmb-trial?v=b)。
3. 准备发布前资料。参考 [发布商入驻指南](https://mmp-staging.chinacloudsites.cn/market/Documentation/article/publishguide/) ；准备好虚拟机镜像文件，参考 [虚拟机镜像制作](https://mmp-staging.chinacloudsites.cn/market/Documentation/article/imageguide/)。

## 发布虚拟机镜像

> [AZURE.NOTE] 注意:虚拟机镜像文件所在的存储容器的属性应该设置为“公共Blob”，否则在Azure 镜像市场上发布的时候会出现找不到镜像的错误。

### 虚拟机内容发布清单

Azure 镜像市场主页点击 “发布”——>“虚拟机镜像”，如下图：

![doc_homepage](./media/imageguide/imagepublish.jpg)

其中，带“*”的为必填项目，“？”为帮助信息。

镜像名称一般建议格式为：推荐的名称格式为：软件名称-版本号-其余信息(操作系统)，例如：ImageName-7.2-SC-UTF8 (Openlogic CentOS 7.2)。

SKY一般建议格式为：软件名称-类目-版本，例如： Lamp-infrastructure-5.6.0。

镜像描述建议添加多张图片，以便以更丰富的样式进行展现。


