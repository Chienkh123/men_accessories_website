<?php
session_start();
include('inc/myconnect.php');
require 'vendor/autoload.php'; // PHPMailer autoload

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$email = "";
$name = "";
$errors = array();

function sendEmail($recipient, $subject, $body)
{
    $mail = new PHPMailer(true);
    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.mailersend.net';
        $mail->SMTPAuth = true;
        $mail->Username = 'MS_551fV1@trial-jy7zpl9yee5g5vx6.mlsender.net'; // Thay bằng email của bạn
        $mail->Password = 'dl0MaqHyUHkzrur2'; // Thay bằng mật khẩu ứng dụng
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Email settings
        $mail->setFrom('MS_551fV1@trial-jy7zpl9yee5g5vx6.mlsender.net', 'HomeShop'); // Email người gửi
        $mail->addAddress($recipient); // Email người nhận
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = $body;

        $mail->send();
        return true;
    } catch (Exception $e) {
        return false;
    }
}

if (isset($_POST['signup'])) {
    // Lấy và xử lý dữ liệu đầu vào
    $name = mysqli_real_escape_string($dbc, trim($_POST['name']));
    $email = mysqli_real_escape_string($dbc, trim($_POST['email']));
    $password = mysqli_real_escape_string($dbc, trim($_POST['password']));
    $cpassword = mysqli_real_escape_string($dbc, $_POST['cpassword']);
    $birthday = mysqli_real_escape_string($dbc, trim($_POST['birthday']));
    $address = mysqli_real_escape_string($dbc, trim($_POST['address']));
    $phone = mysqli_real_escape_string($dbc, trim($_POST['phone']));

    if ($password !== $cpassword) {
        $errors['password'] = "Password confirmation does not match!";
    }

    $email_check = "SELECT * FROM tb_user WHERE email_user = '$email'";
    $res = mysqli_query($dbc, $email_check);
    if (mysqli_num_rows($res) > 0) {
        $errors['email'] = "Email that you have entered already exists!";
    }
    // kiểm tra ngày sinh đủ 18 chưa
    $age = date_diff(date_create($birthday), date_create('now'))->y;
    if ($age < 18) {
        $errors['birthday'] = "You must be at least 18 years old to register.";
    }
     // Kiểm tra mật khẩu
    $passwordRegex = '/^[a-zA-Z0-9]{3,15}$/';
    if (!preg_match($passwordRegex, $password)) {
        $errors['password'] = "Password must be between 3 and 15 characters.";
    }

     // Kiểm tra ngày sinh
    $currentDate = new DateTime();
    $inputDate = new DateTime($birthday);
    if ($inputDate > $currentDate) {
        $errors['birthday'] = "Birthday cannot be in the future.";
    }


    if (count($errors) === 0) {
        $hashed_password = md5($password);
        $code = rand(999999, 111111);
        $status = "notverified";
        $insert_data = "INSERT INTO tb_user (account_user, name_user, email_user, pass_user, birthday_user, address_user, phonenumber_user, status_user, type_user, code, status)
                        VALUES ('{$email}', '{$name}', '{$email}', '{$hashed_password}', '{$birthday}', '{$address}', '{$phone}', 1, 2, {$code}, '{$status}')";

        $data_check = mysqli_query($dbc, $insert_data);
        if ($data_check) {
            $id_user = mysqli_insert_id($dbc); 
            $query_customer = "INSERT INTO tb_customer (name_customer, phonenumber_customer, email_customer, address_customer, id_user)
                               VALUES ('{$name}', '{$phone}', '{$email}', '{$address}', '{$id_user}')";

            $result_customer = mysqli_query($dbc, $query_customer);
            if ($result_customer) {
                $subject = "Email Verification Code";
                $message = "Your verification code is <b>$code</b>";
                if (sendEmail($email, $subject, $message)) {
                    $_SESSION['info'] = "We've sent a verification code to your email - $email";
                    $_SESSION['email'] = $email;
                    $_SESSION['password'] = $password;
                    $_SESSION['name'] = $name;
                    $_SESSION['birthday'] = $birthday;
                    $_SESSION['address'] = $address;
                    $_SESSION['phone'] = $phone;
                    header('location: user-otp.php');
                    exit();
                } else {
                    $errors['otp-error'] = "Failed while sending code!";
                }
            } else {
                $errors['customer-db-error'] = "Failed to insert customer data!";
            }
        } else {
            $errors['db-error'] = "Failed while inserting data into database!";
        }
    }
}

//if user click verification code submit button
if (isset($_POST['check'])) {
    $_SESSION['info'] = "";
    $otp_code = mysqli_real_escape_string($dbc, $_POST['otp']);
    $check_code = "SELECT * FROM tb_user WHERE code = $otp_code";
    $code_res = mysqli_query($dbc, $check_code);
    if (mysqli_num_rows($code_res) > 0) {
        $fetch_data = mysqli_fetch_assoc($code_res);
        $fetch_code = $fetch_data['code'];
        $email = $fetch_data['email'];
        $code = 0;
        $status = 'verified';
        $update_otp = "UPDATE tb_user SET code = $code, status = '$status' WHERE code = $fetch_code";

        $update_res = mysqli_query($dbc, $update_otp);
        if ($update_res) {
            $_SESSION['name'] = $name;
            $_SESSION['email'] = $email;
            header('location: login-user.php');
            exit();
        } else {
            $errors['otp-error'] = "Failed while updating code!";
        }
    } else {
        $errors['otp-error'] = "You've entered incorrect code!";
    }
}

//if user click login button
if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($dbc, $_POST['username']);
    $password = mysqli_real_escape_string($dbc, $_POST['password']);
    $check_email = "SELECT id_user, account_user, pass_user, type_user, status, status_user
        FROM tb_user
        WHERE account_user = '{$username}'";
    $res = mysqli_query($dbc, $check_email);
    if (mysqli_num_rows($res) > 0) {
        list($id_user, $account_user, $hashed_password, $type_user, $status, $status_user) = mysqli_fetch_array($res, MYSQLI_NUM);
        if (md5($password) == $hashed_password) {
            if ($status_user == 0) {
                $errors['email'] = "Your account has been locked. Please contact support.";
            } else {
                if ($status == 'verified') {
                    session_start();
                    $_SESSION['customer_uid'] = $id_user;
                    $_SESSION['customer_username'] = $account_user;
                    $_SESSION['customer_type'] = $type_user;
                    header('Location: index.php');
                } else {
                    $info = "It looks like you haven't verified your email - $email";
                    $_SESSION['info'] = $info;
                    header('location: user-otp.php');
                }
            }
        } else {
            $errors['email'] = "Incorrect email or password!";
        }
    } else {
        $errors['email'] = "It looks like you're not yet a member! Click on the bottom link to signup.";
    }
}

//if user click check-reset-otp button in forgot password form
if (isset($_POST['check-email'])) {
    $email = mysqli_real_escape_string($dbc, $_POST['email']);
    $check_email = "SELECT * FROM tb_user WHERE email_user='$email'";
    $run_sql = mysqli_query($dbc, $check_email);
    if (mysqli_num_rows($run_sql) > 0) {
        $code = rand(999999, 111111);
        $insert_code = "UPDATE tb_user SET code = $code WHERE email_user = '$email'";
        $run_query =  mysqli_query($dbc, $insert_code);
        if ($run_query) {
            $subject = "Password Reset Code";
            $message = "Your password reset code is $code";
            if (sendEmail($email, $subject, $message)) {
                $info = "We've sent a password reset OTP to your email - $email";
                $_SESSION['info'] = $info;
                $_SESSION['email'] = $email;
                header('location: reset-code.php');
                exit();
            } else {
                $errors['otp-error'] = "Failed while sending code!";
            }
        } else {
            $errors['db-error'] = "Something went wrong!";
        }
    } else {
        $errors['email'] = "This email address does not exist!";
    }
}


//if user click check reset otp button
if (isset($_POST['check-reset-otp'])) {
    $_SESSION['info'] = "";
    $otp_code = mysqli_real_escape_string($dbc, $_POST['otp']);
    $check_code = "SELECT * FROM tb_user WHERE code = $otp_code";
    $code_res = mysqli_query($dbc, $check_code);
    if (mysqli_num_rows($code_res) > 0) {
        $fetch_data = mysqli_fetch_assoc($code_res);
        $email = $fetch_data['email_user'];
        $_SESSION['email'] = $email;
        $info = "Please create a new password that you don't use on any other site.";
        $_SESSION['info'] = $info;
        header('location: new-password.php');
        exit();
    } else {
        $errors['otp-error'] = "You've entered incorrect code!";
    }
}

//if user click change password button
if (isset($_POST['change-password'])) {
    $_SESSION['info'] = "";
    $password = mysqli_real_escape_string($dbc, $_POST['password']);
    $cpassword = mysqli_real_escape_string($dbc, $_POST['cpassword']);
    if ($password !== $cpassword) {
        $errors['password'] = "Confirm password not matched!";
    } else {
        $code = 0;
        $email = $_SESSION['email']; 
        $encpass = md5($password);
        $update_pass = "UPDATE tb_user SET code = $code, pass_user = '$encpass' WHERE email_user = '$email'";
        $run_query = mysqli_query($dbc, $update_pass);
        if ($run_query) {
            $info = "Your password changed. Now you can login with your new password.";
            $_SESSION['info'] = $info;
            header('Location: password-changed.php');
        } else {
            $errors['db-error'] = "Failed to change your password!";
        }
    }
}

//if login now button click
if (isset($_POST['login-now'])) {
    header('Location: login-user.php');
}
