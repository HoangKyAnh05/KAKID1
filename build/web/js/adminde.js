document.addEventListener("DOMContentLoaded", function () {
    var daySelect = document.getElementById("day");
    var monthSelect = document.getElementById("month");
    var yearSelect = document.getElementById("year");

    // Hàm kiểm tra năm nhuận
    function isLeapYear(year) {
        return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
    }

    // Hàm cập nhật ngày theo tháng & năm
    function updateDays() {
        let month = parseInt(monthSelect.value);
        let year = parseInt(yearSelect.value);
        
        // Số ngày trong từng tháng
        let daysInMonth = [31, (isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        let days = daysInMonth[month - 1];

        // Xóa ngày cũ
        daySelect.innerHTML = "";
        
        // Thêm ngày mới
        for (let i = 1; i <= days; i++) {
            let option = new Option(i, i);
            daySelect.appendChild(option);
        }
    }

    // Thêm tháng từ 1 đến 12
    let monthNames = [
        "1", " 2", " 3", " 4",
        " 5", " 6", " 7", " 8",
        " 9", " 10", " 11", " 12"
    ];
    for (let i = 0; i < 12; i++) {
        let option = new Option(monthNames[i], i + 1);
        monthSelect.appendChild(option);
    }

    // Thêm năm từ 1900 đến năm hiện tại
    let currentYear = new Date().getFullYear();
    for (let i = currentYear; i >= 1900; i--) {
        let option = new Option(i, i);
        yearSelect.appendChild(option);
    }

    // Gán sự kiện để cập nhật ngày khi chọn tháng hoặc năm
    monthSelect.addEventListener("change", updateDays);
    yearSelect.addEventListener("change", updateDays);

    // Gọi updateDays() để thiết lập ngày ban đầu
    updateDays();
});
