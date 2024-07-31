/opt/splunk/etc/apps/search/local/data/ui/views



Path to add RBA based rules

/opt/splunk/etc/apps/SplunkEnterpriseSecuritySuite/local/savedsearches.conf

http://localhost:8000/fr-FR/manager/SplunkEnterpriseSecuritySuite/saved/searches?app=&count=10&offset=0&itemType=&owner=&search=SPK

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



(Risk Rule)

Règle chapeau: Threat - RIR - Risk Threshold Exceeded For Object Over 3 days Period - Rule => sup ou égale a 3 alertes RR


1er set: detection HTML smuggling to C2

RR - Suspicious mshta.exe child process
RR - Malicious execution of powershell command
RR - Suspicious connection to a C2

2eme set: connection sur la machine comprise par le HTML smuggling avec winrm puis dump lsass puis exfiltration du dump sur un domain ngrok

RR - Winrm suspicious command
RR - Ngrok data exfiltration on Network
RR - Dump LSASS via procdump
