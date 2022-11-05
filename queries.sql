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

-- Write queries to answer the following: 
SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ON v.vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY v.date desc limit 1;
SELECT COUNT(animals.name) FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name='Stephanie Mendez';
SELECT vets.name, species.name FROM specializations JOIN species ON specializations.species_id=species.id FULL JOIN vets ON specializations.vets_id=vets.id;
SELECT animals.name FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name='Stephanie Mendez' AND visits.date BETWEEN '2020-04-01' AND '2020-08-30';
SELECT COUNT(animals.name), animals.name FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id=vets.id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;
SELECT animals.name FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name='Maisy Smith' ORDER BY visits.date LIMIT 1;
SELECT animals.*, vets.*, visits.date as date_visited FROM visits JOIN animals ON visits.animal_id=animals.id JOIN vets ON visits.vets_id=vets.id ORDER BY visits.date DESC LIMIT 1;
SELECT COUNT(*) FROM vets LEFT JOIN visits ON vets.id = visits.animal_id LEFT JOIN specializations ON specializations.species_id = vets.id LEFT JOIN species ON species.id = specializations.species_id WHERE species.id IS NULL;
SELECT COUNT(animals.id), animals.name, animals.species_id FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id=vets.id WHERE vets.name = 'Maisy Smith' GROUP BY animals.id ORDER BY COUNT(animals.id) DESC LIMIT 1;