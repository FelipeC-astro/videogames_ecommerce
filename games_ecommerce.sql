-- Table creation

CREATE TABLE games (
    game_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    platform VARCHAR(100),
    price DECIMAL(10, 2) CHECK(price >= 0), -- USD price
    stock INT,
    release_year INT
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT,
    registration_date DATE
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INT,
    order_date DATE,
    total DECIMAL(10, 2) CHECK(total >= 0), -- USD total
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INT,
    game_id INT,
    quantity INT,
    price DECIMAL(10, 2) CHECK(price >= 0), -- USD price
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);
