DECLARE
-- =============================================
-- Author:      Juan Carlos Perez
-- Email:       jcarlosp1986@gmail.com
-- Description: Update oracle sequence value from table field max value
-- --------------------------------------------- 
-- Change History:
--   20100501 Juan Carlos Perez: Initial Version
-- =============================================

-- =============================================
-- Declarations
-- =============================================
  -- Table Name
  P_TABLE VARCHAR2(100) := '<<CHANGEME>>';
  -- Field Name
  ID_FIELD_NAME VARCHAR(100) := '<<CHANGEME>>';
  -- Sequence Name
  P_SEQ   VARCHAR2(100) := '<<CHANGEME>>';

  -- For internal use
  L_VALUE NUMBER;
  MAX_VALUE NUMBER;
  VAL_UPDATE NUMBER;
BEGIN

  
-- =============================================
-- Calculating value to update
-- =============================================
  EXECUTE immediate 'select ' || P_SEQ || '.nextval from dual' INTO L_VALUE;
  EXECUTE immediate 'select max('||ID_FIELD_NAME||') from '|| P_TABLE INTO MAX_VALUE;
  
  VAL_UPDATE := (MAX_VALUE - L_VALUE);
  
  IF(VAL_UPDATE < 1) THEN
	  VAL_UPDATE := 1;
  END IF;
  
-- =============================================
-- Updating sequence
-- =============================================
  EXECUTE immediate 'alter sequence ' || P_SEQ || ' increment by ' || VAL_UPDATE || ' minvalue 0';
  EXECUTE immediate 'select ' || P_SEQ || '.nextval from dual' INTO L_VALUE;
  EXECUTE immediate 'alter sequence ' || P_SEQ || ' increment by 1 minvalue 0';
END;
/
