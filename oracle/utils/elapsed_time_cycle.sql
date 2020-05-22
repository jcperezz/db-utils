SET SERVEROUTPUT ON

DECLARE
-- =============================================
-- Author:      Juan Carlos Perez
-- Email:       jcarlosp1986@gmail.com
-- Description: Show the elapsed time for a sequential execution
-- --------------------------------------------- 
-- Change History:
--   20100501 Juan Carlos Perez: Initial Version
-- =============================================

-- =============================================
-- Declarations
-- =============================================
    --Total times for test query
    total_times        NUMBER := 100000;
    --Query for test
    target_query       VARCHAR(32767) := 'select sysdate from dual';
    
    -- For internal use
    v_start_time       NUMBER := dbms_utility.get_time;
    v_start_time_cpu   NUMBER := dbms_utility.get_cpu_time;
BEGIN
    
-- =============================================
-- Executing query
-- =============================================
    FOR idx IN 1..total_times LOOP EXECUTE IMMEDIATE target_query;
    END LOOP;
    
-- =============================================
-- Printing results
-- =============================================
    dbms_output.put_line('Elapsed time: ' ||(dbms_utility.get_time - v_start_time));
    dbms_output.put_line('Elapsed time CPU: ' ||(dbms_utility.get_cpu_time - v_start_time_cpu));
END;
/