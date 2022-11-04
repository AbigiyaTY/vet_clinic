/*Queries that provide answers to the questions from all projects.*/

-- SELECT
SELECT name from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth >= '2016-01-01' and date_of_birth <= '2019-12-31';
SELECT name from animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5; 
SELECT name from animals WHERE neutered;
SELECT name from animals WHERE name NOT ILIKE '%Gabumon%';
SELECT name from animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

-- UPDATE
-- 1
BEGIN;
UPDATE animals SET species = 'unspecified' WHERE species is null;
ROLLBACK;
-- 2
BEGIN; 
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is null;
COMMIT;

-- 3
BEGIN; 
DELETE FROM animals WHERE species is NOT null;
ROLLBACK;

-- 4
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg is NOT null;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- Write queries to answer the following questions: 
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT MIN(weight_kg),MAX(weight_kg) FROM animals;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' and date_of_birth <= '2000-12-31';

-- Write queries (using JOIN) to answer the following questions: 
SELECT name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals LEFT JOIN Species ON animals.species_id = species_id WHERE Species.name = 'Pokemon';
SELECT * FROM animals LEFT JOIN Owners ON animals.owner_id = owners.id;
SELECT Species.name, COUNT(animals.species_id) FROM animals JOIN Species ON animals.species_id = species_id GROUP BY Species.name;
SELECT * FROM animals a JOIN Owners O ON a.owner_id=O.id JOIN Species S ON a.species_id=S.id WHERE O.full_name='Jennifer Orwell' AND S.name='Digimon';
SELECT animals.name from animals JOIN Owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND animals.owner_id = 5;
SELECT full_name, COUNT(owner_id) FROM Owners JOIN animals on Owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT (owner_id) desc limit 1;