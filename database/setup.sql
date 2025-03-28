-- Xóa database nếu đã tồn tại và tạo mới
DROP DATABASE IF EXISTS bke_electronics;
CREATE DATABASE bke_electronics;
USE bke_electronics;

-- Tạo bảng users
CREATE TABLE users (
    user_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(25) NOT NULL,
    user_email VARCHAR(55) NOT NULL UNIQUE,
    user_pass VARCHAR(255) NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng products
CREATE TABLE products (
    product_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_description TEXT NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng orders
CREATE TABLE orders (
    order_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Tạo bảng order_details
CREATE TABLE order_details (
    order_detail_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    order_id INT(11) NOT NULL,
    product_id INT(11) NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);


USE bke_electronics;

-- Thêm dữ liệu vào bảng users
INSERT INTO users (user_name, user_email, user_pass) VALUES
('Nguyen Van A', 'nguyenvana@gmail.com', 'password123'),
('Tran Thi B', 'tranthib@gmail.com', 'password456'),
('Le Van C', 'levanc@gmail.com', 'password789'),
('Pham Thi D', 'phamthid@gmail.com', 'passwordabc'),
('Hoang Van E', 'hoangvane@gmail.com', 'passwordxyz');

-- Thêm dữ liệu vào bảng products
INSERT INTO products (product_name, product_price, product_description) VALUES
('Laptop Dell Inspiron', 15000000, 'Laptop Dell màn hình 15.6 inch, Core i5'),
('iPhone 13 Pro Max', 25000000, 'Điện thoại Apple iPhone 13 Pro Max 128GB'),
('Smart TV Samsung 55 inch', 12000000, 'TV Samsung 4K UHD 55 inch hiện đại'),
('Tai nghe Sony WH-1000XM4', 5000000, 'Tai nghe chống ồn cao cấp Sony'),
('Máy lạnh Daikin Inverter 1.5 HP', 10000000, 'Máy lạnh tiết kiệm điện Daikin');

-- Thêm dữ liệu vào bảng orders
INSERT INTO orders (user_id) VALUES
(1),
(2),
(3),
(4),
(5);

-- Thêm dữ liệu vào bảng order_details
INSERT INTO order_details (order_id, product_id) VALUES
(1, 2), -- Người dùng 1 mua iPhone 13 Pro Max
(1, 4), -- Người dùng 1 mua Tai nghe Sony
(2, 3), -- Người dùng 2 mua Smart TV Samsung
(3, 1), -- Người dùng 3 mua Laptop Dell
(4, 5); -- Người dùng 4 mua Máy lạnh Daikin
