-- Inserting data into Hall table
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Main Hall', 'Downtown', 1, 200);
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Conference Room', 'Library 2nd Floor', 2, 50);
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Auditorium', 'City Center', 3, 300);
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Meeting Room A', 'Library 1st Floor', 4, 30);
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Meeting Room B', 'Library 1st Floor', 5, 30);
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Outdoor Area', 'Library Courtyard', 6, 150);
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Workshop Room', 'Library Basement', 7, 40);
INSERT INTO Hall (HName, Place, HID, Capacity) VALUES ('Reading Room', 'Library 3rd Floor', 8, 20);

-- Inserting data into Person table
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('123 Elm St', 'john.doe@example.com', '5550001', 30, 'John Doe');
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('456 Maple Ave', 'jane.smith@example.com', '5550002', 25, 'Jane Smith');
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('789 Oak Dr', 'alice.jones@example.com', '5550003', 40, 'Alice Jones');
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('321 Pine Rd', 'bob.brown@example.com', '5550004', 35, 'Bob Brown');
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('654 Cedar St', 'carol.white@example.com', '5550005', 28, 'Carol White');
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('987 Birch Ln', 'dave.green@example.com', '5550006', 50, 'Dave Green');
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('246 Spruce Pl', 'eve.black@example.com', '5550007', 22, 'Eve Black');
INSERT INTO Person (Address, Mail, MainPhone, Age, Pname) VALUES ('369 Willow Way', 'frank.gray@example.com', '5550008', 45, 'Frank Gray');

-- Inserting data into Manager table
INSERT INTO Manager (MRole, Seniority, MainPhone) VALUES ('Event Coordinator', 10, '5550001');
INSERT INTO Manager (MRole, Seniority, MainPhone) VALUES ('Senior Manager', 15, '5550003');
INSERT INTO Manager (MRole, Seniority, MainPhone) VALUES ('Assistant Manager', 5, '5550004');
INSERT INTO Manager (MRole, Seniority, MainPhone) VALUES ('Operations Manager', 8, '5550006');
INSERT INTO Manager (MRole, Seniority, MainPhone) VALUES ('Junior Manager', 3, '5550008');

-- Inserting data into ActivityOperator table
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (200.00, 'Childrens author', 'Male', '5550002');
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (150.50, 'Yoga guide', 'Female', '5550005');
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (175.75, 'Storyteller', 'Female', '5550007');
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (300.00, 'Magician', 'Male', '5550004');
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (225.25, 'Science educator', 'Female', '5550003');
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (250.00, 'Historian', 'Male', '5550008');
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (100.00, 'Musician', 'Female', '5550006');
INSERT INTO ActivityOperator (OCost, Expertise, Gender, MainPhone) VALUES (180.80, 'Puppeteer', 'Male', '5550001');

-- Inserting data into Participant table
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('johnny123', 1234, 'Adult', '5550001');
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('jane_doe', 5678, 'Child', '5550002');
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('alice.j', 9101, 'Senior', '5550003');
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('bob_the_builder', 1121, 'Adult', '5550004');
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('carolyn', 3141, 'Teen', '5550005');
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('daveG', 5161, 'Adult', '5550006');
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('eve_black', 7181, 'Child', '5550007');
INSERT INTO Participant (UserName, PPassword, PType, MainPhone) VALUES ('frankG45', 9202, 'Senior', '5550008');

-- Inserting data into Person_More_Phone table
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551001', '5550001');
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551002', '5550002');
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551003', '5550003');
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551004', '5550004');
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551005', '5550005');
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551006', '5550006');
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551007', '5550007');
INSERT INTO Person_More_Phone (More_Phone, MainPhone) VALUES ('5551008', '5550008');

-- Inserting data into Manager_Working_Days table
INSERT INTO Manager_Working_Days (Working_Days, MainPhone) VALUES ('Monday', '5550001');
INSERT INTO Manager_Working_Days (Working_Days, MainPhone) VALUES ('Tuesday', '5550003');
INSERT INTO Manager_Working_Days (Working_Days, MainPhone) VALUES ('Wednesday', '5550004');
INSERT INTO Manager_Working_Days (Working_Days, MainPhone) VALUES ('Thursday', '5550006');
INSERT INTO Manager_Working_Days (Working_Days, MainPhone) VALUES ('Friday', '5550008');
INSERT INTO Manager_Working_Days (Working_Days, MainPhone) VALUES ('Wednesday', '5550003');
INSERT INTO Manager_Working_Days (Working_Days, MainPhone) VALUES ('Friday', '5550004');

-- Inserting data into Event table
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-01', 'YYYY-MM-DD'), 1400, 'Children', 'Education', 'Science Show', 5.00, 120, 1, 1, '5550001');
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-02', 'YYYY-MM-DD'), 1000, 'Adults', 'Health', 'Yoga Session', 10.00, 90, 2, 2, '5550003');
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-03', 'YYYY-MM-DD'), 1500, 'Family', 'Entertainment', 'Magic Show', 8.00, 60, 3, 3, '5550004');
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-04', 'YYYY-MM-DD'), 1100, 'Teens', 'Literature', 'Storytelling', 6.00, 45, 4, 4, '5550006');
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-05', 'YYYY-MM-DD'), 1300, 'Seniors', 'History', 'Historical Talk', 7.50, 75, 5, 5, '5550008');
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-06', 'YYYY-MM-DD'), 1700, 'General', 'Music', 'Live Concert', 15.00, 180, 6, 6, '5550001');
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-07', 'YYYY-MM-DD'), 1200, 'Adults', 'Workshop', 'Gardening Workshop', 20.00, 150, 7, 7, '5550003');
INSERT INTO Event (EDate, ETime, Audience, ECategory, ActivityD, Price, Duration, EID, HID, MainPhone) VALUES (TO_DATE('2024-06-08', 'YYYY-MM-DD'), 1600, 'Family', 'Art', 'Puppet Show', 5.00, 60, 8, 8, '5550004');

-- Inserting data into Event_Operator table
INSERT INTO Event_Operator (EID, MainPhone) VALUES (1, '5550002');
INSERT INTO Event_Operator (EID, MainPhone) VALUES (2, '5550005');
INSERT INTO Event_Operator (EID, MainPhone) VALUES (3, '5550004');
INSERT INTO Event_Operator (EID, MainPhone) VALUES (4, '5550007');
INSERT INTO Event_Operator (EID, MainPhone) VALUES (5, '5550003');
INSERT INTO Event_Operator (EID, MainPhone) VALUES (6, '5550006');
INSERT INTO Event_Operator (EID, MainPhone) VALUES (7, '5550008');
INSERT INTO Event_Operator (EID, MainPhone) VALUES (8, '5550001');

-- Inserting data into Event_Participant table
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (5, 1, 123456789012, (TO_DATE('2024-06-01', 'YYYY-MM-DD')), 1, '5550001');
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (4, 2, 234567890123, (TO_DATE('2024-05-01', 'YYYY-MM-DD')), 2, '5550002');
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (3, 3, 345678901234, (TO_DATE('2024-06-20', 'YYYY-MM-DD')), 3, '5550003');
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (5, 4, 456789012345, (TO_DATE('2024-06-01', 'YYYY-MM-DD')), 4, '5550004');
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (4, 5, 567890123456, (TO_DATE('2024-03-01', 'YYYY-MM-DD')), 5, '5550005');
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (5, 6, 678901234567, (TO_DATE('2024-06-07', 'YYYY-MM-DD')), 6, '5550006');
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (3, 7, 789012345678, (TO_DATE('2024-08-01', 'YYYY-MM-DD')), 7, '5550007');
INSERT INTO Event_Participant (Review, SeatNumber, CardNum, SignUpDate, EID, MainPhone) VALUES (4, 8, 890123456789, (TO_DATE('2024-02-01', 'YYYY-MM-DD')), 8, '5550008');

commit;
