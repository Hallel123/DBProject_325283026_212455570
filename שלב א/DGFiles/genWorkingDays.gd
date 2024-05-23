
[General]
Version=1

[Preferences]
Username=
Password=2787
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=MANAGER_WORKING_DAYS
Count=450

[Record]
Name=WORKING_DAYS
Type=VARCHAR2
Size=10
Data=List('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday')
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from MANAGER)
Master=

