<?php
	session_start();
	include('../inc/myconnect.php');
	include('../inc/function.php');
	$customer_uid = $_SESSION['customer_uid'];
		$query_customer = "SELECT * FROM tb_customer WHERE id_user = '$customer_uid'";
		$result_customer = mysqli_query($dbc, $query_customer);
		kt_query($query_customer, $result_customer);
		$customer = mysqli_fetch_array($result_customer, MYSQLI_ASSOC);
		
	if(isset($_SESSION['cart']) or !empty($_SESSION['cart']) && isset($_GET['name']) && isset($_GET['email']) && isset($_GET['sdt']) && isset($_GET['tinh']) && isset( $_GET['quan']) && isset($_GET['sonha']) && isset($_GET['phuong']) ){
		$name = $_GET['name'];
		$email = $_GET['email'];
		$sdt = $_GET['sdt'];
		$tinh = $_GET['tinh'];
		$quan = $_GET['quan'];
		$sonha = $_GET['sonha'];
		$phuong = $_GET['phuong'];
		$code_order = ramdom_code();
		$id_customer = $customer['id_customer'];
		$address_customer = $sonha . ", ". $phuong;
		date_default_timezone_set("Asia/HO_CHI_MINH");
		$order_day =date("Y-m-d  H:i:s");
			foreach ($_SESSION['cart'] as $value) {
				$id_product = $value['id_product'];
				foreach ($value['quantity'] as $key_sl => $value_sl) {
					$size_product =   $key_sl;
					$quantity_product = $value_sl;
					$query= "INSERT INTO tb_order(
											code_order,
											status_order,
											id_product,
											size_product,
											quantity_product,
											name_customer, 
											phone_customer,
											address_customer,
											email_customer,
											order_day,
											id_district,
											id_customer
										) VALUES(
										'{$code_order}',
										'0',
										'{$id_product}', 
										'{$size_product}', 
										'{$quantity_product}', 
										'{$name}', 
										'{$sdt}', 
										'{$address_customer}', 
										'{$email}',
										'{$order_day}',
										'{$quan}',
										'{$id_customer}'
									)";
				$result =  mysqli_query($dbc,$query);
				}
			}	
		// header('location:../gui-hang-thanh-cong.php');
		unset($_SESSION['cart']);
	}

?>