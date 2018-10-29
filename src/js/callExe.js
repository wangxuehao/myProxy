var childProcess = require("child_process");
var path = require("path");
module.exports={
  setProxy:function (){
      var exeUrl = path.dirname(process.cwd()) + "\\myProxy\\include\\demo1.ahk http=localhost:7777";
      childProcess.exec(exeUrl,function(err){
          if(err){
            console.log(err);
          }else{
            console.log("设置代理成功");
          }
      });
  },
  restoreProxy:function (){
      exeUrl = path.dirname(process.cwd()) + "\\myProxy\\include\\demo1.ahk restore";
      childProcess.exec(exeUrl,function(err){
          if(err){
            console.log(err);
          }else{
            console.log("取消代理成功");
          }
      });
  }
}