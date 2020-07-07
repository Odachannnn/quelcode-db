BEGIN;
UPDATE tasks
SET is_completed = 1, modified_at=NOW(), modified_by = 1
WHERE is_deleted = 0
AND created_at >= '2020-04-26 09:00'
AND created_at <='2020-04-26 11:30';
COMMIT;
