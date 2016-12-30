$download_url = 'https://packages.chef.io/stable/windows/2008r2/chefdk-1.0.3-1-x86.msi'
echo "downloading"
(New-Object System.Net.WebClient).DownloadFile($download_url, 'C:\\Windows\\Temp\\chef.msi')
echo "installing chef"
Start-Process 'msiexec' -ArgumentList '/qb /i C:\\Windows\\Temp\\chef.msi' -NoNewWindow -Wait  