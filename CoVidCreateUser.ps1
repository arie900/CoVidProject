#Variables
$Name=Read-Host "Write user first name"
$LastName=Read-Host "Write user last name"
$TZ = Read-Host "Enter ID"
$UserName= ($Name+$LastName[0])
$ExistUserName=Get-ADUser -Filter "SamAccountName -like '$UserName'"
$ExistTZ = Get-ADUser -Filter "UserPrincipalName -like '$TZ@CoVid.local'" 

#Check in look if there already user with the same UPN/SamAccountName
do{
    if($ExistTZ -ne $null){echo $UserName
        echo "There a user with the same ID"
        break
    }
    elseif($ExistUserName -ne $null){echo "User already exist $UserName"
        $UserName=Read-Host "Enter user name"
        $ExistUserName=Get-ADUser -Filter "SamAccountName -eq '$UserName'"}}
while($ExistUserName -ne $null){
    echo "User already exist $UserName"
    $UserName=Read-Host "Enter user name"
    $ExistUserName=Get-ADUser -Filter "SamAccountName -eq '$UserName'"}

#If there no user with same UPN\SamAccountName the user will be created in required path
New-ADUser  -Name $UserName -GivenName $Name `
-Surname $LastName `
-UserPrincipalName "$TZ@CoVid.local" -Enabled $true `
-DisplayName "$Name $LastName" -Path "CN=Users,DC=CoVid,DC=local" `
-AccountPassword (ConvertTo-SecureString "!q2w3e4r" -AsPlainText -Force) `
-PasswordNeverExpires $true -Verbose          
            

#$ExistUserName=Get-ADUser -Filter "SamAccountName -eq '$UserName'"
#echo $ExistUserName
#}while($if -eq $null)



