# Azure 市场虚拟机镜像制作指南

本指南为 Azure 市场独立软件供应商介绍虚拟机镜像制作、上传到 Azure、 以及发布前测试准备的主要过程。

制作虚拟机镜像有两种方式。一种是直接在 Azure 平台上部署操作系统虚拟机，安装应用软件并构建镜像；第二种是从用户本地通过 Hyper-v 创建操作系统，安装应用软件后制作VHD镜像文件，然后上传 VHD 文件至 Azure 上构建镜像。第一种方式属于 Azure 定制方式，操作相对简单，适合普通的镜像制作；第二种方式属于用户定制操作系统方式，操作相对复杂，适合需要特殊操作系统定制的镜像制作。

需要注意的是，VHD 文件完成后，需要存储到（经典）存储账号，并经过测试后，方能发布到 Azure 市场。


## 构建和测试 Azure 镜像

构建 VHD 文件主要包括以下四种方法，一般可以选取前面两种，相对简单。

### 从 Azure 上构建 Linux 应用程序镜像
从 Azure 上构建 Linux 应用程序镜像，请参考文档 [使用 CLI 创建Linux Azure 虚拟机镜像](https://docs.azure.cn/zh-cn/virtual-machines/linux/tutorial-custom-images#next-steps)。请注意，在 Azure 平台上创建虚机进行配置的时候，磁盘类型请选择“HDD”，“设置”->“存储”选项中的“使用托管的磁盘”，请选择“否”。

### 从 Azure 上构建 Windows 应用程序镜像
从 Azure 上构建 Linux 应用程序镜像，请参考文档 [使用 PowerShell 创建Windows Azure 虚拟机镜像](https://docs.azure.cn/zh-cn/virtual-machines/windows/tutorial-custom-images)。请注意，在 Azure 平台上创建虚机进行配置的时候，磁盘类型请选择“HDD”，“设置”->“存储”选项中的“使用托管的磁盘”，请选择“否”。


### 从 Azure 外部（本地）构建 Linux 应用程序镜像
从本地构建基于Azure的CentOS Linux应用程序镜像，请参考文档 [为 Azure 准备基于 CentOS 的虚拟机](https://docs.azure.cn/zh-cn/virtual-machines/linux/create-upload-centos)。如何将 VHD 镜像迁移到Azure平台，请参考 [使用 Azure CLI 2.0 上传自定义磁盘并从其创建 Linux VM](https://docs.azure.cn/zh-cn/virtual-machines/linux/sa-upload-vhd) 。

另外对于 Linux 或 windows 镜像，VHD 上传和创建脚本请参考 [将通用化 VHD 上传到Azure的PowerShell示例脚本](https://docs.azure.cn/zh-cn/virtual-machines/scripts/virtual-machines-windows-powershell-upload-generalized-script)
 

### 从 Azure 外部（本地）构建 Windows 应用程序镜像
从本地或Azure外部构建基于Azure的Windows应用程序镜像，请参考文档 [准备好要上传到 Azure 的 Windows VHD 或 VHDX](https://docs.azure.cn/zh-cn/virtual-machines/windows/prepare-for-upload-vhd-image#complete-recommended-configurations)。
如何将 VHD 镜像迁移到迁移到Azure，请参考 [上传通用化 VHD 并使用它在 Azure 中创建新 VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/upload-generalized-managed)，或参考[利用PowerShell将通用化 VHD 上传到 Azure 并创建新 VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/sa-upload-generalized) 。

另外对于 Linux 或 windows 镜像，VHD 上传和创建脚本请参考 [将通用化 VHD 上传到Azure的PowerShell示例脚本](https://docs.azure.cn/zh-cn/virtual-machines/scripts/virtual-machines-windows-powershell-upload-generalized-script) 。

另外，如果需要从其它平台迁移 VHD 到 Azure 平台，请参考 [从 Amazon Web Services (AWS) 和其他平台迁移到 Azure 中的托管磁盘](https://docs.azure.cn/zh-cn/virtual-machines/windows/on-prem-to-azure?toc=%2fvirtual-machines%2flinux%2ftoc.json)。

## 镜像发布到 Azure 市场前的测试

“构建和测试虚拟机镜像”完成后，VHD 文件保存到了存储账号中，但由于发布需要用到经典存储账号，所以还需要将 VHD 文件拷贝到经典存储账号并用 PowerShell 脚本测试后，方能发布到 Azure 市场。

- 如果您的 VHD 文件没有位于（经典）存储账号，请登录 [Azure Web管理](https://portal.azure.cn/) 平台，手动创建用于测试的（经典）存储账号。请下载PowerShell脚本 [将文件从存储账号拷贝到经典存储账号](https://github.com/msopentechcn/marketplace-content/blob/master/script/vhdcopy.ps1)，修改参数后运行，将 VHD 文件从现有存储账号拷贝到（经典）存储账号。请注意脚本中的 VHD 源地址所在的容器访问策略应该为“Blob”或“容器”。也可以参考 AzCopy 等传输工具，如 [使用 Windows 上的 AzCopy 传输数据](https://docs.azure.cn/zh-cn/storage/common/storage-use-azcopy)。

- 下载PowerShell脚本 [采用经典方式创建虚拟机](https://github.com/msopentechcn/marketplace-content/blob/master/script/createvm-classic.ps1)，查看虚拟机创建是否成功。测试完成后，创建的虚拟机所在的资源组需要手动从 Azure 管理平台删除。请注意，脚本执行前请先登录 Azure 平台，参见脚本中的相关提示，包括 Add-AzureAccount、Select-AzureSubscription 等指令。脚本输入参数中，“vhdUri”为VHD所在url地址，“storageAccountName”和“subid”为创建虚拟机所在的（经典）存储账号（可以用vhdUri的账号）和订阅ID。

	> [AZURE.NOTE] 注意: VHD 发布到 Azure 市场前，VHD 镜像文件所在的容器访问策略一定要设置为 “Blob 或 容器”，这样 VHD 镜像才能够被发布到 Azure 市场。
	> 测试过程中，如果


## 镜像发布前的检查单

在发布镜像提交到 Azure 市场之前，请确保以下检查单全部通过：

### 产品镜像要求

产品镜像必须满足如下要求：

- 适用于生产环境，Azure 市场原则上不接受测试版本产品上架
- 镜像为自包含镜像，所依赖的软件组件，包括客户端应均包括在此镜像中
- 不包含任何已知的缺陷，恶意软件和病毒
- 镜像必须经过严格内测，确保镜像可用性
- 对于 Linux 镜像，默认禁止 root 登录
- 对于 Linux 镜像，镜像中不包含任何用户认证密钥信息

### 产品描述要求

提供至少满足镜像发布表单的描述信息，具体信息见参见 [Azure 市场虚拟机镜像发布指南](~/documentation/article/imagepublishguide/)。内容主要包括但不限于：

- 产品信息（SKU，服务商名称，产品名称，短描述，完整描述）
- 产品logo：2张固定大小像素的png格式的图片（115x115, 255x115）
- 产品图片：此类图片用于产品说明中，可以是产品架构图或产品说明图片等，像素大小要求 （533x324）
- 镜像 VHD 文件地址：发布 VHD 镜像文件所在的 Azure Blob 的 url 地址
- 产品售后服务（客服联系方式，时间）