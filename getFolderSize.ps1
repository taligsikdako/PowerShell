#Function get_users_usage{
Remove-Variable * -ErrorAction  SilentlyContinue
$users_child = Get-ChildItem -Path C:\Users

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
        $Edge = 'Microsoft Edge'
        #AppData\Local\Microsoft\Windows\INetCache\Content.MSO
        Write-Host  $ContentMSO ":" ((Get-ChildItem -Path C:\Users\$b\AppData\Local\Microsoft\Windows\INetCache\Content.MSO-Recurse -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property length -Sum).Sum/1mb)
        Write-Host  $Chrome ":" ((Get-ChildItem -Path C:\Users\$b\AppData\Local\Google -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property length -Sum).Sum/1mb)
        Write-Host  $Mozilla ":"( (Get-ChildItem -Path C:\Users\$b\AppData\Local\Mozilla -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        Write-Host  $InetCache ":"( (Get-ChildItem -Path C:\Users\$b\AppData\Local\Microsoft\Windows\INetCache -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        Write-Host  $Edge ":"( (Get-ChildItem -Path C:\Users\$b\AppData\Local\Microsoft\Edge -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        Write-Host  "Folder: Desktop Usage:"( (Get-ChildItem -Path C:\Users\$b\Desktop -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)

        #Write-Host  "Folder: Desktop Usage:"("{0:N2}" -f (Get-ChildItem -Path C:\Windows\Temp -Recurse -ErrorAction SilentlyContinue | Measure-Object -Sum Length).sum/1mb);
        Write-Host  "Folder: Documents Usage:"( (Get-ChildItem -Path C:\Users\$b\Documents -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        Write-Host  "Folder: Downloads Usage:"( (Get-ChildItem -Path C:\Users\$b\Downloads -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        Write-Host  "Folder: Temp Usage:"( (Get-ChildItem -Path C:\Users\$b\AppData\Local\Temp -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        Write-Host  "Folder: Pictures:"((Get-ChildItem -Path C:\Users\$b\Pictures -Recurse -File -ErrorAction  SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        Write-Host  "Folder: Videos:"( (Get-ChildItem -Path C:\Users\$b\Videos -Recurse -File -ErrorAction  SilentlyContinue | Measure-Object -Property Length -Sum ).Sum/1mb)
        }   
    }
#}