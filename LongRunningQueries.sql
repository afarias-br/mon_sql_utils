SELECT 
    m.MON$ATTACHMENT_ID AS attachment_id,
    a.MON$USER AS user_name,
    a.MON$REMOTE_PROCESS AS client_process,
    m.MON$TIMESTAMP AS started_at,
    (CURRENT_TIMESTAMP - m.MON$TIMESTAMP) AS duration,
    m.MON$SQL_TEXT AS sql_query
FROM MON$STATEMENTS m
JOIN MON$ATTACHMENTS a ON m.MON$ATTACHMENT_ID = a.MON$ATTACHMENT_ID
WHERE m.MON$STATE = 1 -- 1 means actively executing
ORDER BY duration DESC;

SELECT 
    att.mon$user AS username,
    att.mon$remote_process AS application,
    att.mon$remote_address AS ip_address,
    stat.mon$attachment_id AS attachment_id,
    stat.mon$statement_id AS statement_id,
    stat.mon$sql_text AS query_text,
    CAST((CURRENT_TIMESTAMP - stat.mon$timestamp) * 86400 AS INTEGER) AS running_time_seconds
FROM mon$statements stat
JOIN mon$attachments att ON stat.mon$attachment_id = att.mon$attachment_id
WHERE stat.mon$state = 1 -- 1 means currently executing
  AND (CURRENT_TIMESTAMP - stat.mon$timestamp) * 86400 > 5 -- Greater than 5 seconds
ORDER BY running_time_seconds DESC;
