# SQL Documentation Templates
## Procedures, functions and PL/SQL blocks
### Header
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
### Comment Code
SQL (and its derivatives T-SQL and PL/SQL) supports similar commenting techniques as most programming languages. You can embed comments in your procedures and functions code:
```sql
-- Simple short comment
```
### Declarations And Comment Blocks of Code
```sql
-- discount value we are calculating
discount Number;
...
...
-- Initializing variables
discount := 0;
client_name := 'juan';
```
### Code Separators
Many code blocks can be separated as shown below:
```sql
-- =============================================
-- Declarations
-- =============================================
...
-- =============================================
-- Calculating discount
-- =============================================
```
### Manual "Version Control"
There is no code version control built into popular databases. This means that, unless you copy code somewhere or use dedicated version control tool, you only have most recent version of each procedure or function and there is no way to check changes. 
Best practice is to keep track of changes manually.
```sql
-- =============================================
-- Change History:
--   <Date YYYY/MM/DD> <Author Email>: <Comments>
-- =============================================
```
#### Who, When, What and Why
What you should put into that log is who and when made what change. It is also advised to put information why was this was changed and who requested that change. You could also add more details, like a ticked ID.
### Putting It All Together
```sql
CREATE OR REPLACE PROCEDURE example_procedure (
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
    param1   IN   VARCHAR2,
    param2   IN   NUMBER
) IS
-- =============================================
-- Declarations
-- =============================================
    -- discount value we are calculating
    discount      NUMBER;
    -- client name
    client_name   VARCHAR(20);
BEGIN
    -- Initializing variables
    discount := 0;
    client_name := 'juan';
    
    -- =============================================
    -- First Step Calculating discount 
    -- =============================================
    
    -- Getting discount for client
    -- =============================================
    -- Change History:
    --   2020/01/23 juan.perez@example.com      : Changed calculation
    --   2020/02/05 fulano.brown@example.com    : Changed calculation again
    -- =============================================
    SELECT
        client_discount
    INTO discount
    FROM
        clientd
    WHERE
        cname = client_name;

    discount := discount * 100;
    
    -- =============================================
    -- Second Step: Updating discount in items
    -- =============================================
    ...
END example_procedure;
```
## Views
### Header
Add header after SELECT keyword
```sql
CREATE VIEW v_test AS
    SELECT
    -- =============================================
    -- Author:      <Name>
    -- Email:       <Email>
    -- Create date: <Create Date YYYY/MM/DD>
    -- Description: <Description>
    -- --------------------------------------------- 
    -- Change History:
    --   <Date YYYY/MM/DD> <Author Email>: <Comments>
    -- =============================================
        sysdate AS current_date
    FROM
        dual;
```
### Comment line in where clause
Add short comment line in importan where clauses:
```sql
CREATE VIEW v_test AS
    SELECT
    -- =============================================
    -- Author:      <Name>
    -- Email:       <Email>
    -- Create date: <Create Date YYYY/MM/DD>
    -- Description: <Description>
    -- --------------------------------------------- 
    -- Change History:
    --   <Date YYYY/MM/DD> <Author Email>: <Comments>
    -- =============================================
        sysdate AS current_date
    FROM
        dual
    WHERE
        -- Simple short comment
        1 = 1;
```