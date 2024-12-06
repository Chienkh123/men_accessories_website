<?php
session_start();
if (isset($_SESSION['customer_uid'])) {
    unset($_SESSION['customer_uid']);
}
header('Location: index.php');
exit();
