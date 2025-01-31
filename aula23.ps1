$fileSand = "c:\software\sandcastle.ps1"
$urlSand = "https://raw.githubusercontent.com/iesmarenostrum/software-aulas/refs/heads/main/sandcastle.ps1"

curl -o "$fileSand" "$urlSand"

invoke-expression -Command "$fileSand"



If(-Not (Test-Path -Path "c:\veyoninstalado.txt")) {
  $fileVeyon = "c:\windows\temp\veyonsetup.exe"
  $urlVeyon = "https://github.com/veyon/veyon/releases/download/v4.9.2/veyon-4.9.2.0-win64-setup.exe"
  curl -o "$fileVeyon" "$urlVeyon"
  invoke-expression -Command "${fileVeyon} /S /NoMaster /NoStartMenuFolder /Service /InterceptionDriver"



  $fileCert= "c:\windows\temp\profesor_public_key.pem"
  $urlCert= "https://raw.githubusercontent.com/iesmarenostrum/software-aulas/refs/heads/main/profesor_public_key.pem"

  curl -o "$fileCert" "$urlCert"


  invoke-expression -Command "cmd /c 'C:\Program Files\veyon\veyon-cli.exe' authkeys import Profesor ${fileCert}"

  echo veyoninstalado> c:/veyoninstalado.txt
}