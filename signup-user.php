<?php require_once "controllerUserData.php"; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Signup Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <script>
        function validateForm() {
            var password = document.forms["signupForm"]["password"].value;
            var cpassword = document.forms["signupForm"]["cpassword"].value;
            var birthday = document.forms["signupForm"]["birthday"].value;
            var currentDate = new Date();
            var inputDate = new Date(birthday);

            // Kiểm tra mật khẩu
            var passwordRegex = /^[a-zA-Z0-9]{3,15}$/;
            if (!password.match(passwordRegex)) {
                alert("Password must be between 3 and 15 characters and contain only letters and numbers.");
                return false;
            }

            // Kiểm tra mật khẩu xác nhận
            if (password !== cpassword) {
                alert("Passwords do not match.");
                return false;
            }

            // Kiểm tra ngày sinh
            if (inputDate > currentDate) {
                alert("Birthday cannot be in the future.");
                return false;
            }

            // Kiểm tra tuổi (phải đủ 18 tuổi)
            var age = currentDate.getFullYear() - inputDate.getFullYear();
            var month = currentDate.getMonth() - inputDate.getMonth();
            if (month < 0 || (month === 0 && currentDate.getDate() < inputDate.getDate())) {
                age--;
            }
            if (age < 18) {
                alert("You must be at least 18 years old.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4 form">
                <form name="signupForm" action="signup-user.php" method="POST" autocomplete="" onsubmit="return validateForm()">
                    <h2 class="text-center">Signup Form</h2>
                    <p class="text-center">It's quick and easy.</p>
                    <?php
                    if (count($errors) == 1) {
                    ?>
                        <div class="alert alert-danger text-center">
                            <?php
                            foreach ($errors as $showerror) {
                                echo $showerror;
                            }
                            ?>
                        </div>
                    <?php
                    } elseif (count($errors) > 1) {
                    ?>
                        <div class="alert alert-danger">
                            <?php
                            foreach ($errors as $showerror) {
                            ?>
                                <li><?php echo $showerror; ?></li>
                            <?php
                            }
                            ?>
                        </div>
                    <?php
                    }
                    ?>
                    <div class="form-group">
                        <input class="form-control" type="text" name="name" placeholder="Full Name" required value="<?php echo $name ?>">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="email" name="email" placeholder="Email Address" required value="<?php echo $email ?>">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="cpassword" placeholder="Confirm password" required>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" name="birthday" id="birthday" placeholder="Birthday" required />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="address" placeholder="Địa chỉ" required />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Số điện thoại" name="phone" required />
                    </div>
                    <div class="form-group">
                        <input class="form-control button" type="submit" name="signup" value="Signup">
                    </div>
                    <div class="link login-link text-center">Already a member? <a href="login-user.php">Login here</a></div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>