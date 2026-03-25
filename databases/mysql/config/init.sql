-- Create extra databases for common use cases
CREATE DATABASE IF NOT EXISTS app;
CREATE DATABASE IF NOT EXISTS keycloak;

-- Create read-only role
CREATE USER IF NOT EXISTS 'readonly'@'%' IDENTIFIED BY 'readonly';
GRANT SELECT ON devdb.* TO 'readonly'@'%';
FLUSH PRIVILEGES;
