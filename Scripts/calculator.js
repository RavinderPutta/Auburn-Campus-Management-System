
function CurrentHours() {
    var total = 0;
    for (var x = 1; x <= 5; x++) {
        if (!isNaN(parseInt($("#hrs" + x).val())) && parseInt($("#hrs" + x).val()) >= 0) {
            total += parseInt($("#hrs" + x).val());
        }
    }
    return total;
}

function totalPoints() {
    var total = 0;
    for (var x = 1; x <= 5; x++) {
        if (!isNaN(parseInt($("#hrs" + x).val())) && parseInt($("#hrs" + x).val()) >= 0) {
            total += parseInt($("#hrs" + x).val()) * (5 - x);
        }
    }
    return total;
}

function Gpa() {
    if (parseInt($("#ch").text()) == 0) {
        return 0;
    }
    return (totalPoints() / CurrentHours()).toFixed(2);
    }
    
$(".gpa").on("keyup", function () {
    if (parseInt($(this).val()) < 0) {
        $("#e" + $(this).data("x")).text("Cannot be negative.");
    }
    else if ($(this).val() == "" || $(this).val() == "-") {
        $("#e" + $(this).data("x")).text("");
    }
    else if (isNaN(parseInt($(this).val()))) {
        $("#e" + $(this).data("x")).text("Must be a number.");
    }
    else {
        $("#e" + $(this).data("x")).text("");

        $("#result").text("Your GPA is " + Gpa());
    }
});

