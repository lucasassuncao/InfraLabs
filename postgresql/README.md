Steps to connect PgAdmin to PostgreSQL:

1. Access PgAdmin at: http://localhost:5050.
2. Log in with:
    - Email: admin@admin.com
    - Password: admin
3. In PgAdmin, click on "Add New Server".
4. In the General tab, enter a name for the connection (e.g., PostgreSQL).
5. In the Connection tab, fill in:
    - Host: postgres (this is the service name in docker-compose.yml)
    - Port: 5432
    - Username: admin
    - Password: admin
    - Check the Save password option if you want to save it.
6. Click Save.