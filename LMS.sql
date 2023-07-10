create database Library_management;

use Library_management;


-- creating Books Table 

create table Books (
BookID int primary key , 
Title varchar(20),
Author varchar(20),
Publisher varchar(20),
ISBN int ,
Genre varchar(20),
Availability boolean ); 

-- creating Borrowers Table

create table Borrowers (
BorrowerID int primary key , 
Name varchar(20),
Address varchar(50),
Phone_Number int ,
Email int 
); 


-- creating Loans Table 

create table Loans (
LoanID int primary key ,
BookID int ,
BorrowerID int , 
foreign key(BookID) references Books(BookID),
foreign key(BorrowerID) references Borrowers(BorrowerID),
Date_borrowed date,
Due_date date ,
Date_returned date );

-- creating Reservations Table 

create table Reservations (
ReservationID int primary key ,
BookID int ,
BorrowerID int , 
foreign key(BookID) references Books(BookID),
foreign key(BorrowerID) references Borrowers(BorrowerID),
Date_reserved date , 
Date_needed date , 
Status varchar(10) );

-- Inserting values into books Table 

INSERT INTO Books (BookID, Title, Author, Publisher, ISBN, Genre, Availability) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1234567, 'Fiction', true),
(2, 'To Kill Mockingbird', 'Harper Lee', 'J. B. Lippincott', 2345678, 'Fiction', true),
(3, '1984', 'George Orwell', 'Secker & Warburg', 3456789, 'Fiction', false),
(4, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', 4567890, 'Fiction', true),
(5, 'The Catcher', 'J. D. Salinger', 'Little, Brown', 5678901, 'Fiction', false);

-- Inserting values into Borrowers Table 

INSERT INTO Borrowers (BorrowerID, Name, Address, Phone_Number, Email) VALUES
(1, 'John Doe', '123 Main Street, Cityville', 1234567890, 'john.doe@email.com'),
(2, 'Jane Smith', '456 Park Avenue, Townburg', 2345678901, 'jane.smith@email.com'),
(3, 'Michael Johnson', '789 Elm Road, Villageton', 3456789012, 'michael.johnson@email.com'),
(4, 'Emily Williams', '567 Oak Lane, Boroughville', 4567890123, 'emily.williams@email.com'),
(5, 'David Brown', '901 Pine Court, Hamletown', 5678901234, 'david.brown@email.com');

-- Modifying datatype of Email column in Borrowers Table

ALTER TABLE Borrowers MODIFY COLUMN Email VARCHAR(50);

-- Modifying datatype of phone_number column in Borrowers Table 

ALTER TABLE Borrowers MODIFY COLUMN Phone_Number bigint;

-- Inserting into Loans Table 

INSERT INTO Loans (LoanID, BookID, BorrowerID, Date_borrowed, Due_date, Date_returned) VALUES
(1, 1, 1, '2023-06-10', '2023-06-24', '2023-06-22'),
(2, 2, 2, '2023-06-15', '2023-06-29', NULL), -- Book not yet returned
(3, 3, 3, '2023-06-20', '2023-07-04', NULL), -- Book not yet returned
(4, 4, 4, '2023-06-25', '2023-07-09', NULL), -- Book not yet returned
(5, 5, 5, '2023-06-30', '2023-07-14', NULL); -- Book not yet returned

-- Inserting into Reservations Table 

INSERT INTO Reservations (ReservationID, BookID, BorrowerID, Date_reserved, Date_needed, Status) VALUES
(1, 1, 1, '2023-06-15', '2023-06-20', 'active'),
(2, 2, 2, '2023-06-18', '2023-06-25', 'active'),
(3, 3, 3, '2023-06-20', '2023-06-25', 'active'),
(4, 4, 4, '2023-06-22', '2023-06-27', 'canceled'),
(5, 5, 5, '2023-06-25', '2023-06-30', 'expired');

-- Quering the Database 

SELECT * from Books WHERE Availability = True ;

-- Get the Borrowed Books 

SELECT Books.Title , Books.Author , Borrowers.Name , Loans.Date_borrowed, Loans.Due_date
from Books 
inner join Loans on Books.BookID = Loans.BookID
inner join Borrowers on Loans.BorrowerID = Borrowers.BorrowerID ;

-- Get All Reserved Books

SELECT Books.Title, Books.Author, Borrowers.Name, Reservations.Date_reserved, Reservations.Date_needed
FROM Books
INNER JOIN Reservations ON Books.BookID = Reservations.BookID
INNER JOIN Borrowers ON Reservations.BorrowerID = Borrowers.BorrowerID ;


 


