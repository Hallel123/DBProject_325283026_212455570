--commit;
--rollback;

SELECT constraint_name
FROM all_cons_columns
WHERE table_name = 'MEMBERSHIP' AND column_name='CUSTOMERID';

ALTER TABLE Membership DROP CONSTRAINT SYS_C0016027;
ALTER TABLE Membership DROP CONSTRAINT SYS_C0016028;
ALTER TABLE Membership DROP CONSTRAINT SYS_C0016029;


SELECT constraint_name
FROM all_cons_columns
WHERE table_name = 'PURCHASE' AND column_name='WORKERID';

ALTER TABLE purchase DROP CONSTRAINT SYS_C0016014;
ALTER TABLE purchase DROP CONSTRAINT SYS_C0016017;

SELECT constraint_name
FROM all_cons_columns
WHERE table_name = 'MANAGER' AND column_name='MAINPHONE';

ALTER TABLE MANAGER DROP CONSTRAINT SYS_C0015948;
ALTER TABLE MANAGER DROP CONSTRAINT SYS_C0015950;


-- Rename the existing worker table to Librarian
ALTER TABLE Worker RENAME TO Librarian;

ALTER TABLE person
MODIFY (mainphone VARCHAR2(15));
commit;



--change the type of the phone number column of librarian
ALTER TABLE Librarian RENAME COLUMN workerphone TO workerphoneTemp;

ALTER TABLE Librarian ADD (workerphone VARCHAR2(15));
UPDATE Librarian SET workerphone = TO_CHAR(workerphoneTemp);
ALTER TABLE Librarian DROP COLUMN workerphoneTemp;

--change the type of the phone number column of customer
ALTER TABLE Customer RENAME COLUMN CustomerPhone TO CustomerPhoneTemp;
ALTER TABLE Customer ADD (CustomerPhone VARCHAR2(15));
UPDATE Customer SET CustomerPhone = TO_CHAR(CustomerPhoneTemp);
ALTER TABLE Customer DROP COLUMN CustomerPhoneTemp;


-- Create the new Worker table

CREATE TABLE Worker
(
  MainPhone VARCHAR2(15) NOT NULL,
  HireDate DATE NOT NULL,
  PRIMARY KEY (MainPhone),
  FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone)
);

-- Update the Librarian table
-- Remove the Position column
ALTER TABLE Librarian DROP COLUMN Position;



UPDATE Librarian L
SET L.WorkerPhone = (
    SELECT TO_CHAR(ROWNUM + 1000000000) 
    FROM DUAL 
    WHERE NOT EXISTS (SELECT 1 FROM Person P WHERE P.MainPhone = TO_CHAR(ROWNUM + 1000000000))
    AND NOT EXISTS (SELECT 1 FROM Librarian L2 WHERE L2.WorkerPhone = TO_CHAR(ROWNUM + 1000000000))
)
WHERE L.WorkerPhone IS NULL;


DROP SEQUENCE membershipid_seq;
CREATE SEQUENCE membershipid_seq START WITH 200000000 INCREMENT BY 1;

-- Add MainPhone to Membership table
ALTER TABLE Membership ADD MainPhone VARCHAR2(15);


-- Insert participants who are subscribers into Membership with generated values
INSERT INTO Membership (MembershipID, StartDate, EndDate, MembershipType,CustomerID, MainPhone)
SELECT membershipid_seq.NEXTVAL,
       TO_DATE('2023-01-01', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 365)),
       TO_DATE('2024-01-01', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 365)),
       CASE ROUND(DBMS_RANDOM.VALUE(1, 3))
           WHEN 1 THEN 'month'
           WHEN 2 THEN 'year'
           WHEN 3 THEN '6-month'
       END,
       -1 as CustomerID,
       MainPhone
FROM Participant
WHERE PType = 'subscription';


-- Update Membership to reference Person
DELETE FROM Customer
WHERE ROWID IN (
    SELECT ROWID FROM (
        SELECT ROWID, ROW_NUMBER() OVER (PARTITION BY CustomerPhone ORDER BY CustomerID) AS rn
        FROM Customer
    ) WHERE rn > 1
);

commit;

-- Update MainPhone in Membership
UPDATE Membership SET MainPhone = (SELECT TO_CHAR(CustomerPhone) FROM Customer WHERE Customer.CustomerID = Membership.CustomerID);


INSERT INTO Person (MainPhone, Pname, Address, Mail, Age)
SELECT 
    C.CustomerPhone AS MainPhone,
    C.CustomerFname || ' ' || C.CustomerLname AS Pname,
    'Default Address' AS Address, -- Placeholder value for Address
    NVL(C.CustomerEmail, C.CustomerFname || '@gmail.com') AS Mail, -- Use CustomerEmail or generate default email
    30 AS Age -- Placeholder value for Age
FROM Customer C
WHERE NOT EXISTS (
    SELECT 1 FROM Person P WHERE P.MainPhone = C.CustomerPhone
);

commit;


-- Add foreign key constraint only if it does not exist
DECLARE
  cnt INTEGER;
BEGIN
  SELECT COUNT(*) INTO cnt
  FROM user_constraints
  WHERE table_name = 'MEMBERSHIP'
    AND constraint_type = 'R'
    AND r_constraint_name = 'FK_Membership_Person';

  IF cnt = 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE Membership ADD CONSTRAINT FK_Membership_Person FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone)';
  END IF;
END;


-- Drop the CustomerID column
ALTER TABLE Membership DROP COLUMN CustomerID;

-- Ensure MainPhone in Event_Participant references Person
BEGIN
  EXECUTE IMMEDIATE 'ALTER TABLE Event_Participant ADD CONSTRAINT FK_Event_Participant_Person FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone)';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -2275 THEN
      NULL; -- Constraint already exists, ignore the error
    ELSE
      RAISE;
    END IF;
END;


ALTER TABLE Participant DROP COLUMN PType;
ALTER TABLE Participant DROP COLUMN UserName;
ALTER TABLE Participant DROP COLUMN PPassword;


--treat purchase
-- Add a new column LibrarianPhone to PURCHASE table
ALTER TABLE purchase ADD (LibrarianPhone VARCHAR2(15));



ALTER TABLE Librarian ADD CONSTRAINT uq_workerPhone UNIQUE (workerPhone);

-- Delete duplicates in Librarian table if the phone number is already in Person table
DELETE FROM Librarian L
WHERE EXISTS (SELECT 1 FROM Person P WHERE P.MainPhone = L.WorkerPhone);

select* from purchase;

UPDATE purchase p
SET LibrarianPhone = (
    SELECT l.workerphone
    FROM Librarian l
    WHERE l.WorkerId = p.WorkerId
);

ALTER TABLE purchase ADD CONSTRAINT fk_purchase_librarian FOREIGN KEY (LibrarianPhone) REFERENCES Librarian(workerPhone);


-- Insert Librarian data into Person table
INSERT INTO Person (MainPhone, Pname, Address, Mail, Age)
SELECT 
    L.WorkerPhone AS MainPhone,
    L.WorkerFname || ' ' || L.WorkerLname AS Pname,
    'Default Address' AS Address, -- Placeholder value
    'defaultemail@example.com' AS Mail, -- Placeholder value
    30 AS Age -- Placeholder value
FROM Librarian L
WHERE L.WorkerPhone IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM Person P WHERE P.MainPhone = L.WorkerPhone);



-- Insert Librarian data into Worker table
INSERT INTO Worker (MainPhone, HireDate)
SELECT 
    L.WorkerPhone AS MainPhone,
    L.HireDate AS HireDate
FROM Librarian L
WHERE L.WorkerPhone IS NOT NULL;


-- Insert Manager data into Worker table
INSERT INTO Worker (MainPhone, HireDate)
SELECT 
    M.MainPhone AS MainPhone,
    ADD_MONTHS(SYSDATE, -12 * M.Seniority) AS HireDate
FROM Manager M;


-- Delete the Seniority column from Manager table
ALTER TABLE Manager DROP COLUMN Seniority;

ALTER TABLE Librarian ADD CONSTRAINT FK_Librarian_Worker FOREIGN KEY (workerPhone) REFERENCES Worker(MainPhone);

-- Add a new column CustomerPhone to PURCHASE table
ALTER TABLE purchase ADD (CustomerPhone VARCHAR2(15));

ALTER TABLE customer RENAME COLUMN CustomerPhone TO MainPhone;

-- Update CustomerPhone with corresponding MainPhone from Customer table
UPDATE purchase p
SET CustomerPhone = (
    SELECT c.MainPhone
    FROM Customer c
    WHERE c.CustomerID = p.CustomerID
);


-- Rename CustomerPhone to MainPhone
ALTER TABLE Customer ADD CONSTRAINT uq_customerPhone UNIQUE (MainPhone);

-- Add foreign key constraint on the new MainPhone column referencing the Person table
ALTER TABLE purchase ADD CONSTRAINT fk_purchase_customer FOREIGN KEY (CustomerPhone) REFERENCES Customer(MainPhone);


ALTER TABLE librarian RENAME COLUMN workerPhone TO MainPhone;

-- Update LibrarianPhone with corresponding MainPhone from Librarian table
UPDATE purchase p
SET LibrarianPhone = (
    SELECT l.MainPhone
    FROM Librarian l
    WHERE l.WorkerId = p.WorkerId
);



-- Add foreign key constraint to Manager table
ALTER TABLE Manager ADD CONSTRAINT fk_manager_worker FOREIGN KEY (MainPhone) REFERENCES Worker(MainPhone);
ALTER TABLE Customer ADD CONSTRAINT fk_customer_person FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone);

-- Drop all columns except MainPhone from the CUSTOMER table

ALTER TABLE Customer DROP COLUMN CustomerFname;
ALTER TABLE Customer DROP COLUMN CustomerLname;
ALTER TABLE Customer DROP COLUMN CustomerEmail;
ALTER TABLE purchase DROP COLUMN WorkerId;
ALTER TABLE purchase DROP COLUMN CustomerID;
ALTER TABLE Customer DROP COLUMN CustomerID;
ALTER TABLE Librarian DROP COLUMN HireDate;
ALTER TABLE Librarian DROP COLUMN WorkerLname;
ALTER TABLE Librarian DROP COLUMN WorkerFname;
ALTER TABLE Librarian DROP COLUMN WorkerId;






