SELECT 
    i.RDB$RELATION_NAME AS table_name,
    i.RDB$INDEX_NAME AS index_name,
    i.RDB$STATISTICS AS selectivity,
    CASE i.RDB$INDEX_INACTIVE
        WHEN 1 THEN 'Inactive'
        ELSE 'Active'
    END AS index_status
FROM RDB$INDICES i
WHERE i.RDB$SYSTEM_FLAG = 0  -- Filter out system indexes
  AND (i.RDB$STATISTICS = 0 OR i.RDB$INDEX_INACTIVE = 1)
ORDER BY table_name, index_name;
