Param(
    [string]$resourcegroup,  #resource group of deployment
    [string]$vhduri,         #source url of vhd file
    [string]$size,      #default: "Standard_D1_v2"
    [string]$osLinuxOrWindows,    #default: linux
    [string]$ports,      #default: 22
    [string]$osusername,  #default: imtestuser
    [string]$ospassword,  #default: a@968^!Xm
    [string]$location  #default: China North
)

# Default values
$vmSizes = ("Standard_D1_v2") 		# Example for Multi-sizes: ("Standard_A2_v2","Standard_D1_v2","Standard_D2_v2")
$osType = "linux"
$linuxVmPorts = ("22","443","80")
$winVmPorts = ("3389","443","80")
$vmPorts = $linuxVmPorts
$userName = "imtestuser"
$passWord = "a@968^!Xm"
$vmLocation = "China North"
$endpoint ="core.chinacloudapi.cn"	
$vhdName = $vhduri.Split("/")[-1]


$helpDocument = "
    This powershell script will help you deploy a vm from a VHD file.
    The deployment contains four things: 
        Login China Azure using your @Account. 
        Create @Resource Group, @Container and @Storage Account. 
        Copy the @VHD file from the source @Vhduri to the @Storage Account. 
        Deploy a @VM in @Resource Group.

    Grammar:
        ./createvm.ps1 -resourcegroup XXX
            -vhduri   https://xxx.blob.core.chinacloudapi.cn/xxx/xxx.vhd
            -size     Standard_A2_v2,... [default Standard_D1_v2]
            -osLinuxOrWindows   linux|windows      [default linux]
            -ports     port1,port2...     [defaut linux:80, windows:3389]
            -osusername xxx                [default imtestuser]
            -ospassword xxx                [default a@968^!Xm]
            -location 'China North'    [default 'China North']
            -help

    Example:
        ./createvm.ps1 -help
        ./createvm.ps1 -resourcegroup imtestgroup -vhduri https://yourstorage.blob.core.chinacloudapi.cn/yourcontainer/yourvhdfile.vhd
        ./createvm.ps1 -resourcegroup imtestgroup -vhduri https://yourstorage.blob.core.chinacloudapi.cn/yourcontainer/yourvhdfile.vhd -size Standard_A3 -osLinuxOrWindows linux  -ports 80,22 -osusername imtestuser -ospassword 26aL8^)*m -location 'China North'
        
"

# Process the parameters who have default values
if([String]::IsNullOrEmpty($resourcegroup) -or [String]::IsNullOrEmpty($vhduri)){
    Write-Host "    The script need at least Resource Group Name and Vhd Uri." -ForegroundColor Yellow
    Write-Host $helpDocument
    exit
}
if(![String]::IsNullOrEmpty($size))
{
    $vmSizes = $size.Split(",")
}
if(![String]::IsNullOrEmpty($osLinuxOrWindows))
{
    $osType = $osLinuxOrWindows
}	
if(![String]::IsNullOrEmpty($ports))
{
    $vmPorts = $ports.Split(",")
} elseif($osType.ToUpper() -eq "WINDOWS") {
    $vmPorts = $winVmPorts
}
if($osType.ToUpper() -eq "LINUX" -and $vmPorts -notcontains 22){
    $vmPorts += (22)
} elseif ($osType.ToUpper() -eq "WINDOWS" -and $vmPorts -notcontains 3389){
    $vmPorts += (3389)
}
if(![String]::IsNullOrEmpty($osusername))
{
    $userName = $osusername
}

if(![String]::IsNullOrEmpty($ospassword))
{
    $passWord = $ospassword
}

if(![String]::IsNullOrEmpty($location))
{
    $vmLocation = $location
}


function CreateResourceGroup($resourceGroupName, $vmLocation)
{
    $res = Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
    if(!$res)
    {
        New-AzureRmResourceGroup -Name $resourceGroupName -Location $vmLocation -Force -ErrorAction Stop
    } else {
        Write-Host("Resource Group: {0} already existed" -f $resourceGroupName)
    }
}

function CreateStorageAccount($resourceGroupName, $destStorageAccount, $vmLocation)
{
    $res = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroupName -Name $destStorageAccount -ErrorAction SilentlyContinue
    if(!$res)
    {
        $res = New-AzureRmStorageAccount -ResourceGroupName $resourceGroupName -Name $destStorageAccount -SkuName Standard_GRS -Location $vmLocation -ErrorAction Stop
	} else {
        Write-Host("Storage Account: {0} already existed" -f $destStorageAccount)
    }     
    #$res = Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $destStorageAccount
    return $res;
}

function CreateContainer($destContainerName, $destStorageAccount,$accountKey, $endpoint, $destContext)
{
    #New-AzureStorageContext -StorageAccountName $sourceStorageAccountName -Endpoint $endpoint -Anonymous;
    $getdestContainerName = Get-AzureStorageContainer -Context $destContext -ErrorAction Stop | where-object {$_.Name -eq $destContainerName}
    if(!$getdestContainerName)
    {
        $getdestContainerName = New-AzureStorageContainer -Name $destContainerName -Context $destContext -ErrorAction Stop
    } else {
        Write-Host("Containner: {0} already existed" -f $destContainerName)
    }
    return $getdestContainerName;
}

function InputValue($hint){
    $res = Read-Host $hint
    if ($res.ToUpper() -eq "Y")
    {
        return $true;
    } elseif ($res.ToUpper() -eq "N"){
        return $false
    } else {
        Write-Host "Input error，please try again"
        return InputValue($hint)
    }
}
function CopyVHD($fileName, [Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext]$destContext, $destContainerName, $fileAbsoluteUri)
{
    $copyStatus = $null
    $copyStatus = Get-AzureStorageBlobCopyState -Blob $fileName -Context $destContext -Container $destContainerName -WaitForComplete -ErrorAction SilentlyContinue
    if(!$copyStatus)
    {
        Start-AzureStorageBlobCopy  -AbsoluteUri $fileAbsoluteUri -DestContext $destContext -DestContainer $destContainerName -DestBlob $fileName -ErrorAction Stop
        $copyStatus = Get-AzureStorageBlobCopyState -Blob $fileName -Context $destContext -Container $destContainerName -WaitForComplete -ErrorAction Stop
    } elseif ($copyStatus -and (InputValue ("{0} file already existed, copy again?(y/n)" -f $fileName))) {
        Start-AzureStorageBlobCopy  -AbsoluteUri $fileAbsoluteUri -DestContext $destContext -DestContainer $destContainerName -DestBlob $fileName -Force -ErrorAction Stop
        $copyStatus = Get-AzureStorageBlobCopyState -Blob $fileName -Context $destContext -Container $destContainerName -WaitForComplete -ErrorAction Stop     
    } else {
        $copyStatus = Get-AzureStorageBlobCopyState -Blob $fileName -Context $destContext -Container $destContainerName -WaitForComplete
	    Write-Host("VHD file:{0} existed, do not do copy action" -f $fileName)
	} 
    return $copyStatus.Status
}

function CreateNSGGroupRule($resourceGroupName, $vmLocation, $nsgName, $ports){
    $priority = 100
    $ruleArr = New-Object System.Collections.ArrayList
    foreach($port in $ports){
        $name = "Port_{0}" -f $port
        $rule = New-AzureRmNetworkSecurityRuleConfig -Name $name -Description $name -Access Allow -Protocol Tcp -Direction Inbound -Priority $priority `
        -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange $port 
        $ruleArr.Add($rule)
        $priority = $priority + 1
    }
    $nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Location $vmLocation -Name $nsgName -SecurityRules $ruleArr -Force  -WarningAction Ignore   
    return $nsg
}
function CreateVM($resourceGroupName, $vmLocation, $vmSize, $osType, $vmPorts, $vmUser, $vmPwd, $osDiskUrl, $vhdName, $vmName, $subnetName, $vnetName, $pubIpName, $nicName, $osDiskName)
{
    $subnetConfig = New-AzureRmVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix 192.168.1.0/24

    #Create a virtual network
    $vnet = New-AzureRmVirtualNetwork -ResourceGroupName $resourceGroupName -Location $vmLocation -Name $vnetName -AddressPrefix 192.168.0.0/16 -Subnet $subnetConfig -Force

    #Create Public IP

    $publicIP = New-AzureRmPublicIpAddress -Name $pubIpName -ResourceGroupName $resourceGroupName -Location $vmLocation -AllocationMethod Dynamic -IpAddressVersion IPv4 -Force  
    Get-AzureRmPublicIpAddress -Name $pubIpName -ResourceGroupName $resourceGroupName #Check for public IP
	
	#Create NSG
    $nsgRuleName = $vmName + "-nsg"
    $nsg = CreateNSGGroupRule $resourceGroupName $vmLocation $nsgRuleName $vmPorts
	
    #Create Network Interface
    $nic = New-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $resourceGroupName -Location $vmLocation -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIP.Id -NetworkSecurityGroupId $nsg.Id -Force

    #Setting OS disk and Login Account
    $vmOsDisk = "{0}{1}.vhd" -f $osDiskUrl,$osDiskName
    $securePassword = ConvertTo-SecureString $vmPwd -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential ($vmUser, $securePassword)
    $osSourceImageUri = $osDiskUrl + $vhdName 
   
    $vmconfig = New-AzureRmVMConfig -VMName $vmName -VMSize $vmSize 

    if($osType.ToUpper() -eq "LINUX")#Setting linux Config
    {
        $vmconfig = Set-AzureRmVMOperatingSystem -VM $vmconfig -Linux -ComputerName $vmName -Credential $cred 
        $vmconfig = Set-AzureRmVMOSDisk -VM $vmconfig -Name $osDiskName -VhdUri $vmOsDisk  -SourceImageUri $osSourceImageUri -CreateOption FromImage -Linux 
    } elseif($osType.ToUpper() -eq "WINDOWS") { #Setting windows Config
        $vmconfig = Set-AzureRmVMOperatingSystem -VM $vmconfig  -Windows -ComputerName $vmName -Credential $cred -ProvisionVMAgent -EnableAutoUpdate
        $vmconfig = Set-AzureRmVMOSDisk -VM $vmconfig  -Name $osDiskName -VhdUri $vmOsDisk -SourceImageUri $osSourceImageUri -Caching "ReadWrite" -CreateOption FromImage -Windows
    } else {
        Write-Error "[$(Get-Date)][ERROR] Cannot create the VM due to Wrong OS Value, OS should be windows or linux"
        throw "Cannot create the VM due to Wrong OS Value"
    }

    $vmconfig = Add-AzureRmVMNetworkInterface -VM $vmconfig  -Id $nic.Id #-Primary

    #create VM
    New-AzureRmVM -ResourceGroupName $resourceGroupName -Location $vmLocation -VM $vmconfig -Verbose -ErrorAction Stop
    $vmList = Get-AzureRmVM -ResourceGroupName $resourceGroupName
    Write-Host ("Deploy VM {0} Succeed." -f $vmList.Name)
    return $vmList.Name
}

function CheckConnected($vmUser, $vmPwd, $randSuffix, $resourceGroupName)
{
    $pubIpName = "pubIP{0}" -f $randSuffix
    $a = (get-AzureRmPublicIpAddress -Name $pubIpName -ResourceGroupName $resourceGroupName).IpAddress
    Write-Host ("ssh {0}@{1}" -f $vmUser,$a)
}
function RemoveGroup($resourceGroupName)
{
    $res = Read-Host ("Do you want to remove the group of {0}? (y or n)" -f $resourceGroupName)
    if($res -eq "y" -or $res -eq "Y")
    {
        Write-Host ("Starting Remove the group of {0}" -f $resourceGroupName)
        $res = Get-AzureRmResourceGroup -Name $resourceGroupName | Remove-AzureRmResourceGroup 
        if($res){
            Write-Host ("Remove the group of {0} Success." -f $resourceGroupName)
        }
    }
}

function getRandom()
{
    $tmpStr = $NULL
    For($loop = 1; $loop -le 5; $loop ++) {
        $randSuffix = Get-Random  -Minimum 97 -Maximum 122
        $tmpStr += [char]($randSuffix)
    }
    return $tmpStr
}

function login(){
    $accountStr = Get-AzureRmContext 
    if([String]::IsNullOrEmpty($accountStr) -or [String]::IsNullOrEmpty($accountStr.Account)) #decide if has been onboarded
    {
        $res = Login-AzureRmAccount -EnvironmentName Azurechinacloud
        if(!$res -or [String]::IsNullOrEmpty($res))
        {
            Write-Host "`r`nLogin failed" -ForegroundColor Red
            return $false
        }
        Write-Host $res
    } else {
        Write-Host ("`r`nLogin subscription：{0}" -f $accountStr.Name)
        if(InputValue "You have logined the account, do you need change the account?(y/n)"){
            $res = Login-AzureRmAccount -EnvironmentName Azurechinacloud
            if(!$res -or [String]::IsNullOrEmpty($res))
            {
                Write-Host "Login failed" -ForegroundColor Red
                return $false
            }
            break;
        }
    }
    return $true
}

function main(){

    login
	
    $vmSizes | ForEach-Object{  

        Write-Host("`r`nBegin to create resources ... To study parameter, please execute: .\createvm.ps1 -help")
        $randSuffix = getRandom
        $destStorageAccount = ("storage{0}" -f $resourcegroup)
        $destContainerName = "container"
		$destFileAbsoluteUri = "https://" + $destStorageAccount + ".blob." + $endpoint + "/" + $destContainerName + "/" + $vhdName
        $osDiskUrl = "https://"+$destStorageAccount+".blob."+$endpoint+"/"+$destContainerName+"/"
  
        Write-Host("`r`n1. Creating resource group:{0}" -f $resourcegroup)
        CreateResourceGroup $resourcegroup $vmLocation

        Write-Host("`r`n2. Creating storage account:{0}" -f $destStorageAccount)
        CreateStorageAccount $resourcegroup $destStorageAccount $vmLocation
		$accountKey = Get-AzureRmStorageAccountKey -ResourceGroupName $resourcegroup -Name $destStorageAccount

        Write-Host("`r`n3. Creating storage context with account key:{0}" -f $accountKey[0].Value)
        $destContext = New-AzureStorageContext -StorageAccountName $destStorageAccount -StorageAccountKey $accountKey[0].Value  -Endpoint $endpoint

        Write-Host("`r`n4. Creating storage container:{0}" -f $destContainerName)
        CreateContainer $destContainerName $destStorageAccount $accountKey $endpoint $destContext

        Write-Host("`r`n5. Copying source VHD file to destination file:{0}. Note that the Storage Account of VHD file must be the same as the VM which is deployed" -f $destFileAbsoluteUri)
        CopyVHD $vhdName $destContext $destContainerName $vhduri

        Write-Host("`r`n6. Creating VM:")
        $vmName = "vmname{0}" -f $randSuffix 
        $subnetName = "subnet{0}" -f $randSuffix
        $vnetName = "vnet{0}" -f $randSuffix
        $pubIpName = "pubip{0}" -f $randSuffix
        $nicName = "networkinterface{0}" -f $randSuffix
        $osDiskName = "osdisk{0}" -f $randSuffix
        $realVmName = CreateVM $resourcegroup $vmLocation $_ $osType $vmPorts $userName $passWord $osDiskUrl $vhdName $vmName $subnetName $vnetName $pubIpName $nicName $osDiskName
		if($realVmName)
        {
            $ip = (Get-AzureRmPublicIpAddress -Name $pubIpName -ResourceGroupName $resourcegroup).IpAddress
            Write-Host ("`r`nDeployment finished")
            Write-Host (" Resource Group: {0}" -f $resourcegroup)
            Write-Host (" VM Name       : {0}" -f $vmName)
            Write-Host (" VM Size       : {0}" -f $vmSizes)
            Write-Host (" OS Type       : {0}" -f $osType)
            Write-Host (" IP Address    : {0}" -f $ip)
            Write-Host (" OS Ports      : {0}" -f $vmPorts)
            Write-Host (" User Name     : {0}" -f $userName)
            Write-Host (" Password      : {0}" -f $passWord)
            Write-Host (" VM Location   : {0}" -f $vmLocation)
        } else {
            Write-Host ("`r`nDeploy failed")
        }
	}
}
main