BEGIN;
UPDATE chats
SET is_file_sendable = 0, modified_at = NOW(), modified_by = 1
WHERE is_deleted = 0
AND id NOT IN (
    SELECT chat_id FROM joins
    WHERE user_id =1
);
COMMIT;
