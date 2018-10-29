;代理在注册表中位置
proxyRegPath = Software\Microsoft\Windows\CurrentVersion\Internet Settings

;获取参数
Loop, %0% 
{
  param := %A_Index%
  if(A_Index = 1) {
    if(param = "restore") {
      restoreProxy()
    } else {
      setProxy(param)
    }
  }
}

;设置代理
setProxy(address) {
    global proxyRegPath
    RegWrite,REG_DWORD,HKCU,%proxyRegPath%,Proxyenable,1
    RegWrite,REG_SZ,HKCU,%proxyRegPath%,ProxyServer,%address%  
    refresh()
}

;取消设置代理
restoreProxy() {
    global proxyRegPath
    RegWrite,REG_DWORD,HKCU,%proxyRegPath%,Proxyenable,0
    RegWrite,REG_SZ,HKCU,%proxyRegPath%,ProxyServer,  
    refresh()
}

;调用wininet.dll刷新注册表
refresh() {
  dllcall("wininet\InternetSetOptionW","int","0","int","39","int","0","int","0")
  dllcall("wininet\InternetSetOptionW","int","0","int","37","int","0","int","0")
}

