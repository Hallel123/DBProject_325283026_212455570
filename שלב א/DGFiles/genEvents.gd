
[General]
Version=1

[Preferences]
Username=
Password=2569
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=EVENT
Count=420

[Record]
Name=EDATE
Type=DATE
Size=
Data=Random(1/1/2020, 1/1/2030)
Master=

[Record]
Name=ETIME
Type=NUMBER
Size=4
Data=list(1000, 1030, 1100, 1200, 1230, 1300, 1330, 1400, 1430, 1500, 1530, 1600, 1630, 1700, 1730, 1800, 1830, 1900, 1930, 2000)
Master=

[Record]
Name=AUDIENCE
Type=VARCHAR2
Size=30
Data=list('Children', 'Adults', 'Elderly', 'Youth', 'Children and youth')
Master=

[Record]
Name=ECATEGORY
Type=VARCHAR2
Size=40
Data=list('Lecture', 'workshop', 'performance', 'story', 'educational activity', 'play', 'conversation with an author', 'educational activity', 'training', 'film screening', 'exhibition', 'sports', 'volunteering')
Master=

[Record]
Name=ACTIVITYD
Type=VARCHAR2
Size=300
Data=Components.Description
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=6,2
Data=Random(10.00, 300.00)
Master=

[Record]
Name=DURATION
Type=NUMBER
Size=
Data=Random(30, 360)
Master=

[Record]
Name=EID
Type=NUMBER
Size=
Data=Sequence(1, [Inc])
Master=

[Record]
Name=HID
Type=NUMBER
Size=
Data=List(select HID from HALL)
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from MANAGER)
Master=

[Record]
Name=OpMainPhone
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from ActivityOperator)
Master=

