SELECT u.name AS ユーザー名, MAX(p.posted_at) AS 投稿日時, c.name AS チャットルーム名
FROM posts p
JOIN users u
ON p.posted_by = u.id
JOIN chats c
ON p.chat_id = c.id
WHERE u.is_deleted = 0
AND p.is_deleted = 0
GROUP BY c.id
ORDER BY c.id;
