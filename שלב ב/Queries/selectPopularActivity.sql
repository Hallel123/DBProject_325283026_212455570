WITH AgeGroups AS (
    SELECT 
        CASE
            WHEN Age BETWEEN 7 AND 10 THEN 'Mini-Club'
            WHEN Age BETWEEN 11 AND 14 THEN 'Kids-Club'
            WHEN Age BETWEEN 15 AND 18 THEN 'Teen-Club'
            WHEN Age BETWEEN 19 AND 60 THEN 'Adults-Club'
            WHEN Age BETWEEN 61 AND 90 THEN 'Elders-Club'
            ELSE 'Unknown'
        END AS AgeGroup,
        MainPhone
    FROM 
        Person
)

SELECT 
    AgeGroup,
    (
        SELECT 
            e.ECategory
        FROM 
            Event e
        JOIN 
            Event_Participant ep ON e.EID = ep.EID
        JOIN 
            AgeGroups ag ON ep.MainPhone = ag.MainPhone
        WHERE 
            ag.AgeGroup = ag_outer.AgeGroup
        GROUP BY 
            e.ECategory
        ORDER BY 
            COUNT(*) DESC
        FETCH FIRST 1 ROW ONLY
    ) AS MostPopularActivity
FROM 
    AgeGroups ag_outer
GROUP BY 
    AgeGroup
ORDER BY 
    CASE 
        WHEN AgeGroup = 'Mini-Club' THEN 1
        WHEN AgeGroup = 'Kids-Club' THEN 2
        WHEN AgeGroup = 'Teen-Club' THEN 3
        WHEN AgeGroup = 'Adults-Club' THEN 4
        WHEN AgeGroup = 'Elders-Club' THEN 5
        ELSE 6
    END;
