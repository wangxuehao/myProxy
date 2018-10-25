const cp = require("child_process");
var baseReg = "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings";
var proxyInfo = "http=127.0.0.1:5555";
var setProxyServerCmd = 'reg add \"' + baseReg + '\" /v ProxyServer /d \"' + proxyInfo + '\" /f';
var setProxyEnableCmd = 'reg add \"' + baseReg + '\" /v ProxyEnable /t REG_DWORD /d 00000001 /f';
cp.exec(setProxyServerCmd,function(error, stdout, stderr){
    console.log(error);
    console.log(stdout);
    console.log(stderr);
});
cp.exec(setProxyEnableCmd,function(error, stdout, stderr){
    console.log(error);
    console.log(stdout);
    console.log(stderr);
});

//直接在命令窗口运行的cmd
var temp1 = 'reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "http=127.0.0.1:6669" /f'