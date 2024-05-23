
[General]
Version=1

[Preferences]
Username=
Password=2730
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=MANAGER
Count=450

[Record]
Name=MROLE
Type=VARCHAR2
Size=20
Data=list('Librarian', 'Logistic Manager', 'Program Coordinator', 'Outreach Manager', 'Events Planner', 'Volunteer Coordinator', 'Collection Development Manager', 'Digital Services Manager', 'User Experience (UX) Specialist', 'Community Engagement Manager', 'Information Services Manager', 'Children's Program Manager', 'Adult Program Manager', 'Technology Integration Manager', 'Public Relations Coordinator', 'Fundraising Manager', 'Educational Program Developer', 'Archives Manager', 'Facilities Manager', 'Marketing and Communications Manager')
Master=

[Record]
Name=SENIORITY
Type=NUMBER
Size=
Data=Random(0, 40)
Master=

[Record]
Name=MAINPHONE
Type=VARCHAR2
Size=10
Data=List(select MAINPHONE from PERSON)
Master=

