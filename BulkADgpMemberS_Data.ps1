Import-Module ActiveDirectory

$groups = get-content "$home\Desktop\groups.txt"

foreach ($group in $groups) {

	$res = Get-ADGroupMember -Identity $group | ?{$_.ObjectClass -eq "user"} | ft -HideTableHeaders SamAccountName,name -auto | Out-String 
	Get-ADGroupMember -Identity $group | ?{$_.ObjectClass -eq "Group"} | %{Write-Output "`n"$_.Name;Get-ADGroupMember $_ } | ft -HideTableHeaders SamAccountName,name -auto > $home\Desktop\$group.txt
	Add-Content $home\Desktop\$group.txt $group
	Add-Content $home\Desktop\$group.txt $res

}