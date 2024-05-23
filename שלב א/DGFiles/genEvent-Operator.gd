
[General]
Version=1

[Preferences]
Username=
Password=2733
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=EVENT_OPERATOR
Count=450

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
Data=List(select MAINPHONE from ACTIVITYOPERATOR)
Master=

