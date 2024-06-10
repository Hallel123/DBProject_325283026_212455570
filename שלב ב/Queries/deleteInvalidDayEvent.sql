DELETE FROM Event_Participant ep
WHERE ep.EID IN (
    SELECT e.EID
    FROM Event e
    WHERE TO_CHAR(e.EDate, 'Day') NOT IN (
        SELECT mw.Working_Days
        FROM Manager_Working_Days mw
        WHERE mw.MainPhone = e.MainPhone
    )
);

DELETE FROM Event_Operator eo
WHERE eo.EID IN (
    SELECT e.EID
    FROM Event e
    WHERE TO_CHAR(e.EDate, 'Day') NOT IN (
        SELECT mw.Working_Days
        FROM Manager_Working_Days mw
        WHERE mw.MainPhone = e.MainPhone
    )
);

DELETE FROM Event e
WHERE TO_CHAR(e.EDate, 'Day') NOT IN (
    SELECT mw.Working_Days
    FROM Manager_Working_Days mw
    WHERE mw.MainPhone = e.MainPhone
);

commit;

''' SELECT 
    e.EID AS EventNumber,
    TO_CHAR(e.EDate, 'Day', 'NLS_DATE_LANGUAGE = English') AS DayOfWeek,
    m.MainPhone AS ManagerPhone,
    LISTAGG(mw.Working_Days, ', ') WITHIN GROUP (ORDER BY mw.Working_Days) AS WorkingDays
FROM 
    Event e
JOIN 
    Manager m ON e.MainPhone = m.MainPhone
JOIN 
    Manager_Working_Days mw ON m.MainPhone = mw.MainPhone
GROUP BY 
    e.EID, TO_CHAR(e.EDate, 'Day', 'NLS_DATE_LANGUAGE = English'), m.MainPhone
ORDER BY 
    e.EID; '''
