-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 08, 2026 lúc 06:11 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_langnghe_vietnam`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Gốm sứ', NULL, '2026-09-01 14:38:59'),
(2, 'Tơ lụa - Dệt may', NULL, '2026-09-01 14:38:59'),
(3, 'Tranh dân gian', NULL, '2026-09-01 14:38:59'),
(4, 'Mây tre đan', NULL, '2026-09-01 14:38:59'),
(5, 'Thủ công mỹ nghệ khác', NULL, '2026-09-01 14:38:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `craft_villages`
--

CREATE TABLE `craft_villages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `history` longtext NOT NULL,
  `featured_products` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `craft_villages`
--

INSERT INTO `craft_villages` (`id`, `name`, `location_id`, `category_id`, `address`, `history`, `featured_products`, `image_url`, `created_at`) VALUES
(1, 'Làng gốm Bát Tràng', 1, 1, 'Xã Bát Tràng, Huyện Gia Lâm, Hà Nội', 'Làng gốm sứ truyền thống nổi tiếng lâu đời.', '', 'https://hn.ss.bfcplatform.vn/tckt/2022/08/22A08032-1.jpg', '2026-09-08 14:52:34'),
(2, 'Làng lụa Vạn Phúc', 1, 2, 'Phường Vạn Phúc, Quận Hà Đông, Hà Nội', 'Làng dệt lụa tơ tằm thượng hạng.', '', 'https://static.vinwonders.com/production/lang-lua-van-phuc-1.jpg', '2026-09-08 14:52:34'),
(3, 'Làng tranh Đông Hồ', 2, 3, 'Xã Song Hồ, Huyện Thuận Thành, Bắc Ninh', 'Nghề làm tranh dân gian khắc gỗ độc đáo.', '', 'https://media.vietravel.com/images/Content/du-lich-lang-tranh-dong-ho-2.jpg', '2026-09-08 14:52:34'),
(4, 'Làng gốm Bàu Trúc', 3, 1, 'Thị trấn Phước Dân, Huyện Ninh Phước, Ninh Thuận', 'Làng gốm Chăm thủ công nặn bằng tay độc đáo.', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToLK0oPfAijAogauxTgwBTRli1v28KbQMOuffe88rd4A&s=10', '2026-09-08 14:52:34'),
(5, 'Làng nghề đan lát Bao La', 4, 4, 'Xã Quảng Phú, Huyện Quảng Điền, Thừa Thiên Huế', 'Làng nghề truyền thống đan lát tre mây.', '', 'https://bqn.1cdn.vn/2024/07/13/baodanang.vn-dataimages-202407-original-_images1742765_1.gif', '2026-09-08 14:52:34'),
(6, 'Làng nón lá Chuông', 1, 5, 'Xã Phương Trung, Huyện Thanh Oai, Hà Nội', 'Làng nghề làm nón lá truyền thống.', '', 'https://images.vietnamtourism.gov.vn/vn/images/2024/thang_12/30.12_non_lang_chuong.jpg', '2026-09-08 14:52:34'),
(7, 'Làng mây tre đan Phú Vinh', 1, 4, 'Xã Phú Nghĩa, Huyện Chương Mỹ, Hà Nội', 'Thủ công mỹ nghệ từ mây tre tinh xảo.', '', 'https://static.vinwonders.com/production/lang-nghe-may-tre-dan-phu-vinh-4.jpg', '2026-09-08 14:52:34'),
(8, 'Làng chiếu Định Yên', 5, 5, 'Huyện Lấp Vò, Tỉnh Đồng Tháp', 'Nghề dệt chiếu lát truyền thống miền Tây.', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUbStdHawDfO1jrHw7OqwqnF4FSVp8FXnFJS0ApWa_GA&s=10', '2026-09-08 14:52:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Hà Nội', NULL, '2026-09-01 14:38:59'),
(2, 'Bắc Ninh', NULL, '2026-09-01 14:38:59'),
(3, 'Ninh Thuận', NULL, '2026-09-01 14:38:59'),
(4, 'Thừa Thiên Huế', NULL, '2026-09-01 14:38:59'),
(5, 'Bến Tre', NULL, '2026-09-01 14:38:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('admin','editor') DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Quản trị', 'admin', '2026-09-01 14:38:59');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `craft_villages`
--
ALTER TABLE `craft_villages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `craft_villages`
--
ALTER TABLE `craft_villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `craft_villages`
--
ALTER TABLE `craft_villages`
  ADD CONSTRAINT `craft_villages_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_villages_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
