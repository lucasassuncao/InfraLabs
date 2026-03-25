db = db.getSiblingDB('devdb');

db.createUser({
  user: 'devuser',
  pwd: 'devpass',
  roles: [{ role: 'readWrite', db: 'devdb' }]
});

db.createCollection('events');
db.createCollection('logs');

print('MongoDB initialized successfully');
