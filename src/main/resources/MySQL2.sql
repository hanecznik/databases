USE mydb;

INSERT INTO Book (title, ISBN, category_id, published_year, copies, available_copies, publisher_id)
VALUES ('The Catcher in the Rye', '9780316769488', 1, '1951-07-16', 10, 7, 1);

INSERT INTO Book (title, ISBN, category_id, published_year, copies, available_copies, publisher_id)
VALUES ('To Kill a Mockingbird', '9780061120084', 2, '1960-07-11', 8, 4, 2);

INSERT INTO Author (first_name, last_name)
VALUES ('J.D.', 'Salinger');

INSERT INTO Author (first_name, last_name)
VALUES ('Harper', 'Lee');

INSERT INTO Library_Member (first_name, last_name, email, phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '555-1234');

INSERT INTO Library_Member (first_name, last_name, email, phone)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '555-5678');

INSERT INTO Books_Borrowing (member_id, staff_id, start_date, end_date)
VALUES (1, 1, '2023-01-15', '2023-01-22');

INSERT INTO Books_Borrowing (member_id, staff_id, start_date, end_date)
VALUES (2, 2, '2023-01-20', '2023-01-27');

INSERT INTO Books_Reservation (book_id, member_id, status)
VALUES (1, 1, 'pending');

INSERT INTO Books_Reservation (book_id, member_id, status)
VALUES (2, 2, 'completed');


UPDATE Book
SET available_copies = 5
WHERE ISBN = '9780316769488';

UPDATE Book
SET available_copies = 6
WHERE ISBN = '9780061120084';

UPDATE Books_Reservation
SET status = 'completed'
WHERE reservation_id = 1;

UPDATE Books_Borrowing
SET end_date = '2023-01-23'
WHERE borrowing_id = 1;

UPDATE Author
SET first_name = 'Jerome David'
WHERE last_name = 'Salinger';

UPDATE Author
SET last_name = 'Finch'
WHERE first_name = 'Harper';

UPDATE Library_Member
SET phone = '555-9999'
WHERE email = 'john.doe@example.com';

UPDATE Library_Member
SET email = 'jane.doe@example.com'
WHERE last_name = 'Smith';

UPDATE Book
SET copies = 15
WHERE ISBN = '9780316769488';



DELETE FROM Books_Reservation
WHERE reservation_id = 2;

DELETE FROM Books_Borrowing
WHERE borrowing_id = 2;

DELETE FROM Book
WHERE book_id = 2;

DELETE FROM Author
WHERE author_id = 2;

DELETE FROM Library_Member
WHERE member_id = 2;

DELETE FROM Subscription
WHERE subscription_id = 1;

DELETE FROM Books_Review
WHERE review_id = 1;

DELETE FROM Ebook
WHERE ebook_id = 1;

DELETE FROM Penalty
WHERE penalty_id = 1;

DELETE FROM Book_Publisher
WHERE publisher_id = 1;


ALTER TABLE Book
ADD COLUMN description TEXT;

ALTER TABLE Books_Review
DROP COLUMN rewiev_text;

ALTER TABLE Library_Member
MODIFY COLUMN phone VARCHAR(20);

ALTER TABLE Books_Borrowing
ADD CONSTRAINT fk_member
FOREIGN KEY (member_id) REFERENCES Library_Member(member_id);

ALTER TABLE Penalty
CHANGE COLUMN amount fine_amount VARCHAR(45);


SELECT b.title, a.first_name AS author_first_name, a.last_name AS author_last_name, 
       m.first_name AS member_first_name, m.last_name AS member_last_name,
       bo.start_date, bo.end_date, r.status AS reservation_status
FROM Book b
JOIN Books_Reservation r ON b.book_id = r.book_id
JOIN Library_Member m ON r.member_id = m.member_id
JOIN Books_Borrowing bo ON m.member_id = bo.member_id
JOIN Book_Publisher p ON b.publisher_id = p.publisher_id
JOIN Author a ON b.book_id = a.author_id;



SELECT b.title, a.first_name, a.last_name
FROM Book b
INNER JOIN Author a ON b.book_id = a.author_id;

SELECT b.title, r.status
FROM Book b
LEFT JOIN Books_Reservation r ON b.book_id = r.book_id;

SELECT m.first_name, r.status
FROM Library_Member m
RIGHT JOIN Books_Reservation r ON m.member_id = r.member_id;

SELECT b.title, r.status
FROM Book b
LEFT JOIN Books_Reservation r ON b.book_id = r.book_id
UNION
SELECT b.title, r.status
FROM Book b
RIGHT JOIN Books_Reservation r ON b.book_id = r.book_id;

SELECT m.first_name, m.last_name, bo.start_date, bo.end_date
FROM Library_Member m
LEFT JOIN Books_Borrowing bo ON m.member_id = bo.member_id;



SELECT category_id, COUNT(*) AS total_books
FROM Book
GROUP BY category_id;

SELECT member_id, AVG(TIMESTAMPDIFF(DAY, start_date, end_date)) AS avg_borrow_days
FROM Books_Borrowing
GROUP BY member_id;

SELECT book_id, COUNT(*) AS total_reservations
FROM Books_Reservation
GROUP BY book_id;

SELECT borrowing_id, SUM(fine_amount) AS total_fine
FROM Penalty
GROUP BY borrowing_id;

SELECT book_id, AVG(rating) AS avg_rating
FROM Books_Review
GROUP BY book_id;

SELECT plan_type, COUNT(*) AS total_subscriptions
FROM Subscription
GROUP BY plan_type;

SELECT position, COUNT(*) AS total_staff
FROM Library_Staff
GROUP BY position;



SELECT book_id, COUNT(*) AS total_reservations
FROM Books_Reservation
GROUP BY book_id
HAVING total_reservations > 5;

SELECT member_id, COUNT(*) AS total_borrowings
FROM Books_Borrowing
GROUP BY member_id
HAVING total_borrowings > 2;

SELECT borrowing_id, SUM(fine_amount) AS total_fine
FROM Penalty
GROUP BY borrowing_id
HAVING total_fine > 50;

SELECT book_id, AVG(rating) AS avg_rating
FROM Books_Review
GROUP BY book_id
HAVING avg_rating > 4;

SELECT category_id, COUNT(*) AS total_books
FROM Book
GROUP BY category_id
HAVING total_books > 10;

SELECT staff_id, TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM Library_Staff
GROUP BY staff_id
HAVING years_worked > 3;

SELECT plan_type, COUNT(*) AS total_subscriptions
FROM Subscription
GROUP BY plan_type
HAVING total_subscriptions > 10;