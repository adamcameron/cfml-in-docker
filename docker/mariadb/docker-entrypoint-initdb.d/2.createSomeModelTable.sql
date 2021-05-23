USE cfmlindocker;

CREATE TABLE somemodels (
    id INT NOT NULL auto_increment,
    name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    email VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    password VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,

    PRIMARY KEY (id)
) ENGINE=InnoDB;
