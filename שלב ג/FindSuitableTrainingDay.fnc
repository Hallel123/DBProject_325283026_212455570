CREATE OR REPLACE FUNCTION FindSuitableTrainingDay
RETURN VARCHAR2
IS
    v_min_managers_count INT := 100; -- Arbitrary large number
    v_min_managers_day VARCHAR2(10);
    v_current_day VARCHAR2(10);
    v_managers_count INT;
    v_training_date DATE;
    v_hall_id INT;
    v_manager_count INT;
    v_capacity INT;

    CURSOR c_days IS
        SELECT DISTINCT Working_Days
        FROM Manager_Working_Days;

    CURSOR c_managers(day IN VARCHAR2) IS
        SELECT COUNT(*) AS manager_count
        FROM Manager_Working_Days
        WHERE Working_Days = day;

    CURSOR c_halls(capacity_needed IN INT) IS
        SELECT HID, Capacity
        FROM Hall
        WHERE Capacity >= capacity_needed
        ORDER BY Capacity;

BEGIN
    -- Find the day of the week with the minimum number of managers working
    FOR day_rec IN c_days LOOP
        OPEN c_managers(day_rec.Working_Days);
        FETCH c_managers INTO v_managers_count;
        CLOSE c_managers;

        IF v_managers_count < v_min_managers_count THEN
            v_min_managers_count := v_managers_count;
            v_min_managers_day := day_rec.Working_Days;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Minimum managers working day: ' || v_min_managers_day);

    -- Find the nearest date starting from today which is the desired day of the week.
    v_current_day := TO_CHAR(SYSDATE, 'DAY');
    v_training_date := NEXT_DAY(SYSDATE, v_min_managers_day);

    DBMS_OUTPUT.PUT_LINE('Closest training date: ' || TO_CHAR(v_training_date, 'DD-MON-YYYY'));

    -- Find an available hall with sufficient capacity
    SELECT COUNT(*) INTO v_manager_count FROM Manager;
    
    OPEN c_halls(v_manager_count);
    FETCH c_halls INTO v_hall_id, v_capacity;
    CLOSE c_halls;

    DBMS_OUTPUT.PUT_LINE('Selected hall ID: ' || v_hall_id || ' with capacity: ' || v_capacity);

    RETURN 'Training Date: ' || TO_CHAR(v_training_date, 'DD-MON-YYYY') || ', Hall ID: ' || v_hall_id;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No suitable hall found.');
        RETURN 'No suitable hall found.';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        RETURN 'An unexpected error occurred.';
END FindSuitableTrainingDay;
/
