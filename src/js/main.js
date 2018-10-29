var {initPage} = require('./initPage.js');
var jquery = require('jquery');
module.exports={
    init:function(){
        window.$ = jquery;
        initPage();
    }
}