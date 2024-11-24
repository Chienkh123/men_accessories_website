<?php
session_start();

// Kiểm tra nếu session 'customer_uid' tồn tại và xóa session đó
if (isset($_SESSION['customer_uid'])) {
    unset($_SESSION['customer_uid']); // Xóa session 'customer_uid'
}

// Chuyển hướng đến trang đăng nhập
header('Location: index.php');
exit();
?>
