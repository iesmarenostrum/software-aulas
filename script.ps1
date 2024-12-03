# "hola mundo"
New-Item c:\test3 -type directory
# "Nuevo test"

# Borrar usuarios que no se conectan hace más de 100 días
$users = Get-LocalUser | Where-Object {$_.description -eq "pGina created" -and $_.Lastlogon -le (Get-Date).AddDays(-100)} | Select-Object Name,SID,Lastlogon 

foreach ($user in $users) {
  #Eliminar cuenta
  Remove-LocalUser -Name $user.name
  
  # Eliminar carpeta personal
  $sid = $user.sid
  Get-WmiObject Win32_UserProfile -Filter "sid='${sid}'" | ForEach-Object {
    $_.Delete()
  }

}
