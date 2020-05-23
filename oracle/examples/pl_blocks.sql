--Para recorrer una consulta Select
DECLARE
begin
    for r in ( select table_name, constraint_name
               from user_constraints
               where constraint_type = 'R'
               and table_name = 'FE_API_MODULE_LOG')
    loop
        execute immediate 'alter table '||r.table_name
                          ||' drop constraint '||r.constraint_name;
    end loop;
end;
/

DECLARE
BEGIN
    BEGIN
     EXECUTE immediate 'select ' || P_SEQ || '.nextval from dual';
   EXCEPTION 
        WHEN OTHERS 
        THEN dbms_output.put_line(SQLCODE);
   END;
END;
/

--Para capturar errores de registros que ya existen
declare
    column_exists exception;
    pragma exception_init (column_exists , -01430);
begin
    execute immediate 'ALTER TABLE FE_ORDER_MANAGER_LOG ADD (SUCCESSFUL_REPROCESS NUMBER(1, 0) DEFAULT 0 )';
    exception when column_exists then null;
end;
/
