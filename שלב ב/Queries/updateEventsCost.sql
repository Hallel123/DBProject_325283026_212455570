-- Update the price of events with fewer than 50 participants and available space in the hall
UPDATE Event e
SET e.Price = CEIL(e.Price * 0.80)
WHERE e.EID IN (
    SELECT e.EID
    FROM Event e
    JOIN Hall h ON e.HID = h.HID
    LEFT JOIN (
        SELECT ep.EID, COUNT(ep.MainPhone) AS ParticipantCount
        FROM Event_Participant ep
        GROUP BY ep.EID
    ) epc ON e.EID = epc.EID
    WHERE epc.ParticipantCount < 50
    AND h.Capacity - COALESCE(epc.ParticipantCount, 0) > 0
);
commit;

'''
SELECT 
    e.EID AS EventNumber,
    e.Price AS EventPrice,
    COUNT(ep.MainPhone) AS NumberOfRegistrants,
    h.Capacity AS NumberOfSeats
FROM 
    Event e
LEFT JOIN 
    Event_Participant ep ON e.EID = ep.EID
JOIN 
    Hall h ON e.HID = h.HID
GROUP BY 
    e.EID, e.Price, h.Capacity
ORDER BY 
    e.EID;

'''
