CREATE OR REPLACE PROCEDURE ManageOperatorEvents(
    p_OperatorPhone IN VARCHAR2
)
AS
    CURSOR upcoming_events IS
        SELECT e.EID, e.Price
        FROM Event e
        WHERE e.OpMainPhone = p_OperatorPhone
        AND e.EDate > SYSDATE
        ORDER BY (SELECT COUNT(*) FROM Event_Participant ep WHERE ep.EID = e.EID) DESC
        FETCH FIRST 3 ROWS ONLY;

    CURSOR worst_operator IS
        SELECT ao.MainPhone
        FROM ActivityOperator ao
        WHERE EXISTS (
            SELECT 1
            FROM Event e
            WHERE e.OpMainPhone = ao.MainPhone
            AND e.EDate < SYSDATE
        )
        AND EXISTS (
            SELECT 1
            FROM Event e
            WHERE e.OpMainPhone = ao.MainPhone
            AND e.EDate > SYSDATE
        )
        ORDER BY CalculateAverageRating(ao.MainPhone)
        FETCH FIRST 1 ROWS ONLY;

    v_EID Event.EID%TYPE;
    v_Price Event.Price%TYPE;
    v_WorstOperatorPhone ActivityOperator.MainPhone%TYPE;
    v_EventConflict NUMBER;
    v_EventsUpdated NUMBER := 0;
    v_EventsReassigned NUMBER := 0;
    v_TotalEvents NUMBER := 0;
    --v_LowestAvgRating NUMBER := 1000;
    --v_CurrentAvgRating NUMBER;
BEGIN
    -- Debug print: Start of the procedure
    DBMS_OUTPUT.PUT_LINE('Starting ManageOperatorEvents procedure for operator phone: ' || p_OperatorPhone);

    -- Count the total number of upcoming events for the operator
    SELECT COUNT(*)
    INTO v_TotalEvents
    FROM Event e
    WHERE e.OpMainPhone = p_OperatorPhone
    AND e.EDate > SYSDATE;

    DBMS_OUTPUT.PUT_LINE('The operator is responsible for ' || v_TotalEvents || ' upcoming events.');

    -- Increase the price of the top 3 upcoming events by 20%
    FOR event_rec IN upcoming_events LOOP
        v_EID := event_rec.EID;
        v_Price := event_rec.Price * 1.2;

        UPDATE Event
        SET Price = v_Price
        WHERE EID = v_EID;

        v_EventsUpdated := v_EventsUpdated + 1;
        DBMS_OUTPUT.PUT_LINE('Updated price for event ID: ' || v_EID || ', new price: ' || v_Price);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('The price of ' || v_EventsUpdated || ' events has been updated.');

    -- Find the worst operator by calculating average ratings
    OPEN worst_operator;
    FETCH worst_operator INTO v_WorstOperatorPhone;
    CLOSE worst_operator;

    DBMS_OUTPUT.PUT_LINE('Worst operator phone: ' || v_WorstOperatorPhone);

    IF v_WorstOperatorPhone IS NOT NULL THEN
        -- Reassign future events of the worst operator to the specified operator
        FOR event_rec IN (
            SELECT EID, EDate, ETime
            FROM Event
            WHERE OpMainPhone = v_WorstOperatorPhone
            AND EDate > SYSDATE
        ) LOOP
            -- Check for scheduling conflicts
            SELECT COUNT(*)
            INTO v_EventConflict
            FROM Event e
            WHERE e.OpMainPhone = p_OperatorPhone
            AND e.EDate = event_rec.EDate
            AND e.ETime = event_rec.ETime;

            IF v_EventConflict = 0 THEN
                UPDATE Event
                SET OpMainPhone = p_OperatorPhone
                WHERE EID = event_rec.EID;

                v_EventsReassigned := v_EventsReassigned + 1;
                DBMS_OUTPUT.PUT_LINE('Reassigned event ID: ' || event_rec.EID || ' to operator phone: ' || p_OperatorPhone);
            ELSE
                DBMS_OUTPUT.PUT_LINE('Event ID ' || event_rec.EID || ' on date ' || event_rec.EDate || ' at time ' || event_rec.ETime || ' cannot be reassigned due to a scheduling conflict.');
            END IF;
        END LOOP;

        IF v_EventsReassigned > 0 THEN
            DBMS_OUTPUT.PUT_LINE('The operator with the lowest average reviews has been reassigned for ' || v_EventsReassigned || ' events.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No events were reassigned due to scheduling conflicts.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No operator found with the lowest average reviews.');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20013, 'An error occurred while managing operator events: ' || SQLERRM);
END ManageOperatorEvents;
/
