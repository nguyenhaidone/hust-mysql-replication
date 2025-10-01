CREATE DATABASE IF NOT EXISTS petdatabase;
USE petdatabase;
CREATE TABLE IF NOT EXISTS pet (
  name VARCHAR(20),
  owner VARCHAR(20),
  species VARCHAR(20),
  sex CHAR(1),
  birth DATE,
  death DATE
);

INSERT INTO pet (name, owner, species, sex, birth, death) VALUES
  ('Fluffy','Alice','cat','f','2010-01-01',NULL),
  ('Rex','Bob','dog','m','2015-06-20',NULL);

-- Tạo user cho replication (host '%' để slave có thể kết nối)
CREATE USER IF NOT EXISTS 'slave_user'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%';
FLUSH PRIVILEGES;
