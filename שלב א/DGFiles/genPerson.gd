
[General]
Version=1

[Preferences]
Username=
Password=2047
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PERSON
Count=2000

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=40
Data=Address1
Master=

[Record]
Name=MAIL
Type=VARCHAR2
Size=30
Data=Email
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=['05'99(7)]
Master=

[Record]
Name=AGE
Type=NUMBER
Size=
Data=Random(7, 90)
Master=

[Record]
Name=PNAME
Type=VARCHAR2
Size=30
Data=FirstName+'  '+LastName
Master=

