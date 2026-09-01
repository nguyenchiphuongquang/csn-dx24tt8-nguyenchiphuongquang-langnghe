<?php include 'config.php'; ?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Làng Ngh? Truy?n Th?ng Vi?t Nam</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background-color: #f9f9f9; }
        .header { background-color: #2c3e50; color: white; padding: 20px; text-align: center; }
        .container { display: flex; flex-wrap: wrap; gap: 20px; padding: 20px; justify-content: center; }
        .card { background: white; padding: 15px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); width: 300px; }
        .card h3 { color: #e74c3c; margin-top: 0; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Khám Phá Làng Ngh? Truy?n Th?ng Vi?t Nam</h1>
        <p>Gìn gi? b?n s?c - Tôn vinh ngh? nhân</p>
    </div>
    
    <div class="container">
        <?php
        // Truy v?n d? li?u làng ngh? và d?a phuong
        $sql = "SELECT cv.name, cv.address, cv.history, l.name as location 
                FROM craft_villages cv 
                JOIN locations l ON cv.location_id = l.id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<div class='card'>";
                echo "<h3>" . $row['name'] . "</h3>";
                echo "<p><strong>Ð?a phuong:</strong> " . $row['location'] . "</p>";
                echo "<p><strong>Ð?a ch?:</strong> " . $row['address'] . "</p>";
                echo "</div>";
            }
        } else {
            echo "<p>H? th?ng dang c?p nh?t d? li?u làng ngh?...</p>";
        }
        ?>
    </div>
</body>
</html>