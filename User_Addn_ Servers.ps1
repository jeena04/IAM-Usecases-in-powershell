#Geeting input and output file path
$inputpath="path"
$outputpath="Path"
# reading servers from input text file
$servers = Get-Content $inputpath

#Writting headers to out file
"Name`tStatus" | Out-File -FilePath $outputpath

#Iterating over servers
foreach ($server in $servers){
 try{
  $adminGroup = [ADSI]"WinNT://$server/Administrators"
  $adminGroup.add("WinNT://domain/ID")
  "$server`tSuccess"
  "$server`tSuccess" | Out-File -FilePath $outputpath -Append
 }
 catch{
  "$server`t" + $_.Exception.Message.ToString().Split(":")[1].Replace("`n","")
  "$server`t" + $_.Exception.Message.ToString().Split(":")[1].Replace("`n","") | Out-File -FilePath $outputpath -Append
 }
}