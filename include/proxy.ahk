;用法 
;proxy32/64.exe 需要代理的地址 例:proxy32/64.exe http://127.0.0.1:6666 \
;proxy32/64.exe restore  恢复默认值(没有代理)

;代理在注册表中位置
proxyRegPath = Software\Microsoft\Windows\CurrentVersion\Internet Settings

;设置成初始代理
setDefaultProxy() {
    global proxyRegPath
    RegWrite,REG_DWORD,HKCU,%proxyRegPath%,Proxyenable,0
    RegWrite,REG_SZ,HKCU,%proxyRegPath%,ProxyServer,  
    refresh()
}

;刷新注册表
refresh() {
  dllcall("wininet\InternetSetOptionW","int","0","int","39","int","0","int","0")
  dllcall("wininet\InternetSetOptionW","int","0","int","37","int","0","int","0")
}

;设置代理
setProxy(address) {
    global proxyRegPath
    RegWrite,REG_DWORD,HKCU,%proxyRegPath%,Proxyenable,1
    RegWrite,REG_SZ,HKCU,%proxyRegPath%,ProxyServer,%address%  
    refresh()
}

;保存当前的Proxyenable 和 ProxyServer
saveCurretProxyToFile() {
  global proxyRegPath
  proxyenable := RegRead("HKCU",proxyRegPath,"Proxyenable")
  proxyServer := RegRead("HKCU",proxyRegPath,"ProxyServer")
  ProxyOverride := RegRead("HKCU",proxyRegPath,"ProxyOverride")
  file := FileOpen("proxyreg.txt",1 ,GB2312)
  content = %proxyenable% %proxyServer% %ProxyOverride%
  file.write(content)
  file.Close()
}

RegRead(RootKey, SubKey, ValueName = "")
{
  RegRead, v, %RootKey%, %SubKey%, %ValueName%
  Return,v
}

GoSub, getParams  
Return

getParams:  
  If 0 > 0  
  {  
     Loop, %0% ; for each parameter  
     {  
        param := %A_Index%
        if(A_Index = 1) {
          if(param = "restore") {
            setDefaultProxy()
          } else {
            saveCurretProxyToFile()
            setProxy(param)
          }
        }
     }
  }


