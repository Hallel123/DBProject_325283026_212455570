CREATE TABLE Hall
(
  HName varchar2(15) NOT NULL,
  Place varchar2(40) NOT NULL,
  HID INT NOT NULL,
  Capacity INT NOT NULL,
  PRIMARY KEY (HID)
);

CREATE TABLE Person
(
  Address varchar2(40) NOT NULL,
  Mail varchar2(30) NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  Age INT NOT NULL,
  Pname varchar2(30) NOT NULL,
  PRIMARY KEY (MainPhone)
);

CREATE TABLE Manager
(
  MRole varchar2(20) NOT NULL,
  Seniority INT NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (MainPhone),
  FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone)
);

CREATE TABLE ActivityOperator
(
  OCost number(8,2) NOT NULL,
  Expertise varchar2(40) NOT NULL,
  Gender varchar2(15) NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (MainPhone),
  FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone)
);

CREATE TABLE Participant
(
  UserName varchar2(40),
  PPassword INT,
  PType varchar2(30) NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (MainPhone),
  FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone)
);

CREATE TABLE Person_More_Phone
(
  More_Phone varchar2(10) NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (More_Phone, MainPhone),
  FOREIGN KEY (MainPhone) REFERENCES Person(MainPhone)
);

CREATE TABLE Manager_Working_Days
(
  Working_Days varchar2(10) NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (Working_Days, MainPhone),
  FOREIGN KEY (MainPhone) REFERENCES Manager(MainPhone)
);

CREATE TABLE Event
(
  EDate date NOT NULL,
  ETime number(4,0) NOT NULL,
  Audience varchar2(30) NOT NULL,
  ECategory varchar2(40) NOT NULL,
  ActivityD varchar2(300) NOT NULL,
  Price NUMBER(6,2) NOT NULL,
  Duration INT NOT NULL,
  EID INT NOT NULL,
  HID INT NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (EID),
  FOREIGN KEY (HID) REFERENCES Hall(HID),
  FOREIGN KEY (MainPhone) REFERENCES Manager(MainPhone) 
);

CREATE TABLE Event_Operator
(
  EID INT NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (EID, MainPhone),
  FOREIGN KEY (EID) REFERENCES Event(EID),
  FOREIGN KEY (MainPhone) REFERENCES ActivityOperator(MainPhone)
);

CREATE TABLE Event_Participant
(
  Review INT NOT NULL,
  SeatNumber INT NOT NULL,
  CardNum INT NOT NULL,
  SignUpDate date NOT NULL,
  EID INT NOT NULL,
  MainPhone varchar2(10) NOT NULL,
  PRIMARY KEY (EID, MainPhone),
  FOREIGN KEY (EID) REFERENCES Event(EID),
  FOREIGN KEY (MainPhone) REFERENCES Participant(MainPhone)
);
