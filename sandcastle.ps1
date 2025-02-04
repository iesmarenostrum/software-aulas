If(-Not (Test-Path -Path "c:\program files (x86)\EWSoftware\Sandcastle Help File Builder\Tools\SandcastleBuilderGUI.exe")) {
  "Sandcastle Help Builder"
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


  invoke-expression -Command "cmd /c msiexec /i $outFolder\InstallResources\SandcastleHelpFileBuilder.msi /quiet /qn" 

  "Sandcastle Toolkit for Visual Studio"
  invoke-expression -Command "cmd /c 'C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\VSIXInstaller.exe' /q $outFolder\InstallResources\SHFBVisualStudioPackage_VS2022AndLater.vsix"


  # echo sandcastleinstalado > c:/sandcastleinstalado.txt
}
