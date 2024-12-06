<?php
session_start();
include('inc/myconnect.php');
include('inc/function.php');
include('include/header.php');
?>
<!DOCTYPE html>
<html>

<head>
    <title>Lịch sử mua hàng</title>
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
    </style>
</head>

<body style="margin-top: -20px">
    <div class="bcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ul>
                        <li><a href="index.php">Trang chủ</a></li>
                        <li style="background: url('')"><a href="">Thông tin mua hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="thongtin">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 right">
                    <h3>Lịch sử đặt hàng
                        <small class="load" style="float: right; opacity: 0; transition: all 1s;">Cập nhật thành công</small>
                    </h3>
                    <hr>
                    <table class="table">
                        <thead>
                            <tr style="font-weight: 700; color: #444; font-size: 13px;">
                                <th>STT</th>
                                <th>Mã đơn hàng</th>
                                <th>Hình</th>
                                <th>Thông tin sản phẩm</th>
                                <th>SL</th>
                                <th>Đơn giá</th>
                                <th>Ngày đặt hàng</th>
                                <th>Tổng</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody class="tt_product">
                            <?php

                            if (isset($_SESSION['customer_uid'])) {
                                $customer_uid = $_SESSION['customer_uid'];
                                // Truy vấn thông tin đơn hàng từ cơ sở dữ liệu
                                $sql = "SELECT * FROM tb_order, tb_customer, tb_product WHERE tb_customer.id_customer = tb_order.id_customer && tb_customer.id_user = '$customer_uid' && tb_product.id_product = tb_order.id_product";
                                $result = mysqli_query($dbc, $sql);
                                if (mysqli_num_rows($result) > 0) {
                                    while ($order = mysqli_fetch_assoc($result)) {
                            ?>
                                        <tr class="sp<?php echo $order['id_product']; ?>">
                                            <td style="vertical-align: middle;"><?php echo $stt++; ?></td>
                                            <td style="vertical-align: middle;"><?php echo $order['code_order']; ?></td>
                                            <?php $image = $order['image_thump']; ?>
                                            <td style="vertical-align: middle;" class="img-thumbnail"><img src="./<?php echo explode(" ", $image)[0]; ?>" width=50></td>
                                            <td style="vertical-align: middle;">
                                                <p class="name-product"><a href="product.php?id=<?php echo $order['id_product']; ?>"><?php echo $order['name_product']; ?></a></p>
                                            </td>
                                            <td style="vertical-align: middle;">
                                                <p class="sl-product"><?php echo $order['quantity_product']; ?></p>
                                            </td>
                                            <td style="vertical-align: middle;">
                                                <p class="sl-product"><?php echo number_format($order['saleprice_product']); ?> VND</p>
                                            </td>
                                            <td style="vertical-align: middle;">
                                                <p class="sl-product"><?php echo $order['order_day']; ?></p>
                                            </td>
                                            <td style="vertical-align: middle;">
                                                <p class="sl-product"><?php echo number_format($order['quantity_product'] * $order['saleprice_product']); ?> VND</p>
                                            </td>
                                            <td style="vertical-align: middle;"><a href="order_detail_customer.php?code_order=<?php echo $order['id_order']; ?>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                                        </tr>
                            <?php
                                    }
                                } else {
                                    echo "<tr><td colspan='8' style='text-align: center;'>Không có đơn hàng nào.</td></tr>";
                                }
                            } else {
                                echo "<tr><td colspan='8' style='text-align: center;'>Vui lòng đăng nhập để xem lịch sử mua hàng.</td></tr>";
                            }
                            ?>
                            <tr>
                                <td colspan="8" style="text-align: right; border: none;">
                                    <a href="index.php" class="btn btn-default" style="font-size: 14px">Quay về</a>
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