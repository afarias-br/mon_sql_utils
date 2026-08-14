SELECT 
    mon$attachment_id AS user_id,
    mon$sql_text AS query_text,
    mon$timestamp AS started_at
FROM mon$statements
WHERE mon$state = 1;
