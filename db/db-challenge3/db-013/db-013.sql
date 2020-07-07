BEGIN;
UPDATE users
SET is_deleted = 1, modified_at = NOW()
WHERE phone_number IS NULL
AND business_number IS NULL; 
COMMIT;
