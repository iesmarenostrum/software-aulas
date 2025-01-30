$fileSand = "c:\software\sandcastle.ps1"
$urlSand = "https://raw.githubusercontent.com/iesmarenostrum/software-aulas/refs/heads/main/sandcastle.ps1"

curl -o "$fileSand" "$urlSand"

invoke-expression -Command "$fileSand"