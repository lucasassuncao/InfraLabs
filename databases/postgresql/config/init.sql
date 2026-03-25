-- Create extra databases for common use cases
CREATE DATABASE keycloak;
CREATE DATABASE kong;
CREATE DATABASE app;

-- Create read-only role example
CREATE ROLE readonly;
GRANT CONNECT ON DATABASE devdb TO readonly;
