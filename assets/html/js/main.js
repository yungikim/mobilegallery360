

$(document).ready(function(){
    console.log("dkdddddddddd");

    $("#btn2").off().on("click", function(e){
        window.flutter_inappwebview.callHandler('handlerFooWithArgs','kkkkkdddddkkdkdkdkddkdkdkdk').then(function(result){
            console.log("리턴된 결과값 : " + JSON.stringify(result));
        });
    });
});

