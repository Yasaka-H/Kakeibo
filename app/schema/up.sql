CREATE TABLE `list` (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `date` VARCHAR(16) NOT NULL,
    `category` VARCHAR(16) NOT NULL,
    `item` VARCHAR(32),
    `price` INTEGER,
    `discription` VARCHAR(64)
);
