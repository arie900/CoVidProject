$Employee = Read-Host "Enter username"  #Insert Name of user


#$Create in loop users
for ($i = 1 ; $i -lt 16 ; $i=$i+1){
$Display = $Employee+$i
New-ADUser -Name $Display -GivenName $Display `
-UserPrincipalName $Display@CoVid.local -Enabled $true `
-DisplayName $Display -Path "OU=QA,DC=CoVid,DC=local" `
-AccountPassword (ConvertTo-SecureString "!q2w3e4r" -AsPlainText -Force) `
-PasswordNeverExpires $true -Verbose

$Check = Get-ADUser $Display 
if($Check -ne $null){echo "Success"}
else {"FAILED"}
}

