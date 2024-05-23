
[General]
Version=1

[Preferences]
Username=
Password=2571
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=ACTIVITYOPERATOR
Count=450

[Record]
Name=OCOST
Type=NUMBER
Size=8,2
Data=Random(200, 10000)
Master=

[Record]
Name=EXPERTISE
Type=VARCHAR2
Size=40
Data=List('Children's author', 'Yoga guide', 'Storyteller', 'Magician', 'Science educator', 'Historian', 'Musician', 'Puppeteer', 'Gardening expert', 'Art instructor')
Master=

[Record]
Name=GENDER
Type=VARCHAR2
Size=15
Data=List('male', 'female')
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from PERSON)
Master=

