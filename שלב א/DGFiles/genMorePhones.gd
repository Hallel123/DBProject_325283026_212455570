
[General]
Version=1

[Preferences]
Username=
Password=2450
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PERSON_MORE_PHONE
Count=450

[Record]
Name=MORE_PHONE
Type=VARCHAR2
Size=10
Data=['05'99(7)]
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from PERSON)
Master=

