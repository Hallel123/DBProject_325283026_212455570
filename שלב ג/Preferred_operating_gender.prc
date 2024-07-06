CREATE OR REPLACE PROCEDURE PrintPreferredOperatorType
IS
    v_avg_registrants_men NUMBER;
    v_avg_registrants_women NUMBER;

    -- Cursor to get the categories.
    CURSOR c_categories IS
        SELECT DISTINCT ECategory
        FROM Event;
        
    -- Cursor to get the average number of registrants for events by male operators
    CURSOR c_avg_registrants_men(category VARCHAR2) IS
        SELECT AVG(participant_count)
        FROM (
            SELECT e.EID, COUNT(p.SeatNumber) AS participant_count
            FROM Event e
            JOIN Event_Participant p ON e.EID = p.EID
            JOIN ActivityOperator o ON e.OpMainPhone = o.MainPhone
            WHERE e.ECategory = category AND o.Gender = 'Male'
            GROUP BY e.EID
        );

    -- Cursor to get the average number of registrants for events by female operators
    CURSOR c_avg_registrants_women(category VARCHAR2) IS
        SELECT AVG(participant_count)
        FROM (
            SELECT e.EID, COUNT(p.SeatNumber) AS participant_count
            FROM Event e
            JOIN Event_Participant p ON e.EID = p.EID
            JOIN ActivityOperator o ON e.OpMainPhone = o.MainPhone
            WHERE e.ECategory = category AND o.Gender = 'Female'
            GROUP BY e.EID
        );

BEGIN
    -- Loop through each category
    FOR category_rec IN c_categories LOOP
        -- Get the average number of registrants for male operators
        OPEN c_avg_registrants_men(category_rec.ECategory);
        FETCH c_avg_registrants_men INTO v_avg_registrants_men;
        CLOSE c_avg_registrants_men;

        -- Get the average number of registrants for female operators
        OPEN c_avg_registrants_women(category_rec.ECategory);
        FETCH c_avg_registrants_women INTO v_avg_registrants_women;
        CLOSE c_avg_registrants_women;

        -- Print the preferred operator type for the category
        IF v_avg_registrants_men > v_avg_registrants_women THEN
            DBMS_OUTPUT.PUT_LINE(category_rec.ECategory || ': Male');
        ELSE
            DBMS_OUTPUT.PUT_LINE(category_rec.ECategory || ': Female');
        END IF;
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END PrintPreferredOperatorType;
/
