-- CREATE USER ddladmin WITH password='<REDACTED>';

-- Members of the db_ddladmin fixed database role can run any Data Definition Language (DDL) command in a database.
-- Members of the db_datawriter fixed database role can add, delete, or change data in all user tables.
EXEC sp_addrolemember 'db_ddladmin', 'ddladmin';
EXEC sp_addrolemember 'db_datawriter', 'ddladmin';
