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

