var callExe = require('./callExe.js');
module.exports={
    initPage:function(){
        $("#openProxy").click(function(){
            callExe.setProxy();
        });
        $("#closeProxy").click(function(){
            callExe.restoreProxy();
        });
    }
}