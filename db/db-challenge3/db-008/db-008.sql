SELECT u.name AS ユーザー名, c.name AS チャット名, SUBSTRING(j.joined_at, 1, 10) AS 参加日時
FROM joins j
JOIN users u
ON j.user_id = u.id
JOIN chats c
ON j.chat_id = c.id
WHERE u.is_deleted = 0
AND c.is_deleted = 0
ORDER BY j.joined_at;
