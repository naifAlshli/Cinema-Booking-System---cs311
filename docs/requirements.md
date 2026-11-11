Cinema Ticket Booking System

Requirements Analysis

1. Introduction

The Cinema Ticket Booking System is a database project developed for the CS311 Database Systems course.

The main purpose of this project is to design a relational database that organizes and manages cinema operations, including movies, customers, showtimes, seats, bookings, tickets, and payments.

The system aims to improve data organization, reduce booking errors, and provide accurate information about cinema ticket reservations.

2. Project Objectives

The main objectives of the system are:

1. Store and manage movie information.
2. Organize cinema theaters and screening rooms.
3. Manage movie showtimes and available seats.
4. Store customer and booking information.
5. Record ticket reservations and payments.
6. Prevent duplicate seat bookings for the same showtime.
7. Maintain accurate and consistent data.

3. User Requirements Analysis

To understand users' needs, we created an online survey using Google Forms.

The survey included four questions about movie information, seat reservations, ticket details, and payment or booking cancellation.

A total of 3 participants completed the survey at the time of this analysis.

4. Survey Findings

Based on the collected responses:

- Participants expressed different preferences regarding the number of seats they usually book.
- One participant selected 2 seats, one selected 3–4 seats, and one selected 5 or more seats.
- All three participants selected the movie title, show date and time, and seat number as important ticket information.
- Two participants selected the screen number and QR code for ticket verification.
- Participants provided different suggestions for handling failed payments and canceled bookings.

These findings help identify useful features for the proposed database system.

5. Functional Requirements

The proposed system should:

1. Store movie details such as title, genre, duration, and release date.
2. Store cinema theater and screening room information.
3. Manage showtimes for each movie.
4. Store seat information and support multiple-seat bookings.
5. Register customer information.
6. Create and manage booking records.
7. Generate ticket records associated with bookings.
8. Record payments and their status.
9. Track canceled bookings and failed payments.
10. Prevent the same seat from being booked twice for the same showtime.

6. Non-Functional Requirements

The system should provide:

- Data accuracy and consistency.
- Reliable storage of booking information.
- Protection of customer information.
- Efficient retrieval of movie and booking records.
- Referential integrity between related tables.

7. Proposed Database Tables

The database will contain the following ten tables:

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

These tables will be connected using primary keys and foreign keys to maintain relationships and data integrity.

8. Conclusion

The requirements analysis provides an initial foundation for designing the Cinema Ticket Booking System database.

The proposed database structure will support movie management, showtime scheduling, seat reservations, customer bookings, ticket records, and payment tracking.
