#VHD源存储信息，参数请修改。请注意源地址访问策略公共访问级别为Blob或容器（可以在Azure portal中修改）
$sourceStorageAccountName = "xxxx" #VHD所在存储账户名称
$sourceContainerName = "xxxx" #VHD所在容器名称
$fileName="xxxx.vhd" #VHD文件名称

#目标存储信息，参数请修改
$destStorageAccountName ="xxxx" #VHD目标存储账号
$destStorageAccountKey ="xxxx" #VHD目标存储账号KEY
$destContainerName ="xxxx" #VHD目标容器名称

#Uri配置信息
$endpoint="core.chinacloudapi.cn"
$fileAbsoluteUri="https://"+$sourceStorageAccountName+".blob."+$endpoint+"/"+$sourceContainerName+"/"+$fileName
$destContext = New-AzureStorageContext -StorageAccountName $destStorageAccountName -StorageAccountKey $destStorageAccountKey  -Endpoint $endpoint
#开始复制
Start-AzureStorageBlobCopy  -AbsoluteUri $fileAbsoluteUri -DestContext $destContext -DestContainer $destContainerName -DestBlob $fileName -Force

#检查Blob Copy的结果 
Get-AzureStorageBlobCopyState -Blob $fileName -Context $destContext -Container $destContainerName -WaitForComplete 

#Write-Host "TODO//开始创建虚拟机"

