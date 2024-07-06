DECLARE
    --v_OperatorPhone ActivityOperator.MainPhone%TYPE := '&operator_phone';
    v_DeservesRaise BOOLEAN;
BEGIN

    -- Call the function
    v_DeservesRaise := DeservesRaiseOperator(p_OperatorPhone=> :p_OperatorPhone);
    IF v_DeservesRaise THEN 
        -- Call the procedure
        DBMS_OUTPUT.PUT_LINE('The operator deserves to raise' || SQLERRM);
        ManageOperatorEvents(p_OperatorPhone=> :p_OperatorPhone);
       else 
          DBMS_OUTPUT.PUT_LINE('The operator does not deserves to raise' || SQLERRM);
    END IF;
   
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
