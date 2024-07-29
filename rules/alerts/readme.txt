Path to add RBA based rules

/opt/splunk/etc/apps/search/default/savedsearches.conf


List of rules:

(classic)


SPK1 - Suspicious mshta.exe child process => medium
SPK2 - Suspicious connection to a C2 => high
SPK3 - Certutil.exe Download With URLCache and Split Arguments => medium
SPK4 - Winrm suspicious command => high
SPK5 - Ngrok data exfiltration on Network => critical
SPK6 - Connection to a pastebin domain => medium
SPK7 - Dump LSASS via procdump => critical
SPK8 - Malicious execution of powershell command => high
SPK9 - Excessive failed password attempts on user account => medium
SPK10 - Potential Kerberoasting attack => high
SPK11 - Potential NTDS retrieve passwords from DC => critical
