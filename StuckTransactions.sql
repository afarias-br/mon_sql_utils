SELECT 
    mon$transaction_id AS tx_id,
    mon$state AS state,
    mon$top_transaction AS top_tx,
    mon$oldest_transaction AS oldest_tx,
    mon$oldest_active AS oldest_active
FROM mon$transactions
WHERE mon$state = 1;
