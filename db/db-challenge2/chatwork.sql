-- usersテーブルの作成
CREATE TABLE `users` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `mail_address` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `introduction` VARCHAR(1000),
    `phone_number` VARCHAR(13),
    `business_number` VARCHAR(13),
    `is_deleted` TINYINT(1) DEFAULT 0 NOT NULL,
    `created_at` DATETIME NOT NULL,
    `modified_at` DATETIME NOT NULL
);

-- chatsテーブルの作成
CREATE TABLE `chats` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `outline` VARCHAR(1000),
    `is_file_permitted` TINYINT(1) DEFAULT 0 NOT NULL,
    `is_direct_chat` TINYINT(1) DEFAULT 0 NOT NULL,
    `is_deleted` TINYINT(1) DEFAULT 0 NOT NULL,
    `created_at` DATETIME NOT NULL,
    `created_by` INT(11) NOT NULL REFERENCES users(id),
    `modified_at` DATETIME NOT NULL,
    `modified_by` INT(11) NOT NULL REFERENCES users(id)
);

-- postsテーブルの作成
CREATE TABLE `posts` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `message` VARCHAR(1000) NOT NULL,
    `file_name` VARCHAR(100),
    `chat_id` INT(11) NOT NULL  NOT NULL REFERENCES chats(id),
    `is_deleted` TINYINT(1) DEFAULT 0 NOT NULL,
    `posted_at` DATETIME NOT NULL,
    `posted_by` INT(11) NOT NULL REFERENCES users(id),
    `modified_at` DATETIME NOT NULL,
    `modified_by` INT(11) NOT NULL REFERENCES users(id)
);

-- tasksテーブルの作成
CREATE TABLE `tasks` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `task` VARCHAR(1000) NOT NULL,
    `tasked_by` INT(11) NOT NULL REFERENCES users(id),
    `deadline` DATETIME,
    `is_completed` TINYINT(1) DEFAULT 0 NOT NULL,
    `is_deleted` TINYINT(1) DEFAULT 0 NOT NULL,
    `chat_id` INT(11) NOT NULL REFERENCES chats(id),
    `created_at` DATETIME NOT NULL,
    `created_by` INT(11) NOT NULL REFERENCES users(id),
    `modified_at` DATETIME NOT NULL,
    `modified_by` INT(11) NOT NULL REFERENCES users(id)
    );

-- joinsテーブルの作成
CREATE TABLE `joins` (
    `chat_id` INT(11) REFERENCES chats(id),
    `user_id` INT(11) REFERENCES users(id),
    `joined_at` DATETIME NOT NULL,
    PRIMARY KEY(`chat_id`, `user_id`)
);
