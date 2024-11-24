<?php
session_start();

// Kiểm tra nếu session 'uid' tồn tại và xóa session đó
if (isset($_SESSION['uid'])) {
    unset($_SESSION['uid']); // Xóa session 'uid'
}

// Chuyển hướng đến trang đăng nhập
header('Location: login.php');
exit();
