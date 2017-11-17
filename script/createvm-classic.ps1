#运行本脚本之前，请在PowerShell中先运行如下指令，登录Azure平台
#Add-AzureAccount -Environment AzureChinaCloud #在弹出对话框中输入Azure China的用户名和密码，用户名格式：xxx@xxx.partner.onmschina.cn
#Get-AzureSubscription
#Select-AzureSubscription -SubscriptionID <Subscription ID> #选择用于测试的订阅

Param (
	[parameter(Mandatory = $true)]
	[string] $vhdUri,
	[parameter(Mandatory = $true)]
	[string] $storageAccountName,
	[parameter(Mandatory = $true)]
	[string] $subid,
	[parameter(Mandatory = $true)]
	[string] $osLinuxOrWindows,
	[string] $nameSuffix = (Get-Random).ToString()
)


#选择存储账号所在的订阅
Set-AzureSubscription -SubscriptionId $subid -CurrentStorageAccountName $storageAccountName -ErrorAction Stop

$imageName = "TestImage" + $nameSuffix	#镜像名称

#创建镜像
Add-AzureVMImage -ImageName $imageName -MediaLocation $vhdUri -OS $osLinuxOrWindows -ErrorAction Stop
$image = Get-AzureVMImage -ImageName $imageName -ErrorAction Stop

###################################################
## Deploy a Virtual Machine from a user OS Image ##
## This is done to test the VM image             ##
###################################################

Write-Host "[$(Get-Date)][INFO] Creating a VM with the $($image.ImageName)"
$serviceName = "TestService" + $nameSuffix
$vmName = "TestVM" + $nameSuffix
$asciiLower=$NULL;For ($a=97;$a -le 126;$a++) {$asciiLower+=,[char][byte]$a }
$asciiUpper=$NULL;For ($a=65;$a -le 90;$a++) {$asciiUpper+=,[char][byte]$a }
$asciiSpecial=$NULL;For ($a=33;$a -le 64;$a++) {$asciiSpecial+=,[char][byte]$a }
For($loop=1; $loop -le 5; $loop++) {
	$TempPassword+=($asciiLower | GET-RANDOM)
}
For($loop=1; $loop -le 3; $loop++) {
	$TempPassword+=($asciiSpecial | GET-RANDOM)
}
For($loop=1; $loop -le 5; $loop++) {
	$TempPassword+=($asciiUpper | GET-RANDOM)
}
if($image.OS.ToUpper() -like "WINDOWS")
{
	$cmdOutput = New-AzureQuickVM -Windows -ServiceName $serviceName -Name $vmName -ImageName $image.ImageName -Password $TempPassword -AdminUsername "testuser" -Location $image.Location -InstanceSize "Medium" -WaitForBoot
	$cmdOutput	
	Get-AzureVM -ServiceName $serviceName -Name $vmName | Set-AzureEndpoint -Name "default-allow-rdp" -PublicPort 3389 -LocalPort 3389 -Protocol tcp | Update-AzureVM
}
elseif($image.OS.ToUpper() -like "LINUX")
{
	$cmdOutput = New-AzureQuickVM -Linux -ServiceName $serviceName -Name $vmName -ImageName $image.ImageName -Password $TempPassword -LinuxUser "testuser" -Location $image.Location -InstanceSize "Medium" -WaitForBoot
	$cmdOutput
	Get-AzureVM -ServiceName $serviceName -Name $vmName | Set-AzureEndpoint -Name "SSH" -PublicPort 22 -LocalPort 22 -Protocol tcp | Update-AzureVM
}
else
{
	Write-Error "[$(Get-Date)][ERROR] Cannot create the VM due to Wrong OS Value, OS should be Windows or Linux"
	throw "Cannot create the VM due to Wrong OS Value"
}

#删除之前创建的镜像
Remove-AzureVMImage -ImageName $imageName

Write-Host "[$(Get-Date)][INFO] Created classic VM with name $vmName.
User name: testuser
Temporary Password: $TempPassword
Please open ports as necessary."