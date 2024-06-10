SELECT 
    p.Pname AS ManagerName,
    m.MainPhone AS ManagerPhone,
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
    ROUND(AVG(ep.Review), 2) > 6
ORDER BY 
    AverageReview DESC;
