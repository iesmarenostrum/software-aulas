"Aula 15"
# winget install -e --scope machine --silent --accept-package-agreements --accept-source-agreements id=OBSProject.OBSStudio

If(-Not (Test-Path -Path "c:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe") ) {
  "Packet Tracer"
  invoke-expression -Command "cmd /c \\aula15profesor\compartida\software\Packet_Tracer822_64bit_setup_signed.exe /verysilent"
}


}
