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
    ep.SignUpDate <= e.EDate - 7;
