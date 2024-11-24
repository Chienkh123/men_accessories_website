<?PHP
include('includes/header.php');
?>
<style type="text/css">
    .title {
        color: red;
        text-align: center;
        text-transform: uppercase;
        margin-top: 35px;
        font-weight: bold;
    }

    .statistic-chart {
        /*  text-align: center;*/
        margin-top: 25px;
    }

    .statistic-chart #buyers {
        margin: 0 auto;
    }

    .statistic-chart .menu>ul {
        line-height: inherit;
        padding: 0;
        margin-left: 10px;
        border-bottom: 1px solid #ccc;
    }

    .statistic-chart .menu>ul:after {
        content: "";
        display: table;
        clear: both;
    }

    .statistic-chart .menu>ul li {
        float: left;
        cursor: pointer;
        background: #999;
        list-style: none;
        padding: 8px 15px;
        background: #e1e1e1;
        box-sizing: border-box;
        border-left: 1px solid #ccc;
        border-top: 1px solid #ccc;
        border-right: 1px solid #ccc;
        margin-bottom: -1px;
        margin-left: 10px;
    }

    .statistic-chart .menu>ul li:hover {
        background: #f1f1f1;
        border-bottom: 1px solid #f1f1f1;
    }

    .statistic-chart .menu>ul .active {
        background: #f1f1f1;
        border-bottom: 1px solid #f1f1f1;
    }

    /**/
    .statistic-chart .sub-menu {
        text-align: center;
        background: white;
        margin-top: 25px;
    }

    .statistic-chart .sub-menu ul {
        text-align: left;
        background: #f5f5f5;
        list-style: none;
        padding: 0;
        border-bottom: 1px solid #ccc;
    }

    .statistic-chart .sub-menu ul li:first-child {
        margin-left: 0px;
    }

    .statistic-chart .sub-menu ul li {
        font-weight: 700;
        color: #0073aa;
        display: inline-block;
        cursor: pointer;
        background: #999;
        list-style: none;
        padding: 8px 15px;
        background: #f5f5f5;
        box-sizing: border-box;
        border-left: 1px solid #ccc;
        border-top: 1px solid #ccc;
        border-right: 1px solid #ccc;
        margin-bottom: -1px;
        margin-left: 10px;
    }

    .statistic-chart .sub-menu ul .active {
        background: #fff;
    }

    .statistic-chart .sub-menu ul li:hover {
        background: #fff;
    }

    /**/
    /*style header*/
    .wrap-header {
        margin: 15px 0;
    }

    .wrap-header:after {
        content: " ";
        display: table;
        clear: both;
    }

    .wrap-header .left,
    .wrap-header .right {
        background: white;
        border-radius: 4px;
        padding: 5px 10px;
        border: 1px solid #e1e1e1;
    }

    .wrap-header .left .title-left {
        margin-top: 5px;
        margin-bottom: 5px;
        color: blue;
        font-weight: bold;
        font-size: 16px;
    }

    .link_a {
        background: #f1f1f1;
        padding: 8px;
        border: 1px solid #e1e1e1;
        border-radius: 4px;

    }

    .dashboard {
        display: flex;
        gap: 15px;
        justify-content: center;
    }

    .card {
        width: 297px;
        border: none;
        border-radius: 8px;

    }

    .card-footer:hover {
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2);
        /* phóng to */
        transform: scale(1.01);
    }

    .card-body {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
    }

    .card-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #f8f9fa;
        padding: 10px 15px;
    }


    .card-footer a {
        font-weight: bold;
        text-decoration: none;
    }

    .card-footer a.text-danger {
        color: #dc3545;
    }

    .card-footer a.text-info {
        color: #17a2b8;
    }

    .card-footer a.text-warning {
        color: #ffc107;
    }

    .card-footer a.text-success {
        color: #28a745;
    }

    .fa-tshirt,
    .fa-address-book,
    .fa-shopping-cart {
        font-size: 5rem;
    }


    .fa-arrow-circle-right {
        font-size: 1.2rem;
    }
</style>

<div class="row" style="margin-top: -15px;padding-bottom: 55px">
    <div class="row" style="background: #f1f1f1;">
        <div class="col-lg-12">
            <div class="title">
                <h2 class="title">Thống kê cửa hàng</h2>
            </div>
            <div class="dashboard d-flex">
                <!-- Card 1: Sản Phẩm -->
                <?php
                // Truy vấn lấy tổng số sản phẩm
                $query = "SELECT COUNT(id_product) AS total_products FROM tb_product";
                $result = mysqli_query($dbc, $query);

                $total_products = 0; // Giá trị mặc định nếu không có sản phẩm
                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $total_products = $row['total_products'];
                }
                ?>
                <div class="card bg-danger text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div class="text-left">
                            <h5 class="text-uppercase m-0">Sản Phẩm</h5>
                            <h2 class="m-0"><?php echo $total_products; ?></h2>
                        </div>
                        <i class="fa fa-address-book fa-2x"></i>
                    </div>
                    <div class="card-footer d-flex justify-content-between align-items-center">
                        <a href="list_product.php" class="text-danger">Xem Chi Tiết</a>
                        <i class="fa fa-arrow-circle-right text-danger"></i>
                    </div>
                </div>

                <!-- Card 2: Khách Hàng -->
                <?php
                // Truy vấn lấy tổng số sản phẩm
                $query = "SELECT COUNT(id_customer) AS total_customers FROM tb_customer";
                $result = mysqli_query($dbc, $query);

                $total_customers = 0; // Giá trị mặc định nếu không có sản phẩm
                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $total_customers = $row['total_customers'];
                }
                ?>
                <div class="card bg-info text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div class="text-left">
                            <h5 class="text-uppercase m-0">Khách Hàng</h5>
                            <h2 class="m-0"><?php echo $total_customers; ?></h2>
                        </div>
                        <i class="fa fa-address-book fa-2x"></i>
                    </div>
                    <div class="card-footer d-flex justify-content-between align-items-center">
                        <a href="list_customer.php" class="text-info">Xem Chi Tiết</a>
                        <i class="fa fa-arrow-circle-right text-info"></i>
                    </div>
                </div>

                <!-- Card 3: Hóa Đơn -->
                <?php
                // Truy vấn lấy tổng số hóa đơn
                $query = "SELECT COUNT(id_bill) AS total_bills FROM tb_bill";
                $result = mysqli_query($dbc, $query);

                $total_bills = 0; // Giá trị mặc định nếu không có hóa đơn
                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $total_bills = $row['total_bills'];
                }
                ?>

                <div class="card bg-warning text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div class="text-left">
                            <h5 class="text-uppercase m-0">Hóa Đơn</h5>
                            <h2 class="m-0"><?php echo $total_bills; ?></h2>
                        </div>
                        <i class="fa fa-shopping-cart fa-2x"></i>
                    </div>
                    <div class="card-footer d-flex justify-content-between align-items-center">
                        <a href="list_bill_review.php" class="text-warning">Xem Chi Tiết</a>
                        <i class="fa fa-arrow-circle-right text-warning"></i>
                    </div>
                </div>

                <!-- Card 4: Doanh Thu -->
                <?php
                // Function to get total revenue for the current month or year
                function getTotalRevenue()
                {
                    global $dbc;
                    $now = getdate();
                    $year = $now["year"];
                    $totalRevenue = 0;
                    // Prepare and execute the query
                    $query = "SELECT SUM(quantity_product * saleprice_product) AS tongtien 
              FROM tb_order 
              INNER JOIN tb_product ON tb_order.id_product = tb_product.id_product 
              WHERE order_day BETWEEN '$year-01-01 00:00:00' AND '$year-12-31 23:59:59'"; // Adjust date range as needed

                    $result = mysqli_query($dbc, $query);

                    // Check for query execution success
                    if ($result) {
                        $row = mysqli_fetch_assoc($result);
                        $totalRevenue = $row['tongtien'] ? (float)$row['tongtien'] : 0; // Handle null cases
                    } else {
                        error_log("Database query failed: " . mysqli_error($dbc)); // Log the error
                    }

                    return $totalRevenue;
                }

                // Get the total revenue
                $totalRevenue = getTotalRevenue();
                ?>
                <div class="card bg-success text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div class="text-left">
                            <h5 class="text-uppercase m-0">Doanh Thu</h5>
                            <h2 class="m-0"><?php echo number_format($totalRevenue, 0, ',', '.') . '₫'; ?></h2> <!-- Display revenue -->
                        </div>
                        <i class="fa fa-shopping-cart fa-2x"></i>
                    </div>
                    <div class="card-footer d-flex justify-content-between align-items-center">
                        <a href="#" class="text-success">Xem Chi Tiết</a>
                        <i class="fa fa-arrow-circle-right text-success"></i>
                    </div>
                </div>

            </div>





            <div class="wrap-header">
                <div class="col-xs-12">
                    <div class="left">
                        <div class="title-left">Sản phẩm bán chạy</div>
                        <hr style="margin-top: 0">
                        <div class="content-product">
                            <table class="table table-hover">
                                <thead>
                                    <tr style="color: red">
                                        <th>STT</th>
                                        <th>Mã sp</th>
                                        <th>Tên sp</th>
                                        <!--<th>Loại sp</th>
                                        <th>Hiệu sp</th> -->
                                        <th>Hình ảnh</th>
                                        <th>Giá</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng</th>
                                        <th>Lượt xem</th>
                                        <th>Số đơn hàng đặt</th>
                                        <!-- <th>Ngày thêm</th> -->
                                        <th>Trạng thái</th>
                                        <th>Xem</th>
                                    </tr>
                                </thead>

                                <!-- <tbody>
                                    <?php
                                    $query = "SELECT tb_order.id_product, tb_product.code_product, tb_product.name_product,tb_product.price_product,tb_product.saleprice_product, tb_product.image,tb_product.view_product,tb_product.size_product, tb_product.status_product, SUM(tb_order.quantity_product) quantity_product_order, COUNT(tb_order.id_order) total_order FROM tb_order, tb_product WHERE tb_order.id_product = tb_product.id_product GROUP BY tb_order.id_product ORDER BY quantity_product_order DESC LIMIT 10";
                                    $result = mysqli_query($dbc, $query);
                                    $stt = 0;
                                    while ($product = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                        $stt++;
                                        /* Tính số lượng */
                                        $sl = 0;
                                        foreach (unserialize($product['size_product']) as $key => $value) {
                                            $sl += $value;
                                        }
                                    ?>

                                        <tr>
                                            <th style="vertical-align: middle;"><?php echo $stt; ?></th>
                                            <td style="vertical-align: middle;"><?php echo $product['code_product']; ?></td>
                                            <td style="vertical-align: middle;"><?php echo $product['name_product']; ?></td>
                                            <td style="vertical-align: middle;"><?php

                                                                                $img_product = explode(" ",  $product['image']);
                                                                                $stt = 0;
                                                                                foreach ($img_product as $value) {
                                                                                    if (isset($value) && !empty($value)) {
                                                                                ?>

                                                        <img style="width: 50px;" src="../<?php echo $value; ?>" style="margin: 0 auto">

                                                <?php
                                                                                        $stt++;
                                                                                        break;
                                                                                    }
                                                                                }
                                                ?>
                                            </td>
                                            <td style="vertical-align: middle;"><?php echo number_format($product['price_product']); ?><br /><strong> VND</strong></td>
                                            <td style="vertical-align: middle;"><?php echo number_format($product['saleprice_product']); ?><br /><strong> VND</strong></td>
                                            <td style="vertical-align: middle;" class="text-center"><?php echo $sl; ?></td>
                                            <td style="vertical-align: middle;" class="text-center"><?php echo number_format($product['view_product']); ?></td>
                                            <td style="vertical-align: middle;" class="text-center"><?php echo number_format($product['total_order']); ?></td>
                                            <td style="vertical-align: middle;"><?php
                                                                                $status = $product['status_product'];
                                                                                if ($status == 1) {
                                                                                    echo "Còn hàng";
                                                                                } else {
                                                                                    echo "Hết hàng";
                                                                                }
                                                                                ?></td>
                                            <td style="vertical-align: middle;" align="center"><a class="link_a" href="edit_product.php?id=<?php echo $product['id_product']; ?>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                </tbody> -->
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-xs-5">
                    <!--  <div class="right">
                    a
                </div>  -->
                </div>
            </div>
            <div class="statistic-chart">
                <div class="menu">
                    <ul>
                        <li style="color: blue;font-size: 18px;font-weight: 700" class="active dh"><i style="margin-right: 5px;" class="fa fa-bar-chart" aria-hidden="true"></i> Doanh thu</li>
                        <li style="color: blue;font-size: 18px;font-weight: 700" class="kho"><i style="margin-right: 5px;" class="glyphicon glyphicon-object-align-bottom" aria-hidden="true"></i>Kho</li>
                    </ul>
                    <div class="sub-menu">
                        <ul>
                            <li class="active year">Năm</li>
                            <li class="month-ago">Tháng trước</li>
                            <li class="this-month">Tháng này</li>
                            <li class="day">7 ngày qua</li>
                        </ul>
                        <canvas id="buyers" width="900" height="500"></canvas>
                    </div>
                </div>

                <div class="clearfix"></div>

            </div>
        </div>
    </div>
</div>



<?PHP
include('includes/footer.php');
?>
<script type="text/javascript" src="js/thongke.js"></script>