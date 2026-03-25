-- Initial schema for LAMP dev environment
CREATE DATABASE IF NOT EXISTS app;

CREATE USER IF NOT EXISTS 'readonly'@'%' IDENTIFIED BY 'readonly';
GRANT SELECT ON lampdb.* TO 'readonly'@'%';
FLUSH PRIVILEGES;
