prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by halel on יום רביעי 22 מאי 2024
set feedback off
set define off

prompt Creating PERSON...
create table PERSON
(
  address   VARCHAR2(40) not null,
  mail      VARCHAR2(30) not null,
  mainphone VARCHAR2(10) not null,
  age       INTEGER not null,
  pname     VARCHAR2(30) not null
)
;
alter table PERSON
  add primary key (MAINPHONE);

prompt Creating ACTIVITYOPERATOR...
create table ACTIVITYOPERATOR
(
  ocost     NUMBER(8,2) not null,
  expertise VARCHAR2(40) not null,
  gender    VARCHAR2(15) not null,
  mainphone VARCHAR2(10) not null
)
;
alter table ACTIVITYOPERATOR
  add primary key (MAINPHONE);
alter table ACTIVITYOPERATOR
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Creating HALL...
create table HALL
(
  hname    VARCHAR2(15) not null,
  place    VARCHAR2(40) not null,
  hid      INTEGER not null,
  capacity INTEGER not null
)
;
alter table HALL
  add primary key (HID);

prompt Creating MANAGER...
create table MANAGER
(
  mrole     VARCHAR2(20) not null,
  seniority INTEGER not null,
  mainphone VARCHAR2(10) not null
)
;
alter table MANAGER
  add primary key (MAINPHONE);
alter table MANAGER
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Creating EVENT...
create table EVENT
(
  edate     DATE not null,
  etime     NUMBER(4) not null,
  audience  VARCHAR2(30) not null,
  ecategory VARCHAR2(40) not null,
  activityd VARCHAR2(300) not null,
  price     NUMBER(6,2) not null,
  duration  INTEGER not null,
  eid       INTEGER not null,
  hid       INTEGER not null,
  mainphone VARCHAR2(10) not null
)
;
alter table EVENT
  add primary key (EID);
alter table EVENT
  add foreign key (HID)
  references HALL (HID);
alter table EVENT
  add foreign key (MAINPHONE)
  references MANAGER (MAINPHONE);

prompt Creating EVENT_OPERATOR...
create table EVENT_OPERATOR
(
  eid       INTEGER not null,
  mainphone VARCHAR2(10) not null
)
;
alter table EVENT_OPERATOR
  add primary key (EID, MAINPHONE);
alter table EVENT_OPERATOR
  add foreign key (EID)
  references EVENT (EID);
alter table EVENT_OPERATOR
  add foreign key (MAINPHONE)
  references ACTIVITYOPERATOR (MAINPHONE);

prompt Creating PARTICIPANT...
create table PARTICIPANT
(
  username  VARCHAR2(40),
  ppassword INTEGER,
  ptype     VARCHAR2(30) not null,
  mainphone VARCHAR2(10) not null
)
;
alter table PARTICIPANT
  add primary key (MAINPHONE);
alter table PARTICIPANT
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Creating EVENT_PARTICIPANT...
create table EVENT_PARTICIPANT
(
  review     INTEGER not null,
  seatnumber INTEGER not null,
  cardnum    INTEGER not null,
  signupdate DATE not null,
  eid        INTEGER not null,
  mainphone  VARCHAR2(10) not null
)
;
alter table EVENT_PARTICIPANT
  add primary key (EID, MAINPHONE);
alter table EVENT_PARTICIPANT
  add foreign key (EID)
  references EVENT (EID);
alter table EVENT_PARTICIPANT
  add foreign key (MAINPHONE)
  references PARTICIPANT (MAINPHONE);

prompt Creating MANAGER_WORKING_DAYS...
create table MANAGER_WORKING_DAYS
(
  working_days VARCHAR2(10) not null,
  mainphone    VARCHAR2(10) not null
)
;
alter table MANAGER_WORKING_DAYS
  add primary key (WORKING_DAYS, MAINPHONE);
alter table MANAGER_WORKING_DAYS
  add foreign key (MAINPHONE)
  references MANAGER (MAINPHONE);

prompt Creating PERSON_MORE_PHONE...
create table PERSON_MORE_PHONE
(
  more_phone VARCHAR2(10) not null,
  mainphone  VARCHAR2(10) not null
)
;
alter table PERSON_MORE_PHONE
  add primary key (MORE_PHONE, MAINPHONE);
alter table PERSON_MORE_PHONE
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR disable all triggers;
prompt Disabling triggers for HALL...
alter table HALL disable all triggers;
prompt Disabling triggers for MANAGER...
alter table MANAGER disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for EVENT_OPERATOR...
alter table EVENT_OPERATOR disable all triggers;
prompt Disabling triggers for PARTICIPANT...
alter table PARTICIPANT disable all triggers;
prompt Disabling triggers for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT disable all triggers;
prompt Disabling triggers for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS disable all triggers;
prompt Disabling triggers for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE disable all triggers;
prompt Disabling foreign key constraints for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR disable constraint SYS_C009512;
prompt Disabling foreign key constraints for MANAGER...
alter table MANAGER disable constraint SYS_C009506;
prompt Disabling foreign key constraints for EVENT...
alter table EVENT disable constraint SYS_C009536;
alter table EVENT disable constraint SYS_C009537;
prompt Disabling foreign key constraints for EVENT_OPERATOR...
alter table EVENT_OPERATOR disable constraint SYS_C009541;
alter table EVENT_OPERATOR disable constraint SYS_C009542;
prompt Disabling foreign key constraints for PARTICIPANT...
alter table PARTICIPANT disable constraint SYS_C009516;
prompt Disabling foreign key constraints for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT disable constraint SYS_C009550;
alter table EVENT_PARTICIPANT disable constraint SYS_C009551;
prompt Disabling foreign key constraints for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS disable constraint SYS_C009524;
prompt Disabling foreign key constraints for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE disable constraint SYS_C009520;
prompt Deleting PERSON_MORE_PHONE...
delete from PERSON_MORE_PHONE;
commit;
prompt Deleting MANAGER_WORKING_DAYS...
delete from MANAGER_WORKING_DAYS;
commit;
prompt Deleting EVENT_PARTICIPANT...
delete from EVENT_PARTICIPANT;
commit;
prompt Deleting PARTICIPANT...
delete from PARTICIPANT;
commit;
prompt Deleting EVENT_OPERATOR...
delete from EVENT_OPERATOR;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Deleting MANAGER...
delete from MANAGER;
commit;
prompt Deleting HALL...
delete from HALL;
commit;
prompt Deleting ACTIVITYOPERATOR...
delete from ACTIVITYOPERATOR;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (address, mail, mainphone, age, pname)
values ('123 Elm St', 'john.doe@example.com', '5550001', 30, 'John Doe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('456 Maple Ave', 'jane.smith@example.com', '5550002', 25, 'Jane Smith');
insert into PERSON (address, mail, mainphone, age, pname)
values ('789 Oak Dr', 'alice.jones@example.com', '5550003', 40, 'Alice Jones');
insert into PERSON (address, mail, mainphone, age, pname)
values ('321 Pine Rd', 'bob.brown@example.com', '5550004', 35, 'Bob Brown');
insert into PERSON (address, mail, mainphone, age, pname)
values ('654 Cedar St', 'carol.white@example.com', '5550005', 28, 'Carol White');
insert into PERSON (address, mail, mainphone, age, pname)
values ('987 Birch Ln', 'dave.green@example.com', '5550006', 50, 'Dave Green');
insert into PERSON (address, mail, mainphone, age, pname)
values ('246 Spruce Pl', 'eve.black@example.com', '5550007', 22, 'Eve Black');
insert into PERSON (address, mail, mainphone, age, pname)
values ('369 Willow Way', 'frank.gray@example.com', '5550008', 45, 'Frank Gray');
commit;
prompt 8 records loaded
prompt Loading ACTIVITYOPERATOR...
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (200, 'Childrens author', 'Male', '5550002');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (150.5, 'Yoga guide', 'Female', '5550005');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (175.75, 'Storyteller', 'Female', '5550007');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (300, 'Magician', 'Male', '5550004');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (225.25, 'Science educator', 'Female', '5550003');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (250, 'Historian', 'Male', '5550008');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (100, 'Musician', 'Female', '5550006');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (180.8, 'Puppeteer', 'Male', '5550001');
commit;
prompt 8 records loaded
prompt Loading HALL...
insert into HALL (hname, place, hid, capacity)
values ('Main Hall', 'Downtown', 1, 200);
insert into HALL (hname, place, hid, capacity)
values ('Conference Room', 'Library 2nd Floor', 2, 50);
insert into HALL (hname, place, hid, capacity)
values ('Auditorium', 'City Center', 3, 300);
insert into HALL (hname, place, hid, capacity)
values ('Meeting Room A', 'Library 1st Floor', 4, 30);
insert into HALL (hname, place, hid, capacity)
values ('Meeting Room B', 'Library 1st Floor', 5, 30);
insert into HALL (hname, place, hid, capacity)
values ('Outdoor Area', 'Library Courtyard', 6, 150);
insert into HALL (hname, place, hid, capacity)
values ('Workshop Room', 'Library Basement', 7, 40);
insert into HALL (hname, place, hid, capacity)
values ('Reading Room', 'Library 3rd Floor', 8, 20);
commit;
prompt 8 records loaded
prompt Loading MANAGER...
insert into MANAGER (mrole, seniority, mainphone)
values ('Event Coordinator', 10, '5550001');
insert into MANAGER (mrole, seniority, mainphone)
values ('Senior Manager', 15, '5550003');
insert into MANAGER (mrole, seniority, mainphone)
values ('Assistant Manager', 5, '5550004');
insert into MANAGER (mrole, seniority, mainphone)
values ('Operations Manager', 8, '5550006');
insert into MANAGER (mrole, seniority, mainphone)
values ('Junior Manager', 3, '5550008');
commit;
prompt 5 records loaded
prompt Loading EVENT...
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-06-2024', 'dd-mm-yyyy'), 1400, 'Children', 'Education', 'Science Show', 5, 120, 1, 1, '5550001');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-06-2024', 'dd-mm-yyyy'), 1000, 'Adults', 'Health', 'Yoga Session', 10, 90, 2, 2, '5550003');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-06-2024', 'dd-mm-yyyy'), 1500, 'Family', 'Entertainment', 'Magic Show', 8, 60, 3, 3, '5550004');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-06-2024', 'dd-mm-yyyy'), 1100, 'Teens', 'Literature', 'Storytelling', 6, 45, 4, 4, '5550006');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-06-2024', 'dd-mm-yyyy'), 1300, 'Seniors', 'History', 'Historical Talk', 7.5, 75, 5, 5, '5550008');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-06-2024', 'dd-mm-yyyy'), 1700, 'General', 'Music', 'Live Concert', 15, 180, 6, 6, '5550001');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-06-2024', 'dd-mm-yyyy'), 1200, 'Adults', 'Workshop', 'Gardening Workshop', 20, 150, 7, 7, '5550003');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-06-2024', 'dd-mm-yyyy'), 1600, 'Family', 'Art', 'Puppet Show', 5, 60, 8, 8, '5550004');
commit;
prompt 8 records loaded
prompt Loading EVENT_OPERATOR...
insert into EVENT_OPERATOR (eid, mainphone)
values (1, '5550002');
insert into EVENT_OPERATOR (eid, mainphone)
values (2, '5550005');
insert into EVENT_OPERATOR (eid, mainphone)
values (3, '5550004');
insert into EVENT_OPERATOR (eid, mainphone)
values (4, '5550007');
insert into EVENT_OPERATOR (eid, mainphone)
values (5, '5550003');
insert into EVENT_OPERATOR (eid, mainphone)
values (6, '5550006');
insert into EVENT_OPERATOR (eid, mainphone)
values (7, '5550008');
insert into EVENT_OPERATOR (eid, mainphone)
values (8, '5550001');
commit;
prompt 8 records loaded
prompt Loading PARTICIPANT...
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('johnny123', 1234, 'Adult', '5550001');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('jane_doe', 5678, 'Child', '5550002');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('alice.j', 9101, 'Senior', '5550003');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('bob_the_builder', 1121, 'Adult', '5550004');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('carolyn', 3141, 'Teen', '5550005');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('daveG', 5161, 'Adult', '5550006');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('eve_black', 7181, 'Child', '5550007');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('frankG45', 9202, 'Senior', '5550008');
commit;
prompt 8 records loaded
prompt Loading EVENT_PARTICIPANT...
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 1, 123456789012, to_date('01-06-2024', 'dd-mm-yyyy'), 1, '5550001');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 2, 234567890123, to_date('01-05-2024', 'dd-mm-yyyy'), 2, '5550002');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 3, 345678901234, to_date('20-06-2024', 'dd-mm-yyyy'), 3, '5550003');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 4, 456789012345, to_date('01-06-2024', 'dd-mm-yyyy'), 4, '5550004');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 5, 567890123456, to_date('01-03-2024', 'dd-mm-yyyy'), 5, '5550005');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 6, 678901234567, to_date('07-06-2024', 'dd-mm-yyyy'), 6, '5550006');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 7, 789012345678, to_date('01-08-2024', 'dd-mm-yyyy'), 7, '5550007');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 8, 890123456789, to_date('01-02-2024', 'dd-mm-yyyy'), 8, '5550008');
commit;
prompt 8 records loaded
prompt Loading MANAGER_WORKING_DAYS...
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '5550001');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '5550003');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '5550004');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '5550006');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Friday', '5550008');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '5550003');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Friday', '5550004');
commit;
prompt 7 records loaded
prompt Loading PERSON_MORE_PHONE...
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551001', '5550001');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551002', '5550002');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551003', '5550003');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551004', '5550004');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551005', '5550005');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551006', '5550006');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551007', '5550007');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('5551008', '5550008');
commit;
prompt 8 records loaded
prompt Enabling foreign key constraints for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR enable constraint SYS_C009512;
prompt Enabling foreign key constraints for MANAGER...
alter table MANAGER enable constraint SYS_C009506;
prompt Enabling foreign key constraints for EVENT...
alter table EVENT enable constraint SYS_C009536;
alter table EVENT enable constraint SYS_C009537;
prompt Enabling foreign key constraints for EVENT_OPERATOR...
alter table EVENT_OPERATOR enable constraint SYS_C009541;
alter table EVENT_OPERATOR enable constraint SYS_C009542;
prompt Enabling foreign key constraints for PARTICIPANT...
alter table PARTICIPANT enable constraint SYS_C009516;
prompt Enabling foreign key constraints for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT enable constraint SYS_C009550;
alter table EVENT_PARTICIPANT enable constraint SYS_C009551;
prompt Enabling foreign key constraints for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS enable constraint SYS_C009524;
prompt Enabling foreign key constraints for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE enable constraint SYS_C009520;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR enable all triggers;
prompt Enabling triggers for HALL...
alter table HALL enable all triggers;
prompt Enabling triggers for MANAGER...
alter table MANAGER enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for EVENT_OPERATOR...
alter table EVENT_OPERATOR enable all triggers;
prompt Enabling triggers for PARTICIPANT...
alter table PARTICIPANT enable all triggers;
prompt Enabling triggers for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT enable all triggers;
prompt Enabling triggers for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS enable all triggers;
prompt Enabling triggers for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE enable all triggers;

set feedback on
set define on
prompt Done
