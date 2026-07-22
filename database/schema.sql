CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    gender VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    account_status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE locations (
    location_id INT GENERATED ALWAYS AS PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL
);

CREATE TABLE cards (

    card_id INT PRIMARY KEY,

    customer_id INT NOT NULL,

    card_number_last4 VARCHAR(4) NOT NULL,

    card_type VARCHAR(20) NOT NULL,

    bank_name VARCHAR(100) NOT NULL,

    issue_date DATE NOT NULL,

    expiry_date DATE NOT NULL,

    is_active BOOLEAN NOT NULL,

    FOREIGN KEY (customer_id)

    REFERENCES customers(customer_id)

);

CREATE TABLE devices (

    device_id INT PRIMARY KEY,

    customer_id INT NOT NULL,

    device_name VARCHAR(100) NOT NULL,

    device_type VARCHAR(30) NOT NULL,

    operating_system VARCHAR(30) NOT NULL,

    browser VARCHAR(30) NOT NULL,

    ip_address INET NOT NULL,

    is_trusted BOOLEAN NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)

);

CREATE TABLE transactions (

    transaction_id INT PRIMARY KEY,

    customer_id INT NOT NULL,

    card_id INT NOT NULL,

    merchant_id INT NOT NULL,

    device_id INT NOT NULL,

    location_id INT NOT NULL,

    amount DECIMAL(10,2) NOT NULL,

    currency VARCHAR(3) NOT NULL,

    transaction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    payment_method VARCHAR(30) NOT NULL,

    transaction_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (card_id)
        REFERENCES cards(card_id),

    FOREIGN KEY (merchant_id)
        REFERENCES merchants(merchant_id),

    FOREIGN KEY (device_id)
        REFERENCES devices(device_id),

    FOREIGN KEY (location_id)
        REFERENCES locations(location_id)

);