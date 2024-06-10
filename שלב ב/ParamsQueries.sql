--Query 1: hight rating managers
SELECT 
    p.Pname AS ManagerName,
    m.MainPhone AS ManagerID,
    ROUND(AVG(ep.Review), 2) AS AverageReview
FROM 
    Manager m
JOIN 
    Person p ON m.MainPhone = p.MainPhone
JOIN 
    Event e ON m.MainPhone = e.MainPhone
JOIN 
    Event_Participant ep ON e.EID = ep.EID
GROUP BY 
    p.Pname, m.MainPhone
HAVING 
    ROUND(AVG(ep.Review), 2) > &<name="min rating" hint="min rating between 3-10" type="integer" default=6>
ORDER BY 
    AverageReview DESC;
    
    
--Query 2: paticipant in range of ages categories
select * FROM Event_Participant
WHERE 
    EID IN (
        SELECT e.EID
        FROM Event e
        WHERE e.ECategory in (&< multiselect="yes" name="Event category" list="'Lecture', 'workshop', 'performance', 'story', 'educational activity', 'play', 'conversation with an author', 'educational activity', 'training', 'film screening', 'exhibition', 'sports', 'volunteering" required=true >)
    )
AND 
    MainPhone IN (
        SELECT p.MainPhone
        FROM Person p
        WHERE p.Age > &<name="min age" type="integer" default=10> and p.Age < &<name="max age" type="integer" default=50>
    );



--Query 3: early sign up
SELECT 
    p.Pname AS ParticipantName,
    ep.MainPhone,
    e.EID AS EventNumber,
    e.edate,
    ep.signupdate
FROM 
    Event_Participant ep
JOIN 
    Participant par ON ep.MainPhone = par.MainPhone
JOIN 
    Person p ON par.MainPhone = p.MainPhone
JOIN 
    Event e ON ep.EID = e.EID
WHERE 
    ep.SignUpDate <= e.EDate - &<name="early days" type=integer default=7>;


--Query 4: Operators that should not have been ordered, in a specific period
SELECT AO.MainPhone, AO.OCost, round(AVG(EP.ParticipantCount),0) AS AvgParticipants
FROM ActivityOperator AO
JOIN Event_Operator EO ON AO.MainPhone = EO.MainPhone
JOIN Event E ON EO.EID = E.EID
JOIN (
    SELECT EID, COUNT(MainPhone) AS ParticipantCount
    FROM Event_Participant
    GROUP BY EID
) EP ON E.EID = EP.EID
WHERE E.EDate BETWEEN &<name="d_from" type="date" default="01/01/09"> and &<name="d_to" type="date" default="01/09/24">
AND AO.OCost > 1000
GROUP BY AO.MainPhone, AO.OCost
HAVING AVG(EP.ParticipantCount) < 50;



    


