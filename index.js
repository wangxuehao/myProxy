var path = require("path");
var childProcess = require("child_process");
var argv = require("yargs").argv; //argument value?
var switchToolUrl = path.resolve(__dirname,'./include/proxy64.exe');
console.log(switchToolUrl);
var setProxyCmd = switchToolUrl + " http=127.0.0.1:7777";
var closeProxyCmd = switchToolUrl + " restore";
var optionType = argv.optionType;
if(optionType == 'open'){
  childProcess.exec(setProxyCmd,function(err){
    if(err){
      console.log(' open proxy failed');
    }else{
      console.log(' open proxy succceed');
    }
  });
}else if(optionType == 'close'){
  childProcess.exec(closeProxyCmd,function(err){
    if(err){
      console.log(' close proxy failed');
    }else{
      console.log(' close proxy succceed');
    }
  });
}