// Modal box

$(".modal-trigger").click(function (e) {
    e.preventDefault();
    dataModal = $(this).attr("data-modal");
    $("#" + dataModal).css({ "display": "block" });
});

$(".update, .modal-sandbox").click(function () {
    $(".modal").css({ "display": "none" });
});