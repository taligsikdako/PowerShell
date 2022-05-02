#Function get_users_usage{
Remove-Variable * -ErrorAction SilentlyContinue
$users_child = Get-ChildItem -Path C:\Users
#$users_child = Get-ChildItem -Path "C:\Users\905PP3183\AppData\Local\Google\Chrome\User Data"
#$c_directory = Get-ChildItem -Path C:\
$path = 'D:\Temp\Arjay\Tools\GetFolderSize\'


$output_dir = foreach($i in $users_child)
{
Write-Host "Users Directory and it's usage for:"$i  -ForegroundColor Red

 foreach($b in $i)
{
$usage_dir = "usage directory"
$Chrome = "Google Chrome";
$Mozilla = "Mozilla Firefox";
$InetCache = "Microsoft|Windows|INetCache"
$ContentMSO = "Content MSO"
#AppData\Local\Microsoft\Windows\INetCache\Content.MSO

Write-Host ((Get-ChildItem -Path C:\Users\$b\AppData\Local\Google -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property length -Sum).Sum/1mb) | ft
Write-Host ((Get-ChildItem -Path C:\Users\$b\AppData\Local\Mozilla -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb) | ft


}   
}




#}