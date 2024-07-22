--Hall

--create view
CREATE OR REPLACE VIEW Hall_View AS
SELECT 
    HID,
    HName,
    Place,
    Capacity
FROM 
    Hall;

--query1
SELECT 
    HID,
    HName,
    Place,
    Capacity
FROM 
    Hall_View
WHERE 
    Capacity > 100;

--query2
SELECT 
    HID,
    HName,
    Place,
    Capacity
FROM 
    Hall_View
WHERE 
    TO_NUMBER(SUBSTR(Place, INSTR(Place, ':') + 2, 1)) BETWEEN 4 AND 6;



--Book
--create view
CREATE OR REPLACE VIEW Book_View AS
SELECT 
    BookID,
    BookName,
    Categorys,
    Author,
    Title,
    Price,
    PageNumbers
FROM 
    Book;

--query1
SELECT 
    BookID,
    BookName,
    Author,
    Title,
    Price
FROM 
    Book
WHERE 
    BookName LIKE 'T%';


--query2
SELECT 
    BookID,
    BookName,
    Author,
    Title,
    Price
FROM 
    Book_View
WHERE 
    Price BETWEEN 10 AND 20
ORDER BY 
    Price DESC;
