# Cinema Ticket Booking System

## Database Implementation Notes

### 1. Overview

This document provides implementation guidelines for the Cinema Ticket Booking System database using MySQL.

The database design includes 10 relational tables documented in the Data Dictionary and ERD.

### 2. Database Tables

The database consists of:

1. Genres
2. Movies
3. Theaters
4. Screens
5. Seats
6. Showtimes
7. Customers
8. Bookings
9. Tickets
10. Payments

### 3. Primary and Foreign Keys

Each table must have a primary key to uniquely identify its records.

Foreign keys must be implemented according to the ERD to maintain referential integrity.

### 4. Seat Booking Rules

The system must prevent duplicate active reservations for the same seat and showtime.

- Each ticket must belong to a valid booking.
- Every booking must reference a valid showtime.
- The selected seat must belong to the screen assigned to that showtime.
- A seat can be reserved for different showtimes.
- Canceled and expired reservations must release their seats.

### 5. Transaction Management

MySQL transactions should be used to ensure safe booking operations.

The booking process should:

1. Start a database transaction.
2. Lock the selected seat records to coordinate concurrent booking attempts.
3. Verify seat availability for the selected showtime.
4. Create the booking and associated ticket records.
5. Commit the transaction if all operations succeed.
6. Roll back the transaction if any operation fails.

All booking operations must follow the same locking strategy to prevent double bookings.

### 6. Payment Management

The database must track payment attempts and their statuses.

- Failed payments must not confirm bookings.
- Successful payments can confirm valid bookings.
- Refund information should be recorded when applicable.
- Each payment must reference an existing booking.

### 7. Data Validation

The implementation must enforce:

- Primary key uniqueness.
- Foreign key integrity.
- Required fields using NOT NULL.
- Unique booking references.
- Non-negative ticket and payment amounts.
- Valid booking and ticket statuses.
- Prevention of overlapping showtimes in the same screening room.

Some business rules require transactional validation beyond standard foreign key constraints.

### 8. Testing Requirements

The completed database should be tested to verify:

1. Customers can create valid bookings.
2. Multiple seats can be reserved in one booking.
3. Duplicate active seat reservations are prevented.
4. Canceled bookings release reserved seats.
5. Failed payments do not confirm bookings.
6. Foreign key constraints are enforced.
7. Concurrent booking attempts do not result in double booking.

### 9. Implementation Handover

The implementation team should use the following project files:

- data-dictionary.md
- Cinema-erd.dbml
- Cinema Ticket Booking System ERD.png
- requirements.md

The DBML file represents the database design and must be converted into valid MySQL SQL statements before execution.
