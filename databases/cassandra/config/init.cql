-- Create keyspace for development
CREATE KEYSPACE IF NOT EXISTS devdb
  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- Example table
USE devdb;

CREATE TABLE IF NOT EXISTS events (
  id UUID PRIMARY KEY,
  name TEXT,
  payload TEXT,
  created_at TIMESTAMP
);

-- Connect via cqlsh:
--   docker exec -it cassandra cqlsh
