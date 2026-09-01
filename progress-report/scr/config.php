<?php
$host = 'localhost';
$user = 'root';
$pass = ''; // M?c d?nh XAMPP không có m?t kh?u
$db_name = 'db_langnghe_vietnam'; // Tên database dã t?o t? file SQL

$conn = new mysqli($host, $user, $pass, $db_name);
if ($conn->connect_error) {
    die("K?t n?i CSDL th?t b?i: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");
?>