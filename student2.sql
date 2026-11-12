CREATE DATABASE IF NOT EXISTS CinemaTicketBooking;

USE CinemaTicketBooking;

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE,
    genre_code VARCHAR(10) NOT NULL UNIQUE,
    description VARCHAR(255),
    is_active BOOLEAN NOT NULL,
    created_at DATETIME NOT NULL
);
INSERT INTO Genres
(genre_id, genre_name, genre_code, description, is_active, created_at)
VALUES
(1, 'Action', 'ACT', 'Action movies', TRUE, NOW()),
(2, 'Comedy', 'COM', 'Comedy movies', TRUE, NOW()),
(3, 'Drama', 'DRA', 'Drama movies', TRUE, NOW()),
(4, 'Horror', 'HOR', 'Horror movies', TRUE, NOW()),
(5, 'Sci-Fi', 'SCI', 'Science fiction movies', TRUE, NOW()),
(6, 'Romance', 'ROM', 'Romantic movies', TRUE, NOW()),
(7, 'Thriller', 'THR', 'Thriller movies', TRUE, NOW()),
(8, 'Animation', 'ANI', 'Animated movies', TRUE, NOW()),
(9, 'Adventure', 'ADV', 'Adventure movies', TRUE, NOW()),
(10, 'Documentary', 'DOC', 'Documentary movies', TRUE, NOW());

SELECT * FROM Genres;
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    genre_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    duration_minutes INT NOT NULL,
    release_date DATE NOT NULL,
    language VARCHAR(50) NOT NULL,
    age_rating VARCHAR(10) NOT NULL,
    description VARCHAR(255),

    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

INSERT INTO Movies
(movie_id, genre_id, title, duration_minutes, release_date, language, age_rating, description)
VALUES
(1, 1, 'John Wick', 101, '2014-10-24', 'English', 'R', 'Action thriller'),
(2, 2, 'Home Alone', 103, '1990-11-16', 'English', 'PG', 'Family comedy'),
(3, 3, 'The Pursuit of Happyness', 117, '2006-12-15', 'English', 'PG-13', 'Drama'),
(4, 4, 'The Conjuring', 112, '2013-07-19', 'English', 'R', 'Horror movie'),
(5, 5, 'Interstellar', 169, '2014-11-07', 'English', 'PG-13', 'Science fiction'),
(6, 6, 'The Notebook', 123, '2004-06-25', 'English', 'PG-13', 'Romantic drama'),
(7, 7, 'Shutter Island', 138, '2010-02-19', 'English', 'R', 'Psychological thriller'),
(8, 8, 'Toy Story', 81, '1995-11-22', 'English', 'G', 'Animated movie'),
(9, 9, 'Jumanji', 104, '1995-12-15', 'English', 'PG', 'Adventure movie'),
(10, 10, 'Free Solo', 100, '2018-09-28', 'English', 'PG-13', 'Documentary');

SELECT * FROM Movies;

CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY,
    theater_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100),
    opening_time TIME NOT NULL,
    closing_time TIME NOT NULL
);
INSERT INTO Theaters
(theater_id, theater_name, city, address, phone_number, email, opening_time, closing_time)
VALUES
(1, 'Cinema Riyadh', 'Riyadh', 'Olaya District', '0501111111', 'riyadh@cinema.com', '10:00:00', '23:59:00'),
(2, 'Cinema Jeddah', 'Jeddah', 'Al Rawdah District', '0502222222', 'jeddah@cinema.com', '10:00:00', '23:59:00'),
(3, 'Cinema Dammam', 'Dammam', 'Al Faisaliyah District', '0503333333', 'dammam@cinema.com', '10:00:00', '23:59:00'),
(4, 'Cinema Makkah', 'Makkah', 'Al Aziziyah District', '0504444444', 'makkah@cinema.com', '10:00:00', '23:59:00'),
(5, 'Cinema Madinah', 'Madinah', 'Al Aridh District', '0505555555', 'madinah@cinema.com', '10:00:00', '23:59:00'),
(6, 'Cinema Taif', 'Taif', 'Al Shuhada District', '0506666666', 'taif@cinema.com', '10:00:00', '23:59:00'),
(7, 'Cinema Abha', 'Abha', 'Al Murooj District', '0507777777', 'abha@cinema.com', '10:00:00', '23:59:00'),
(8, 'Cinema Tabuk', 'Tabuk', 'Al Wurud District', '0508888888', 'tabuk@cinema.com', '10:00:00', '23:59:00'),
(9, 'Cinema Hail', 'Hail', 'Al Naqrah District', '0509999999', 'hail@cinema.com', '10:00:00', '23:59:00'),
(10, 'Cinema Khobar', 'Khobar', 'Al Aqrabiyah District', '0501234567', 'khobar@cinema.com', '10:00:00', '23:59:00');

SELECT * FROM Theaters;
CREATE TABLE Screens (
    screen_id INT PRIMARY KEY,
    theater_id INT NOT NULL,
    screen_number VARCHAR(20) NOT NULL,
    screen_type VARCHAR(30) NOT NULL,
    sound_system VARCHAR(50),
    floor_number INT,
    wheelchair_accessible BOOLEAN NOT NULL,
    is_active BOOLEAN NOT NULL,

    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id),
    UNIQUE (theater_id, screen_number)
);
INSERT INTO Screens
(screen_id, theater_id, screen_number, screen_type, sound_system, floor_number, wheelchair_accessible, is_active)
VALUES
(1, 1, 'Screen 1', 'Standard', 'Dolby Digital', 1, TRUE, TRUE),
(2, 1, 'Screen 2', 'IMAX', 'Dolby Atmos', 2, TRUE, TRUE),
(3, 2, 'Screen 1', 'Standard', 'Dolby Digital', 1, TRUE, TRUE),
(4, 2, 'Screen 2', 'VIP', 'Dolby Atmos', 2, TRUE, TRUE),
(5, 3, 'Screen 1', 'Standard', 'Dolby Digital', 1, TRUE, TRUE),
(6, 4, 'Screen 1', 'IMAX', 'Dolby Atmos', 1, TRUE, TRUE),
(7, 5, 'Screen 1', 'Standard', 'Dolby Digital', 1, TRUE, TRUE),
(8, 6, 'Screen 1', 'VIP', 'Dolby Atmos', 1, TRUE, TRUE),
(9, 7, 'Screen 1', 'Standard', 'Dolby Digital', 1, TRUE, TRUE),
(10, 8, 'Screen 1', 'IMAX', 'Dolby Atmos', 1, TRUE, TRUE);

SELECT * FROM Screens;
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY,
    screen_id INT NOT NULL,
    row_label VARCHAR(5) NOT NULL,
    seat_number INT NOT NULL,
    seat_type VARCHAR(30) NOT NULL,
    is_accessible BOOLEAN NOT NULL,
    is_active BOOLEAN NOT NULL,
    created_at DATETIME NOT NULL,

    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id),
    UNIQUE (screen_id, row_label, seat_number)
);
INSERT INTO Seats
(seat_id, screen_id, row_label, seat_number, seat_type, is_accessible, is_active, created_at)
VALUES
(1, 1, 'A', 1, 'Standard', FALSE, TRUE, NOW()),
(2, 1, 'A', 2, 'Standard', FALSE, TRUE, NOW()),
(3, 1, 'A', 3, 'Standard', FALSE, TRUE, NOW()),
(4, 1, 'A', 4, 'Standard', FALSE, TRUE, NOW()),
(5, 1, 'A', 5, 'Standard', FALSE, TRUE, NOW()),
(6, 1, 'B', 1, 'VIP', FALSE, TRUE, NOW()),
(7, 1, 'B', 2, 'VIP', FALSE, TRUE, NOW()),
(8, 1, 'B', 3, 'VIP', FALSE, TRUE, NOW()),
(9, 1, 'C', 1, 'Accessible', TRUE, TRUE, NOW()),
(10, 1, 'C', 2, 'Accessible', TRUE, TRUE, NOW());

SELECT * FROM Seats;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    registration_date DATETIME NOT NULL,
    account_status VARCHAR(20) NOT NULL,
    date_of_birth DATE
);
INSERT INTO Customers
(customer_id, first_name, last_name, email, phone_number, registration_date, account_status, date_of_birth)
VALUES
(1, 'Ahmed', 'Ali', 'ahmed1@example.com', '0501111111', NOW(), 'Active', '2000-05-15'),
(2, 'Mohammed', 'Saleh', 'mohammed2@example.com', '0502222222', NOW(), 'Active', '1999-08-20'),
(3, 'Sara', 'Ahmed', 'sara3@example.com', '0503333333', NOW(), 'Active', '2001-03-10'),
(4, 'Noura', 'Fahad', 'noura4@example.com', '0504444444', NOW(), 'Active', '2002-11-25'),
(5, 'Khalid', 'Omar', 'khalid5@example.com', '0505555555', NOW(), 'Active', '1998-07-12'),
(6, 'Reem', 'Abdullah', 'reem6@example.com', '0506666666', NOW(), 'Active', '2000-09-18'),
(7, 'Faisal', 'Hassan', 'faisal7@example.com', '0507777777', NOW(), 'Active', '1997-04-22'),
(8, 'Lama', 'Saad', 'lama8@example.com', '0508888888', NOW(), 'Active', '2003-01-30'),
(9, 'Omar', 'Khalid', 'omar9@example.com', '0509999999', NOW(), 'Active', '2001-06-14'),
(10, 'Yousef', 'Nasser', 'yousef10@example.com', '0501234567', NOW(), 'Active', '1999-12-05');

SELECT * FROM Customers;

CREATE TABLE Showtimes (
    showtime_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    base_price DECIMAL(8,2) NOT NULL,
    showtime_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

INSERT INTO Showtimes
(showtime_id, movie_id, screen_id, start_time, end_time, base_price, showtime_status)
VALUES
(1, 1, 1, '2026-11-15 14:00:00', '2026-11-15 16:00:00', 45.00, 'Scheduled'),
(2, 2, 2, '2026-11-15 17:00:00', '2026-11-15 19:00:00', 50.00, 'Scheduled'),
(3, 3, 3, '2026-11-15 18:00:00', '2026-11-15 20:30:00', 45.00, 'Scheduled'),
(4, 4, 4, '2026-11-16 15:00:00', '2026-11-16 17:00:00', 55.00, 'Scheduled'),
(5, 5, 5, '2026-11-16 19:00:00', '2026-11-16 22:00:00', 60.00, 'Scheduled'),
(6, 6, 6, '2026-11-17 14:00:00', '2026-11-17 16:30:00', 45.00, 'Scheduled'),
(7, 7, 7, '2026-11-17 18:00:00', '2026-11-17 20:30:00', 50.00, 'Scheduled'),
(8, 8, 8, '2026-11-18 13:00:00', '2026-11-18 15:00:00', 40.00, 'Scheduled'),
(9, 9, 9, '2026-11-18 17:00:00', '2026-11-18 19:00:00', 45.00, 'Scheduled'),
(10, 10, 10, '2026-11-19 20:00:00', '2026-11-19 22:00:00', 55.00, 'Scheduled');

SELECT * FROM Showtimes;