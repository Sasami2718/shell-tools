# 可以在host没有网络的条件下上传vscode server 安装包进行远程安装
# ============================================================
# 客户端vscode版本,从 Help->About 中 copy 过来

$version = "2ccd690cbff1569e4a83d7c43d45101f817401dc" 
$hostName = "calvin"
$hostPort = "22"
$hostIp = "192.168.1.100"

# ============================================================
$downFileName = "$version.tar.gz"
$vscServerDir = "vscs"
$downFileDir = "$ENV:TMP/$vscServerDir"
$downFile = "$downFileDir/$downFileName"

rd $downFileDir -Recurse # 先清空vscserver缓存文件夹

md $downFileDir # 创建vscserver 缓存文件夹

$client = [System.Net.WebClient]::new()
$client.DownloadFile("https://update.code.visualstudio.com/commit:$version/server-linux-x64/stable","$downFile ")


$hostAddress = "$hostName@$hostIp"
$hostHome = "/home/$hostName"
$hostVSCDir = "$hostHome/$vscServerDir"
$hostInstallPath = "$hostHome/.vscode-server/bin/$version"

scp -r -P $hostPort $downFileDir $hostAddress`:$hostHome 

$hostInstallSh = "cd $hostVSCDir ; tar -zxf $downFileName ; rm -rf $downFileName ; rm -rf $hostInstallPath ; mv vscode-server-linux-x64/ $hostInstallPath/"

ssh -p $hostPort $hostAddress $hostInstallSh
