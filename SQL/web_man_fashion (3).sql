-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 06, 2024 lúc 05:27 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_man_fashion`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_bill`
--

CREATE TABLE `tb_bill` (
  `id_bill` int(11) NOT NULL,
  `code_bill` char(10) NOT NULL,
  `status_bill` char(2) NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_category`
--

CREATE TABLE `tb_category` (
  `id_category` int(11) NOT NULL,
  `code_category` char(30) NOT NULL,
  `name_category` varchar(255) NOT NULL,
  `unaccentname_category` char(100) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_category`
--

INSERT INTO `tb_category` (`id_category`, `code_category`, `name_category`, `unaccentname_category`, `parent_id`) VALUES
(43, 'AoNam', 'Áo nam', 'aonam', 0),
(44, 'QuanNam', 'Quần nam', 'quẦnnam', 0),
(45, 'PhuKienNam', 'Phụ kiện nam', 'phỤkiỆnnam', 0),
(99, 'GiayNam', 'Giày nam', 'giaynam', 0),
(100, 'KhuyenMai', 'Khuyến mãi', 'khuyẾnm??i', 0),
(101, 'AoSoMiNam', 'Áo sơ mi nam', 'aosominam', 43),
(102, 'AoThunNam', 'Áo thun nam', 'aothunnam', 43),
(103, 'AoKhoacNam', 'Áo khoác nam', 'aokhoacnam', 43),
(104, 'AoVestNam', 'Áo vest nam', 'aovestnam', 43),
(105, 'AoLenNam', 'Áo len nam', 'aolennam', 43),
(106, 'AoSoMiHanQuoc', 'Áo sơ mi Hàn Quốc', 'aosomihanquoc', 101),
(107, 'AoSoMiHoaTiet', 'Áo sơ mi họa tiết', 'aosomihoatiet', 101),
(108, 'AoSoMiCaro', 'Áo sơ mi Caro', 'aosomicaro', 101),
(109, 'AoSoMiNganTay', 'Áo sơ mi ngắn tay', 'aosomingantay', 101),
(110, 'AoThunNamCoCo', 'Áo thun nam có cổ', 'aothunnamcoco', 102),
(111, 'AoThunNamCoTron', 'Áo thun nam cổ tròn', 'aothunnamcotron', 102),
(112, 'AoThunNamCoTim', 'Áo thun nam cổ tim', 'aothunnamcotim', 102),
(113, 'AoThunNamTayDai', 'Áo thun nam tay dài', 'aothunnamtaydai', 102),
(114, 'AoKhoacDa', 'Áo khoác da', 'aokhoacda', 103),
(115, 'AoKhoacDu', 'Áo khoác dù', 'aokhoacdu', 103),
(116, 'AoKhoacNi', 'Áo khoác nỉ', 'aokhoacni', 103),
(117, 'AoKhoacJeanNam', 'Áo khoác jean nam', 'aokhoacjeannam', 103),
(118, 'AoKhoacKakiNam', 'Áo khoác kaki nam', 'aokhoackakinam', 103);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_city`
--

CREATE TABLE `tb_city` (
  `id_city` int(11) NOT NULL,
  `code_city` char(10) NOT NULL,
  `name_city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_city`
--

INSERT INTO `tb_city` (`id_city`, `code_city`, `name_city`) VALUES
(3, 'AnGiang', 'An Giang'),
(5, 'BacGiang', 'Bắc Giang'),
(6, 'BacKan', 'Bắc Kạn'),
(7, 'BacLieu', 'Bạc Liêu'),
(8, 'BacNinh', 'Bắc Ninh'),
(9, 'BenTre', 'Bến Tre'),
(10, 'BinhDinh', 'Bình Định'),
(11, 'BinhDuong', 'Bình Dương'),
(12, 'BinhPhuoc', 'Bình Phước'),
(13, 'BinhThuan', 'Bình Thuận'),
(14, 'CaMau', 'Cà Mau'),
(15, 'CaoBang', 'Cao Bằng'),
(16, 'DakLak', 'Đắk Lắk'),
(17, 'DakNong', 'Đắk Nông'),
(18, 'DienBien', 'Điện Biên'),
(19, 'DongNai', 'Đồng Nai'),
(20, 'DongThap', 'Đồng Tháp'),
(21, 'GiaLai', 'Gia Lai'),
(22, 'HaGiang', 'Hà Giang'),
(23, 'HaNam', 'Hà Nam'),
(25, 'HaiDuong', 'Hải Dương'),
(61, 'CanTho', 'Cần Thơ'),
(62, 'DaNang', 'Đà Nẵng'),
(63, 'HaiPhong', 'Hải Phòng'),
(64, 'HaNoi', 'Hà Nội');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_contact`
--

CREATE TABLE `tb_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` char(100) NOT NULL,
  `number_phone` char(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_customer` int(11) NOT NULL,
  `name_customer` char(20) NOT NULL,
  `phonenumber_customer` int(11) NOT NULL,
  `email_customer` varchar(50) NOT NULL,
  `address_customer` varchar(20) NOT NULL,
  `type_customer` int(2) NOT NULL DEFAULT 1,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_customer`
--

INSERT INTO `tb_customer` (`id_customer`, `name_customer`, `phonenumber_customer`, `email_customer`, `address_customer`, `type_customer`, `id_user`) VALUES
(12, 'Nông Văn Chiến', 867476810, 'chienkh6b.vn@gmail.com', 'Tuyen Quang', 1, 43),
(17, 'Nông Văn Chiến', 867476810, '20211891@eaut.edu.vn', 'Tuyên Quang', 1, 56);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_district`
--

CREATE TABLE `tb_district` (
  `id_district` int(11) NOT NULL,
  `code_district` char(10) NOT NULL,
  `name_district` varchar(50) NOT NULL,
  `id_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_district`
--

INSERT INTO `tb_district` (`id_district`, `code_district`, `name_district`, `id_city`) VALUES
(5, 'AnPhu', 'An Phú', 3),
(6, 'TanChau', 'Tân Châu', 3),
(7, 'PhuTan', 'Phú Tân', 3),
(8, 'ChauDoc', 'Châu Đốc', 3),
(9, 'TinhBien', 'Tịnh Biên', 3),
(10, 'TriTon', 'Trị Tôn', 3),
(11, 'ChauPhu', 'Châu Phú', 3),
(12, 'ChauThanh', 'Châu Thành', 3),
(13, 'ChoMoi', 'Chợ Mới', 3),
(14, 'LongXuyen', 'Long Xuyên', 3),
(15, 'ThoaiSon', 'Thoại Sơn', 3),
(24, 'HiepHoa', 'Hiệp Hòa', 5),
(25, 'YenDung', 'Yên Dũng', 5),
(26, 'LucNam', 'Lục Nam', 5),
(27, 'SonDong', 'Sơn Động', 5),
(28, 'LangGiang', 'Lạng Giang', 5),
(29, 'VietYen', 'Việt Yên', 5),
(30, 'LucNgan', 'Lục Ngạn', 5),
(31, 'YenThe', 'Yên Thế', 5),
(32, 'BacKan', 'Bắc Kạn', 6),
(33, 'PacNam', 'Pác Nặm', 6),
(34, 'BaBe', 'Ba Bể', 6),
(35, 'NganSon', 'Ngân Sơn', 6),
(36, 'BachThong', 'Bạch Thông', 6),
(37, 'ChoDon', 'Chợ Đồn', 6),
(38, 'ChoMoi', 'Chợ Mới', 6),
(39, 'NaRi', 'Na Rì', 6),
(40, 'BacLieu', 'Bạc Liêu', 7),
(41, 'VinhLoi', 'Vĩnh Lợi', 7),
(42, 'HongDan', 'Hồng Dân', 7),
(43, 'GiaRai', 'Giá Rai', 7),
(44, 'PhuocLong', 'Phước Long', 7),
(45, 'DongHai', 'Đông Hải', 7),
(46, 'HoaBinh', 'Hòa Bình', 7),
(47, 'BacNinh', 'Bắc Ninh', 8),
(48, 'YenPhong', 'Yên Phong', 8),
(49, 'QueVo', 'Quế Võ', 8),
(50, 'TienDu', 'Tiên Du', 8),
(51, 'TuSon', 'Từ Sơn', 8),
(52, 'ThuanThanh', 'Thuận Thành', 8),
(53, 'GiaBinh', 'Gia Bình', 8),
(54, 'LuongTai', 'Lương Tài', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_information`
--

CREATE TABLE `tb_information` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_information`
--

INSERT INTO `tb_information` (`id`, `name`, `value`) VALUES
(1, 'name', 'HOME-SHOP'),
(2, 'description', 'Thương hiệu thời trang nam HOMESHOP Chuyên các dòng sản phẩm thời trang nam: Quần jean, quần tây, quần kaki, áo sơ mi, áo khoác, áo vest, áo thun, phụ kiện nam,...'),
(3, 'logo_header', 'image/SHOP(1).png'),
(4, 'logo_footer', 'image/SHOP(1).png'),
(5, 'email', ' chienkh6b.vn@gmail.com'),
(6, 'phone', ' 0867476810'),
(7, 'adress', '$%^$%^Khuôn Hà, Lâm Bình, Tuyên Quang'),
(15, 'slider', 'image/g144.jpg image/g137.jpg image/g142.jpg image/g143.jpg image/g116.jpg'),
(16, 'fb', ''),
(17, 'image_1', 'image/slide-1-trang-chu-slide-1.jpg'),
(18, 'category_1', '17'),
(19, 'image_2', 'image/slide-2-trang-chu-slide-2.jpg'),
(20, 'category_2', '22'),
(21, 'image_3', 'image/slide-3-trang-chu-slide-3.jpg'),
(22, 'category_3', '23'),
(23, 'image_4', 'image/slide-4-trang-chu-slide-4.jpg'),
(24, 'category_4', '18'),
(25, 'gioithieu', '<p>&nbsp;</p>\r\n\r\n<p><strong>Thương hiệu Thời trang HOMESHOP&nbsp;được th&agrave;nh lập từ th&aacute;ng 3 năm 2010, l&agrave; một trong những thương hiệu thời trang nam uy t&iacute;n h&agrave;ng đầu Việt Nam. Với sự quản l&yacute; chặt chẽ, chuy&ecirc;n nghiệp của đội ngũ&nbsp;quản l&yacute;; Nỗ lực s&aacute;ng tạo kh&ocirc;ng ngừng của bộ phận thiết kế, Sự tận t&acirc;m của nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng&hellip; l&agrave; những yếu tố l&agrave;m n&ecirc;n thương hiệu thời trang HOMESHOP&nbsp;lớn mạnh như hiện nay.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3T&nbsp;lu&ocirc;n quan niệm thời trang l&agrave; sự t&igrave;m t&ograve;i v&agrave; s&aacute;ng tạo n&ecirc;n những sản phẩm của HOME-SHOP&nbsp;đều được thiết kế ri&ecirc;ng với sự trẻ trung, hiện đại để mang lại gu&nbsp;thời trang hợp mốt nhất cho c&aacute;c bạn trẻ. C&aacute;c d&ograve;ng sản phẩm của HOMESHOP&nbsp;kh&ocirc;ng ngừng đa dạng về kiểu d&aacute;ng, mẫu m&atilde; từ &aacute;o sơ mi, &aacute;o thun, &aacute;o kho&aacute;c, &aacute;o vest, quần jean, quần t&acirc;y, quần kaki&hellip; đến c&aacute;c phụ kiện thời trang v&ocirc; c&ugrave;ng s&agrave;nh điệu, tất cả tạo n&ecirc;n vẻ đẹp ho&agrave;n hảo, hiện đại, phong c&aacute;ch cho ph&aacute;i mạnh</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>B&ecirc;n cạnh đ&oacute; HOME-SHOP&nbsp;lu&ocirc;n đặt m&igrave;nh v&agrave;o t&acirc;m l&yacute; v&agrave; quyền lợi của kh&aacute;ch h&agrave;ng để tung ra những sản phẩm thời trang chất lượng tốt nhất, mẫu m&atilde; cực đẹp, mới lạ nhưng với gi&aacute; cả cực k&igrave; hấp dẫn, cạnh tranh nhất.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Hiện nay, thương hiệu thời trang nam HOME-SHOP&nbsp;ph&aacute;t triển ng&agrave;y c&agrave;ng lớn mạnh th&agrave;nh một hệ thống với nhiều chi nh&aacute;nh cửa h&agrave;ng b&aacute;n lẻ tại TPHCM, Đồng Nai v&agrave; Vũng T&agrave;u. Ngo&agrave;i ra, nhằm tạo sự tiện lợi mua sắm tối đa cho kh&aacute;ch h&agrave;ng, HOMESHOP&nbsp;ph&aacute;t triển hệ thống b&aacute;n h&agrave;ng online, giao h&agrave;ng đến tận tay người ti&ecirc;u d&ugrave;ng tr&ecirc;n to&agrave;n quốc. Giờ đ&acirc;y ngay tại nh&agrave; bạn cũng c&oacute; thể chọn cho m&igrave;nh những sản phẩm ph&ugrave; hợp với sở th&iacute;ch v&agrave; phong c&aacute;ch của m&igrave;nh.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Đến với HOME-SHOP, ch&uacute;ng t&ocirc;i lu&ocirc;n tận t&acirc;m tư vấn gi&uacute;p qu&yacute; kh&aacute;ch t&igrave;m được những sản phẩm y&ecirc;u th&iacute;ch, ph&ugrave; hợp với nhu cầu v&agrave; g&oacute;p phần tạo n&ecirc;n phong c&aacute;ch cho ri&ecirc;ng m&igrave;nh!</strong></p>\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_label`
--

CREATE TABLE `tb_label` (
  `id_label` int(11) NOT NULL,
  `code_label` char(10) NOT NULL,
  `name_label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `tb_label`
--

INSERT INTO `tb_label` (`id_label`, `code_label`, `name_label`) VALUES
(22, 'Bitis', 'Bitis'),
(23, 'Gucci', 'Gucci'),
(24, 'Burberry', 'Burberry'),
(25, 'Nike', 'Nike'),
(26, 'Adidas', 'Adidas'),
(27, 'Converse', 'Converse'),
(28, 'LouisVuitt', 'Louis Vuitton'),
(29, 'Prada', 'Prada'),
(30, 'Versace', 'Versace'),
(31, 'Dior', 'Dior');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `code_order` char(10) NOT NULL,
  `status_order` char(2) NOT NULL,
  `id_product` int(11) NOT NULL,
  `size_product` char(255) NOT NULL,
  `quantity_product` int(5) NOT NULL,
  `name_customer` varchar(255) NOT NULL,
  `phone_customer` char(11) NOT NULL,
  `address_customer` text NOT NULL,
  `email_customer` char(255) NOT NULL,
  `order_day` datetime NOT NULL,
  `id_district` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_product`
--

CREATE TABLE `tb_product` (
  `id_product` int(11) NOT NULL,
  `code_product` char(10) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_label` int(11) NOT NULL,
  `image` text NOT NULL,
  `image_thump` text NOT NULL,
  `price_product` int(11) NOT NULL,
  `saleprice_product` int(11) NOT NULL,
  `describe_product` text NOT NULL,
  `size_product` char(255) NOT NULL,
  `view_product` int(11) NOT NULL,
  `date_product` date NOT NULL,
  `status_product` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_product`
--

INSERT INTO `tb_product` (`id_product`, `code_product`, `name_product`, `id_category`, `id_label`, `image`, `image_thump`, `price_product`, `saleprice_product`, `describe_product`, `size_product`, `view_product`, `date_product`, `status_product`) VALUES
(19, 'A8024', 'ÁO SƠ MI HÀN QUỐC CAM TRƠN', 106, 22, 'upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-1_thump.jpg upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-2_thump.jpg upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-3_thump.jpg upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-4_thump.jpg', 'upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-1_thump.jpg upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-2_thump.jpg upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-3_thump.jpg upload/resize/ao-so-mi-han-quoc-cam-tron-asm788-7258-slide-4_thump.jpg', 200000, 245000, 'Áo Sơ Mi Hàn Quốc Cam Trơn với thiết kế cổ trụ, tay dài, form ôm nhẹ, phối nút ở cổ áo tinh tế. Thiết kế đơn giản theo phong cách Hàn Quốc rất thời trang, vải trơn thanh lịch, chất liệu 100% cotton cao cấp thấm hút tốt, pha sợi spandex giúp co giãn và không co rút, nhăn nhàu khi sử dụng. Đường chỉ may tỉ mỉ, tinh tế đến từng chi tiết nhỏ. Màu sắc nổi bật, kiểu dáng hiện đại, giúp bạn tự tin và lịch lãm hơn.', 'a:6:{s:1:\"s\";i:7;s:1:\"m\";i:9;s:1:\"l\";i:6;s:2:\"xl\";s:2:\"10\";i:28;i:-1;i:27;i:-1;}', 72, '2018-01-10', '1'),
(20, 'A551', 'ÁO SƠ MI HÀN QUỐC TRẮNG KEM TRƠN', 106, 22, 'upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-1_thump.jpg upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-2_thump.jpg upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-3_thump.jpg upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-4_thump.jpg', 'upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-1_thump.jpg upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-2_thump.jpg upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-3_thump.jpg upload/resize/ao-so-mi-han-quoc-trang-kem-tron-asm788-7251-slide-4_thump.jpg', 200000, 245000, 'Áo Sơ Mi Hàn Quốc Trắng Kem Trơn màu sắc trang nhã, thiết kế hiện đại không gây cảm giác nhàm chán. Form ôm, vải suông, tay dài, cổ trụ phối nút tạo điểm nhấn tinh tế cho sản phẩm. Chất liệu cao cấp từ 100% cotton thấm hút tốt, pha sợi spandex giúp sản phẩm có độ co giãn, không nhăn nhàu co rút sau khi giặt. Thiết kế theo phong cách Hàn Quốc rất thời trang và hiện đại, giúp bạn thêm chuyên nghiệp, lịch lãm và nam tính hơn.', 'a:4:{s:1:\"s\";i:9;s:1:\"m\";s:2:\"10\";s:1:\"l\";i:0;s:2:\"xl\";s:2:\"10\";}', 17, '2018-01-10', '1'),
(21, 'A3516', 'ÁO SƠ MI HÀN QUỐC XANH ĐEN TRƠN', 106, 22, 'upload/resize/ao-so-mi-han-quoc-xanh-den-tron-asm788-7255-slide-1_thump.jpg upload/resize/ao-so-mi-han-quoc-xanh-den-tron-asm788-7255-slide-2_thump.jpg upload/resize/ao-so-mi-han-quoc-xanh-den-tron-asm788-7255-slide-3_thump.jpg', 'upload/resize/ao-so-mi-han-quoc-xanh-den-tron-asm788-7255-slide-1_thump.jpg upload/resize/ao-so-mi-han-quoc-xanh-den-tron-asm788-7255-slide-2_thump.jpg upload/resize/ao-so-mi-han-quoc-xanh-den-tron-asm788-7255-slide-3_thump.jpg', 200000, 245000, 'Áo Sơ Mi Hàn Quốc Xanh Đen Trơn  với thiết kế cổ trụ, tay dài, form ôm nhẹ, phối nút ở cổ áo tinh tế. Thiết kế đơn giản theo phong cách Hàn Quốc rất thời trang, vải trơn thanh lịch, chất liệu 100% cotton cao cấp thấm hút tốt. Đường chỉ may tỉ mỉ, tinh tế đến từng chi tiết nhỏ. Màu sắc nổi bật, kiểu dáng hiện đại, giúp bạn tự tin và lịch lãm hơn.', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";i:4;s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 3, '2018-01-10', '1'),
(23, 'A441', 'ÁO SƠ MI TRẮNG KEM', 106, 22, 'upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-1_thump.jpg upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-2_thump.jpg upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-3_thump.jpg upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-4_thump.jpg', 'upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-1_thump.jpg upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-2_thump.jpg upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-3_thump.jpg upload/resize/ao-so-mi-trang-kem-asm836-8193-slide-4_thump.jpg ', 200000, 245000, 'Màu trắng kem luôn mang đến cho người mặc sự thanh lịch, nhã nhặn như chiếc Áo Sơ Mi Trắng Kem này. Áo co giãn rất thoải mái và thấm hút mồ hôi cực tốt nhờ chất liệu từ cotton cao cấp. Điểm nhấn của chiếc áo nằm ở những đường lượn cong nhiều màu trải đều khắp mặt áo rất ấn tượng. Đảm bảo sẽ làm bật lên style ăn mặc hiện đại của bạn.', 'a:5:{s:1:\"m\";i:9;s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";i:27;i:-2;i:29;i:-1;}', 15, '2018-01-11', '1'),
(28, 'A792', 'ÁO SƠ MI TRẮNG KEM', 107, 22, 'upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-1_thump.jpg upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-2_thump.jpg upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-3_thump.jpg upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-4_thump.jpg', 'upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-1_thump.jpg upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-2_thump.jpg upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-3_thump.jpg upload/resize/ao-so-mi-trang-kem-asm838-8198-slide-4_thump.jpg ', 200000, 245000, 'Áo Sơ Mi Trắng Kem thanh lịch với màu trắng kem nhã nhặn, chất liệu cao cấp từ cotton co giãn, thấm hút tốt, giúp sản phẩm không những bền đẹp mà còn có giá trị sử dụng rất cao. Chiếc áo được nhấn nhá với những họa tiết nhỏ, trải đều khắp mặt áo rất ấn tượng. Đảm bảo sẽ làm bật lên style ăn mặc hiện đại của bạn.', 'a:2:{s:1:\"l\";i:0;s:2:\"xl\";s:2:\"10\";}', 6, '2018-01-11', '1'),
(30, 'A3007', 'ÁO SƠ MI HỌA TIẾT ĐỎ ĐÔ', 107, 22, 'upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-1_thump.jpg upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-2_thump.jpg upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-3_thump.jpg upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-4_thump.jpg', 'upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-1_thump.jpg upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-2_thump.jpg upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-3_thump.jpg upload/resize/ao-so-mi-hoa-tiet-do-do-asm706-5720-slide-4_thump.jpg ', 200000, 225000, 'Áo Sơ Mi Họa Tiết Đỏ Đô kiểu dáng trẻ trung, phối họa tiết lạ mắt tạo điểm nhấn cho sản phẩm. Màu đỏ đô nổi bật, tay dài, cổ bẻ cao thời trang. Tên và logo thương hiệu gắn bên ngực phải mang đến sự khác biệt cho sản phẩm. Chất liệu vải cotton cao cấp bền đẹp, không nhăn, thấm hút mồ hôi tốt tạo sự thoải mái khi mặc.\r\n\r\n', 'a:2:{s:1:\"l\";i:9;s:2:\"xl\";s:2:\"10\";}', 5, '2018-01-11', '1'),
(32, 'A5771', 'ÁO SƠ MI CA RÔ XANH ĐEN', 108, 22, 'upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7937-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7937-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7937-slide-4_thump.jpg', 'upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7937-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7937-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7937-slide-4_thump.jpg ', 200000, 245000, 'Áo Sơ Mi Ca Rô Xanh Đen màu sắc tươi sáng, nổi bật với những đường sọc caro xanh đen cá tính cho người mặc nét sang trọng, lịch lãm. Kiểu dáng thanh lịch, hợp thời trang, phù hợp với nhiều đối tượng. Hãy bắt đầu ngày mới với những sắc màu trẻ trung, tươi sáng từ Áo sơ mi của 4MEN.\r\n\r\n', 'a:2:{s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-11', '1'),
(33, 'A5042', 'ÁO SƠ MI CA RÔ XANH ĐEN', 108, 22, 'upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-4_thump.jpg', 'upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm886-8768-slide-4_thump.jpg ', 150000, 195000, '', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-11', '1'),
(35, 'A6757', 'ÁO SƠ MI SỌC XANH RÊU ASM840', 108, 22, 'upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-1_thump.jpg upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-2_thump.jpg upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-3_thump.jpg upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-4_thump.jpg', 'upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-1_thump.jpg upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-2_thump.jpg upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-3_thump.jpg upload/resize/ao-so-mi-soc-xanh-reu-asm840-8259-slide-4_thump.jpg ', 200000, 245000, 'Áo Sơ Mi Sọc Xanh Rêu với những đường sọc màu bắt mắt đã phá tan sự giản đơn của một chiếc áo sơ mi trắng. Kiểu dáng thanh lịch, hợp thời trang, phù hợp với nhiều đối tượng. Sọc màu xanh rêu cá tính ở ngực phải tạo nên điểm nhấn cho sản phẩm cũng như sự thu hút cho người mặc.', 'a:2:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";}', 0, '2018-01-11', '1'),
(36, 'A6208', 'ÁO SƠ MI CA RÔ XANH LÁ CÂY', 108, 22, 'upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-4_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-5_thump.jpg', 'upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-4_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-la-cay-asm858-8504-slide-5_thump.jpg', 150000, 195000, 'Nếu bạn cảm thấy nhàm chán với Áo sơ mi trơn thì hãy thay đổi diện mạo với Áo Sơ Mi Ca Rô Xanh Lá Cây cá tính này. Màu xanh lá cây tươi sáng phối những đường sọc caro nhỏ bắt mắt tạo nên sự nổi bật cho người mặc. Bên cạnh đó, thiết kế dáng cổ trụ cài nút lịnh lãm, tay dài, cùng hàng nút cài tiệp màu áo càng làm tăng lên vẻ thu hút.', 'a:0:{}', 2, '2018-01-11', '0'),
(37, 'A4311', 'ÁO SƠ MI NGẮN TAY TRẮNG KEM', 109, 22, 'upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-2_thump.jpg upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-3_thump.jpg upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-4_thump.jpg', 'upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-2_thump.jpg upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-3_thump.jpg upload/resize/ao-so-mi-ngan-tay-trang-kem-asm776-7005-slide-4_thump.jpg ', 200000, 225000, 'Áo Sơ Mi Ngắn Tay Trắng Kem thiết kế tinh tế đi cùng màu sắc trang nhã. Cổ trụ phối nút, tay ngắn, đường may đều đẹp chắc chắn. Đường viền cổ phối khác màu và logo nho nhỏ trên ngực áo tạo điểm nhấn. Chất liệu cao cấp 100% cotton thấm hút tốt, pha sợi spandex giúp sản phẩm vừa ôm dáng khoe body vừa co giãn cực thoải mái cho người mặc, lại không nhăn nhàu không co rút. Sản phẩm giúp bạn nam có vẻ ngoài lịch lãm và sang trọng hơn, nhưng vẫn giữ được nét tươi trẻ và hiện đại.', 'a:2:{s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-11', '1'),
(38, 'A6907', 'ÁO SƠ MI NGẮN TAY ĐỎ ĐÔ', 109, 22, 'upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-2_thump.jpg upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-3_thump.jpg upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-4_thump.jpg', 'upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-2_thump.jpg upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-3_thump.jpg upload/resize/ao-so-mi-ngan-tay-do-do-asm776-7003-slide-4_thump.jpg ', 200000, 225000, 'Áo Sơ Mi Ngắn Tay Đỏ Đô thiết kế hiện đại, màu đỏ đô nam tính và lịch lãm. Chất liệu cao cấp 100% cotton thấm hút tốt, pha sợi spandex nên sản phẩm tăng độ co giãn, không nhăn nhàu và co rút. Thiết kế mới lạ, cổ trụ phối nút nam tính, đường viền cổ khác màu và logo trên ngực áo tạo điểm nhấn cho sản phẩm. Đường chỉ may đều đẹp chắc chắn. Sản phẩm giúp người mặc nổi bật và cuốn hút hơn.', 'a:2:{s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-11', '1'),
(39, 'A2555', 'ÁO SƠ MI NGẮN TAY ĐEN', 109, 22, 'upload/resize/ao-so-mi-ngan-tay-den-asm710-6052-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-den-asm710-6052-slide-2_thump.jpg', 'upload/resize/ao-so-mi-ngan-tay-den-asm710-6052-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-den-asm710-6052-slide-2_thump.jpg ', 150000, 185000, 'Áo Sơ Mi Ngắn Tay Đen màu đen nam tính phối viền cổ áo, cổ tay áo và túi trước ngực tạo điểm nhấn cho sản phẩm. Thiết kế đơn giản với áo cổ bẻ, tay ngắn trẻ trung. Form áo ôm vừa vặn, đường may đẹp, tinh tế mang đến vẻ ngoài thanh lịch, nam tính. Chất liệu cotton mềm mại, thấm hút mồ hôi, mang lại cảm giác thoải mái khi mặc .', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-11', '1'),
(40, 'A4822', 'ÁO SƠ MI NGẮN TAY XANH BÍCH', 109, 22, 'upload/resize/ao-so-mi-ngan-tay-xanh-bich-asm710-6054-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-bich-asm710-6054-slide-2_thump.jpg', 'upload/resize/ao-so-mi-ngan-tay-xanh-bich-asm710-6054-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-bich-asm710-6054-slide-2_thump.jpg', 150000, 185000, 'Áo Sơ Mi Ngắn Tay Xanh Bích Gam màu xanh bích phối viền cổ áo, cổ tay áo và túi trước ngực tạo điểm nhấn.\r\n- Thiết kế đơn giản với áo cổ bẻ, tay ngắn trẻ trung.\r\n- Form áo ôm vừa vặn, đường may đẹp, tinh tế mang đến vẻ ngoài thanh lịch, nam tính.\r\n- Chất liệu cotton mềm mại, thấm hút mồ hôi, mang lại cảm giác thoải mái khi mặc', 'a:1:{i:27;s:1:\"0\";}', 12, '2018-01-11', '0'),
(41, 'A8543', 'ÁO SƠ MI NGẮN TAY CA RÔ ĐEN', 108, 22, 'upload/resize/ao-so-mi-ca-ro-den-asm912-8796-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-den-asm912-8796-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-den-asm912-8796-slide-4_thump.jpg', 'upload/resize/ao-so-mi-ca-ro-den-asm912-8796-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-den-asm912-8796-slide-3_thump.jpg upload/resize/ao-so-mi-ca-ro-den-asm912-8796-slide-4_thump.jpg ', 150000, 185000, '', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-12', '1'),
(43, 'A603', 'ÁO SƠ MI NGẮN TAY XANH RÊU', 108, 22, 'upload/resize/ao-so-mi-ca-ro-xanh-reu-asm904-8782-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-reu-asm904-8782-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-reu-asm904-8782-slide-3_thump.jpg', 'upload/resize/ao-so-mi-ca-ro-xanh-reu-asm904-8782-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-reu-asm904-8782-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-reu-asm904-8782-slide-3_thump.jpg ', 150000, 185000, '', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-12', '1'),
(44, 'A5', 'ÁO SƠ MI CỔ LÃNH TỤ NGẮN TAY TRẮNG', 109, 22, 'upload/resize/ao-so-mi-co-lanh-tu-ngan-tay-trang-asm798-7571-slide-1_thump.jpg upload/resize/ao-so-mi-co-lanh-tu-ngan-tay-trang-asm798-7571-slide-2_thump.jpg upload/resize/ao-so-mi-co-lanh-tu-ngan-tay-trang-asm798-7571-slide-3_thump.jpg', 'upload/resize/ao-so-mi-co-lanh-tu-ngan-tay-trang-asm798-7571-slide-1_thump.jpg upload/resize/ao-so-mi-co-lanh-tu-ngan-tay-trang-asm798-7571-slide-2_thump.jpg upload/resize/ao-so-mi-co-lanh-tu-ngan-tay-trang-asm798-7571-slide-3_thump.jpg ', 200000, 225000, 'Áo Sơ Mi Cổ Lãnh Tụ Ngắn Tay Trắng thiết kế tay ngắn năng động, form ôm, mang phong cách thời trang Hàn quốc tạo cảm giác sang trọng và đẳng cấp cho người mặc. Dáng cổ trụ, may những đường viền nhỏ dọc ngực áo tạo điểm nhấn cho sản phẩm. Chất liệu cao cấp từ 100% cotton, pha thêm sợi spandex giúp sản phẩm không những thấm hút tốt, mà còn không nhăn nhàu mất dáng sau khi giặt bởi có độ co giãn. Rất đáng để trải nghiệm!', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-12', '1'),
(45, 'A3320', 'ÁO SƠ MI NGẮN TAY XANH ĐEN', 109, 22, 'upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404cb3a3_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404cdf05_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404ce598_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404de395_thump.jpg', 'upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404cb3a3_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404cdf05_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404ce598_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm880-8746-slide-products-594b7404de395_thump.jpg ', 150000, 185000, 'Áo Sơ Mi Ngắn Tay Xanh Đen thiết kế cổ bẻ ve nhỏ, tay áo ngắn năng động thích hợp cho dân công sở thay đổi diện mạo khô khan thường thấy. Bên cạnh đó, chất cotton cao cấp mang đến cảm giác thoải mái, dễ chịu cho người mặc.', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-12', '1'),
(47, 'A2942', 'ÁO SƠ MI NGẮN TAY XANH ĐEN', 109, 22, 'upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-2_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-3_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-4_thump.jpg', 'upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-1_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-2_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-3_thump.jpg upload/resize/ao-so-mi-ngan-tay-xanh-den-asm869-8664-slide-4_thump.jpg', 200000, 225000, 'Áo Sơ Mi Ngắn Tay Xanh Đen thiết kế theo phong cách thời trang Hàn Quốc, gọn gàng, lịch lãm mang đến cho người mặc vẻ ngoài bắt mắt, thu hút phái nữ.', 'a:0:{}', 0, '2018-01-12', '1'),
(49, 'A1088', 'ÁO THUN CÓ CỔ XANH LÁ CÂY IN NỔI CỜ ĐỨC', 110, 22, 'upload/resize/ao-thun-co-co-xanh-la-cay-in-noi-co-duc-at519-336-p_thump.jpg upload/resize/ao-thun-co-co-xanh-la-cay-in-noi-co-duc-at519-336-p(1)_thump.jpg', 'upload/resize/ao-thun-co-co-xanh-la-cay-in-noi-co-duc-at519-336-p_thump.jpg upload/resize/ao-thun-co-co-xanh-la-cay-in-noi-co-duc-at519-336-p(1)_thump.jpg ', 100000, 170000, '', 'a:2:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";}', 2, '2018-01-12', '1'),
(50, 'A9312', 'ÁO THUN CÁ SẤU XANH LÁ CÂY', 110, 22, 'upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-4_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-5_thump.jpg', 'upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-4_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at632-7961-slide-5_thump.jpg ', 150000, 195000, '', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 1, '2018-01-12', '1'),
(51, 'A4261', 'ÁO THUN CÁ SẤU CỔ LÃNH TỤ ĐEN', 110, 22, 'upload/resize/ao-thun-ca-sau-den-at574-6225-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-den-at574-6225-slide-2_thump.jpg', 'upload/resize/ao-thun-ca-sau-den-at574-6225-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-den-at574-6225-slide-2_thump.jpg ', 150000, 195000, 'Áo Thun Cá Sấu Cổ Lãnh Tụ Đen AT574 màu đen cá tính phối đỏ đô bên tay áo tạo điểm nhấn cho sản phẩm. Thiết kế tay ngắn, cổ lãnh tụ kèm nút, phối hàng chữ dọc chạy theo nút thời trang. Chất liệu thun cotton mềm mại, co giãn tạo sự thoáng mát khi mặc. Logo và chữ CITIZEN sử dụng công nghệ in cao được in nổi bật bên ngực áo. Form áo ôm body.\r\n\r\n', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-12', '1'),
(52, 'A8432', 'ÁO THUN CÁ SẤU CỔ LÃNH TỤ XANH LÁ CÂY', 110, 22, 'upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-4_thump.jpg', 'upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at574-6229-slide-4_thump.jpg', 150000, 195000, 'Áo Thun Cá Sấu Cổ Lãnh Tụ Xanh Lá Cây màu xanh lá cây tươi sáng phối màu trắng kem ở tay áo tạo điểm nhấn nổi bật cho sản phẩm. Thiết kế tay ngắn, cổ lãnh tụ kèm nút, phối hàng chữ dọc chạy theo nút thời trang. Chất liệu thun cotton mềm mại, co giãn tạo sự thoáng mát khi mặc. Logo và chữ CITIZEN sử dụng công nghệ in cao được in nổi bật bên ngực áo. Form áo ôm body giúp chàng ôm dáng và khoe hình thể chuẩn. Sản phẩm mới, mang đến phong cách năng động, khỏe khoắn cho người mặc.', 'a:4:{s:1:\"s\";s:1:\"0\";s:1:\"m\";s:1:\"0\";s:1:\"l\";s:1:\"0\";s:2:\"xl\";s:1:\"0\";}', 0, '2018-01-12', '0'),
(53, 'A267', 'ÁO THUN CÁ SẤU CỔ LÃNH TỤ VÀNG ', 110, 22, 'upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-4_thump.jpg', 'upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-vang-at574-6228-slide-4_thump.jpg', 150000, 195000, 'Áo Thun Cá Sấu Cổ Lãnh Tụ Vàng màu vàng phối trắng ở tay áo tạo điểm nhấn nổi bật. Thiết kế tay ngắn, cổ lãnh tụ kèm nút, phối hàng chữ dọc chạy theo nút thời trang. Chất liệu thun cotton mềm mại, co giãn tạo sự thoáng mát khi mặc. Logo và chữ CITIZEN sử dụng công nghệ in cao được in nổi bật bên ngực áo. Form áo ôm body giúp chàng ôm dáng và khoe hình thể chuẩn, áo có nhiều size giúp bạn dễ đàng lựa chọn sản phẩm phù hợp.\r\n\r\n', 'a:3:{s:1:\"m\";s:1:\"2\";s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"1\";}', 1, '2018-01-12', '1'),
(54, 'A8182', 'ÁO THUN CÁ SẤU XÁM MUỐI TIÊU', 110, 22, 'upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-4_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-5_thump.jpg', 'upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-4_thump.jpg upload/resize/ao-thun-ca-sau-xam-muoi-tieu-at587-6518-slide-5_thump.jpg', 150000, 195000, 'Áo Thun Cá Sấu Xám Muối Tiêu thiết kế tay ngắn, cổ bẻ tạo sự khỏe khoắn năng động. Màu xám muối tiêu phối xanh trên vai áo cùng các đường sọc ngang trên thân áo. Họa tiết xe đạp được in cao bên ngực phải áo Chất liệu thun cá sấu mềm mại, co giãn tốt, mặc thoáng mát. Form ôm body giúp tôn dáng và body chuẩn hoàn hảo.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2018-01-12', '1'),
(55, 'A7230', 'ÁO THUN CÁ SẤU XANH LÁ CÂY ', 110, 22, 'upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-4_thump.jpg', 'upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-1_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-2_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-3_thump.jpg upload/resize/ao-thun-ca-sau-xanh-la-cay-at580-6344-slide-4_thump.jpg', 150000, 195000, 'Áo Thun Cá Sấu Xanh Lá Cây màu xanh lá cây tươi sáng phối viền trắng ở cổ áo. Thiết kế tay ngắn, cổ lãnh tụ kèm nút gài cá tính, năng động. Chất liệu thun cá sấu mềm mại, co giãn tạo sự thoáng mát khi mặc. Logo sử dụng công nghệ in cao được in nổi bật bên ngực áo. Form áo ôm body giúp chàng ôm dáng và khoe hình thể chuẩn cho nam giới', 'a:3:{s:1:\"m\";s:1:\"1\";s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"1\";}', 0, '2018-01-12', '1'),
(56, 'A6533', 'ÁO THUN CỔ TRÒN ĐỎ ĐÔ PRADA', 111, 22, 'upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-1_thump.jpg upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-2_thump.jpg upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-3_thump.jpg upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-4_thump.jpg', 'upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-1_thump.jpg upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-2_thump.jpg upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-3_thump.jpg upload/resize/ao-thun-co-tron-do-do-prada-at540-4896-slide-4_thump.jpg', 120000, 165000, 'Áo Thun Cổ Tròn Đỏ Đô AT540 chất liệu thun thoáng mát. Thiết kế form áo body ôm vừa, cổ tròn, tay ngắn, phối chữ và họa tiết lạ, tạo sự trẻ trung, năng động cho người mặc.\r\n\r\n', 'a:3:{s:1:\"m\";s:1:\"1\";s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"1\";}', 1, '2018-01-12', '1'),
(99, 'K6838', 'ÁO SƠ MI CA RÔ XANH DƯƠNG', 100, 28, 'upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7936-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7936-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7936-slide-3_thump.jpg', 'upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7936-slide-1_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7936-slide-2_thump.jpg upload/resize/ao-so-mi-ca-ro-xanh-den-asm832-7936-slide-3_thump.jpg ', 50000, 122000, 'Áo Sơ Mi Ca Rô Xanh Dương thiết kế dạng cổ bẻ, tay dài phối nút cài kín đáo. Sọc caro màu xanh dương nổi bật trên nền vải trắng tạo sự thu hút cho sản phẩm cũng như người mặc. Phong cách Hàn Quốc, form ôm body gọn gàng giúp bạn nam khoe dáng chuẩn nhưng vẫn thoải mái khi vận động.', 'a:3:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";}', 3, '2018-01-13', '1'),
(100, 'K4544', 'ÁO SƠ MI XANH ĐEN', 100, 26, 'upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b39246c6d4_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b39247fde6_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b392480d37_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b392478136_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b392488820_thump.jpg', 'upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b39246c6d4_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b39247fde6_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b392480d37_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b392478136_thump.jpg upload/resize/ao-so-mi-xanh-den-asm873-8731-slide-products-594b392488820_thump.jpg ', 70000, 130000, 'Áo Sơ Mi Xanh Đen thiết kế theo phong cách thời trang Hàn Quốc, tôn dáng hoàn hảo cho người mặc. Chất liệu được tối ưu hơn khi có pha sợi spandex khiến sản phẩm co giãn và thấm hút hiệu quả. Một lựa chọn mới cho các chàng trai công sở.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";i:27;i:-1;}', 1, '2018-01-13', '1'),
(101, 'K9357', 'ÁO SƠ MI TRẮNG', 100, 25, 'upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f8c0b6_thump.jpg upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f94c55_thump.jpg upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f94d66_thump.jpg upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f946d7_thump.jpg', 'upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f8c0b6_thump.jpg upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f94c55_thump.jpg upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f94d66_thump.jpg upload/resize/ao-so-mi-trang-asm874-8733-slide-products-594b405f946d7_thump.jpg ', 70000, 130000, 'F5 phong cách công sở thường ngày của bạn với Áo Sơ Mi Trắng cùng những họa tiết thêu tay, cập nhật theo xu hướng thời trang nam mới nhất. Với item này, bạn sẽ trở thành chàng soái ca lãng tử và vô cùng cuốn hút.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2018-01-13', '1'),
(102, 'K6790', 'ÁO SƠ MI XANH ĐEN', 100, 26, 'upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8dd7b8_thump.jpg upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8e50f2_thump.jpg upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8e260f_thump.jpg upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8f1f61_thump.jpg', 'upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8dd7b8_thump.jpg upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8e50f2_thump.jpg upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8e260f_thump.jpg upload/resize/ao-so-mi-xanh-den-asm874-8734-slide-products-594b48d8f1f61_thump.jpg ', 80000, 130000, 'Áo Sơ Mi Xanh Đen được làm từ chất liệu cotton lụa cao cấp, tạo độ bóng mịn sang trọng. Mang nét lãng đãng cho các chàng trai nhờ những họa tiết hoa bồ công anh thêu tay tỉ mỉ ở ngực áo.', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-13', '1'),
(103, 'K6834', 'ÁO THUN TRẮNG', 100, 24, 'upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d055c2734_thump.jpg upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d055f20b4_thump.jpg upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d0562da45_thump.jpg upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d0565c86e_thump.jpg', 'upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d055c2734_thump.jpg upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d055f20b4_thump.jpg upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d0562da45_thump.jpg upload/resize/ao-thun-xanh-den-at719-9172-slide-products-59e1d0565c86e_thump.jpg ', 50000, 87000, '', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-13', '1'),
(104, 'K4775', 'ÁO KHOÁC DA XANH ĐEN', 100, 30, 'upload/resize/ao-khoac-xanh-den-ak208-8445-slide-1_thump.jpg upload/resize/ao-khoac-xanh-den-ak208-8445-slide-4_thump.jpg', 'upload/resize/ao-khoac-xanh-den-ak208-8445-slide-1_thump.jpg upload/resize/ao-khoac-xanh-den-ak208-8445-slide-4_thump.jpg ', 150000, 312000, 'Áo Khoác Da Xanh Đen tạo nên nét mới lạ cho kiểu áo khoác da thường thấy. Vẫn là form áo suông thoải mái, dáng tay dài, cổ trụ thấp cá tính. AK208 còn được dập nổi các họa tiết caro, hoa lá đẹp mắt ở ngực áo. Hứa hẹn mang đến cho người mặc nhiều trải nghiệm thú vị.', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-13', '1'),
(105, 'K194', 'ÁO SƠ MI XANH ĐEN', 100, 23, 'upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f0a1d5_thump.jpg upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f1fb68_thump.jpg upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f185ab_thump.jpg upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f12302_thump.jpg', 'upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f0a1d5_thump.jpg upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f1fb68_thump.jpg upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f185ab_thump.jpg upload/resize/ao-so-mi-xanh-den-asm919-8940-slide-59730e4f12302_thump.jpg ', 80000, 130000, '', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2018-01-13', '1'),
(106, 'K7108', 'ÁO KHOÁC DA NÂU', 100, 26, 'upload/resize/ao-khoac-da-nau-ak208-8444-slide-1_thump.jpg upload/resize/ao-khoac-da-nau-ak208-8444-slide-2_thump.jpg upload/resize/ao-khoac-da-nau-ak208-8444-slide-3_thump.jpg', 'upload/resize/ao-khoac-da-nau-ak208-8444-slide-1_thump.jpg upload/resize/ao-khoac-da-nau-ak208-8444-slide-2_thump.jpg upload/resize/ao-khoac-da-nau-ak208-8444-slide-3_thump.jpg ', 150000, 312000, 'Áo Khoác Da Nâu được tạo điểm nhấn với những họa tiết bắt mắt được dập nổi ở ngực áo. Màu da nâu sang trọng, đường nét gãy gọn, đẹp mắt. Thiết kế dáng cổ trụ thấp có nút cài, tay dài, túi hông sâu rộng có khóa kéo. Áo có khóa kéo dài linh hoạt, rất tiện lợi được phối cả ở cổ tay.', 'a:5:{s:1:\"s\";i:9;s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 3, '2018-01-13', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_ship`
--

CREATE TABLE `tb_ship` (
  `id_ship` int(11) NOT NULL,
  `code_ship` char(10) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `status_ship` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `account_user` char(100) NOT NULL,
  `pass_user` text NOT NULL,
  `name_user` varchar(100) NOT NULL,
  `birthday_user` date NOT NULL,
  `cmnd_user` char(13) NOT NULL,
  `address_user` text NOT NULL,
  `phonenumber_user` char(11) NOT NULL,
  `email_user` char(100) NOT NULL,
  `type_user` char(2) NOT NULL,
  `status_user` int(11) NOT NULL,
  `code` mediumint(50) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `account_user`, `pass_user`, `name_user`, `birthday_user`, `cmnd_user`, `address_user`, `phonenumber_user`, `email_user`, `type_user`, `status_user`, `code`, `status`) VALUES
(7, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Nông Văn Chiến', '1997-10-18', '362489844', '188/48B Nguyễn Văn Cừ', '01262898272', 'chien@gmail.com', '0', 1, 0, 'verified'),
(10, 'nhanvien', '2a2fa4fe2fa737f129ef2d127b861b7e', 'Phạm Huyền My', '2003-12-10', '123456789', 'Nguyễn Văn Cừ', '01262898272', 'huyenmy@gmail.com', '1', 1, 0, 'verified'),
(43, 'chienkh6b.vn@gmail.com', '70393d54c6f1edb7edb0ffaf0b6694bd', 'Nông Văn Chiến', '2003-08-01', '', 'Tuyen Quang', '0867476810', 'chienkh6b.vn@gmail.com', '2', 1, 142347, 'verified'),
(56, '20211891@eaut.edu.vn', '3c37b8686f44f400225246f813908933', 'Nông Văn Chiến', '2004-08-04', '', 'Tuyên Quang', '0867476810', '20211891@eaut.edu.vn', '2', 1, 699510, 'notverified');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tb_bill`
--
ALTER TABLE `tb_bill`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `fk_order` (`id_order`);

--
-- Chỉ mục cho bảng `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Chỉ mục cho bảng `tb_city`
--
ALTER TABLE `tb_city`
  ADD PRIMARY KEY (`id_city`);

--
-- Chỉ mục cho bảng `tb_contact`
--
ALTER TABLE `tb_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `fk_user` (`id_user`);

--
-- Chỉ mục cho bảng `tb_district`
--
ALTER TABLE `tb_district`
  ADD PRIMARY KEY (`id_district`),
  ADD KEY `fk_city` (`id_city`);

--
-- Chỉ mục cho bảng `tb_information`
--
ALTER TABLE `tb_information`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tb_label`
--
ALTER TABLE `tb_label`
  ADD PRIMARY KEY (`id_label`);

--
-- Chỉ mục cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fk_product` (`id_product`),
  ADD KEY `fk_district_order` (`id_district`),
  ADD KEY `fk_customer` (`id_customer`);

--
-- Chỉ mục cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_label` (`id_label`),
  ADD KEY `fk_category` (`id_category`);

--
-- Chỉ mục cho bảng `tb_ship`
--
ALTER TABLE `tb_ship`
  ADD PRIMARY KEY (`id_ship`),
  ADD KEY `fk_bill_ship` (`id_bill`);

--
-- Chỉ mục cho bảng `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tb_bill`
--
ALTER TABLE `tb_bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT cho bảng `tb_city`
--
ALTER TABLE `tb_city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `tb_contact`
--
ALTER TABLE `tb_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tb_district`
--
ALTER TABLE `tb_district`
  MODIFY `id_district` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `tb_information`
--
ALTER TABLE `tb_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `tb_label`
--
ALTER TABLE `tb_label`
  MODIFY `id_label` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT cho bảng `tb_ship`
--
ALTER TABLE `tb_ship`
  MODIFY `id_ship` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tb_bill`
--
ALTER TABLE `tb_bill`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`id_order`) REFERENCES `tb_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_district`
--
ALTER TABLE `tb_district`
  ADD CONSTRAINT `fk_city` FOREIGN KEY (`id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`id_customer`) REFERENCES `tb_customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_district_order` FOREIGN KEY (`id_district`) REFERENCES `tb_district` (`id_district`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`id_product`) REFERENCES `tb_product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`id_category`) REFERENCES `tb_category` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_label` FOREIGN KEY (`id_label`) REFERENCES `tb_label` (`id_label`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_ship`
--
ALTER TABLE `tb_ship`
  ADD CONSTRAINT `fk_bill_ship` FOREIGN KEY (`id_bill`) REFERENCES `tb_bill` (`id_bill`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
