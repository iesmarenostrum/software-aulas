"Aula 15"
# winget install -e --scope machine --silent --accept-package-agreements --accept-source-agreements id=OBSProject.OBSStudio


If(-Not (Test-Path -Path "c:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe") ) {
  "Packet Tracer"
  $fileName = "c:\windows\temp\packet.exe"
  $urlPacket = "https://drive.usercontent.google.com/download?id=12NREa81tRmiMPp5r9HccXYc7d6--chdU&export=download&authuser=1&confirm=t&uuid=4ec5ffb6-02b0-40b7-9cc9-c286b70eed67&at=AIrpjvM5RhlF48BlIrKReQM9fO2T%3A1737373919119"

  curl -o "$fileName" "$urlPacket"

  invoke-expression -Command "cmd /c ${fileName} /verysilent"
}
