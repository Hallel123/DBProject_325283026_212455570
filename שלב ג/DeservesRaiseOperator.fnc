CREATE OR REPLACE FUNCTION DeservesRaiseOperator(p_OperatorPhone IN VARCHAR2) 
RETURN BOOLEAN
AS
    v_AvgRating NUMBER := 0;
    v_PhoneExists NUMBER;
    e_OperatorNotFound EXCEPTION;
BEGIN
    -- Check if the phone number belongs to an operator
    SELECT COUNT(*)
    INTO v_PhoneExists
    FROM ActivityOperator
    WHERE MainPhone = p_OperatorPhone;

    IF v_PhoneExists = 0 THEN
        RAISE e_OperatorNotFound; -- Raise custom exception
    END IF;

    -- Calculate the average rating using the CalculateAverageRating function
    v_AvgRating := CalculateAverageRating(p_OperatorPhone);

    RETURN v_AvgRating > 5;
EXCEPTION
    WHEN e_OperatorNotFound THEN
        RAISE_APPLICATION_ERROR(-20001, 'The cell phone number entered does not belong to an operator');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20012, 'An error occurred while calculating the average rating: ' || SQLERRM);
END DeservesRaiseOperator;
/
