SELECT c.name AS チャット名, COUNT(p.id) AS 投稿数
FROM posts p
JOIN chats c
ON p.chat_id = c.id
JOIN users u
ON p.posted_by = u.id
WHERE c.is_deleted = 0
AND u.is_deleted = 0
GROUP BY c.id
ORDER BY COUNT(p.id) DESC;
