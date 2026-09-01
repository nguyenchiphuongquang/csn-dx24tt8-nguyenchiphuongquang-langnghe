-- T?o Database
CREATE DATABASE IF NOT EXISTS db_langnghe_vietnam DEFAULT CHARACTER SET utf8mb4;
USE db_langnghe_vietnam;

-- 1. B?ng Ð?a phuong (Locations)
CREATE TABLE locations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. B?ng Lo?i ngh? (Categories)
CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. B?ng Làng ngh? (Craft_Villages)
CREATE TABLE craft_villages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location_id INT NOT NULL,
  category_id INT NOT NULL,
  address VARCHAR(255) NOT NULL,
  history LONGTEXT NOT NULL,
  featured_products TEXT NOT NULL,
  image_url VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- 4. B?ng Ngu?i dùng / Qu?n tr? viên (Users)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  role ENUM('admin', 'editor') DEFAULT 'admin',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- THÊM D? LI?U M?U (MOCK DATA)
-- Thêm d? li?u Qu?n tr? viên
INSERT INTO users (username, password, full_name, role) VALUES
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Qu?n tr?', 'admin');

-- Thêm d? li?u Ð?a phuong
INSERT INTO locations (id, name) VALUES
(1, 'Hà N?i'),
(2, 'B?c Ninh'),
(3, 'Ninh Thu?n'),
(4, 'Th?a Thiên Hu?'),
(5, 'B?n Tre');

-- Thêm d? li?u Lo?i ngh?
INSERT INTO categories (id, name) VALUES
(1, 'G?m s?'),
(2, 'To l?a - D?t may'),
(3, 'Tranh dân gian'),
(4, 'Mây tre dan'),
(5, 'Th? công m? ngh? khác');

-- Thêm d? li?u 5 Làng ngh? tiêu bi?u
INSERT INTO craft_villages (name, location_id, category_id, address, history) VALUES
('Làng g?m Bát Tràng', 1, 1, 'Xã Bát Tràng, Huy?n Gia Lâm, Hà N?i', 'Làng g?m Bát...'),
('Làng l?a V?n Phúc', 1, 2, 'Phu?ng V?n Phúc, Qu?n Hà Ðông, Hà N?i', 'Làng l?a V?n...'),
('Làng tranh Ðông H?', 2, 3, 'Xã Song H?, Huy?n Thu?n Thành, B?c Ninh', 'Ngh? làm...'),
('Làng g?m Bàu Trúc', 3, 1, 'Th? tr?n Phu?c Dân, Huy?n Ninh Phu?c, Ninh Thu?n', 'E...'),
('Làng ngh? dan lát Bao La', 4, 4, 'Xã Qu?ng Phú, Huy?n Qu?ng Ði?n, Th?a Thiên Huê', '...');