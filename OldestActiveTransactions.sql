SELECT 
    t.MON$TRANSACTION_ID AS tx_id,
    a.MON$USER AS user_name,
    a.MON$REMOTE_ADDRESS AS client_ip,
    a.MON$REMOTE_PROCESS AS client_app,
    t.MON$TIMESTAMP AS tx_started_at,
    CASE t.MON$ISOLATION_MODE
        WHEN 0 THEN 'Consistency'
        WHEN 1 THEN 'Concurrency (Snapshot)'
        WHEN 2 THEN 'Read Committed (No Record Version)'
        WHEN 3 THEN 'Read Committed (Record Version)'
    END AS isolation_mode
FROM MON$TRANSACTIONS t
JOIN MON$ATTACHMENTS a ON t.MON$ATTACHMENT_ID = a.MON$ATTACHMENT_ID
WHERE t.MON$STATE = 1 -- 1 means active
ORDER BY t.MON$TRANSACTION_ID ASC;
