SELECT u.name AS ユーザー名, p1.posted_at AS 最新投稿日時, c.name AS チャット名
FROM posts p1
JOIN
(SELECT MAX(posted_at) AS posted_at, chat_id
FROM posts
WHERE is_deleted = 0
GROUP BY chat_id
) AS p2
ON p1.chat_id = p2.chat_id
AND p1.posted_at = p2.posted_at
JOIN users u
ON p1.posted_by= u.id
JOIN chats c
ON p1.chat_id = c.id;
