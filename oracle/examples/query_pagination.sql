WITH selection AS (
    SELECT
        ROW_NUMBER() OVER(
            ORDER BY
                table_name
        ) ROW_NUMBER,
        re.*
    FROM
        SYS.ALL_TABLES re
)
SELECT
    :page_number page_number,
    ceil((
        SELECT count(1) from SYS.ALL_TABLES
    ) / :page_size) total_pages,
    :page_size page_size,
    (
        SELECT count(1) from SYS.ALL_TABLES
    ) total_rows,
    selection.*
FROM
    selection
WHERE
    ROW_NUMBER BETWEEN ( ( :page_size * :page_number ) - :page_size + 1 ) AND ( :page_size * :page_number );