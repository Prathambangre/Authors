CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

INSERT INTO Authors (first_name, last_name)
VALUES
    ('Jane', 'Austen'),
    ('George', 'Orwell'),
    ('J.R.R.', 'Tolkien'),
    ('Agatha', 'Christie'),
    ('Stephen', 'King'),
    ('J.K.', 'Rowling'),
    ('Isaac', 'Asimov'),
    ('Arthur C.', 'Clarke'),
    ('Gabriel', 'Garcia Marquez'),
    ('Leo', 'Tolstoy'),
    ('Fyodor', 'Dostoevsky'),
    ('Ernest', 'Hemingway'),
    ('F. Scott', 'Fitzgerald'),
    ('Harper', 'Lee'),
    ('Mark', 'Twain'),
    ('Charles', 'Dickens'),
    ('William', 'Shakespeare'),
    ('Homer', 'Unknown'),
    ('Virgil', 'Unknown'),
    ('Dante', 'Alighieri'),
    ('Geoffrey', 'Chaucer'),
    ('Miguel', 'de Cervantes'),
    ('Emily', 'Bronte'),
    ('Charlotte', 'Bronte'),
    ('Oscar', 'Wilde'),
    ('Virginia', 'Woolf'),
    ('Aldous', 'Huxley'),
    ('Ray', 'Bradbury'),
    ('Philip K.', 'Dick'),
    ('Ursula K.', 'Le Guin'),
    ('Neil', 'Gaiman'),
    ('Terry', 'Pratchett'),
    ('Margaret', 'Atwood'),
    ('Toni', 'Morrison'),
    ('Chinua', 'Achebe'),
    ('Salman', 'Rushdie'),
    ('Haruki', 'Murakami'),
    ('Simone', 'de Beauvoir'),
    ('Albert', 'Camus'),
    ('Jean-Paul', 'Sartre'),
    ('Franz', 'Kafka'),
    ('Milan', 'Kundera'),
    ('Gabriel', 'Garcia Marquez'),
    ('Jorge Luis', 'Borges'),
    ('Pablo', 'Neruda'),
    ('Octavio', 'Paz');

select * from Authors

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INTEGER REFERENCES Authors(author_id),
    publication_year SMALLINT,
    genre VARCHAR(100)
);

INSERT INTO Books (title, author_id, publication_year, genre)
VALUES
    ('Pride and Prejudice', 19, 1813, 'Romance'),
    ('Nineteen Eighty-Four', 20, 1949, 'Dystopian'),
    ('The Hobbit', 21, 1937, 'Fantasy'),
    ('The Lord of the Rings', 21, 1954, 'Fantasy'),
    ('Murder on the Orient Express', 22, 1934, 'Mystery'),
    ('The Shining', 23, 1977, 'Horror'),
    ('Foundation', 25, 1951, 'Science Fiction'),
    ('2001: A Space Odyssey', 26, 1968, 'Science Fiction'),
    ('One Hundred Years of Solitude', 27, 1967, 'Magical Realism'),
    ('War and Peace', 28, 1869, 'Historical Fiction'),
    ('Crime and Punishment', 29, 1866, 'Psychological Thriller'),
    ('The Old Man and the Sea', 30, 1952, 'Literary Fiction'),
    ('The Great Gatsby', 31, 1925, 'Literary Fiction'),
    ('To Kill a Mockingbird', 32, 1960, 'Southern Gothic'),
    ('The Adventures of Tom Sawyer', 33, 1876, 'Adventure'),
    ('A Tale of Two Cities', 34, 1859, 'Historical Fiction'),
    ('Hamlet', 35, 1603, 'Tragedy'),
    ('The Odyssey', 36, -800, 'Epic Poetry'),
    ('The Aeneid', 37, -19, 'Epic Poetry'),
    ('The Divine Comedy', 38, 1320, 'Epic Poetry'),
    ('The Canterbury Tales', 39, 1475, 'Middle English Literature'),
    ('Don Quixote', 40, 1605, 'Satire'),
    ('Wuthering Heights', 41, 1847, 'Gothic Fiction'),
    ('Jane Eyre', 42, 1847, 'Gothic Fiction'),
    ('The Picture of Dorian Gray', 43, 1890, 'Philosophical Fiction'),
    ('Mrs. Dalloway', 44, 1925, 'Modernist Literature'),
    ('Brave New World', 45, 1932, 'Dystopian'),
    ('Fahrenheit 451', 46, 1953, 'Dystopian'),
    ('Do Androids Dream of Electric Sheep?', 47, 1968, 'Science Fiction'),
    ('The Left Hand of Darkness', 48, 1969, 'Science Fiction'),
    ('Neverwhere', 49, 1996, 'Urban Fantasy'),
    ('Good Omens', 50, 1990, 'Fantasy Comedy'),
    ('Beloved', 52, 1987, 'Historical Fiction'),
    ('Things Fall Apart', 53, 1958, 'African Literature'),
    ('Norwegian Wood', 55, 1987, 'Literary Fiction'),
    ('The Stranger', 56, 1942, 'Philosophical Fiction'),
    ('The Trial', 57, 1925, 'Absurdist Fiction'),
    ('The Unbearable Lightness of Being', 58, 1984, 'Philosophical Fiction'),
    ('Love in the Time of Cholera', 27, 1985, 'Magical Realism'),
    ('The Aleph', 62, 1949, 'Short Stories'),
    ('Twenty Love Poems and a Song of Despair', 63, 1924, 'Poetry'),
    ('The Labyrinth of Solitude', 64, 1950, 'Essay'),
    ('Blindness', 59, 1995, 'Dystopian');

select * from books

UPDATE Books
SET genre = 'Classic Literature'
WHERE book_id = 1;

ALTER TABLE Books
ALTER COLUMN publication_year SET NOT NULL;

CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES Books(book_id),
    borrower_name VARCHAR(255) NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE
);

INSERT INTO Loans (book_id, borrower_name, loan_date, due_date)
VALUES
    (44, 'Alice Smith', CURRENT_DATE - INTERVAL '7 days', CURRENT_DATE + INTERVAL '7 days'),
    (45, 'Bob Johnson', CURRENT_DATE - INTERVAL '3 days', CURRENT_DATE + INTERVAL '11 days'),
    (46, 'Charlie Brown', CURRENT_DATE - INTERVAL '10 days', CURRENT_DATE + INTERVAL '4 days'),
    (47, 'Diana Lee', CURRENT_DATE - INTERVAL '1 day', CURRENT_DATE + INTERVAL '13 days'),
    (48, 'Ethan Davis', CURRENT_DATE - INTERVAL '15 days', CURRENT_DATE - INTERVAL '1 day'),
    (49, 'Fiona Green', CURRENT_DATE - INTERVAL '5 days', CURRENT_DATE + INTERVAL '9 days'),
    (50, 'George Hill', CURRENT_DATE - INTERVAL '9 days', CURRENT_DATE + INTERVAL '5 days'),
    (51, 'Hannah White', CURRENT_DATE - INTERVAL '2 days', CURRENT_DATE + INTERVAL '12 days'),
    (52, 'Ian Black', CURRENT_DATE - INTERVAL '12 days', CURRENT_DATE + INTERVAL '2 days'),
    (53, 'Jane Taylor', CURRENT_DATE - INTERVAL '6 days', CURRENT_DATE + INTERVAL '8 days'),
    (54, 'Kevin Moore', CURRENT_DATE - INTERVAL '4 days', CURRENT_DATE + INTERVAL '10 days'),
    (55, 'Linda King', CURRENT_DATE - INTERVAL '11 days', CURRENT_DATE + INTERVAL '3 days'),
    (56, 'Michael Wright', CURRENT_DATE - INTERVAL '8 days', CURRENT_DATE + INTERVAL '6 days'),
    (57, 'Nancy Hall', CURRENT_DATE - INTERVAL '13 days', CURRENT_DATE + INTERVAL '1 day'),
    (58, 'Oliver Lewis', CURRENT_DATE - INTERVAL '7 days', CURRENT_DATE + INTERVAL '7 days'),
    (59, 'Patricia Young', CURRENT_DATE - INTERVAL '2 days', CURRENT_DATE + INTERVAL '12 days'),
    (60, 'Quinn Allen', CURRENT_DATE - INTERVAL '10 days', CURRENT_DATE + INTERVAL '4 days'),
    (61, 'Robert Scott', CURRENT_DATE - INTERVAL '5 days', CURRENT_DATE + INTERVAL '9 days'),
    (62, 'Susan Adams', CURRENT_DATE - INTERVAL '9 days', CURRENT_DATE + INTERVAL '5 days'),
    (63, 'Thomas Baker', CURRENT_DATE - INTERVAL '3 days', CURRENT_DATE + INTERVAL '11 days'),
    (64, 'Ursula Carter', CURRENT_DATE - INTERVAL '12 days', CURRENT_DATE + INTERVAL '2 days'),
    (65, 'Victor Davis', CURRENT_DATE - INTERVAL '6 days', CURRENT_DATE + INTERVAL '8 days'),
    (66, 'Wendy Evans', CURRENT_DATE - INTERVAL '4 days', CURRENT_DATE + INTERVAL '10 days'),
    (67, 'Xavier Flores', CURRENT_DATE - INTERVAL '11 days', CURRENT_DATE + INTERVAL '3 days'),
    (68, 'Yara Garcia', CURRENT_DATE - INTERVAL '8 days', CURRENT_DATE + INTERVAL '6 days'),
    (69, 'Zane Harris', CURRENT_DATE - INTERVAL '13 days', CURRENT_DATE + INTERVAL '1 day'),
    (70, 'Ava Irwin', CURRENT_DATE - INTERVAL '7 days', CURRENT_DATE + INTERVAL '7 days'),
    (71, 'Ben Jackson', CURRENT_DATE - INTERVAL '1 day', CURRENT_DATE + INTERVAL '13 days'),
    (72, 'Cora Klein', CURRENT_DATE - INTERVAL '10 days', CURRENT_DATE + INTERVAL '4 days'),
    (73, 'David Lopez', CURRENT_DATE - INTERVAL '5 days', CURRENT_DATE + INTERVAL '9 days'),
    (74, 'Ella Martin', CURRENT_DATE - INTERVAL '9 days', CURRENT_DATE + INTERVAL '5 days'),
    (75, 'Finn Nelson', CURRENT_DATE - INTERVAL '3 days', CURRENT_DATE + INTERVAL '11 days'),
    (76, 'Grace Owen', CURRENT_DATE - INTERVAL '12 days', CURRENT_DATE + INTERVAL '2 days'),
    (77, 'Henry Perez', CURRENT_DATE - INTERVAL '6 days', CURRENT_DATE + INTERVAL '8 days'),
    (78, 'Ivy Quinn', CURRENT_DATE - INTERVAL '4 days', CURRENT_DATE + INTERVAL '10 days'),
    (79, 'Jack Roberts', CURRENT_DATE - INTERVAL '11 days', CURRENT_DATE + INTERVAL '3 days'),
    (80, 'Kelly Sanders', CURRENT_DATE - INTERVAL '8 days', CURRENT_DATE + INTERVAL '6 days'),
    (81, 'Liam Turner', CURRENT_DATE - INTERVAL '13 days', CURRENT_DATE + INTERVAL '1 day'),
    (82, 'Mia Upton', CURRENT_DATE - INTERVAL '7 days', CURRENT_DATE + INTERVAL '7 days'),
    (83, 'Noah Vargas', CURRENT_DATE - INTERVAL '2 days', CURRENT_DATE + INTERVAL '12 days'),
    (84, 'Olivia Ward', CURRENT_DATE - INTERVAL '10 days', CURRENT_DATE + INTERVAL '4 days'),
    (85, 'Peter Wood', CURRENT_DATE - INTERVAL '5 days', CURRENT_DATE + INTERVAL '9 days'),
    (86, 'Sophia Yates', CURRENT_DATE - INTERVAL '9 days', CURRENT_DATE + INTERVAL '5 days'),
    (49, 'Ryan Zimmerman', CURRENT_DATE - INTERVAL '3 days', CURRENT_DATE + INTERVAL '11 days'),
    (50, 'Scarlett Hayes', CURRENT_DATE - INTERVAL '12 days', CURRENT_DATE + INTERVAL '2 days'),
    (51, 'Samuel Foster', CURRENT_DATE - INTERVAL '6 days', CURRENT_DATE + INTERVAL '8 days'),
    (52, 'Victoria Jenkins', CURRENT_DATE - INTERVAL '4 days', CURRENT_DATE + INTERVAL '10 days');

	select * from Loans

	UPDATE Loans
SET return_date = CURRENT_DATE
WHERE loan_id = 1;

ALTER TABLE Loans
ADD CONSTRAINT due_date_after_loan_date CHECK (due_date > loan_date);

SELECT b.title, a.first_name, a.last_name
FROM Books b
INNER JOIN Authors a ON b.author_id = a.author_id;

SELECT b.title, a.first_name, a.last_name
FROM Books b
LEFT JOIN Authors a ON b.author_id = a.author_id;

SELECT b.title, l.borrower_name
FROM Books b
INNER JOIN Loans l ON b.book_id = l.book_id
WHERE l.return_date IS NULL;

CREATE VIEW BookAuthors AS
SELECT b.title, a.first_name || ' ' || a.last_name AS author_full_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

select * from BookAuthors

CREATE VIEW OverdueBooks AS
SELECT b.title, l.borrower_name, l.due_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
WHERE l.return_date IS NULL AND l.due_date < CURRENT_DATE;

SELECT * FROM OverdueBooks
