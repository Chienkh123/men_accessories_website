<?php
session_start();
include('inc/myconnect.php');
include('inc/function.php');

// Nếu đã đăng nhập, chuyển hướng về trang chủ
if (isset($_SESSION['customer_uid'])) {
    header('Location: index.php');
    exit();
}

// Xử lý đăng ký
if (isset($_POST['signup'])) {
    $error = [];

    // Lấy và xử lý dữ liệu đầu vào
    $name = mysqli_real_escape_string($dbc, trim($_POST['name']));
    $email = mysqli_real_escape_string($dbc, trim($_POST['email']));
    $password = mysqli_real_escape_string($dbc, trim($_POST['password']));
    $birthday = mysqli_real_escape_string($dbc, trim($_POST['birthday']));
    $address = mysqli_real_escape_string($dbc, trim($_POST['address']));
    $phone = mysqli_real_escape_string($dbc, trim($_POST['phone']));

    // Kiểm tra dữ liệu đầu vào
    if (empty($name) || empty($email) || empty($password) || empty($birthday) || empty($address) || empty($phone)) {
        $error[] = 'Vui lòng điền đầy đủ thông tin!';
    }

    // Kiểm tra email hợp lệ
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error[] = 'Email không hợp lệ!';
    }

    // Kiểm tra độ dài mật khẩu
    if (strlen($password) < 3 || strlen($password) > 15) {
        $error[] = 'Mật khẩu phải từ 3-15 ký tự!';
    }

    // Kiểm tra email đã tồn tại
    $check_query = "SELECT email_user FROM tb_user WHERE email_user = '{$email}'";
    $check_result = mysqli_query($dbc, $check_query);
    kt_query($check_query, $check_result);

    if (mysqli_num_rows($check_result) > 0) {
        $error[] = 'Email đã được sử dụng. Vui lòng sử dụng email khác!';
    }

    // Nếu không có lỗi, thực hiện đăng ký
    if (empty($error)) {
        $hashed_password = md5($password); // Mã hóa mật khẩu bằng MD5

        // Thêm vào bảng tb_user
        $query_user = "INSERT INTO tb_user (account_user, name_user, email_user, pass_user, birthday_user, address_user, phonenumber_user, status_user, type_user)
                       VALUES ('{$email}', '{$name}', '{$email}', '{$hashed_password}', '{$birthday}', '{$address}', '{$phone}', 1, 2)";
        $result_user = mysqli_query($dbc, $query_user);
        kt_query($query_user, $result_user);

        // Lấy ID của người dùng vừa thêm
        if ($result_user && mysqli_affected_rows($dbc) == 1) {
            $id_user = mysqli_insert_id($dbc); // Lấy ID của bản ghi vừa được thêm

            // Thêm vào bảng tb_customer
            $query_customer = "INSERT INTO tb_customer (name_customer, phonenumber_customer, email_customer, address_customer, id_user)
                               VALUES ('{$name}', '{$phone}', '{$email}', '{$address}', '{$id_user}')";
            $result_customer = mysqli_query($dbc, $query_customer);
            kt_query($query_customer, $result_customer);

            if ($result_customer && mysqli_affected_rows($dbc) == 1) {
                echo '<script>alert("Đăng ký thành công. Bạn có thể đăng nhập ngay bây giờ!");</script>';
            } else {
                echo '<script>alert("Đăng ký tài khoản thành công nhưng lỗi khi thêm thông tin khách hàng. Vui lòng liên hệ hỗ trợ!");</script>';
            }
        } else {
            echo '<script>alert("Đã xảy ra lỗi trong quá trình đăng ký. Vui lòng thử lại sau!");</script>';
        }
    } else {
        // Hiển thị lỗi
        foreach ($error as $err) {
            echo '<script>alert("' . $err . '");</script>';
        }
    }
}


// Xử lý đăng nhập
if (isset($_POST['login'])) {
    $error = [];

    // Kiểm tra xem email và mật khẩu có trống không
    if (empty($_POST['username']) || empty($_POST['password'])) {
        $error[] = 'Vui lòng nhập email và mật khẩu!';
    } else {
        $username = mysqli_real_escape_string($dbc, trim($_POST['username']));
        $password = mysqli_real_escape_string($dbc, trim($_POST['password']));

        // Lấy thông tin tài khoản từ cơ sở dữ liệu
        $query = "SELECT id_user, account_user, pass_user, type_user
                  FROM tb_user
                  WHERE account_user = '{$username}' AND status_user = 1 AND type_user = 2";
        $result = mysqli_query($dbc, $query);
        kt_query($query, $result);

        // Kiểm tra xem tài khoản có tồn tại trong cơ sở dữ liệu không
        if (mysqli_num_rows($result) == 1) {
            list($id_user, $account_user, $hashed_password, $type_user) = mysqli_fetch_array($result, MYSQLI_NUM);

            // Kiểm tra mật khẩu đúng hay không (so sánh với MD5)
            if (md5($password) == $hashed_password) {
                // Khởi tạo session nếu mật khẩu đúng
                session_start();
                $_SESSION['customer_uid'] = $id_user;
                $_SESSION['customer_username'] = $account_user;
                $_SESSION['customer_type'] = $type_user;

                // Chuyển hướng đến trang chính
                header('Location: index.php');
                exit();
            } else {
                $error[] = 'Tài khoản hoặc mật khẩu không đúng. Vui lòng thử lại!';
            }
        } else {
            $error[] = 'Tài khoản không tồn tại hoặc đã bị khóa!';
        }
    }

    // Hiển thị các lỗi nếu có
    if (!empty($error)) {
        foreach ($error as $err) {
            echo '<script>alert("' . $err . '");</script>';
        }
    }
}


?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập / Đăng ký</title>
    <link rel="stylesheet" href="css/dangnhap.css">
</head>

<body>
    <div class="form-structor">
        <!-- Form đăng ký -->
        <div class="signup slide-up">
            <h2 class="form-title" id="signup"><span>or</span>Đăng ký</h2>
            <form action="dang-nhap.php" method="POST">
                <div class="form-holder">
                    <input type="text" class="input" placeholder="Họ và Tên" name="name" required />
                    <input type="email" class="input" placeholder="Email" name="email" required />
                    <input type="password" class="input" placeholder="Mật khẩu" name="password" required />
                    <input type="date" class="input" name="birthday" id="birthday" required />
                    <input type="text" class="input" placeholder="Địa chỉ" name="address" required />
                    <input type="text" class="input" placeholder="Số điện thoại" name="phone" required />
                </div>
                <button type="submit" class="submit-btn" name="signup">Đăng ký</button>
            </form>
        </div>

        <!-- Form đăng nhập -->
<div class="login">
    <div class="center">
        <h2 class="form-title" id="login"><span>or</span> Đăng nhập</h2>
        <form action="dang-nhap.php" method="POST">
            <div class="form-holder">
                <input type="email" class="input" placeholder="Email" name="username" required />
                <input type="password" class="input" placeholder="Mật khẩu" name="password" required />
            </div>
            <button type="submit" class="submit-btn" name="login">Đăng nhập</button>
        </form>
        <a href="quen-mat-khau.php" class="forgot-password">Quên mật khẩu?</a>
    </div>
</div>

    </div>

    <script>
        console.clear();

        const loginBtn = document.getElementById('login');
        const signupBtn = document.getElementById('signup');

        loginBtn.addEventListener('click', (e) => {
            let parent = e.target.parentNode.parentNode;
            Array.from(e.target.parentNode.parentNode.classList).find((element) => {
                if (element !== "slide-up") {
                    parent.classList.add('slide-up')
                } else {
                    signupBtn.parentNode.classList.add('slide-up')
                    parent.classList.remove('slide-up')
                }
            });
        });

        signupBtn.addEventListener('click', (e) => {
            let parent = e.target.parentNode;
            Array.from(e.target.parentNode.classList).find((element) => {
                if (element !== "slide-up") {
                    parent.classList.add('slide-up')
                } else {
                    loginBtn.parentNode.parentNode.classList.add('slide-up')
                    parent.classList.remove('slide-up')
                }
            });
        });

        // Kiểm tra điều kiện đăng ký
        const signupForm = document.querySelector('.signup form');
        signupForm.addEventListener('submit', (e) => {
            const email = signupForm.querySelector('input[name="email"]').value;
            const password = signupForm.querySelector('input[name="password"]').value;

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const passwordRegex = /^[a-zA-Z0-9]{3,15}$/;

            if (!emailRegex.test(email)) {
                e.preventDefault();
                alert('Email không hợp lệ. Vui lòng nhập đúng định dạng email.');
            }
            if (!passwordRegex.test(password)) {
                e.preventDefault();
                alert('Mật khẩu phải từ 3-15 ký tự và chỉ chứa chữ hoặc số.');
            }
        });

        // Kiểm tra điều kiện đăng nhập
        const loginForm = document.querySelector('.login form');
        loginForm.addEventListener('submit', (e) => {
            const email = loginForm.querySelector('input[name="username"]').value;
            const password = loginForm.querySelector('input[name="password"]').value;

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const passwordRegex = /^[a-zA-Z0-9]{3,15}$/;

            if (!emailRegex.test(email)) {
                e.preventDefault();
                alert('Email không hợp lệ. Vui lòng nhập đúng định dạng email.');
            }
            
        });
    </script>
</body>

</html>