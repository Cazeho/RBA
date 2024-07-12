openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout calc.key -out calc.crt
openssl pkcs12 -export -out calc.pfx -inkey calc.key -in calc.crt

osslsigncode sign -pkcs12 calc.pfx -pass Password123! -n "Calc" -i "http://microsoft.com"  -in calc.exe -out calc-signed.exe -t http://timestamp.digicert.com

osslsigncode verify calc-signed.exe
