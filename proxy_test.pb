XIncludeFile("Proxy_Connect.pbi")
OpenConsole()
*buffer=AllocateMemory(2048)
res=Proxy_Connect("60.21.161.55",1080,"smtp.picordi.fr",25,2,"","",120)
Repeat
ne.l=NetworkClientEvent(res)
Select ne.l
  Case #PB_NetworkEvent_Data
    t=ReceiveNetworkData(res,*buffer,2048)
    PrintN(PeekS(*buffer,t)):FillMemory(*buffer,t,0)
  Case #PB_NetworkEvent_Disconnect
    quit.l=1
  Case #PB_NetworkEvent_None
    PrintN("NONE "+Str(c)):c+1:Delay(100):If c=20:quit.l=1:EndIf
EndSelect
Until quit.l=1

PrintN("STOP")
Input()
End
