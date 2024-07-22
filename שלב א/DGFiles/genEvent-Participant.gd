
[General]
Version=1

[Preferences]
Username=
Password=2054
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=EVENT_PARTICIPANT
Count=1000

[Record]
Name=REVIEW
Type=NUMBER
Size=
Data=Random(1, 10)
Master=

[Record]
Name=SEATNUMBER
Type=NUMBER
Size=
Data=Random(1, 600)
Master=

[Record]
Name=CARDNUM
Type=NUMBER
Size=
Data=Random(100, 999)
Master=

[Record]
Name=SIGNUPDATE
Type=DATE
Size=
Data=Random(1/1/2000, 1/1/2024)
Master=

[Record]
Name=EID
Type=NUMBER
Size=
Data=List(select EID from EVENT)
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from PARTICIPANT)
Master=

