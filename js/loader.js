$(document).ready(function () {
    // Ẩn loader khi trang đã tải xong
    $(window).on("load", function () {
        $("#global-loader").fadeOut("slow");
    });
});