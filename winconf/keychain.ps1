$credentials = Get-StoredCredential -Target sshpassphrase
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($credentials.Password)
$passphrase = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
C:\Windows\System32\wsl.exe -u glsorre -d Wlinux /home/glsorre/.dotfiles/winconf/keychain.sh $passphrase
