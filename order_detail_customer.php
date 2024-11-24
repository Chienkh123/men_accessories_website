<!DOCTYPE html>
<html>

<head>
    <title>Thông tin chi tiết</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style-main.css">
    <style type="text/css">
        .errors {
            font-size: 12px;
            color: #bd0103;
            margin: 5px;
        }

        .sl-product {
            vertical-align: middle;
        }

        .bcrumbs ul li a {
            color: #444;
        }

        .bcrumbs ul li a:hover {
            text-decoration: underline;
        }

        .status-pending {
            color: orange;
        }

        .status-success {
            color: green;
        }

        .status-sent {
            color: blue;
        }
    </style>
</head>

<body style="margin-top: -20px">
    <?php
    session_start();
    include('inc/myconnect.php');
    include('inc/function.php');
    include('include/header.php');
    ?>

    <div class="bcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ul>
                        <li><a href="index.php">Trang chủ</a></li>
                        <li><a href="don-mua.php">Thông tin mua hàng</a></li>
                        <li style="background: url('')"><a href="">Thông tin chi tiết</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="thongtin">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 right">
                    <h3>Chi tiết đơn hàng </h3>
                    <hr>
                    <table class="table">
                        <thead>
                            <tr style="font-weight: 700; color: #444; font-size: 13px;">
                                <th>Mã hóa đơn</th>
                                <th>Mã ship</th>
                                <th>Họ và tên</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Ngày đặt hàng</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody class="tt_product">
                            <?php if (isset($_GET['code_order'])) {
                                $code_order = $_GET['code_order'];
                                $query = "SELECT code_ship, name_customer, phone_customer, address_customer, order_day, code_bill, status_ship, tb_district.name_district, tb_city.name_city 
                                        FROM tb_order
                                        JOIN tb_bill ON tb_order.id_order = tb_bill.id_order
                                        JOIN tb_ship ON tb_bill.id_bill = tb_ship.id_bill
                                        JOIN tb_district ON tb_order.id_district = tb_district.id_district
                                        JOIN tb_city ON tb_district.id_city = tb_city.id_city
                                        WHERE tb_order.id_order = '{$code_order}'";

                                $result = mysqli_query($dbc, $query);
                                if (mysqli_num_rows($result) > 0) {
                                    while ($order = mysqli_fetch_assoc($result)) {
                            ?>
                                        <tr>
                                            <td><?php echo $order['code_bill']; ?></td>
                                            <td><?php echo $order['code_ship']; ?></td>
                                            <td><?php echo $order['name_customer']; ?></td>
                                            <td><?php echo $order['phone_customer']; ?></td>
                                            <td><?php echo $order['address_customer'] . ', ' . $order['name_district'] . ', ' . $order['name_city']; ?></td>
                                            <td style="vertical-align: middle;">
                                                <p class="sl-product"><?php echo $order['order_day']; ?></p>
                                            </td>
                                            <td class="<?php
                                                        echo $order['status_ship'] == 1 ? 'status-pending' : ($order['status_ship'] == 2 ? 'status-success' : 'status-sent'); ?>">
                                                <?php
                                                echo $order['status_ship'] == 1 ? 'Đang giao hàng' : ($order['status_ship'] == 2 ? 'Giao hàng thành công' : 'Người bán đã gửi cho bên giao hàng');
                                                ?>
                                            </td>

                                        </tr>
                            <?php

                                    }
                                } else {
                                    echo "<tr><td colspan='8' style='text-align: center;'>Đang chờ người bán hàng xử lý.</td></tr>";
                                }
                            } ?>
                            <tr>
                                <td colspan="8" style="text-align: right; border: none;">
                                    <a href="don-mua.php" class="btn btn-default" style="font-size: 14px">Quay về</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <?php include('include/footer.php'); ?>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-main.js"></script>
</body>

</html>