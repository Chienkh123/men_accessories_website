<?php
include('includes/header.php');
include('inc/function.php');
?>

<div class="row">
    <div class="col-12">
        <h2 style="color: red">Danh sách đơn đặt hàng
            <a href="list_order_review.php" class="btn btn-primary" style="float: right;">Các đơn hàng đã duyệt</a>
        </h2>
        <!-- Form tìm kiếm -->
        <form method="GET" action="">
            <div class="form-group col-md-2">
                <input class="form-control" type="text" name="search" placeholder="Tìm kiếm" value="<?php echo isset($_GET['search']) ? $_GET['search'] : ''; ?>" />
            </div>
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>


        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Họ và tên</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Ngày đặt hàng</th>
                    <th>Xem chi tiết</th>
                    <th>Chỉnh sửa</th>
                    <th>Duyệt</th>
                    <th>Xóa</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Lấy giá trị tìm kiếm từ form
                $search = isset($_GET['search']) ? $_GET['search'] : '';

                // Truy vấn cơ sở dữ liệu với điều kiện tìm kiếm
                $query = "SELECT code_order, name_customer, phone_customer, address_customer, order_day, id_product, tb_district.name_district, tb_city.name_city 
                          FROM tb_order, tb_district, tb_city 
                          WHERE tb_district.id_city = tb_city.id_city 
                          AND tb_district.id_district = tb_order.id_district 
                          AND status_order = '0' 
                          AND status_order != '1'";

                if ($search) {
                    // Thêm điều kiện tìm kiếm vào truy vấn
                    $query .= " AND (code_order LIKE '%$search%' OR phone_customer LIKE '%$search%')";
                }

                $query .= " GROUP BY code_order ORDER BY order_day DESC";
                $result = mysqli_query($dbc, $query);
                kt_query($query, $result);

                while ($order = mysqli_fetch_array($result, MYSQLI_NUM)) {
                    $check = check_order($order[0]);
                ?>
                    <tr style="<?php echo ($check) ? 'color: #bd0103' : "b"; ?>">
                        <td><?php echo $order[0]; ?></td>
                        <td><?php echo $order[1]; ?></td>
                        <td><?php echo $order[2]; ?></td>
                        <td><?php echo $order[3] . ", " . $order[6] . ", " . $order[7]; ?></td>
                        <td><?php $date = date_create($order[4]);
                            echo date_format($date, "H:i - d/m/Y"); ?></td>
                        <td class="text-center"><a href="order_detail.php?code_order=<?php echo $order[0]; ?>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                        <td><a href="edit_order.php?code_order=<?php echo $order[0]; ?>"><i class="fa fa-fw fa-pencil" style="font-size: 20px; color:#1b926c;"></i></a></td>
                        <?php if ($check) { ?>
                            <td style="color: #bd0103;text-align: center;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></td>
                        <?php } else { ?>
                            <td class="text-center"><a onClick="return confirm('Bạn muốn chuyển đơn hàng này qua bên hóa đơn?');" href="functions/review_order.php?id_order=<?php echo $order[0]; ?>"><i class="glyphicon glyphicon-ok"></i></a></td>
                            <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');" href="delete_order.php?code_order=<?php echo $order[0]; ?>"><i class="fa fa-fw fa-trash" style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
                    </tr>
            <?php
                        }
                    }
            ?>
            </tbody>
        </table>
    </div>
</div>

<?php
include('includes/footer.php');
?>

<script language="JavaScript">
    function chkallClick(o) {
        var form = document.frmForm;
        for (var i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type == "checkbox" && form.elements[i].name != "chkall") {
                form.elements[i].checked = document.frmForm.chkall.checked;
            }
        }
    }
</script>

<script type="text/javascript">
    $('.kinh-doanh .collapse').addClass('in');
    $('.kinh-doanh .dathang').css({
        'background-color': '#e1e1e1'
    });
</script>