-- =============================================
-- Author:      Juan Carlos Perez
-- Email:       jcarlosp1986@gmail.com
-- Description: Generate Insert from Query and write result in file
--              ONLY for sqldeveloper v19+
-- --------------------------------------------- 
-- Change History:
--   20100501 Juan Carlos Perez: Initial Version
-- =============================================

set sqlformat insert
set long 10000
set lines 100

SPOOL <<FULL_PATH\FILE_NAME>>.sql

    --Query

SPOOL OFF
