$inputpath="path"
$outputpath="Path"
$servers = Get-Content $inputpath
"Name`tStatus" | Out-File -FilePath C:\Users\w3919\Desktop\results.txt
foreach ($server in $servers){
 try{
  $adminGroup = [ADSI]"WinNT://$server/Administrators"
  $adminGroup.add("WinNT://domain/ID")
  "$server`tSuccess"
  "$server`tSuccess" | Out-File -FilePath C:\Users\w3919\Desktop\results.txt -Append
 }
 catch{
  "$server`t" + $_.Exception.Message.ToString().Split(":")[1].Replace("`n","")
  "$server`t" + $_.Exception.Message.ToString().Split(":")[1].Replace("`n","") | Out-File -FilePath $outputpath -Append
 }
}