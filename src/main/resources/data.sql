
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS place;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    is_admin TINYINT(1) NOT NULL
   );

CREATE TABLE place (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    description TEXT,
    capacity INT NOT NULL,
    price_per_hour DOUBLE NOT NULL,
    owner_id BIGINT,
    user_renting_id BIGINT,
    CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES users(id),
    CONSTRAINT fk_user_renting FOREIGN KEY (user_renting_id) REFERENCES users(id)
);



CREATE TABLE booking (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    place_id BIGINT NOT NULL,
    time_beginning DATETIME NOT NULL,
    time_ending DATETIME NOT NULL,
    confirmed_checkin BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_place FOREIGN KEY (place_id) REFERENCES place (id) ON DELETE CASCADE
);

INSERT INTO users (name, email, username, password, phone_number, is_admin)
VALUES
    ('Admin User', 'admin@tocloc.com', 'adminuser', 'senha123', '1234567890', TRUE),
    ('John Doe', 'john.doe@example.com', 'johndoe', '$2a$10$YX7oKJ3sKMgK9Pgi6u63BucBJhSRmVuQsZx/XzZXQkvcx4l1CnF2G', '9876543210', FALSE),
    ('Jane Smith', 'jane.smith@example.com', 'janesmith', '$2a$10$h8IOk6b3uLP6Opmy5dmgyOKu5lO9aYuPLhVRLdm7oY8a6vFP3/3wC', '5551234567', FALSE),
    ('Charlie Brown', 'charlie.brown@example.com', 'charliebrown', '$2a$10$LZZsyBK1hNzPfnCmoyclJeIrDUZxhjFFBGHtCoC3m4IYYDd3xhnDW', '4449876543', TRUE),
    ('Emily Davis', 'emily.davis@example.com', 'emilydavis', '$2a$10$SiO.y85tlUdEOo2PHb.UeOVhsZMS9Mx9VmCmLfPfyEt9YpPaA15/a', '3339876543', FALSE);

INSERT INTO place (name, address, description, capacity, price_per_hour, owner_id, user_renting_id)
VALUES
('Arena Beach Tennis', 'Rua das Palmeiras, 123, Rio de Janeiro, RJ', 'Quadra de areia para prática de beach tennis com iluminação noturna.', 10, 80.0, 1, 3),
('Campo Society Estrela', 'Avenida Central, 456, São Paulo, SP', 'Campo de futebol society com grama sintética e vestiários.', 14, 150.0, 4, NULL),
('Quadra Poliesportiva Aurora', 'Travessa das Flores, 789, Curitiba, PR', 'Quadra poliesportiva com marcações para vôlei, basquete e futsal.', 20, 100.0, 4, NULL),
('Espaço Recreativo Horizonte', 'Praça do Sol, 321, Belo Horizonte, MG', 'Área recreativa com quadra poliesportiva e playground infantil.', 25, 120.0, 4, NULL),
('Quadra Coberta Vitória', 'Estrada da Vitória, 654, Porto Alegre, RS', 'Quadra coberta para futsal e handebol, ideal para jogos em dias de chuva.', 18, 110.0, 4, NULL);
