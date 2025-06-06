--pessoa_física e pessoa jurídica
-- Conta
CREATE TABLE Individual (
    individual_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT UNIQUE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
--pessoa jurídica
CREATE TABLE LegalEntity (
    legal_entity_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT UNIQUE NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    company_name VARCHAR(100) NOT NULL,
    trade_name VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
-- Endereço
CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    street VARCHAR(100) NOT NULL,
    number VARCHAR(10) NOT NULL,
    complement VARCHAR(50),
    neighborhood VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(2) NOT NULL,
    postal_code VARCHAR(8) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
-- Telefone
CREATE TABLE Phone (
    phone_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    phone_type ENUM('Mobile', 'Landline') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
-- E-mail
CREATE TABLE Email (
    email_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
-- Conta bancária
CREATE TABLE BankAccount (
    bank_account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT UNIQUE NOT NULL,
    bank_name VARCHAR(50) NOT NULL,
    agency_number VARCHAR(10) NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    account_type ENUM('Checking', 'Savings') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
-- Cartão de crédito
CREATE TABLE CreditCard (
    credit_card_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT UNIQUE NOT NULL,
    card_number VARCHAR(16) NOT NULL UNIQUE,
    cardholder_name VARCHAR(100) NOT NULL,
    expiration_date DATE NOT NULL,
    cvv VARCHAR(3) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);