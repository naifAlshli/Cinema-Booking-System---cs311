# Cinema Ticket Booking System

## Data Dictionary

This document describes the database tables, attributes, data types, constraints, and relationships used in the Cinema Ticket Booking System.

### 1. Genres Table

Description: This table stores movie genres such as Action, Comedy, Horror, and Drama.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| genre_id | INT | PRIMARY KEY | Unique genre identifier |
| genre_name | VARCHAR(50) | NOT NULL, UNIQUE | Name of the genre |
| genre_code | VARCHAR(10) | NOT NULL, UNIQUE | Short genre code |
| description | VARCHAR(255) | NULL | Genre description |
| is_active | BOOLEAN | NOT NULL | Indicates whether the genre is active |
| created_at | DATETIME | NOT NULL | Genre creation date and time |

Primary Key: genre_id

Relationship: One genre can be associated with multiple movies. The Movies table references the Genres table using genre_id.

Relationship Type: One-to-Many (1:N).

### 2. Movies Table

Description: This table stores information about movies available in the cinema, including their titles, genres, duration, release dates, and languages.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| movie_id | INT | PRIMARY KEY | Unique movie identifier |
| genre_id | INT | FOREIGN KEY, NOT NULL | References Genres table |
| title | VARCHAR(150) | NOT NULL | Title of the movie |
| duration_minutes | INT | NOT NULL | Movie duration in minutes |
| release_date | DATE | NOT NULL | Movie release date |
| language | VARCHAR(50) | NOT NULL | Original movie language |
| age_rating | VARCHAR(10) | NOT NULL | Movie age classification |
| description | VARCHAR(255) | NULL | Short movie description |

Primary Key: movie_id

Foreign Key: genre_id references Genres(genre_id).

Relationship: Each movie belongs to one genre, while one genre can have multiple movies.

Relationship Type: Many-to-One (N:1) from Movies to Genres.

### 3. Theaters Table

Description: This table stores information about cinema branches, including their names, locations, and contact details.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| theater_id | INT | PRIMARY KEY | Unique identifier for each cinema branch |
| theater_name | VARCHAR(100) | NOT NULL | Name of the cinema branch |
| city | VARCHAR(50) | NOT NULL | City where the cinema is located |
| address | VARCHAR(255) | NOT NULL | Full address of the cinema branch |
| phone_number | VARCHAR(20) | NULL | Contact phone number |
| email | VARCHAR(100) | NULL | Contact email address |
| opening_time | TIME | NOT NULL | Daily opening time |
| closing_time | TIME | NOT NULL | Daily closing time |

Primary Key: theater_id

Relationship: One theater can contain multiple screening rooms. Each screening room belongs to one theater.

Relationship Type: One-to-Many (1:N) from Theaters to Screens.

### 4. Screens Table

Description: This table stores information about screening rooms within each cinema theater, including their numbers, types, and facilities.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| screen_id | INT | PRIMARY KEY | Unique identifier for each screening room |
| theater_id | INT | FOREIGN KEY, NOT NULL | References the Theaters table |
| screen_number | VARCHAR(20) | NOT NULL | Screening room number |
| screen_type | VARCHAR(30) | NOT NULL | Type of screen, such as Standard or IMAX |
| sound_system | VARCHAR(50) | NULL | Type of sound system |
| floor_number | INT | NULL | Floor where the screen is located |
| wheelchair_accessible | BOOLEAN | NOT NULL | Indicates wheelchair accessibility |
| is_active | BOOLEAN | NOT NULL | Indicates whether the screening room is active |

Primary Key: screen_id

Foreign Key: theater_id references Theaters(theater_id).

Unique Constraint: (theater_id, screen_number).

Relationship: Each screening room belongs to one theater, while one theater can contain multiple screening rooms.

Relationship Type: Many-to-One (N:1) from Screens to Theaters.

### 5. Seats Table

Description: This table stores information about the seats available in each cinema screening room, including seat numbers, rows, and types.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| seat_id | INT | PRIMARY KEY | Unique identifier for each seat |
| screen_id | INT | FOREIGN KEY, NOT NULL | References the Screens table |
| row_label | VARCHAR(5) | NOT NULL | Row label, such as A, B, or C |
| seat_number | INT | NOT NULL | Seat number within the row |
| seat_type | VARCHAR(30) | NOT NULL | Seat type, such as Standard or VIP |
| is_accessible | BOOLEAN | NOT NULL | Indicates whether the seat is accessible |
| is_active | BOOLEAN | NOT NULL | Indicates whether the seat is active |
| created_at | DATETIME | NOT NULL | Date and time the seat was added |

Primary Key: seat_id

Foreign Key: screen_id references Screens(screen_id).

Unique Constraint: (screen_id, row_label, seat_number).

Relationship: Each seat belongs to one screening room, while one screening room can contain multiple seats.

Relationship Type: Many-to-One (N:1) from Seats to Screens.

Note: Seat availability depends on the selected showtime and will be determined using ticket and booking records.

### 6. Showtimes Table

Description: This table stores scheduled movie screenings, including the movie, screening room, date, time, and ticket price.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| showtime_id | INT | PRIMARY KEY | Unique identifier for each showtime |
| movie_id | INT | FOREIGN KEY, NOT NULL | References Movies(movie_id) |
| screen_id | INT | FOREIGN KEY, NOT NULL | References Screens(screen_id) |
| start_time | DATETIME | NOT NULL | Date and time the movie starts |
| end_time | DATETIME | NOT NULL | Date and time the movie ends |
| base_price | DECIMAL(8,2) | NOT NULL | Base ticket price |
| language | VARCHAR(50) | NOT NULL | Language used in this screening |
| show_status | VARCHAR(20) | NOT NULL | Status such as Scheduled or Canceled |

Primary Key: showtime_id

Foreign Keys:
- movie_id references Movies(movie_id).
- screen_id references Screens(screen_id).

Relationships:
- One movie can have multiple showtimes.
- One screening room can host multiple showtimes.

Relationship Type: One-to-Many (1:N) from Movies to Showtimes and from Screens to Showtimes.

Business Rules:
- end_time must be later than start_time.
- A screening room must not have overlapping showtimes.
- The base price must not be negative.

  ### 7. Customers Table

Description: This table stores information about customers who register and book cinema tickets, including their names and contact details.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| customer_id | INT | PRIMARY KEY | Unique identifier for each customer |
| first_name | VARCHAR(50) | NOT NULL | Customer's first name |
| last_name | VARCHAR(50) | NOT NULL | Customer's last name |
| email | VARCHAR(100) | NOT NULL, UNIQUE | Customer's email address |
| phone_number | VARCHAR(20) | NULL | Customer's contact number |
| registration_date | DATETIME | NOT NULL | Date and time the customer registered |
| account_status | VARCHAR(20) | NOT NULL | Status such as Active or Inactive |
| date_of_birth | DATE | NULL | Customer's date of birth |

Primary Key: customer_id

Unique Constraint: email must be unique for each customer.

Relationship: One customer can make multiple bookings, while each booking belongs to one customer.

Relationship Type: One-to-Many (1:N) from Customers to Bookings.

Business Rules:
- Each customer must have a unique email address.
- Customer first name and last name cannot be empty.
- A customer can have multiple bookings.

  ### 8. Bookings Table

Description: This table stores customer booking information, including the selected showtime, booking date, total amount, and booking status.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| booking_id | INT | PRIMARY KEY | Unique identifier for each booking |
| customer_id | INT | FOREIGN KEY, NOT NULL | References Customers(customer_id) |
| showtime_id | INT | FOREIGN KEY, NOT NULL | References Showtimes(showtime_id) |
| booking_reference | VARCHAR(30) | NOT NULL, UNIQUE | Unique booking reference number |
| booking_date | DATETIME | NOT NULL | Date and time the booking was created |
| booking_status | VARCHAR(20) | NOT NULL | Status such as Pending, Confirmed, or Canceled |
| total_amount | DECIMAL(10,2) | NOT NULL | Total booking amount |
| expires_at | DATETIME | NULL | Expiration time for an unpaid reservation |

Primary Key: booking_id

Foreign Keys:
- customer_id references Customers(customer_id).
- showtime_id references Showtimes(showtime_id).

Unique Constraint: booking_reference must be unique.

Relationships:
- One customer can make multiple bookings.
- One showtime can have multiple bookings.
- One booking can contain multiple tickets.
- One booking can have multiple payment attempts.

Relationship Types:
- Customers to Bookings: One-to-Many (1:N).
- Showtimes to Bookings: One-to-Many (1:N).
- Bookings to Tickets: One-to-Many (1:N).
- Bookings to Payments: One-to-Many (1:N).

Business Rules:
- Each booking must belong to one customer.
- Each booking must be associated with one showtime.
- The total amount cannot be negative.
- A canceled booking must not have active tickets.
- Seats must not be booked twice for the same showtime.

### 9. Tickets Table

Description: This table stores cinema tickets associated with customer bookings, including seat assignments, ticket prices, and ticket statuses.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| ticket_id | INT | PRIMARY KEY | Unique identifier for each ticket |
| booking_id | INT | FOREIGN KEY, NOT NULL | References Bookings(booking_id) |
| seat_id | INT | FOREIGN KEY, NOT NULL | References Seats(seat_id) |
| ticket_code | VARCHAR(50) | NOT NULL, UNIQUE | Unique ticket verification code |
| ticket_price | DECIMAL(8,2) | NOT NULL | Price of the ticket |
| ticket_status | VARCHAR(20) | NOT NULL | Status such as Valid, Used, or Canceled |
| issued_at | DATETIME | NOT NULL | Date and time the ticket was issued |
| checked_in_at | DATETIME | NULL | Date and time the ticket was used |

Primary Key: ticket_id

Foreign Keys:
- booking_id references Bookings(booking_id).
- seat_id references Seats(seat_id).

Unique Constraint: ticket_code must be unique.

Relationships:
- One booking can contain multiple tickets.
- Each ticket belongs to one booking.
- Each ticket is assigned to one seat.
- One seat can be associated with multiple tickets for different showtimes.

Relationship Types:
- Bookings to Tickets: One-to-Many (1:N).
- Seats to Tickets: One-to-Many (1:N).

Business Rules:
- Every ticket must belong to a valid booking.
- Each ticket must have a unique verification code.
- The ticket price cannot be negative.
- The assigned seat must belong to the screening room of the booked showtime.
- A seat must not have more than one active ticket for the same showtime.
- Canceled tickets must not be accepted for entry.

Note: Preventing duplicate active tickets for the same seat and showtime requires validation during SQL implementation.

### 10. Payments Table

Description: This table stores payment transactions associated with cinema bookings, including payment amounts, methods, statuses, and transaction details.

| Attribute | Data Type | Constraints | Description |
|---|---|---|---|
| payment_id | INT | PRIMARY KEY | Unique identifier for each payment |
| booking_id | INT | FOREIGN KEY, NOT NULL | References Bookings(booking_id) |
| amount | DECIMAL(10,2) | NOT NULL | Payment amount |
| payment_method | VARCHAR(30) | NOT NULL | Payment method, such as Card or Cash |
| payment_status | VARCHAR(20) | NOT NULL | Status such as Pending, Completed, Failed, or Refunded |
| transaction_reference | VARCHAR(100) | UNIQUE, NULL | Unique transaction reference if available |
| attempted_at | DATETIME | NOT NULL | Date and time of the payment attempt |
| refunded_at | DATETIME | NULL | Date and time of refund, if applicable |

Primary Key: payment_id

Foreign Key: booking_id references Bookings(booking_id).

Unique Constraint: transaction_reference must be unique when provided.

Relationship: Each payment belongs to one booking, while one booking can have multiple payment attempts.

Relationship Type: Many-to-One (N:1) from Payments to Bookings.

Business Rules:
- Every payment must belong to a valid booking.
- Payment amounts cannot be negative.
- Each transaction reference must be unique when provided.
- A failed payment must not confirm a booking.
- A refunded payment should record its refund date.
- A booking may have multiple payment attempts.
