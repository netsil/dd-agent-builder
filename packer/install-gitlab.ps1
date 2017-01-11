$download_url = 'https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-windows-amd64.exe'
$dest_dir = 'c:\gitlab-ci'
$file_name = 'gitlab-runner.exe'
$dest_file = Join-Path $dest_dir $file_name
New-Item $dest_dir -type Directory
(New-Object System.Net.WebClient).DownloadFile($download_url, $dest_file)
echo "Gitlab runner downloaded"