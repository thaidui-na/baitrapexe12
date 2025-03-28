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
