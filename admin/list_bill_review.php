<?php
include('includes/header.php');
include('inc/function.php');
?>

<div class="row">
    <div class="col-12">
        <h3 style="color: red">Danh sách hóa đơn đã duyệt</h3>

        <!-- Form tìm kiếm theo mã hóa đơn -->
        <form class="d-flex col-md-3" method="get" action="">
            <div class="form-group flex-grow-1 mr-2">
                <input type="text" class="form-control" id="search_code_bill" name="search_code_bill" placeholder="Nhập mã hóa đơn" value="<?php echo isset($_GET['search_code_bill']) ? $_GET['search_code_bill'] : ''; ?>">
            </div>
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>


        <!-- Bảng danh sách hóa đơn -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Họ và tên</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Ngày đặt hàng</th>
                    <th class="text-center">Xem chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Lấy mã hóa đơn tìm kiếm từ form
                $search_code_bill = isset($_GET['search_code_bill']) ? $_GET['search_code_bill'] : '';

                // Câu truy vấn SQL, với điều kiện tìm kiếm nếu có
                $query = "SELECT code_bill, name_customer, phone_customer, address_customer, order_day, id_product, tb_bill.status_bill, tb_district.name_district, tb_city.name_city 
                          FROM tb_order, tb_bill, tb_district, tb_city  
                          WHERE tb_district.id_city = tb_city.id_city 
                          AND tb_district.id_district = tb_order.id_district 
                          AND tb_bill.id_order = tb_order.id_order 
                          AND tb_bill.status_bill = '1'";

                // Kiểm tra nếu có mã hóa đơn nhập vào để lọc kết quả
                if (!empty($search_code_bill)) {
                    $query .= " AND code_bill LIKE '%" . mysqli_real_escape_string($dbc, $search_code_bill) . "%'";
                }

                // Sắp xếp và nhóm kết quả
                $query .= " GROUP BY code_bill ORDER BY status_bill";

                $result = mysqli_query($dbc, $query);
                kt_query($query, $result);

                // Hiển thị kết quả
                while ($bill = mysqli_fetch_array($result, MYSQLI_NUM)) {
                ?>
                    <tr>
                        <td><?php echo $bill[0]; ?></td>
                        <td><?php echo $bill[1]; ?></td>
                        <td><?php echo $bill[2]; ?></td>
                        <td><?php echo $bill[3] . ", " . $bill[7] . ", " . $bill[8]; ?></td>
                        <td><?php
                            $date = date_create($bill[4]);
                            echo date_format($date, "H:i - d/m/Y");
                            ?></td>
                        <td class="text-center"><a href="bill_detail.php?code_bill=<?php echo $bill[0]; ?>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                    </tr>
                <?php
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
    $('.kinh-doanh .hoadon').css({
        'background-color': '#e1e1e1'
    });
</script>
<style>
    /* Đảm bảo form tìm kiếm nằm cùng một dòng */
    form.d-flex {
        display: flex;
        align-items: center;
        /* Căn giữa các phần tử theo chiều dọc */
    }

    /* Điều chỉnh thêm nếu cần */
    form .form-group {
        margin-bottom: 0;
        margin-right: 10px;
        /* Loại bỏ khoảng cách dưới cho form group */
    }
</style>