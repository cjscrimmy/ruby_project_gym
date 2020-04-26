DROP TABLE bookings;
DROP TABLE members;
DROP TABLE lessons;

CREATE TABLE lessons(
    id SERIAL PRIMARY KEY,
    lesson_name VARCHAR(255),
    lesson_type VARCHAR(255),
    day_of_lesson VARCHAR(255),
    time_lesson_is_on VARCHAR(255),
    week_number_lesson_is_on INT
);

CREATE TABLE members(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth VARCHAR(255)
);

CREATE TABLE bookings(
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id),
    lesson_id INT REFERENCES lessons(id)
);