-- lab1 :Création et sélection d’une base
USE testdb;
SHOW DATABASES;

-- Création et peuplement d’une table
CREATE TABLE utilisateur (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  nom   VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;
INSERT INTO utilisateur (nom, email) VALUES 
('Alice Dupont', 'alice@example.com'),
('Bob Martin', 'bob@example.com'),
('Charlie Leroy', 'charlie@test.org');

SELECT * FROM utilisateur;
-- Interrogation des données
SELECT * FROM utilisateur;

SELECT nom, email
FROM utilisateur
WHERE email LIKE '%@example.com';

SELECT COUNT(*) AS total_utilisateurs
FROM utilisateur;

SELECT nom, email
FROM utilisateur
ORDER BY nom ASC;

SELECT nom, email
FROM utilisateur
ORDER BY id DESC
LIMIT 2;
-- Mise à jour et suppression de données
UPDATE utilisateur
SET email = 'bob.martin@example.com'
WHERE id= 2;
SELECT * FROM utilisateur;

SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;
DELETE FROM utilisateur WHERE id = 1;
SELECT * FROM utilisateur;
ROLLBACK;
-- Gestion des index et performance
CREATE INDEX idx_email ON utilisateur(email);
SET SQL_SAFE_UPDATES = 1;
SHOW INDEX FROM utilisateur;
EXPLAIN SELECT * FROM utilisateur WHERE email = 'alice@example.com';
SELECT * FROM utilisateur;
DROP TABLE utilisateur;
DROP DATABASE testdb;


