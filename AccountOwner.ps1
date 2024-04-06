Import-Module ActiveDirectory
$inputpath="path"
$outfile="output filepath"
$users = ForEach ($user in $( Get-Content "$inputpath" ))
{

Get-AdUser $user -Properties managedBy, Notes,rSAAccountType

}

$users |
Select-Object SamAccountName, managedBy, Notes,rSAAccountType |
Export-CSV -Path  $outfile -NoTypeInformation