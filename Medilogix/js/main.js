$(document).ready(function () {
    LoginW();
    AccW();
    //bodyClick();
});
function LoginW() {
    var ctr = 0;
    $("#log").click(function () {
        if (ctr == 0) {
            $(".Login-Widget").css("visibility", "visible");
            ctr = 1
        }
        else {
            $(".Login-Widget").css("visibility", "hidden");
            ctr = 0
        }
    });
    $("body").click(function (event) {
        var myClasses = event.target.classList;
        var myid = event.target.id
        if (myClasses != "mylog" && myClasses != "Login-Widget") {
            $(".Login-Widget").css("visibility", "hidden");
            ctr = 0
        }
        if (myid == "btnLogin") {
            ctr = 0
        }
    });
};

function AccW() {
    var ctr = 0;
    $("#lblName").click(function () {
        if (ctr == 0) {
            $(".Acc-Widget").css("visibility", "visible");
            ctr = 1
        }
        else {
            $(".Acc-Widget").css("visibility", "hidden");
            ctr = 0
        }
    });
    $("body").click(function (event) {
        var myClasses = event.target.classList;
        var myid = event.target.id
        if (myClasses != "MyAcc" && myClasses != "Acc-Widget") {
            $(".Acc-Widget").css("visibility", "hidden");
            ctr = 0
        }
        if (myid == "btnLogOut") {
            ctr = 0
        }
    });
};

//function bodyClick() {
//    var ctr;
//    $("body").click(function (event) {
//        var myClasses = event.target.classList;
//        var myid = event.target.id
//        if (myClasses != "mylog" && myClasses != "Login-Widget" && myClasses != "MyAcc" && myClasses != "Acc-Widget") {
//            $(".Acc-Widget").css("visibility", "hidden");
//            $(".Login-Widget").css("visibility", "hidden");
//            ctr = 0
//        }
//        if (myid == "btnLogOut") {
//            ctr = 0
//        }
//    });
//}

function ShowHide() {
    $("#pStat").removeClass("L-stat-Hide");
    $("#pStat").addClass("L-stat-Show");

    setTimeout(function () {
        $("#pStat").removeClass("L-stat-Show");
        $("#pStat").addClass("L-stat-Hide");
    }, 5000);
};