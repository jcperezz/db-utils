# SQL Documentation Templates
## Header for procedures, functions and PL/SQL blocks
There is not really something like a standard header. The next template is based in SQL Server Management Studio standard header:
```sql
-- =============================================
-- Author:      <Name>
-- Email:       <Email>
-- Create date: <Create Date YYYY/MM/DD>
-- Description: <Description>
-- --------------------------------------------- 
-- Parameters:
--   @<Name> - <Type,Description,limits,Restrictions>
-- --------------------------------------------- 
-- Returns:     <Description>
-- --------------------------------------------- 
-- Change History:
--   <Date YYYY/MM/DD> <Author Email>: <Comments>
-- =============================================
```
Example:
```sql
CREATE OR REPLACE PROCEDURE EXAMPLE_PROCEDURE (
-- =============================================
-- Author:      Juan Carlos Perez
-- Email:       juan.perez@example.com
-- Create date: 2020/01/21
-- Description: A example procedure
-- --------------------------------------------- 
-- Parameters:
--   @PARAM1- Varchar param for example, Accepts nulls
--   @PARAM1- Varchar param for example, Not nulls, Min 0 max 1
-- --------------------------------------------- 
-- Returns:     No apply
-- --------------------------------------------- 
-- Change History:
--   2020/01/23 juan.perez@example.com      : Changed calculation
--   2020/02/05 fulano.brown@example.com    : Changed calculation again
--   2020/02/13 mike.white@example.com      : Reverted changes
-- =============================================
    PARAM1   IN    VARCHAR2,
    PARAM2   IN    NUMBER
) AS
BEGIN
    NULL;
END EXAMPLE_PROCEDURE;
```