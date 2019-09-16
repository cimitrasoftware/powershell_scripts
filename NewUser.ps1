﻿$firstNameIn=$args[0]
$lastNameIn=$args[1]
$passwordIn=$args[2]
$samAccountName = $firstNameIn[0]+'.'+$lastNameIn


New-ADUser -Name "$firstNameIn $lastNameIn" -GivenName "$firstNameIn" -Surname "$lastNameIn" -SamAccountName "$samAccountName" -AccountPassword (ConvertTo-SecureString "$passwordIn" -AsPlainText -force) -passThru -path "OU=USERS,OU=DEMO,OU=CIMITRA,DC=cimitrademo,DC=com"
$theResult = $?

if ($theResult = 'True')
{
Write-Output ""
Write-Output ""
Write-Output "New User ${firstNameIn} ${lastNameIn} created in Active Directory"
}