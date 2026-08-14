SELECT 
    att.mon$user AS username,
    att.mon$remote_process AS app_name,
    stat.mon$sql_text AS query_text,
    tx.mon$transaction_id AS tx_id,
    (CURRENT_TIMESTAMP - stat.mon$timestamp) AS running_time_seconds
FROM mon$statements stat
JOIN mon$attachments att ON stat.mon$attachment_id = att.mon$attachment_id
JOIN mon$transactions tx ON stat.mon$transaction_id = tx.mon$transaction_id
WHERE stat.mon$state = 1 -- Currently running/waiting
  AND (CURRENT_TIMESTAMP - stat.mon$timestamp) > 2 -- Running for more than 2 seconds
  AND (UPPER(stat.mon$sql_text) containing 'UPDATE'
    OR UPPER(stat.mon$sql_text) containing 'DELETE'
    OR UPPER(stat.mon$sql_text) containing 'INSERT'
    OR UPPER(stat.mon$sql_text) containing 'WITH LOCK');
