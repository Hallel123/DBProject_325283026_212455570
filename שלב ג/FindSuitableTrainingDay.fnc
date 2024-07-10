CREATE OR REPLACE FUNCTION FindSuitableTrainingDay
RETURN VARCHAR2
IS
<<<<<<< HEAD
    v_min_managers_count INT := 900;
    v_min_managers_day VARCHAR2(10);
    v_managers_count INT;
    v_training_date DATE;
    v_hall_id INT;
    v_capacity INT;
    v_manager_count INT;
    v_event_count INT;
=======
    v_min_managers_count INT := 100; -- Arbitrary large number
    v_min_managers_day VARCHAR2(10);
    v_current_day VARCHAR2(10);
    v_managers_count INT;
    v_training_date DATE;
    v_hall_id INT;
    v_manager_count INT;
    v_capacity INT;
>>>>>>> f506c4ecb5f43f86bd6a1a89ea6e601aa53993b6

    CURSOR c_days IS
        SELECT DISTINCT Working_Days
        FROM Manager_Working_Days;

<<<<<<< HEAD
        --count the free managers on a specific day
=======
>>>>>>> f506c4ecb5f43f86bd6a1a89ea6e601aa53993b6
    CURSOR c_managers(day IN VARCHAR2) IS
        SELECT COUNT(*) AS manager_count
        FROM Manager_Working_Days
        WHERE Working_Days = day;

<<<<<<< HEAD
        --get the relevant halls to the managers' count
=======
>>>>>>> f506c4ecb5f43f86bd6a1a89ea6e601aa53993b6
    CURSOR c_halls(capacity_needed IN INT) IS
        SELECT HID, Capacity
        FROM Hall
        WHERE Capacity >= capacity_needed
        ORDER BY Capacity;

<<<<<<< HEAD
        --get the num of events on a date in a hall
    CURSOR c_events(hall_id IN INT, training_date IN DATE) IS
        SELECT COUNT(*) AS event_count
        FROM Event
        WHERE HID = hall_id AND EDate = training_date; -- Ensure EDate is the correct column name

=======
>>>>>>> f506c4ecb5f43f86bd6a1a89ea6e601aa53993b6
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
<<<<<<< HEAD
=======
    v_current_day := TO_CHAR(SYSDATE, 'DAY');
>>>>>>> f506c4ecb5f43f86bd6a1a89ea6e601aa53993b6
    v_training_date := NEXT_DAY(SYSDATE, v_min_managers_day);

    DBMS_OUTPUT.PUT_LINE('Closest training date: ' || TO_CHAR(v_training_date, 'DD-MON-YYYY'));

<<<<<<< HEAD
    -- Find an available hall with sufficient capacity and no event on the training date
    SELECT COUNT(*) INTO v_manager_count FROM Manager;

    OPEN c_halls(v_manager_count);
    LOOP
        FETCH c_halls INTO v_hall_id, v_capacity;
        EXIT WHEN c_halls%NOTFOUND;

        -- Check if there is any event scheduled in the hall on the training date
        OPEN c_events(v_hall_id, v_training_date);
        FETCH c_events INTO v_event_count;
        CLOSE c_events;

        -- If no event is scheduled, select this hall
        IF v_event_count = 0 THEN
            EXIT;
        END IF;
    END LOOP;
    CLOSE c_halls;

    IF v_event_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Selected hall ID: ' || v_hall_id || ' with capacity: ' || v_capacity);
        RETURN 'Training Date: ' || TO_CHAR(v_training_date, 'DD-MON-YYYY') || ', Hall ID: ' || v_hall_id;
    ELSE
        RETURN 'No suitable hall found.';
    END IF;
=======
    -- Find an available hall with sufficient capacity
    SELECT COUNT(*) INTO v_manager_count FROM Manager;
    
    OPEN c_halls(v_manager_count);
    FETCH c_halls INTO v_hall_id, v_capacity;
    CLOSE c_halls;

    DBMS_OUTPUT.PUT_LINE('Selected hall ID: ' || v_hall_id || ' with capacity: ' || v_capacity);

    RETURN 'Training Date: ' || TO_CHAR(v_training_date, 'DD-MON-YYYY') || ', Hall ID: ' || v_hall_id;
>>>>>>> f506c4ecb5f43f86bd6a1a89ea6e601aa53993b6
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No suitable hall found.');
        RETURN 'No suitable hall found.';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        RETURN 'An unexpected error occurred.';
END FindSuitableTrainingDay;
/
