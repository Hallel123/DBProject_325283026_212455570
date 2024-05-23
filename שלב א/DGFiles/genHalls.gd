
[General]
Version=1

[Preferences]
Username=
Password=2411
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=HALL
Count=450

[Record]
Name=HNAME
Type=VARCHAR2
Size=15
Data=List('Iris', 'Tavor', 'Galilee', 'Hermon', 'Carmel', 'Negev', 'Sharon', 'Golan', 'Eilat', 'Sinai')
Master=

[Record]
Name=PLACE
Type=VARCHAR2
Size=40
Data=List('floor: 0 room: 0001',
='floor: 1 room: 1023',
='floor: 2 room: 2034',
='floor: 3 room: 3045','floor: 4 room: 4056',
='floor: 5 room: 5067',
='floor: 6 room: 6078')
Master=

[Record]
Name=HID
Type=NUMBER
Size=
Data=Sequence(1, [Inc], [WithinParent])
Master=

[Record]
Name=CAPACITY
Type=NUMBER
Size=
Data=List(30,50,80,100,150,200,250,300,500)
Master=

