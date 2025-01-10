# Borrar usuarios que no se conectan hace más de 100 días
$users = Get-LocalUser | Where-Object {$_.description -eq "pGina created" -and $_.Lastlogon -le (Get-Date).AddDays(-50)} | Select-Object Name,SID,Lastlogon

foreach ($user in $users) {
  #Eliminar cuenta
  Remove-LocalUser -Name $user.name
  
  # Eliminar carpeta personal
  $sid = $user.sid
  Get-WmiObject Win32_UserProfile -Filter "sid='${sid}'" | ForEach-Object {
    $_.Delete()
  }

}

$nombre_equipo = $env:computername
$aula = $nombre_equipo.Substring(0,6)

curl -o c:\software\$aula.ps1 https://raw.githubusercontent.com/iesmarenostrum/software-aulas/refs/heads/main/$aula.ps1

invoke-expression -Command "c:\software\$aula.ps1"