SELECT 
    mon$attachment_id AS id,
    mon$user AS username,
    mon$remote_process AS app_name,
    mon$remote_address AS ip_address
FROM mon$attachments
WHERE mon$attachment_id <> CURRENT_CONNECTION;
