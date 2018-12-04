# Azure Marketplace Virtual Machine Image Creating Guide[中文版](file:///D:/Github/MPdocs/marketplace-content/imageguide/)

This guide introduces Azure Marketplace ISV (independent software vendors) the main process for producing VM images, uploading to Azure, and pre-publishing test preparation.

## 1. Prerequisites for creating a virtual machine image for the Azure Marketplace

### Download needed tools & applications
You should have the following items ready before beginning the process:

 - Depending on which operating system you are targeting, install the **Azure PowerShell cmdlets** or **Linux command-line interface tool** (Azure-Cli) from the [Azure Downloads](https://docs.azure.cn/zh-cn/downloads/) page. For the management tools you may use, please refer to [Azure PowerShell Overview](https://docs.microsoft.com/zh-cn/powershell/azure/overview?view=azurermps-5.0.0) and [Install Azure CLI 2.0](https://docs.azure.cn/zh-cn/cli/install-azure-cli?view=azure-cli-latest)。

 - Install [Azure Storage Explorer](https://docs.azure.cn/zh-cn/vs-azure-tools-storage-manage-with-storage-explorer).

 - Download and install the Certification Test Tool for Azure Certified:
		[http://go.microsoft.com/fwlink/?LinkID=526913](http://go.microsoft.com/fwlink/?LinkID=526913). You need a Windows-based computer to run the certification tool. If you do not have a Windows-based computer available, you can run the tool using a Windows-based VM in Azure.

### Platforms supported
You can develop Azure-based VMs on Windows or Linux. Some elements of the publishing process--such as creating an Azure-compatible virtual hard disk (VHD)--use different tools and steps depending on which operating system you are using: 

 - If you are using Linux, refer to the “Create an Azure-compatible VHD (Linux-based)” section of the [Azure 认可的 Linux 发行版](https://docs.azure.cn/zh-cn/virtual-machines/linux/endorsed-distros).

 - If you are using Windows, to ensure that you are using the correct base VHDs and choosing the correct VHD size.

	The operating system VHD for your VM image must be based on an Azure-approved base image that contains Windows Server or SQL Server. You can create a VM from one of the following images, located at the Microsoft Azure portal [Azure Web Management Platform](https://portal.azure.cn/). These links can also be found in the Azure China Marketplace [Windows Server](https://market.azure.cn/zh-cn/marketplace/apps/Microsoft.WindowsServer?tab=Overview) and [SQL Server](https://market.azure.cn/zh-cn/marketplace/apps?page=1&search=sql%20server).

	The Windows operating system VHD in your VM image should be created as a 128-GB fixed-format VHD. If the physical size is less than 128 GB, the VHD should be sparse. The base Windows and SQL Server images provided already meet these requirements, so do not change the format or the size of the VHD obtained.
	
 - If you are using Windows, Install the latest Windows patches. 
 
	The base images contain the latest patches up to their published date. Before publishing the operating system VHD you have created, ensure that Windows Update has been run and that all the latest Critical and Important security updates have been installed. Please refer to the document [Ready for Windows VHD or VHDX to Upload to Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/prepare-for-upload-vhd-image#complete-recommended-configurations)

 - If you are using Windows, perform additional configuration and schedule tasks as necessary. If additional configuration is needed, consider using a scheduled task that runs at startup to make any final changes to the VM after it has been deployed:

	It is a best practice to have the task delete itself upon successful execution.

	No configuration should rely on drives other than drives C or D, because these are the only two drives that are always guaranteed to exist. Drive C is the operating system disk, and drive D is the temporary local disk.


There are two ways to make a VM image. One is to deploy the operating system VM directly on the Azure platform, install the application software and build an image; the other is to create an operating system locally through Hyper-v, create a VHD image file after the application software is installed, and then upload the VHD file to build a mirror on Azure. The first is Azure -customized method with relatively simple operation which is suitable for ordinary images; while the second one is a user-customized operating system with relatively complicated operation, which is suitable for images that require special operating system customization.

In order to create images of high security-level, please refer to [Security Recommendations for Azure Marketplace Images](https://docs.microsoft.com/en-us/azure/security/security-recommendations-azure-marketplace-images)

If the downloaded PowerShell script fails to execute, it is possibly due to Windows security isolation. You can select "unblock" in the property page of the script file, unlock the file and then execute it.

## 2. Build and test Azure Images

There are mainly four ways to build a VHD file. Generally, we recommend you choose the 1st and 3rd methods, which operate in ARM (Azure Resource Manager) mode.

### 2.1 Build a Linux application image on Azure
To build a Linux application image on Azure, you should:

2.1.1 First create a Linux VM, Please refer to [Create a Linux virtual machine in Azure portal，使用 Azure 门户创建 Linux 虚拟机](https://docs.azure.cn/zh-cn/virtual-machines/linux/quick-create-portal) or [Create and Manage Linux VMs with the Azure CLI, 使用 Azure CLI 创建和管理 Linux VM](https://docs.azure.cn/zh-cn/virtual-machines/linux/tutorial-manage-vm). 

- Once you have entered Azure portal and selected the base image, follow the prompts to create a VM. When creating a virtual machine for configuration on Azure platform, for "Whether use managed disk，使用托管的磁盘" in "Settings" -> "Storage" option, select "No". Otherwise VHD file may not be created in the next step. Under Storage Account, you can optionally select the storage account in which the operating system VHD will be stored.

2.1.2 To build a Linux application image and VHD file on Azure, please refer to the document [Creating a Linux Azure VM Image Using the CLI, 使用 CLI 创建 Azure VM 的自定义映像](https://docs.azure.cn/zh-cn/virtual-machines/linux/tutorial-custom-images#next-steps). Please note:

- In the reference document, the VHD image has been prepared and can be viewed in the resource group on the portal web administration page after “you have deallocated VMs and mark them as universal”. In the subsequent test, you can manage "create a VM from the image" in the portal Web management page but not from Azure-Cli.

### 2.2 Build a Linux application image from outside Azure (local)
To build an Azure-based CentOS Linux application image locally, please refer to the documentation [Information for Non-Endorsed Distributions有关未认可分发版的信息](https://docs.azure.cn/zh-cn/virtual-machines/linux/create-upload-generic). 

For how to create & test a Linux VM from an image, please refer to [Create a Linux VM from custom disk with the Azure CLI 2.0](https://docs.azure.cn/zh-cn/virtual-machines/linux/upload-vhd).


### 2.3 Build a Windows application image on Azure
To build a Windows application image on Azure, you should:

2.3.1 First create a Windows VM, Please refer to [Create a Windows virtual machine in Azure portal，使用 Azure 门户创建 Windows 虚拟机](https://docs.azure.cn/zh-cn/virtual-machines/windows/quick-create-portal) or [Creating a Windows Azure VM Image Using the PowerShell, 使用 Azure PowerShell 模块创建和管理 Windows VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/tutorial-manage-vm). 

- Once you have entered Azure portal and selected the base image, follow the prompts to create a VM. When creating a virtual machine for configuration on Azure platform, for "Whether use managed disk，使用托管的磁盘" in "Settings" -> "Storage" option, select "No". Otherwise VHD file may not be created in the next step. Under Storage Account, you can optionally select the storage account in which the operating system VHD will be stored.

2.3.2 To build a Windows application image on Azure, Please refer to the document [Using PowerShell to Create a Windows Azure Virtual Machine Image](https://docs.azure.cn/zh-cn/virtual-machines/windows/tutorial-custom-images). Please note:

- In the reference document, for "Deallocating a VM and marking it as universal", you should log in to Azure (Login-AzureRmAccount -EnvironmentName AzureChinaCloud) in ARM firstly before viewing VHD files in the resource group on the portal web administration page. Subsequent tests, "from the image to create a VM" in the portal Web management page operation, this is relatively simple. In the subsequent test, you can manage "create a VM from the image" in the portal Web management page.
 

### 2.4 Build a Windows application image from outside Azure (local)

To build an Azure-based Windows application image either locally or outside of Azure, please refer to the document [Ready for Windows VHD or VHDX to Upload to Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/prepare-for-upload-vhd-image#complete-recommended-configurations). For image testing, please refer to [Create a VM from a managed image从托管映像创建 VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/create-vm-generalized-managed). For how to upload a VHD to Azure and test it, refer to [Uploading a Generic VHD and use it to create a new VM in Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/upload-generalized-managed), or refer to the test script [Uploading a Universal VHD to Azure Using PowerShell and Creating a New VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/sa-upload-generalized). 

### 2.5 For other resources

For uploading Linux or Windows images to Azure, please refer to the scirpt [PowerShell Sample Scripts for Uploading Universalized VHDs to Azure](https://docs.azure.cn/zh-cn/virtual-machines/scripts/virtual-machines-windows-powershell-upload-generalized-script).

In addition, if you need to migrate VHDs from other platforms to Azure platform, please refer to [Managed Disks Migrated from Amazon Web Services (AWS) and Other Platforms to Azure](https://docs.azure.cn/zh-cn/virtual-machines/windows/on-prem-to-azure?toc=%2fvirtual-machines%2flinux%2ftoc.json).

## 3. Obtain certification for your VM image

The next step in preparing your VM image for the Azure Marketplace is to have it certified.

### 3.1 Download and run the Certification Test Tool for Azure Certified

The certification tool runs on a running VM, provisioned from your user VM image, to ensure that the VM image is compatible with Microsoft Azure. It will verify that the guidance and requirements about preparing your VHD have been met. The output of the tool is a compatibility report.

The certification tool can be used with both Windows and Linux VMs. It connects to Windows-based VMs via PowerShell and connects to Linux VMs via SSH.Net:

 - First, download the certification tool at the [Microsoft download site](http://www.microsoft.com/download/details.aspx?id=44299).
 - Open the certification tool, and then click the Start New Test button.
 - From the Test Information screen, enter a name for the test run.
 - Choose whether your VM is on Linux or Windows. Depending on which you choose, select the subsequent options.
 - After you have selected the correct options for your Linux or Windows-based VM image, select **Test Connection** to ensure that SSH.Net or PowerShell has a valid connection for testing purposes. After a connection is established, select **Next** to start the test.
 - When the test is complete, you will receive the results (Pass/Fail/Warning) for each test element. If any of the tests fail, your image will not be certified. If this occurs, review the requirements and make any necessary changes. After the automated test, you are asked to provide additional input on your VM image via a questionnaire screen. Complete the questions, and then select **Next**.
 - In the end, you can download the test results and log files for the executed test cases in addition to your answers to the questionnaire. Save the results in the same container as your VHDs

### 3.2 Set access of image URI
The access policy of the Azure storage container where the VM image file is located should be set as "Blob" or "container", or there will be “no image found” error when it is published on Azure China Marketplace.

If you want to precisely definite the access of the image URI, please refer to the next section using the SAS URI.

### 3.3 Get the shared access signature URI for your VM images
During the publishing process, you specify the uniform resource identifiers (URIs) that lead to each of the VHDs you have created for your SKU. Microsoft needs access to these VHDs during the certification process. Therefore, you need to create a shared access signature URI for each VHD. This is the URI that should be entered in the **Address of VHD file** item in the Publishing Portal.

The shared access signature URI created should adhere to the following requirements. Note that the following instructions are applicable only for unmanaged disks which are the only kind supported.

 - When generating shared access signature URIs for your VHDs, List and Read­ permissions are sufficient. Do not provide Write or Delete access.	
 - The access should be invalid only after the image has been published to Azure China Marketplace platform using Publishing Portal. 

To generate SAS URL to share your VHD for Azure Marketplace, please refer to part **Attach a storage account by using a Shared Access Signature, 使用 SAS 附加存储帐户** of [Get started with Storage Explorer (Preview), 存储资源管理器（预览版）入门](https://docs.azure.cn/zh-cn/vs-azure-tools-storage-manage-with-storage-explorer) and **Manage access policy, 管理访问策略** of [Use the Microsoft Storage Explorer to Import/Export data to Azure Storage, 使用 Azure 存储资源管理器将对象传入/传出 Azure Blob 存储](https://docs.azure.cn/zh-cn/storage/blobs/storage-quickstart-blobs-storage-explorer).

## 4. Troubleshooting common issues encountered during VHD creation

4.1 How do I change the name of the host? Once VM is created, users can’t update the name of the host.

4.2 How to reset vm's login password? Please refer to [Windows VM 中重置远程桌面服务或其登录密码How to reset the Remote Desktop service or its login password in a Windows VM](https://docs.azure.cn/zh-cn/virtual-machines/windows/reset-rdp) and [如何在 Azure VM 上重置本地 Linux 密码](https://docs.azure.cn/zh-cn/virtual-machines/linux/reset-password), [Manage users, SSH, and check or repair disks on Azure Linux VMs using the VMAccess Extension with the Azure CLI 1.0, 配合使用 VMAccess 扩展和 Azure CLI 2.0 管理管理用户、SSH，并检查或修复 Linux VM 上的磁盘](https://docs.azure.cn/zh-cn/virtual-machines/linux/using-vmaccess-extension)

4.3 How to generate new ssh certificates? Please refer to the link: [如何为 Azure 中的 Linux VM 创建 SSH 密钥对Detailed walk through to create an SSH key pair and additional certificates for a Linux VM in Azure](https://docs.azure.cn/zh-cn/virtual-machines/linux/create-ssh-keys-detailed)

4.4 How to configure an open VPN certificate? Please refer to the link: [使用本机 Azure 证书身份验证配置与 VNet 的点到站点连接：Azure 门户，Configure a Point-to-Site connection to a VNet using native Azure certificate authentication: Azure portal](https://docs.azure.cn/zh-cn/vpn-gateway/vpn-gateway-howto-point-to-site-resource-manager-portal)

4.5 What is the policy for running Microsoft server software in the Microsoft Azure virtual machine environment (infrastructure-as-a-service)? Please refer to the link: [Microsoft Azure 虚拟机的 Microsoft 服务器软件支持, Microsoft server software support for Microsoft Azure virtual machines](https://support.microsoft.com/kb/2721672)

4.6 Do Virtual Machines have any unique identifier? Azure encodes Azure VM Unique ID in every VM. See details in this blog and documentation.

4.7 In a VM how can I manage the custom script extension in the startup task? Please refer to the link: [Custom Script Extension for Windows, 适用于 Windows 的自定义脚本扩展](https://docs.azure.cn/zh-cn/virtual-machines/windows/extensions-customscript)https://azure.microsoft.com/documentation/articles/virtual-machines-windows-extensions-customscript/, [Use the Azure Custom Script Extension with Linux virtual machines, 在 Linux 虚拟机上使用 Azure 自定义脚本扩展](https://docs.azure.cn/zh-cn/virtual-machines/linux/extensions-customscript)

4.8 How to create a VM from the Azure portal using the VHD that is uploaded to premium storage? We do not support this feature yet.


## 5. Image pre-publishing test to Azure Marketplace

After VM image is built and tested, it cannot be released directly to Azure Marketplace since the VHD image file needs to be tested in (classic) mode (as opposed to ARM mode). This test requires a (classic) storage account under PowerShell.

- Make sure the VHD file is in the (classic) storage account. If your VHD file is not in the (classic) storage account, log in to the [Azure Web Management Platform](https://portal.azure.cn/) and manually create a (classic) storage account for testing. Please download the PowerShell script [Copy the File from the Storage Account to the Classic Storage Account](https://raw.githubusercontent.com/msopentechcn/marketplace-content/master/script/vhdcopy.ps1). After updating the parameters, copy the VHD file from the existing storage account to the (classic) storage account. Note that the access policy for the storage container where the VHD source address in the script resides should be Blob or Container. In addition to PowerShell, you can also use tools such as AzCopy for copying, such as [Using AzCopy on Windows to Transfer Data](https://docs.azure.cn/zh-cn/storage/common/storage-use-azcopy).

- Log in to the Azure platform in (classic) mode. Enter the following instructions in PowerShell:
	- Add-AzureAccount -Environment AzureChinaCloud
	- Get-AzureSubscription
	- Select-AzureSubscription -SubscriptionID <Subscription ID> #Select the subscription for testing.	
	
- Use PowerShell scripts to test VHD files. Download PowerShell Scripts [Create Virtual Machines in a Classic Way](https://raw.githubusercontent.com/msopentechcn/marketplace-content/master/script/createvm-classic.ps1) and run to see whether the virtual machine is created successfully. In the script input parameter, "vhdUri" is the url address where the VHD is located. "StorageAccountName" and "subid" are the (classic) storage account where the virtual machine is created (an account that can be used by vhdUri) and the subscription ID.

- After the test is completed, the resource group where the created virtual machine in the test resides needs to be manually removed from the Azure Management Platform.

	> [AZURE.NOTE] Note: Before VHD is released to Azure Marketplace, the container access policy where the VHD image file resides must be set to "Blob or Container" so that the VHD image can be published to the Azure Marketplace.


## 6. Checklist before image release

Before submitting the image to Azure Marketplace, make sure the following checklist is all passed:

### Product image requirements

Product images must meet the following requirements:

- For production environments. Azure Marketplace does not accept publishing testing products in principle
- The image should be a self-contained image in which software components including the client should all be included
- Do not contain any known defects, malware and viruses
- Images must be rigorously tested for availability
- For Linux mirroring, root login is disabled by default
- For Linux mirroring, the mirror does not contain any user authentication key information

### Product description requirements

Provide a description that meets at least the mirror publishing form. For more information, see [Azure Marketplace Virtual Machine Image Publishing Guide](~/documentation/article/imagepublishguide/). The content mainly includes but not limited to:

- Product Information (Service-ID, SKU, Product Name, Short Description, Full Description)
- Product logo: 2 png-format images with fixed-size pixels (115x115, 255x115)
- Product Image: it is used in the product description, which can be a product image or a product description image etc. with fixed-size pixel (533x324)
- Mirror VHD File Address: The URL address of the Azure Blob where the VHD image file is published
- Product after-sales service (customer service contact, time)