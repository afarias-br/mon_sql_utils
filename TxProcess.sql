SELECT mon$user, mon$remote_process, tx.mon$timestamp
FROM mon$transactions tx
JOIN mon$attachments att ON tx.mon$attachment_id = att.mon$attachment_id
WHERE tx.mon$transaction_id = <tx-id>;
