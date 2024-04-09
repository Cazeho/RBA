net user bob P@ssword22 /add

net user svc_http P@ssword22 /add
setspn -A HTTP/windows2016 svc_http

Import-Module ActiveDirectory

net user nada P@ssword22 /add
Set-ADUser -Identity "nada" -Replace @{userAccountControl=4194304}
