-- =============================================
-- Author:      Juan Carlos Perez
-- Email:       jcarlosp1986@gmail.com
-- Description: Drop and create an user on oracle express DB,
--              change <<CHANGEME>> for username without quotes 
--              execute the script from sys user
-- --------------------------------------------- 
-- Change History:
--   20100501 Juan Carlos Perez: Initial Version
-- =============================================

-- Drop User, avoid if user doesn't exists
DROP USER <<CHANGEME>> CASCADE;

-- Create User With Default Tablespace
Create User <<CHANGEME>> Profile "DEFAULT" Identified By <<CHANGEME>> 
DEFAULT TABLESPACE "USERS" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;

-- Grant permissions for user
GRANT "DBA" TO <<CHANGEME>>;
GRANT "CONNECT" TO <<CHANGEME>>;
GRANT "RESOURCE" TO <<CHANGEME>>;
GRANT ALTER ANY INDEX TO <<CHANGEME>>;
GRANT ALTER ANY SEQUENCE TO <<CHANGEME>>;
GRANT ALTER ANY TABLE TO <<CHANGEME>>;
GRANT ALTER ANY TRIGGER TO <<CHANGEME>>;
GRANT CREATE ANY INDEX TO <<CHANGEME>>;
GRANT CREATE ANY SEQUENCE TO <<CHANGEME>>;
GRANT CREATE ANY SYNONYM TO <<CHANGEME>>;
GRANT CREATE ANY TABLE TO <<CHANGEME>>;
GRANT CREATE ANY TRIGGER TO <<CHANGEME>>;
GRANT CREATE ANY VIEW TO <<CHANGEME>>;
GRANT CREATE PROCEDURE TO <<CHANGEME>>;
GRANT CREATE PUBLIC SYNONYM TO <<CHANGEME>>;
GRANT CREATE TRIGGER TO <<CHANGEME>>;
GRANT CREATE VIEW TO <<CHANGEME>>;
GRANT DELETE ANY TABLE TO <<CHANGEME>>;
GRANT DROP ANY INDEX TO <<CHANGEME>>;
GRANT DROP ANY SEQUENCE TO <<CHANGEME>>;
GRANT DROP ANY TABLE TO <<CHANGEME>>;
GRANT DROP ANY TRIGGER TO <<CHANGEME>>;
GRANT DROP ANY VIEW TO <<CHANGEME>>;
GRANT INSERT ANY TABLE TO <<CHANGEME>>;
GRANT QUERY REWRITE TO <<CHANGEME>>;
Grant Select Any Table To <<CHANGEME>>;
GRANT UNLIMITED TABLESPACE TO <<CHANGEME>>;
commit;