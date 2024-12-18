<?php include('includes/header.php'); ?>
<?php include('inc/myconnect.php'); ?>
<?php include('inc/function.php'); ?>

<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h2 style="color: red">Danh sách tài khoản
            <a href="add_user.php" style="float: right; color:#1b926c; font-size: 20px;">Thêm<i
                    class="fa fa-fw fa-plus-square-o"
                    style="font-size: 25px; color:#1b926c; float: right; padding-left: 10px; padding-right: 75px;"></i></a>
        </h2>

        <!-- Form lọc theo loại tài khoản -->
        <form method="GET" action="">
            <label for="type_user">Loại tài khoản: </label>
            <select name="type_user" id="type_user">
                <option value="">Tất cả</option>
                <option value="0" <?php echo isset($_GET['type_user']) && $_GET['type_user'] == 0 ? 'selected' : ''; ?>>Admin</option>
                <option value="1" <?php echo isset($_GET['type_user']) && $_GET['type_user'] == 1 ? 'selected' : ''; ?>>Nhân viên</option>
                <option value="2" <?php echo isset($_GET['type_user']) && $_GET['type_user'] == 2 ? 'selected' : ''; ?>>Khách hàng</option>
            </select>
            <input type="submit" value="Tìm">
        </form>

        <!-- Bảng danh sách tài khoản -->
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Tài khoản</th>
                    <th>Họ tên</th>
                    <th>Loại tài khoản</th>
                    <th>Ngày sinh</th>
                    <th>CMND</th>
                    <th>Địa chỉ</th>
                    <th>Điện thoại</th>
                    <th>Email</th>
                    <th>Trạng thái</th>
                    <th>Sửa</th>
                    <th>Xóa</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Lọc theo loại tài khoản
                $type_user = isset($_GET['type_user']) ? $_GET['type_user'] : '';

                $query = "SELECT * FROM tb_user";
                if ($type_user !== '') {
                    $query .= " WHERE type_user = $type_user";
                }
                $query .= " ORDER BY type_user ASC";

                $result = mysqli_query($dbc, $query);
                kt_query($query, $result);

                while ($user = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                ?>
                    <tr>
                        <td><?php echo $user['account_user']; ?></td>
                        <td><?php echo $user['name_user']; ?></td>
                        <td><?php echo $user['type_user'] == 0 ? 'Admin' : ($user['type_user'] == 1 ? 'Nhân viên' : 'Khách hàng'); ?></td>
                        <td><?php echo date("d/m/Y", strtotime($user['birthday_user'])); ?></td>
                        <td><?php echo $user['cmnd_user']; ?></td>
                        <td><?php echo $user['address_user']; ?></td>
                        <td><?php echo $user['phonenumber_user']; ?></td>
                        <td><?php echo $user['email_user']; ?></td>
                        <td><?php if ($user['status_user'] == 1) echo "Hoạt động"; else echo "Không hoạt động"; ?></td>
                        <td align="center"><a href="edit_user.php?id=<?php echo $user['id_user']; ?>"><i class="fa fa-fw fa-pencil" style="font-size: 20px; color:#1b926c;"></i></a></td>
                        <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');" href="delete_user.php?id=<?php echo $user['id_user']; ?>"><i class="fa fa-fw fa-trash" style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

<?php include('includes/footer.php'); ?>

<script type="text/javascript">
    $('.tai-khoan .collapse').addClass('in');
    $('.tai-khoan .nguoidung').addClass('active-hover');
</script>
