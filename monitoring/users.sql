-- 1. Create the user
CREATE USER 'grafana_user'@'%' IDENTIFIED BY 'secretpassword';

-- 2. Create the database (optional)
CREATE DATABASE IF NOT EXISTS grafana;

-- 3. Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON grafana.* TO 'grafana_user'@'%';

-- 4. Apply the changes
FLUSH PRIVILEGES;
