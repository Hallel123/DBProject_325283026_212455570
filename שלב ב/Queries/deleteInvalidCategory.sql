DELETE FROM 
    Event_Participant
WHERE 
    EID IN (
        SELECT e.EID
        FROM Event e
        WHERE e.ECategory = 'volunteering'
    )
AND 
    MainPhone IN (
        SELECT p.MainPhone
        FROM Person p
        WHERE p.Age < 10
    );
commit;
    

--select e.EID, p.AGE, e.ECATEGORY from EVENT_PARTICIPANT ep, Event e, Person p
--where ep.EID=e.EID and ep.MainPhone = p.MainPhone and p.Age<10 and e.ecategory='volunteering'; 

