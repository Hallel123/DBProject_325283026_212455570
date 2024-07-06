DECLARE
    v_TrainingDetails VARCHAR2(3000); -- Increase the size to handle larger return values
BEGIN
    -- Call the function FindSuitableTrainingDay
    v_TrainingDetails := FindSuitableTrainingDay;
    DBMS_OUTPUT.PUT_LINE('Training Details: ' || v_TrainingDetails);
    
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('');


    -- Call the procedure PrintPreferredOperatorType
    PrintPreferredOperatorType();

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
