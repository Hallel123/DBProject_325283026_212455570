SELECT 
    e.EID AS EventNumber,
    e.HID AS HallNumber,
    h.Capacity,
    COUNT(ep.MainPhone) AS NumberOfRegistrants
FROM 
    Event e
JOIN 
    Hall h ON e.HID = h.HID
JOIN 
    Event_Participant ep ON e.EID = ep.EID
GROUP BY 
    e.EID, e.HID, h.Capacity
HAVING 
    COUNT(ep.MainPhone) > h.Capacity;
