# Descargar de: https://www.sdelsol.com/editex/


$factusol_instalar = "cmd /c " + $PSScriptRoot + "\FACTUSOL.exe /S /v/qn"
$contasol_instalar = "cmd /c " + $PSScriptRoot + "\CONTASOL.exe /S /v/qn"
$nominasol_instalar = "cmd /c " + $PSScriptRoot + "\NOMINASOL.exe /S /v/qn"
$tpvsol_instalar = "cmd /c " + $PSScriptRoot + "\TPVSOL.exe /S /v/qn"

$contasol_ver = "c:\contasol2022_denuevo.txt"
$nominasol_ver = "c:\nominasol2023.txt"
$factusol_ver = "c:\factusol2023.txt"
$tpvsol_ver = "c:\tpvsol2023.txt"
$factusol_instalado = "c:\Software DELSOL\FACTUSOL\FACTUSOL.EXE"
$contasol_instalado = "c:\Software DELSOL\CONTASOL\CONTASOL.EXE"
$nominasol_instalado = "c:\Software DELSOL\NOMINASOL\NOMINASOL.EXE"
$tpvsol_instalado = "c:\Software DELSOL\TPVSOL\TPVSOL.EXE"

# Librería de MS necesaria: AccessDatabaseEngine 2010 EN ESPAÑOL!!!
$file_success = "c:\accessdatabaseengine_instalado_v3.txt"
If(-Not (Test-Path -Path $file_success)) {
  "Instalando componente Access Database Engine 2010"
  $comando = "cmd /c " + $PSScriptRoot + "\AccessDatabaseEngine.exe /quiet /passive"
  invoke-expression -Command $comando
  echo "instalado" > $file_success
}

If((-Not (Test-Path -Path $factusol_instalado)) -Or (-Not (Test-Path -Path $factusol_ver)) ) {
  "Instalando Factusol"
  # Desinstalar versión previa
  $desins = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "FACTUSOL"}
  $desins.uninstall()
  invoke-expression -Command $factusol_instalar
  echo "instalado" > $factusol_ver
}
If((-Not (Test-Path -Path $contasol_instalado)) -Or (-Not (Test-Path -Path $contasol_ver)) ) {
  "Instalando Contasol"
  $desins = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "CONTASOL"}
  $desins.uninstall()
  invoke-expression -Command $contasol_instalar
  echo "instalado" > $contasol_ver
}
If((-Not (Test-Path -Path $nominasol_instalado)) -Or (-Not (Test-Path -Path $nominasol_ver)) ) {
  "Instalando Nominasol"
  $desins = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "NOMINASOL"}
  $desins.uninstall()
  invoke-expression -Command $nominasol_instalar
  echo "instalado" > $nominasol_ver
}
If((-Not (Test-Path -Path $tpvsol_instalado)) -Or (-Not (Test-Path -Path $tpvsol_ver)) ) {
  "Instalando TPVsol"
  $desins = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "TPVSOL"}
  $desins.uninstall()
  invoke-expression -Command $tpvsol_instalar
  echo "instalado" > $tpvsol_ver
}
