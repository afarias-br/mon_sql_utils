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
