<h1>Trang Quản trị Admin</h1>
<?php 
include 'config.php'; 

// 1. XỬ LÝ XÓA DỮ LIỆU
if (isset($_GET['delete_id'])) {
    $id = $_GET['delete_id'];
    $sql_delete = "DELETE FROM craft_villages WHERE id = $id";
    $conn->query($sql_delete);
    header("Location: admin.php"); // Tải lại trang sau khi xóa
}

// 2. XỬ LÝ THÊM DỮ LIỆU MỚI
if (isset($_POST['btn_add'])) {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $history = $_POST['history'];
    // Mặc định gán location_id = 1 và category_id = 1 để đơn giản hóa cho bản demo
    $sql_insert = "INSERT INTO craft_villages (name, location_id, category_id, address, history) 
                   VALUES ('$name', 1, 1, '$address', '$history')";
    $conn->query($sql_insert);
    header("Location: admin.php");
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị Làng Nghề</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f9; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #2c3e50; color: white; }
        .btn-delete { color: red; text-decoration: none; font-weight: bold; }
        .form-add { background: white; padding: 15px; border-radius: 5px; margin-bottom: 20px; }
        input[type="text"], textarea { width: 100%; padding: 8px; margin: 5px 0 15px; }
        button { background-color: #27ae60; color: white; padding: 10px 15px; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <h2>Trang Quản Trị Hệ Thống Làng Nghề</h2>
    
    <!-- Form Thêm Dữ Liệu -->
    <div class="form-add">
        <h3>Thêm Làng Nghề Mới</h3>
        <form method="POST" action="admin.php">
            <label>Tên Làng Nghề:</label>
            <input type="text" name="name" required>
            
            <label>Địa chỉ:</label>
            <input type="text" name="address" required>
            
            <label>Lịch sử hình thành:</label>
            <textarea name="history" rows="3" required></textarea>
            
            <button type="submit" name="btn_add">Thêm Mới</button>
        </form>
    </div>

    <!-- Bảng Hiển thị Dữ liệu -->
    <table>
        <tr>
            <th>ID</th>
            <th>Tên Làng Nghề</th>
            <th>Địa Chỉ</th>
            <th>Thao tác</th>
        </tr>
        <?php
        $sql = "SELECT id, name, address FROM craft_villages ORDER BY id DESC";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['id'] . "</td>";
                echo "<td>" . $row['name'] . "</td>";
                echo "<td>" . $row['address'] . "</td>";
                // Nút Xóa có đính kèm ID
                echo "<td><a class='btn-delete' href='admin.php?delete_id=" . $row['id'] . "' onclick='return confirm(\"Bạn có chắc chắn muốn xóa?\")'>Xóa</a></td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='4'>Chưa có dữ liệu</td></tr>";
        }
        ?>
    </table>
</body>
</html>