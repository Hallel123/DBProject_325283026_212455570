CREATE OR REPLACE FUNCTION CalculateAverageRating(p_OperatorPhone IN VARCHAR2) 
RETURN NUMBER
AS
    v_TotalRating NUMBER := 0;
    v_Count NUMBER := 0;
    v_AvgRating NUMBER := 0;
BEGIN
    FOR rating_rec IN (
        SELECT ep.Review
        FROM Event e
        JOIN Event_Participant ep ON e.EID = ep.EID
        WHERE e.OpMainPhone = p_OperatorPhone
    )
    LOOP
        v_TotalRating := v_TotalRating + rating_rec.Review;
        v_Count := v_Count + 1;
    END LOOP;

    IF v_Count > 0 THEN
        v_AvgRating := v_TotalRating / v_Count;
    ELSE
        v_AvgRating := 0;
    END IF;

    RETURN v_AvgRating;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20014, 'An error occurred while calculating the average rating: ' || SQLERRM);
END CalculateAverageRating;
/
