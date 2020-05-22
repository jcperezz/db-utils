DECLARE
-- =============================================
-- Author:      Juan Carlos Perez
-- Email:       jcarlosp1986@gmail.com
-- Description: Restart oracle sequence value to 1
-- --------------------------------------------- 
-- Change History:
--   20100501 Juan Carlos Perez: Initial Version
-- =============================================

-- =============================================
-- Declarations
-- =============================================
  -- Sequence Name
  P_SEQ   VARCHAR2(100) := '<<CHANGEME>>';
  -- Internal use
  L_VALUE NUMBER;
BEGIN
  -- Select the next value of the sequence
  EXECUTE immediate 'select ' || P_SEQ || '.nextval from dual' INTO L_VALUE;
  -- Set a negative increment for the sequence, with value = the current value of the sequence
  EXECUTE immediate 'alter sequence ' || P_SEQ || ' increment by -' || L_VALUE || ' minvalue 0';
  -- Select once from the sequence, to take its current value back to 0
  EXECUTE immediate 'select ' || P_SEQ || '.nextval from dual' INTO L_VALUE;
  -- Set the increment back to 1
  EXECUTE immediate 'alter sequence ' || P_SEQ || ' increment by 1 minvalue 0';
END;
/
