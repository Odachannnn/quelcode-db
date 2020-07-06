SELECT id, name, outline,
CASE is_file_sendable
WHEN 1 THEN '許可'
WHEN 0 THEN '禁止'
END AS ファイル送信可否,
is_direct_chat, is_deleted, created_at, created_by, modified_at, modified_by
FROM chats
WHERE is_deleted = 0
AND is_direct_chat = 1
ORDER BY id;
