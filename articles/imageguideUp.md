# Azure China Marketplace Virtual Machine Image Creating Guide[中文版](file:///D:/Github/MPdocs/marketplace-content/imageguide/), Azure 市场虚拟机镜像制作指南[英文版](file:///D:/Github/MPdocs/marketplace-content/imageguideen/)

This guide introduces Azure Marketplace ISV (independent software vendors) the main process for producing VM images, uploading to Azure, and pre-publishing test preparation. 本指南为 Azure 市场 ISV（独立软件供应商）介绍虚拟机镜像制作、上传到 Azure、 VHD认证以及发布前测试准备的主要过程。（bug）

## 1. Prerequisites for creating a virtual machine image for the Azure Marketplace，为 Azure 市场制作虚拟机镜像的先决条件

### Download needed tools & applications，下载需要用到的工具和应用
You should have the following items ready before beginning the process:在开始之前应当安装下面的工具。

 - Depending on which operating system you are targeting, install the **Azure PowerShell cmdlets** or **Linux command-line interface tool** (Azure-Cli) from the [Azure Downloads](https://docs.azure.cn/zh-cn/downloads/) page. For the management tools you may use, please refer to [Azure PowerShell Overview](https://docs.microsoft.com/zh-cn/powershell/azure/overview?view=azurermps-5.0.0) and [Install Azure CLI 2.0](https://docs.azure.cn/zh-cn/cli/install-azure-cli?view=azure-cli-latest)。  根据所面向的操作系统，从[Azure 下载](Azure https://docs.azure.cn/zh-cn/downloads/)页安装**Azure PowerShell命令**或**Linux命令行接口工具（Azure CLI）**。对于你可能用到的管理工具，请参阅[Azure PowerShell概述](https://docs.microsoft.com/zh-cn/powershell/azure/overview?view=azurermps-5.0.0)和[安装Azure CLI 2 ](https://docs.azure.cn/zh-cn/cli/install-azure-cli?view=azure-cli-latest)。 

 - Install [Azure Storage Explorer](https://docs.azure.cn/zh-cn/vs-azure-tools-storage-manage-with-storage-explorer). [Azure 存储资源管理器](https://docs.azure.cn/zh-cn/vs-azure-tools-storage-manage-with-storage-explorer)

 - Download and install the Certification Test Tool for Azure Certified: 下载并运行 Azure 认证的认证测试工具:
		[http://go.microsoft.com/fwlink/?LinkID=526913](http://go.microsoft.com/fwlink/?LinkID=526913). You need a Windows-based computer to run the certification tool. If you do not have a Windows-based computer available, you can run the tool using a Windows-based VM in Azure. 你需要一台基于 Windows 的机器运行认证工具，如果你没有基于 Windows 的机器，也可以在基于 Windows 的 Azure 虚拟机上运行。

### Platforms supported，支持的平台
You can develop Azure-based VMs on Windows or Linux. Some elements of the publishing process--such as creating an Azure-compatible virtual hard disk (VHD)--use different tools and steps depending on which operating system you are using: 您可以在 Windows 或 Linux 上开发基于 Azure 的 VM，在镜像发布过程中的一些问题———如创建一个 Azure 兼容的虚拟硬盘（VHD），用到的工具和步骤取决于您所使用的操作系统：

 - If you are using Linux, refer to [Linux on distributions endorsed by Azure](https://docs.azure.cn/zh-cn/virtual-machines/linux/endorsed-distros). 如果您使用 Linux，请参阅 [Azure 认可的 Linux 发行版](https://docs.azure.cn/zh-cn/virtual-machines/linux/endorsed-distros)。

 - If you are using Windows, to ensure that you are using the correct base VHDs and choosing the correct VHD size. 如果你在制作 Windows映像，请确保使用正确的基本 VHD。

	The operating system VHD for your VM image must be based on an Azure-approved base image that contains Windows Server or SQL Server. You can create a VM from one of the following images, located at the Microsoft Azure portal [Azure Web Management Platform](https://portal.azure.cn/). These links can also be found in the Azure China Marketplace [Windows Server](https://market.azure.cn/zh-cn/marketplace/apps/Microsoft.WindowsServer?tab=Overview) and [SQL Server](https://market.azure.cn/zh-cn/marketplace/apps?page=1&search=sql%20server). 用于 VM 映像的操作系统 VHD 必须基于 Azure 批准的基本映像（包含 Windows Server 或 SQL Server）。开始时，请从位于 Microsoft Azure 门户  [Azure web管理平台](https://portal.azure.cn/) 的映像中创建 VM，这些映像也可以在 Azure 中国市场的[Windows Server](https://market.azure.cn/zh-cn/marketplace/apps/Microsoft.WindowsServer?tab=Overview) and [SQL Server](https://market.azure.cn/zh-cn/marketplace/apps?page=1&search=sql%20server)中找到。

	The Windows operating system VHD in your VM image should be created as a 128-GB fixed-format VHD. If the physical size is less than 128 GB, the VHD should be sparse. The base Windows and SQL Server images provided already meet these requirements, so do not change the format or the size of the VHD obtained. VM 映像中的 Windows 操作系统 VHD 应创建为 128 GB 的固定格式的 VHD。如果物理大小小于 128GB，则 VHD 应是稀疏的磁盘。 基本 Windows 和 SQL Server 映像已满足这些要求，因此请不要更改获取的 VHD 的格式或大小。 
	
 - If you are using Windows, Install the latest Windows patches. 如果你在制作 Windows映像，请安装最新 Windows 修补程序。
 
	The base images contain the latest patches up to their published date. Before publishing the operating system VHD you have created, ensure that Windows Update has been run and that all the latest Critical and Important security updates have been installed. Please refer to the document [Ready for Windows VHD or VHDX to Upload to Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/prepare-for-upload-vhd-image#complete-recommended-configurations). 基本映像包含截至发布日期的最新修补程序。 发布创建的操作系统 VHD 之前，请确保 Windows 更新已运行，并且所有最新的“关键”和“重要”安全更新都已安装。请参阅文档 [准备好要上传到 Azure 的 Windows VHD 或 VHDX](https://docs.azure.cn/zh-cn/virtual-machines/windows/prepare-for-upload-vhd-image#complete-recommended-configurations)中"安装 Windows 更新"部分。(bug)

 - If you are using Windows, perform additional configuration and schedule tasks as necessary. If additional configuration is needed, consider using a scheduled task that runs at startup to make any final changes to the VM after it has been deployed: 如果你在制作 Windows映像，根据需要执行其他配置和计划任务。如果需要其他配置，请考虑使用在启动时运行的计划任务，以便在部署 VM 之后对它进行任何最终更改：

	It is a best practice to have the task delete itself upon successful execution. 让任务在成功执行之后删除自己是最佳做法。

	No configuration should rely on drives other than drives C or D, because these are the only two drives that are always guaranteed to exist. Drive C is the operating system disk, and drive D is the temporary local disk. 不应有任何配置依赖于驱动器 C 或 D 之外的驱动器，因为这两个驱动器是仅有的始终保证存在的驱动器。 驱动器 C 是操作系统磁盘，而驱动器 D 是临时的本地磁盘。


There are two ways to make a VM image. One is to deploy the operating system VM directly on the Azure platform, install the application software and build an image; the other is to create an operating system locally through Hyper-v, create a VHD image file after the application software is installed, and then upload the VHD file to build a mirror on Azure. The first is Azure -customized method with relatively simple operation which is suitable for ordinary images; while the second one is a user-customized operating system with relatively complicated operation, which is suitable for images that require special operating system customization. 制作虚拟机镜像有两种方式。一种是直接在 Azure 平台上部署操作系统虚拟机，安装应用软件并构建镜像；第二种是从用户本地通过 Hyper-v 创建操作系统，安装应用软件后制作 VHD 镜像文件，然后上传 VHD 文件至 Azure 上构建镜像。第一种方式属于 Azure 定制方式，操作相对简单，适合普通的镜像制作；第二种方式属于用户定制操作系统方式，操作相对复杂，适合需要特殊操作系统定制的镜像制作。

In order to create images of high security-level, please refer to [Security Recommendations for Azure Marketplace Images](https://docs.microsoft.com/en-us/azure/security/security-recommendations-azure-marketplace-images). 为了制作高安全等级的映像，请参阅 [适用于 Azure 市场映像的安全建议](https://docs.microsoft.com/en-us/azure/security/security-recommendations-azure-marketplace-images)。

If the downloaded PowerShell script fails to execute, it is possibly due to Windows security isolation. You can select "unblock" in the property page of the script file, unlock the file and then execute it. 测试中下载的 PowerShell 脚本如果不能执行，可能的原因是由于 Windows 安全隔离导致，可以在脚本文件的属性页中，选择“unblock”，将文件解锁，然后再执行。

## 2. Build and test Azure Images，构建和测试 Azure 镜像

There are mainly four ways to build a VHD file. Generally, we recommend you choose the 1st and 3rd methods, which operate in ARM (Azure Resource Manager) mode. 构建 VHD 文件主要包括以下四种方法，一般可以选取第一种和第三种，相对简单（bug），这两种方法均在 ARM （ Azure 资源管理器）模式下执行。

### 2.1 Build a Linux application image on Azure，从 Azure 上构建 Linux 应用程序镜像
To build a Linux application image on Azure, you should:从 Azure 上构建 Linux 应用程序镜像，您应当：

2.1.1 First create a Linux VM, Please refer to [Create a Linux virtual machine in Azure portal](https://docs.azure.cn/zh-cn/virtual-machines/linux/quick-create-portal) or [Create and Manage Linux VMs with the Azure CLI](https://docs.azure.cn/zh-cn/virtual-machines/linux/tutorial-manage-vm). 首先在 Azure 平台上（bug）创建 Linux 虚拟机，请参阅[使用 Azure 门户创建 Linux 虚拟机](https://docs.azure.cn/zh-cn/virtual-machines/linux/quick-create-portal) 或 [使用 Azure CLI 创建和管理 Linux VM](https://docs.azure.cn/zh-cn/virtual-machines/linux/tutorial-manage-vm)。

- Once you have entered Azure portal and selected the base image, follow the prompts to create a VM. When creating a virtual machine for configuration on Azure platform, for "Whether use managed disk" in "Settings" -> "Storage" option, select "No". Otherwise VHD file may not be created in the next step. Under ‘Storage Account’（bug）, you can optionally select the storage account in which the operating system VHD will be stored. 一旦登录 Azure 管理平台并选中基本镜像，请根据提示创建虚拟机。在 Azure 平台上创建虚机进行配置的时候，对于“设置”->“存储”选项中的“使用托管的磁盘”，请选择“否”，否则不会生成 VHD 文件。在“存储账号”下，你可以任意选择存储账号存放 VHD 文件。

2.1.2 To build a Linux application image and VHD file on Azure, please refer to the document [Creating a Linux Azure VM Image Using the CLI](https://docs.azure.cn/zh-cn/virtual-machines/linux/tutorial-custom-images#next-steps). Please note: 在 Azure 上创建 Linux 应用程序镜像和 VHD 文件，请参阅文档 [使用 CLI 创建 Azure VM 的自定义映像](https://docs.azure.cn/zh-cn/virtual-machines/linux/tutorial-custom-images#next-steps)，并注意：

- In the reference document, the VHD image has been prepared and can be viewed in the resource group or stroage account(bug) on the portal(Azure, bug) web administration page after “you have deallocated VMs and mark them as universal”. In the subsequent test, you can manage "create a VM from the image" in the portal(Azure, bug) Web management page but not from Azure-Cli. 参考文档中，“解除分配 VM 并将其标记为通用化”完成后，VHD 镜像文件已经制作好了，可以在Azure Web 管理页面的资源组或存储账号中查看。 后续测试中，“从映像创建 VM”部分可以在 Azure Web 管理页面操作，这样更为简单。

### 2.2 Build a Linux application image from outside Azure (local)，从 Azure 外部（本地）构建 Linux 应用程序镜像
To build an Azure-based CentOS（bug） Linux application image locally, please refer to the documentation [Information for Non-Endorsed Distributions](https://docs.azure.cn/zh-cn/virtual-machines/linux/create-upload-generic). 从本地构建基于 Azure 的 Linux 应用程序镜像，请参阅文档 [有关未认可分发版的信息](https://docs.azure.cn/zh-cn/virtual-machines/linux/create-upload-generic)。

For how to create & test a Linux VM from an image, please refer to [Create a Linux VM from custom disk with the Azure CLI 2.0](https://docs.azure.cn/zh-cn/virtual-machines/linux/upload-vhd). 如何从镜像创建和测试 Linux 虚拟机，请参阅 [使用 Azure CLI 2.0 从自定义磁盘创建 Linux VM]((https://docs.azure.cn/zh-cn/virtual-machines/linux/upload-vhd)。


### 2.3 Build a Windows application image on Azure，从 Azure 上构建 Windows 应用程序镜像
To build a Windows application image on Azure, you should: 从 Azure 上构建 Windows 应用程序镜像，您应当：

2.3.1 First create a Windows VM, Please refer to [Create a Windows virtual machine in Azure portal](https://docs.azure.cn/zh-cn/virtual-machines/windows/quick-create-portal) or [Creating a Windows Azure VM Image Using the PowerShell](https://docs.azure.cn/zh-cn/virtual-machines/windows/tutorial-manage-vm). 首先在Azure 平台上（bug）创建 Windows 虚拟机，请参阅 [使用 Azure 门户创建 Windows 虚拟机](https://docs.azure.cn/zh-cn/virtual-machines/windows/quick-create-portal) 或 [使用 Azure PowerShell 模块创建和管理 Windows VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/tutorial-manage-vm)。

- Once you have entered Azure portal and selected the base image, follow the prompts to create a VM. When creating a virtual machine for configuration on Azure platform, for "Whether use managed disk" in "Settings" -> "Storage" option, select "No". Otherwise VHD file may not be created in the next step. Under ‘Storage Account’（bug）, you can optionally select the storage account in which the operating system VHD will be stored. 一旦登录 Azure 管理平台并选中基本镜像，请根据提示创建虚拟机。在 Azure 平台上创建虚机进行配置的时候，对于“设置”->“存储”选项中的“使用托管的磁盘”，请选择“否”，否则不会生成 VHD 文件。在“存储账号”下，你可以任意选择存储账号存放 VHD 文件。

2.3.2 To build a Windows application image and VHD file on Azure(bug), Please refer to the document [Using PowerShell to Create a Windows Azure Virtual Machine Image](https://docs.azure.cn/zh-cn/virtual-machines/windows/tutorial-custom-images). 请注意: 在 Azure 上创建 Windows 应用程序镜像和 VHD 文件，请参阅文档  [使用 PowerShell 创建 Azure VM 的自定义映像](https://docs.azure.cn/zh-cn/virtual-machines/windows/tutorial-custom-images)，请注意：

- In the reference document, for "Deallocating a VM and marking it as universal", you should log in to Azure (Login-AzureRmAccount -EnvironmentName AzureChinaCloud) in ARM firstly before viewing VHD files in the resource group  or or stroage account(bug) on the portal web administration page. Subsequent tests, "from the image to create a VM" in the portal（Azure, bug） Web management page operation, this is relatively simple. In the subsequent test, you can manage "create a VM from the image" in the portal（Azure, bug） Web management page. 参考文档中，“解除分配 VM 并将其标记为通用化”需要首先在ARM 模式下登录 Azure（Login-AzureRmAccount -EnvironmentName AzureChinaCloud）再执行，完成后可以在 Azure Web 管理页面的资源组或存储账号中查看 VHD 文件。后续测试中，“从映像创建 VM”部分可以在 Azure Web 管理页面操作，这样更为简单。

### 2.4 Build a Windows application image from outside Azure (local)，从 Azure 外部（本地）构建 Windows 应用程序镜像

To build an Azure-based Windows application image either locally or outside of Azure, please refer to the document [Ready for Windows VHD or VHDX to Upload to Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/prepare-for-upload-vhd-image#complete-recommended-configurations). For image testing, please refer to [Create a VM from a managed image](https://docs.azure.cn/zh-cn/virtual-machines/windows/create-vm-generalized-managed). For how to upload a VHD to Azure and test it, refer to [Uploading a Generic VHD and use it to create a new VM in Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/upload-generalized-managed), or refer to the test script [Uploading a Universal VHD to Azure Using PowerShell and Creating a New VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/sa-upload-generalized).  从本地或 Azure 外部构建基于 Azure 的 Windows 应用程序镜像，请参阅文档 [准备好要上传到 Azure 的 Windows VHD 或 VHDX](https://docs.azure.cn/zh-cn/virtual-machines/windows/prepare-for-upload-vhd-image#complete-recommended-configurations)。镜像的测试, 请参阅 [从托管映像创建 VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/create-vm-generalized-managed)。 如何将 VHD 文件上传到 Azure 并测试, 请参阅 [上传通用化 VHD 并使用它在 Azure 中创建新 VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/upload-generalized-managed), 或参阅文中测试脚本 [将通用化 VHD 上传到 Azure 以创建新 VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/sa-upload-generalized).


### 2.5 For other resources，其它资源

For uploading Linux or Windows images to Azure, please refer to the scirpt [PowerShell Sample Scripts for Uploading Universalized VHDs to Azure](https://docs.azure.cn/zh-cn/virtual-machines/scripts/virtual-machines-windows-powershell-upload-generalized-script). 另外对于 Linux 或 windows 镜像，VHD 上传和创建脚本请参阅 [将 VHD 上传到 Azure 并创建新的 VM 的示例脚本](https://docs.azure.cn/zh-cn/virtual-machines/scripts/virtual-machines-windows-powershell-upload-generalized-script)

In addition, if you need to migrate VHDs from other platforms to Azure platform, please refer to [Managed Disks Migrated from Amazon Web Services (AWS) and Other Platforms to Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/on-prem-to-azure?toc=%2fvirtual-machines%2flinux%2ftoc.json). 另外，如果需要从其它平台迁移 VHD 到 Azure 平台，请参阅 [从 Amazon Web Services (AWS) 和其他平台迁移到 Azure 中的托管磁盘](https://docs.azure.cn/zh-cn/virtual-machines/windows/on-prem-to-azure?toc=%2fvirtual-machines%2flinux%2ftoc.json)。

## 3. Obtain certification for your VM image，获得 VM 镜像的认证

The next step in preparing your VM image for the Azure Marketplace is to have it certified. 为 Azure 市场准备 VM 映像的下一步是进行认证。

### 3.1 Download and run the Certification Test Tool for Azure Certified 下载并运行用于 Azure 认证的认证测试工具

The certification tool runs on a running VM, provisioned from your user VM image, to ensure that the VM image is compatible with Microsoft Azure. It will verify that the guidance and requirements about preparing your VHD have been met. The output of the tool is a compatibility report. 认证工具在正在运行的 VM（从用户 VM 映像中预配）上运行，确保 VM 映像与 Microsoft Azure 兼容。 它会验证是否 VHD 满足指南的要求，该工具的输出是一份兼容性报告。

The certification tool can be used with both Windows and Linux VMs. It connects to Windows-based VMs via PowerShell and connects to Linux VMs via SSH.Net: 认证工具可以与 Windows 和 Linux VM 一起使用。 它通过 PowerShell 连接到基于 Windows 的 VM，通过 SSH.Net 连接到 Linux VM：

 - First, download the certification tool at the [Microsoft download site](http://www.microsoft.com/download/details.aspx?id=44299). 首先，在 [Microsoft 下载站点](http://www.microsoft.com/download/details.aspx?id=44299)下载认证工具。
 - Open the certification tool, and then click the Start New Test button.打开认证工具，并单击“启动新测试”按钮。
 - From the Test Information screen, enter a name for the test run. 在“测试信息”屏幕中，为测试运行输入名称。
 - Choose whether your VM is on Linux or Windows. Depending on which you choose, select the subsequent options. 选择 VM 是处于 Linux 还是 Windows 上。 根据所选内容，选择后续选项。
 - After you have selected the correct options for your Linux or Windows-based VM image, select **Test Connection** to ensure that SSH.Net or PowerShell has a valid connection for testing purposes. After a connection is established, select **Next** to start the test. 为基于 Linux 或 Windows 的 VM 映像选择了正确的选项之后，选择“测试连接”以确保 SSH.Net 或 PowerShell 具有可用于测试的有效连接。 建立连接之后，按“下一步”以启动测试。
 - When the test is complete, you will receive the results (Pass/Fail/Warning) for each test element. If any of the tests fail, your image will not be certified. If this occurs, review the requirements and make any necessary changes. After the automated test, you are asked to provide additional input on your VM image via a questionnaire screen. Complete the questions, and then select **Next**. 测试完成时，将收到每个测试元素的结果（通过/失败/警告）。 如果任何测试失败，不会认证映像。 如果发生这种情况，请查看要求并作出任何必要更改。自动测试后，将通过调查表屏幕要求用户提供有关 VM 映像的其他输入。 填写这些问题，并选择“下一步”。
 - In the end, you can download the test results and log files for the executed test cases in addition to your answers to the questionnaire. Save the results in the same container as your VHDs. 最后，除下载调查表答案外，还可下载已执行的测试用例的测试结果和日志文件，并将结果保存在与 VHD 相同的容器中。


### 3.2 Set access of image URI，设置镜像 URI 的访问权限
The access policy of the Azure storage container where the VM image file is located should be set as "Blob" or "container", or there will be “no image found” error when it is published on Azure China Marketplace. 在将 VM 镜像发布到 Azure 中国市场的时候，镜像文件所在的 Azure 存储容器属性应该设置为“Blob”或“容器”属性，否则将会出现“镜像不存在”的错误。

If you want to precisely definite the access of the image URI, please refer to the next section using the SAS URI. 如果你想更精细地定义镜像 URI 的访问权限，请参考下一节的使用 SAS URI的方法。

### 3.3 Get the shared access signature URI for your VM images，为 VM 映像获取共享访问签名 URI
During the publishing process, you specify the uniform resource identifiers (URIs) that lead to each of the VHDs you have created for your SKU. Microsoft needs access to these VHDs during the certification process. Therefore, you need to create a shared access signature URI for each VHD. This is the URI that should be entered in the **Address of VHD file** item in the Publishing Portal. 在发布过程中，指定导向为 SKU 创建的所有 VHD 的统一资源标识符 (URI)。 Microsoft 需要在认证过程中访问这些 VHD，因此需要为每个 VHD 创建共享访问签名 URI，这是应在发布门户的“映像”选项卡中输入的 URI。

The shared access signature URI created should adhere to the following requirements. Note that the following instructions are applicable only for unmanaged disks which are the only kind supported. 创建的共享访问签名 URI 应符合以下要求，注意以下说明仅适用于非托管磁盘，这是唯一支持的类型。

 - When generating shared access signature URIs for your VHDs, List and Read­ permissions are sufficient. Do not provide Write or Delete access. 为 VHD 生成共享访问签名 URI 时，“列出”和“读取”权限已足够使用。 请不要提供“写入”或“删除”访问权限。
访问的持续时间应至少是三 (3) 周，从创建共享访问签名 URI 时算起。
为了保证 UTC 时间，请选择当前日期的前一天。 例如，如果当前时间是 2014 年 10 月 6 日，则选择 10/5/2014。
 - The access should be invalid only after the image has been published to Azure China Marketplace platform using Publishing Portal. 只有当镜像通过发布平台被发布到 Azure 中国市场的时候，访问权限才有效。(bug)

To generate SAS URL to share your VHD for Azure Marketplace, please refer to part **Attach a storage account by using a Shared Access Signature** of [Get started with Storage Explorer (Preview)](https://docs.azure.cn/zh-cn/vs-azure-tools-storage-manage-with-storage-explorer) and **Manage access policy** of [Use the Microsoft Storage Explorer to Import/Export data to Azure Storage](https://docs.azure.cn/zh-cn/storage/blobs/storage-quickstart-blobs-storage-explorer). 为了为 Azure 市场生成 VHD的 SAS URL，请参阅[存储资源管理器（预览版）入门](https://docs.azure.cn/zh-cn/vs-azure-tools-storage-manage-with-storage-explorer)的**使用 SAS 附加存储帐户**部分 和 [使用 Azure 存储资源管理器将对象传入/传出 Azure Blob 存储](https://docs.azure.cn/zh-cn/storage/blobs/storage-quickstart-blobs-storage-explorer) 的**管理访问策略**部分。

## 4. Troubleshooting common issues encountered during VHD creation，VHD 创建中遇到的常见的故障诊断

4.1 How do I change the name of the host? Once VM is created, users can’t update the name of the host. 如何更改主机名称？创建 VM 后，用户无法更新主机名称。

4.2 How to reset vm's login password? Please refer to [How to reset the Remote Desktop service or its login password in a Windows VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/reset-rdp) and [How to reset local Linux password on Azure VMs](https://docs.azure.cn/zh-cn/virtual-machines/linux/reset-password), [Manage users, SSH, and check or repair disks on Azure Linux VMs using the VMAccess Extension with the Azure CLI 1.0](https://docs.azure.cn/zh-cn/virtual-machines/linux/using-vmaccess-extension). 如何重置远程桌面服务或其登录密码？请参阅 [Windows VM 中重置远程桌面服务或其登录密码](https://docs.azure.cn/zh-cn/virtual-machines/windows/reset-rdp) and [如何在 Azure VM 上重置本地 Linux 密码](https://docs.azure.cn/zh-cn/virtual-machines/linux/reset-password), [配合使用 VMAccess 扩展和 Azure CLI 2.0 管理管理用户、SSH，并检查或修复 Linux VM 上的磁盘](https://docs.azure.cn/zh-cn/virtual-machines/linux/using-vmaccess-extension)。

4.3 How to generate new ssh certificates? Please refer to the link: [Detailed walk through to create an SSH key pair and additional certificates for a Linux VM in Azure](https://docs.azure.cn/zh-cn/virtual-machines/linux/create-ssh-keys-detailed). 如何生成新 ssh 证书？请参阅以下链接: [如何为 Azure 中的 Linux VM 创建 SSH 密钥对](https://docs.azure.cn/zh-cn/virtual-machines/linux/create-ssh-keys-detailed)。

4.4 How to configure an open VPN certificate? Please refer to the link: [Configure a Point-to-Site connection to a VNet using native Azure certificate authentication: Azure portal](https://docs.azure.cn/zh-cn/vpn-gateway/vpn-gateway-howto-point-to-site-resource-manager-portal). 如何配置开放式的 VPN 证书？请参阅以下链接：[使用本机 Azure 证书身份验证配置与 VNet 的点到站点连接：Azure 门户](https://docs.azure.cn/zh-cn/vpn-gateway/vpn-gateway-howto-point-to-site-resource-manager-portal)。

4.5 What is the policy for running Microsoft server software in the Microsoft Azure virtual machine environment (infrastructure-as-a-service)? Please refer to the link: [Microsoft server software support for Microsoft Azure virtual machines](https://support.microsoft.com/kb/2721672). 在 Microsoft Azure 虚拟机环境中运行 Microsoft 服务器软件（基础结构即服务）的支持策略是什么？请参阅以下链接：[Microsoft Azure 虚拟机的 Microsoft 服务器软件支持](https://support.microsoft.com/kb/2721672)。

4.6 Do Virtual Machines have any unique identifier? Azure encodes Azure VM Unique ID in every VM. See details in this blog and documentation. 虚拟机有唯一标识符吗？Azure 在每台 VM 中为 Azure VM 唯一 ID 编码。 请参阅此博客和文档中的详细信息。

4.7 In a VM how can I manage the custom script extension in the startup task? Please refer to the link: [Custom Script Extension for Windows](https://docs.azure.cn/zh-cn/virtual-machines/windows/extensions-customscript)（bug）, [Use the Azure Custom Script Extension with Linux virtual machines](https://docs.azure.cn/zh-cn/virtual-machines/linux/extensions-customscript). 在 VM 中如何管理启动任务中的自定义脚本扩展？请参阅以下链接：[适用于 Windows 的自定义脚本扩展](https://docs.azure.cn/zh-cn/virtual-machines/windows/extensions-customscript), [在 Linux 虚拟机上使用 Azure 自定义脚本扩展](https://docs.azure.cn/zh-cn/virtual-machines/linux/extensions-customscript)。

4.8 How to create a VM from the Azure portal using the VHD that is uploaded to premium storage? We do not support this feature yet. 如何使用上传到高级存储的 VHD 在 Azure 门户中创建 VM？ 我们尚不支持此功能。


## 5. Image pre-publishing test to Azure Marketplace

After VM image is built and tested, it cannot be released directly to Azure Marketplace since the VHD image file needs to be tested in (classic) mode (as opposed to ARM mode). This test requires a (classic) storage account under PowerShell. “构建和测试虚拟机镜像”完成后，还不能直接发布到 Azure 市场，还需要在（经典）模式（相对于“Azure 资源管理器”模式）下对 VHD 镜像文件进行测试。这个测试需要用到（经典）存储账号，在 PowerShell 下进行。

- Make sure the VHD file is in the (classic) storage account. If your VHD file is not in the (classic) storage account, log in to the [Azure Web Management Platform](https://portal.azure.cn/) and manually create a (classic) storage account for testing. Please download the PowerShell script [Copy the File from the Storage Account to the Classic Storage Account](https://raw.githubusercontent.com/msopentechcn/marketplace-content/master/script/vhdcopy.ps1). After updating the parameters, copy the VHD file from the existing storage account to the (classic) storage account. Note that the access policy for the storage container where the VHD source address in the script resides should be Blob or Container. In addition to PowerShell, you can also use tools such as AzCopy for copying, such as [Using AzCopy on Windows to Transfer Data](https://docs.azure.cn/zh-cn/storage/common/storage-use-azcopy). 确保 VHD 文件位于（经典）存储账号中。如果您的 VHD 文件没有位于（经典）存储账号中，请登录 [Azure Web管理](https://portal.azure.cn/) 平台，手动创建用于测试的（经典）存储账号。请下载 PowerShell 脚本 [将文件从存储账号拷贝到经典存储账号](https://raw.githubusercontent.com/msopentechcn/marketplace-content/master/script/vhdcopy.ps1 "download")，修改参数后运行，将 VHD 文件从现有存储账号拷贝到（经典）存储账号。请注意脚本中的 VHD 源地址所在的存储容器的访问策略应该为“Blob”或“容器”。除了 PowerShell ，也可以使用 AzCopy 等工具进行拷贝，如 [使用 Windows 上的 AzCopy 传输数据](https://docs.azure.cn/zh-cn/storage/common/storage-use-azcopy)。

- Log in to the Azure platform in (classic) mode. Enter the following instructions in PowerShell: （经典）模式下登录到 Azure 平台。 PowerShell 下输入如下指令：
	- Add-AzureAccount -Environment AzureChinaCloud
	- Get-AzureSubscription
	- Select-AzureSubscription -SubscriptionID <Subscription ID> #Select the subscription for testing.	
	
- Use PowerShell scripts to test VHD files. Download PowerShell Scripts [Create Virtual Machines in a Classic Way](https://raw.githubusercontent.com/msopentechcn/marketplace-content/master/script/createvm-classic.ps1) and run to see whether the virtual machine is created successfully. In the script input parameter, "vhdUri" is the url address where the VHD is located. "StorageAccountName" and "subid" are the (classic) storage account where the virtual machine is created (an account that can be used by vhdUri) and the subscription ID. 使用PowerShell脚本对 VHD 文件进行测试。下载PowerShell脚本 [采用经典方式创建虚拟机](https://raw.githubusercontent.com/msopentechcn/marketplace-content/master/script/createvm-classic.ps1 "download")并运行，然后查看虚拟机创建是否成功。脚本输入参数中，“vhdUri”为VHD所在url地址，“storageAccountName”和“subid”为创建虚拟机所在的（经典）存储账号（可以用vhdUri的账号）和订阅ID。

- After the test is completed, the resource group where the created virtual machine in the test resides needs to be manually removed from the Azure Management Platform. 测试完成后，测试中创建的虚拟机所在的资源组需要手动从 Azure 管理平台删除。

	> [AZURE.NOTE] Note: Before VHD is released to Azure Marketplace, the container access policy where the VHD image file resides must be set to "Blob or Container" so that the VHD image can be published to the Azure Marketplace. 注意: VHD 发布到 Azure 市场前，VHD 镜像文件所在的容器访问策略一定要设置为 “Blob 或 容器”，这样 VHD 镜像才能够被发布到 Azure 市场。（bug）


## 6. Checklist before image release 镜像发布前的检查单

Before submitting the image to Azure Marketplace, make sure the following checklist is all passed: 在发布镜像提交到 Azure 市场之前，请确保以下检查单全部通过：

### Product image requirements，产品镜像要求

Product images must meet the following requirements: 产品镜像必须满足如下要求：

- For production environments. Azure Marketplace does not accept publishing testing products in principle
- The image should be a self-contained image in which software components including the client should all be included
- Do not contain any known defects, malware and viruses
- Images must be rigorously tested for availability
- For Linux mirroring, root login is disabled by default
- For Linux mirroring, the mirror does not contain any user authentication key information
- 适用于生产环境，Azure 市场原则上不接受测试版本产品上架
- 镜像为自包含镜像，所依赖的软件组件，包括客户端应均包括在此镜像中
- 不包含任何已知的缺陷，恶意软件和病毒
- 镜像必须经过严格内测，确保镜像可用性
- 对于 Linux 镜像，默认禁止 root 登录
- 对于 Linux 镜像，镜像中不包含任何用户认证密钥信息

### Product description requirements，产品描述要求

Provide a description that meets at least the mirror publishing form. For more information, see [Azure Marketplace Virtual Machine Image Publishing Guide](~/documentation/article/imagepublishguide/). The content mainly includes but not limited to: 提供至少满足镜像发布表单的描述信息，具体信息见参见 [Azure 市场虚拟机镜像发布指南](~/documentation/article/imagepublishguide/)。内容主要包括但不限于：

- Product Information (Service-ID, SKU, Product Name, Short Description, Full Description)
- Product logo: 2 png-format images with fixed-size pixels (115x115, 255x115)
- Product Image: it is used in the product description, which can be a product image or a product description image etc. with fixed-size pixel (533x324)
- Mirror VHD File Address: The URL address of the Azure Blob where the VHD image file is published
- Product after-sales service (customer service contact, time)
- 产品信息（SKU，服务商名称，产品名称，短描述，完整描述）
- 产品logo：2张固定大小像素的png格式的图片（115x115, 255x115）
- 产品图片：此类图片用于产品说明中，可以是产品架构图或产品说明图片等，像素大小要求 （533x324）
- 镜像 VHD 文件地址：发布 VHD 镜像文件所在的 Azure Blob 的 url 地址
- 产品售后服务（客服联系方式，时间）