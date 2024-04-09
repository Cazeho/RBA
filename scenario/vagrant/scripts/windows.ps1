Set-ExecutionPolicy Bypass -Scope Process -Force
    iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco install onenote -y
choco install thunderbird -y
choco install googlechrome -y
