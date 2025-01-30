Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$urlSandcastle = "https://github.com/EWSoftware/SHFB/releases/download/2024.12.21.0/SHFBInstaller_2024.12.21.0.zip"

$zipFile = "c:\windows\temp\sandcastle.zip"
curl -o "$zipFile" "$urlSandcastle"

$outFolder = "c:\windows\temp\sandcastle"

Unzip "$zipFile" "$outFolder"


If(-Not (Test-Path -Path "c:\sandcastleinstalado.txt")) {
  "Sandcastle Help Builder"
  invoke-expression -Command "cmd /c msiexec /i $outFolder\InstallResources\SandcastleHelpFileBuilder.msi /quiet /qn" 
  echo sandcastleinstalado > c:/sandcastleinstalado.txt
}
