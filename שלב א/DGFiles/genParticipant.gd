
[General]
Version=1

[Preferences]
Username=
Password=2267
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PARTICIPANT
Count=450

[Record]
Name=USERNAME
Type=VARCHAR2
Size=40
Data=FirstName+[99]
Master=

[Record]
Name=PPASSWORD
Type=NUMBER
Size=
Data=Random(100000, 99999999)
Master=

[Record]
Name=PTYPE
Type=VARCHAR2
Size=30
Data=List('subscription', 'not_subscriber')
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from PERSON)
Master=

