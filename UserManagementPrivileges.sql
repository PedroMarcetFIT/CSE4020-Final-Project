-- Phase 6: User Management and Privileges

-- Drop users first if they already exist (safe to run multiple times)
DROP USER IF EXISTS 'AlexSmith'@'localhost';
DROP USER IF EXISTS 'JamieLee'@'localhost';

-- 1. Database Administrator (DBA) user
CREATE USER 'AlexSmith'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'AlexSmith'@'localhost' WITH GRANT OPTION;

-- 2. Data Analyst user (read-only)
CREATE USER 'JamieLee'@'localhost';
GRANT SELECT ON OGDataBase.* TO 'JamieLee'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

-- Verify grants
SHOW GRANTS FOR 'AlexSmith'@'localhost';
SHOW GRANTS FOR 'JamieLee'@'localhost';
