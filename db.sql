CREATE TABLE Customer
(
    id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    fullName    VARCHAR(255),
    address     VARCHAR(255),
    phone       VARCHAR(20),
    CMND        VARCHAR(200),
    visaCreated BOOLEAN,
    username    VARCHAR(255) UNIQUE,
    password    VARCHAR(255),
    birth_date  DATE,
    email       VARCHAR(255)
);

CREATE TABLE Employee
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    position   VARCHAR(255),
    username   VARCHAR(255) UNIQUE,
    password   VARCHAR(255),
    birth_date DATE,
    email      VARCHAR(255)
);

CREATE TABLE Address
(
    id       INTEGER PRIMARY KEY AUTO_INCREMENT,
    city     VARCHAR(255) NOT NULL,
    country  VARCHAR(255) NOT NULL,
    airfield VARCHAR(255)
);

CREATE TABLE Flight
(
    id                 nvarchar(7) PRIMARY KEY,
    arrivalAddressID   INT,
    departureAddressID INT,
    flightTime         VARCHAR(255),
    departureTime      DATETIME,
    arrivalTime        DATETIME,
    availableSeats     INT,
    totalSeats         INT,
    FOREIGN KEY (arrivalAddressID) REFERENCES Address (id),
    FOREIGN KEY (departureAddressID) REFERENCES Address (id)
);

CREATE TABLE seatClass
(
    id            INTEGER PRIMARY KEY AUTO_INCREMENT,
    seat_clazz    VARCHAR(200),
    amount        FLOAT,
    seat_class_id INT,
    FOREIGN KEY (seat_class_id) REFERENCES seatClass (id)
);

CREATE TABLE Booking
(
    id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_id   nvarchar(7),
    bookingDate DATETIME,
    seatNumber  VARCHAR(10),
    roundTrip   BOOLEAN,
    seatClassId INT,
    FOREIGN KEY (seatClassId) REFERENCES seatClass (id),
    FOREIGN KEY (customer_id) REFERENCES Customer (id),
    FOREIGN KEY (flight_id) REFERENCES Flight (id)
);

CREATE TABLE Invoice
(
    id            INTEGER PRIMARY KEY AUTO_INCREMENT,
    booking_id    INT,
    totalAmount   FLOAT,
    departureTime DATETIME,
    arrivalTime   DATETIME,
    paymentStatus VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Booking (id)
);

CREATE TABLE PaymentPartner
(
    id                INTEGER PRIMARY KEY AUTO_INCREMENT,
    partner_name      VARCHAR(200),
    partner_thumbnail VARCHAR(250)
);

-- Thêm dữ liệu mẫu cho bảng seatClass
INSERT INTO seatClass (id, seat_clazz, amount)
VALUES (1, 'Business', 4690000);
INSERT INTO seatClass (id, seat_clazz, amount)
VALUES (2, 'SkyBoss', 3690000);
INSERT INTO seatClass (id, seat_clazz, amount)
VALUES (3, 'Veluxe', 1550000);
INSERT INTO seatClass (id, seat_clazz, amount)
VALUES (4, 'Eco', 1420000);

-- Thêm dữ liệu mẫu cho bảng Customer
INSERT INTO Customer (fullName, address, phone, CMND, visaCreated, username, password, birth_date, email)
VALUES ('Nguyễn Văn A', '123 Đường ABC, Hà Nội', '0912345678', '123456789012', true, 'user1', 'password1', '1990-01-01',
        'user1@email.com'),
       ('Trần Thị B', '456 Đường XYZ, TP.Hồ Chí Minh', '0987654321', '987654321098', false, 'user2', 'password2',
        '1985-05-15', 'user2@email.com'),
       ('Lê Văn C', '789 Đường LMN, Đà Nẵng', '0912123456', '654321098765', true, 'user3', 'password3', '1995-08-20',
        'user3@email.com'),
       ('Phạm Thị D', '101 Đường PQRS, Hải Phòng', '0918765432', '789012345678', false, 'user4', 'password4',
        '1988-11-10', 'user4@email.com'),
       ('Nguyễn Văn E', '202 Đường UVW, Nha Trang', '0901122334', '543210987654', true, 'user5', 'password5',
        '1992-04-25', 'user5@email.com'),
       ('Trần Thị F', '303 Đường GHI, Vũng Tàu', '0976543210', '876543210987', false, 'user6', 'password6',
        '1998-07-15', 'user6@email.com'),
       ('Lê Văn G', '404 Đường JKL, Quy Nhơn', '0987654321', '234567890123', true, 'user7', 'password7', '1993-09-30',
        'user7@email.com'),
       ('Phạm Thị H', '505 Đường XYZ, Cần Thơ', '0909876543', '567890123456', false, 'user8', 'password8', '1987-02-18',
        'user8@email.com'),
       ('Nguyễn Văn I', '606 Đường ABC, Huế', '0912345678', '012345678901', true, 'user9', 'password9', '1991-06-05',
        'user9@email.com'),
       ('Trần Thị K', '707 Đường LMN, Bắc Giang', '0987654321', '890123456789', false, 'user10', 'password10',
        '1997-03-12', 'user10@email.com');

-- Thêm dữ liệu mẫu cho bảng Employee
INSERT INTO Employee (position, username, password, birth_date, email)
VALUES ('Quản lý', 'manager1', 'managerpass1', '1980-10-20', 'manager1@email.com'),
       ('Nhân viên', 'staff1', 'staffpass1', '1995-03-25', 'staff1@email.com'),
       ('Nhân viên', 'staff2', 'staffpass2', '1992-09-15', 'staff2@email.com'),
       ('Quản lý', 'manager2', 'managerpass2', '1978-12-05', 'manager2@email.com'),
       ('Nhân viên', 'staff3', 'staffpass3', '1994-07-30', 'staff3@email.com'),
       ('Nhân viên', 'staff4', 'staffpass4', '1989-02-14', 'staff4@email.com'),
       ('Quản lý', 'manager3', 'managerpass3', '1983-06-28', 'manager3@email.com'),
       ('Nhân viên', 'staff5', 'staffpass5', '1996-11-23', 'staff5@email.com'),
       ('Nhân viên', 'staff6', 'staffpass6', '1990-04-10', 'staff6@email.com'),
       ('Quản lý', 'manager4', 'managerpass4', '1975-08-08', 'manager4@email.com');

-- Thêm dữ liệu mẫu cho bảng Address
INSERT INTO Address (city, country, airfield)
VALUES ('Hà Nội', 'Việt Nam', 'Sân bay Nội Bài'),
       ('TP.Hồ Chí Minh', 'Việt Nam', 'Sân bay Tân Sơn Nhất'),
       ('Đà Nẵng', 'Việt Nam', 'Sân bay Đà Nẵng'),
       ('Hải Phòng', 'Việt Nam', 'Sân bay Cát Bi'),
       ('Nha Trang', 'Việt Nam', 'Sân bay Cam Ranh'),
       ('Vũng Tàu', 'Việt Nam', 'Sân bay Cảng hàng không Phú Cường'),
       ('Quy Nhơn', 'Việt Nam', 'Sân bay Phù Cát'),
       ('Cần Thơ', 'Việt Nam', 'Sân bay Cần Thơ'),
       ('Huế', 'Việt Nam', 'Sân bay Phú Bài'),
       ('Bắc Giang', 'Việt Nam', 'Sân bay Nội Bài');

-- Thêm dữ liệu mẫu cho bảng Flight
-- Thêm dữ liệu mẫu cho bảng Flight

INSERT INTO Flight (id, arrivalAddressID, departureAddressID, flightTime, departureTime, arrivalTime, availableSeats,
                    totalSeats)
VALUES ('VN124', 1, 2, '2 giờ', '2024-02-01 08:00:00', '2024-02-01 10:00:00', 100, 150),
       ('VN457', 2, 1, '3 giờ', '2024-02-02 12:00:00', '2024-02-02 15:00:00', 120, 180),
       ('VN790', 3, 4, '1.5 giờ', '2024-02-03 16:30:00', '2024-02-03 18:00:00', 80, 120),
       ('VN102', 4, 3, '2.5 giờ', '2024-02-04 09:15:00', '2024-02-04 11:45:00', 90, 130),
       ('VN203', 5, 6, '1 giờ', '2024-02-05 14:45:00', '2024-02-05 15:45:00', 60, 100),
       ('VN304', 6, 5, '2 giờ', '2024-02-06 18:30:00', '2024-02-06 20:30:00', 110, 160),
       ('VN405', 7, 8, '1.5 giờ', '2024-02-07 11:00:00', '2024-02-07 12:30:00', 70, 110),
       ('VN506', 8, 7, '2.5 giờ', '2024-02-08 08:45:00', '2024-02-08 11:15:00', 85, 125),
       ('VN607', 9, 10, '1 giờ', '2024-02-09 13:30:00', '2024-02-09 14:30:00', 50, 90),
       ('VN708', 10, 9, '2 giờ', '2024-02-10 17:15:00', '2024-02-10 19:15:00', 95, 140);

INSERT INTO Booking (customer_id, flight_id, bookingDate, seatNumber, roundTrip, seatClassId)
VALUES (1, 'VN124', '2024-01-27 14:30:00', 'A12', false, 1),
       (2, 'VN457', '2024-01-28 09:45:00', 'B15', true, 2),
       (3, 'VN790', '2024-01-29 17:00:00', 'C8', false, 3),
       (4, 'VN102', '2024-01-30 13:15:00', 'D20', true, 4),
       (5, 'VN203', '2024-01-31 20:30:00', 'E10', false, 1),
       (6, 'VN304', '2024-02-01 12:45:00', 'F18', true, 2),
       (7, 'VN405', '2024-02-02 08:00:00', 'G14', false, 3),
       (8, 'VN506', '2024-02-03 16:30:00', 'H25', true, 4),
       (9, 'VN607', '2024-02-04 10:45:00', 'I5', false, 1),
       (10, 'VN708', '2024-02-05 14:00:00', 'J16', true, 2);

-- Thêm dữ liệu mẫu cho bảng Invoice

INSERT INTO Invoice (booking_id, totalAmount, departureTime, arrivalTime, paymentStatus)
VALUES (1, 50.0, '2024-02-01 08:00:00', '2024-02-01 10:00:00', 'Đã thanh toán'),
       (2, 200.0, '2024-02-02 12:00:00', '2024-02-02 15:00:00', 'Chờ thanh toán'),
       (3, 90.0, '2024-02-03 16:30:00', '2024-02-03 18:00:00', 'Đã thanh toán'),
       (4, 190.0, '2024-02-04 09:15:00', '2024-02-04 11:45:00', 'Chờ thanh toán'),
       (5, 55.0, '2024-02-05 14:45:00', '2024-02-05 15:45:00', 'Đã thanh toán'),
       (6, 220.0, '2024-02-06 18:30:00', '2024-02-06 20:30:00', 'Chờ thanh toán'),
       (7, 65.0, '2024-02-07 11:00:00', '2024-02-07 12:30:00', 'Đã thanh toán'),
       (8, 250.0, '2024-02-08 08:45:00', '2024-02-08 11:15:00', 'Chờ thanh toán'),
       (9, 50.0, '2024-02-09 13:30:00', '2024-02-09 14:30:00', 'Đã thanh toán'),
       (10, 260.0, '2024-02-10 17:15:00', '2024-02-10 19:15:00', 'Chờ thanh toán');


-- Thêm dữ liệu mẫu cho bảng PaymentPartner
INSERT INTO PaymentPartner (partner_name, partner_thumbnail)
VALUES ('PaymentCo', 'paymentco_logo.png'),
       ('SecurePay', 'securepay_logo.png'),
       ('FastPay', 'fastpay_logo.png'),
       ('EasyPay', 'easypay_logo.png'),
       ('SwiftPay', 'swiftpay_logo.png'),
       ('QuickPay', 'quickpay_logo.png'),
       ('SimplePay', 'simplepay_logo.png'),
       ('SpeedyPay', 'speedypay_logo.png'),
       ('RapidPay', 'rapidpay_logo.png'),
       ('ExpressPay', 'expresspay_logo.png');
