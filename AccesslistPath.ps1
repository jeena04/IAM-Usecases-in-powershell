#path which we need users list
$path="path"
#output file path where we need to store the data
$outputpath="path"
#Reading the folder structure and recurse to the subfolders and hidden folders and storing to variable
$FolderPath = Get-ChildItem -Directory -Path $path -Recurse -Force

#initialising func and iterating to the folders read
$Output = @()
ForEach ($Folder in $FolderPath) {

#getting access control list for folders and storing the permission
    $Acl = Get-Acl -Path $Folder.FullName

    #looping through access control entries
    ForEach ($Access in $Acl.Access) {

    #the retrieved properties of each access entries are stored in hashtable
$Properties = [ordered]@{'Folder Name'=$Folder.FullName;'Group/User'=$Access.IdentityReference;'Permissions'=$Access.FileSystemRights;'Inherited'=$Access.IsInherited}

#custom obejects created and storing the defined hashtable data
$Output += New-Object -TypeName PSObject -Property $Properties            
}
}
$Output | Export-Csv -path $outputpath
