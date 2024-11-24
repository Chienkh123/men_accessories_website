<?php
session_start();
include('inc/myconnect.php');
include('inc/function.php');

if (isset($_SESSION['customer_uid'])) {
    header('location: index.php');
    exit();
}

if (isset($_POST['signup'])) {
    $error = array();

    // Kiểm tra đầu vào
    if (empty($_POST['name']) || empty($_POST['email']) || empty($_POST['password']) || empty($_POST['birthday']) || empty($_POST['address']) || empty($_POST['phone'])) {
        $error[] = 'Vui lòng nhập đầy đủ thông tin!';
    } else {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $password = md5($_POST['password']); // Mã hóa mật khẩu
        $birthday = $_POST['birthday'];
        $address = $_POST['address'];
        $phone = $_POST['phone'];

        // Kiểm tra định dạng email
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $error[] = 'Địa chỉ email không hợp lệ!';
        }

        // Kiểm tra tài khoản đã tồn tại trong cơ sở dữ liệu
        $query_check_user = "SELECT id_user FROM tb_user WHERE account_user = '{$email}'";
        $result_check_user = mysqli_query($dbc, $query_check_user);
        kt_query($query_check_user, $result_check_user); // Kiểm tra kết quả truy vấn

        if (mysqli_num_rows($result_check_user) > 0) {
            $error[] = 'Tài khoản đã tồn tại!';
        }
    }

    // Nếu không có lỗi thì thực hiện đăng ký
    if (empty($error)) {
        $query_register = "INSERT INTO tb_user (account_user, pass_user, name_user, email_user, birthday_user, address_user, phonenumber_user, type_user, status_user) 
                           VALUES ('{$email}', '{$password}', '{$name}', '{$email}', '{$birthday}', '{$address}', '{$phone}', 2, 1)";
        $result_register = mysqli_query($dbc, $query_register);
        kt_query($query_register, $result_register); // Kiểm tra kết quả

        if ($result_register) {
            echo '<script>alert("Đăng ký thành công!");</script>';
            header('Location: dang-nhap.php'); // Chuyển hướng đến trang đăng nhập
            exit();
        } else {
            echo '<script>alert("Có lỗi xảy ra. Vui lòng thử lại!");</script>';
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
    $error = array();

    // Kiểm tra đầu vào
    if (empty($_POST['username']) || empty($_POST['password'])) {
        $error[] = 'Vui lòng nhập đầy đủ thông tin!';
    } else {
        $pattern = "/^[A-Za-z0-9]{3,15}$/"; // Kiểm tra tài khoản/mật khẩu hợp lệ

        if (!preg_match($pattern, $_POST['username']) || !preg_match($pattern, $_POST['password'])) {
            $error[] = 'Tài khoản và mật khẩu phải từ 3-15 ký tự và chỉ chứa chữ hoặc số!';
        } else {
            $username = $_POST['username'];
            $password = md5($_POST['password']); // Mã hóa mật khẩu
        }
    }

    // Xử lý nếu không có lỗi
    if (empty($error)) {
        $query = "SELECT id_user, account_user, pass_user, type_user
                  FROM tb_user
                  WHERE account_user = '{$username}' AND pass_user = '{$password}' AND status_user = 1 AND type_user = 2";
        $result = mysqli_query($dbc, $query);
        kt_query($query, $result); // Hàm kiểm tra kết quả

        if (mysqli_num_rows($result) == 1) {
            list($id_user, $account_user, $pass_user, $type_user) = mysqli_fetch_array($result, MYSQLI_NUM);

            // Gán session cho customer
            $_SESSION['customer_uid'] = $id_user;
            $_SESSION['customer_username'] = $account_user;
            $_SESSION['customer_type'] = $type_user;

            header('Location: index.php'); // Chuyển hướng đến trang chính
            exit();
        } else {
            echo '<script>alert("Tài khoản hoặc mật khẩu không đúng. Vui lòng thử lại!");</script>';
        }
    } else {
        // Hiển thị lỗi
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
                <h2 class="form-title" id="login"><span>or</span>Đăng nhập</h2>
                <form action="dang-nhap.php" method="POST">
                    <div class="form-holder">
                        <input type="text" class="input" placeholder="Email" name="username" required />
                        <input type="password" class="input" placeholder="Mật khẩu" name="password" required />
                    </div>

                    <button type="submit" class="submit-btn" name="login">Đăng nhập</button>
                </form>
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
    </script>
</body>

</html>
