UPDATE Event e
SET e.Audience = 'Adults'
WHERE e.Audience = 'Elderly'
AND e.HID IN (
    SELECT h.HID
    FROM Hall h
    WHERE REGEXP_SUBSTR(h.Place, 'floor: ([0-9]+)') IS NOT NULL
    AND TO_NUMBER(REGEXP_SUBSTR(h.Place, 'floor: ([0-9]+)', 1, 1, NULL, 1)) >= 2
);
commit;

'''
SELECT 
    e.EID AS EventNumber,
    e.Audience AS TargetAudience,
    h.Place AS HallLocation
FROM 
    Event e
JOIN 
    Hall h ON e.HID = h.HID
ORDER BY 
    e.EID;
'''
