/* Populate database with sample data. */

-- INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, "Agumon", "2020-02-03", 0, true, 48);
-- INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals VALUES ('Gabumon', '2020-11-15', 2, true, 8.00);
INSERT INTO animals VALUES ('Pikachu', '2021-01-07', 1, false, 15.00);
INSERT INTO animals VALUES ('Devimon', '2017-05-12', 5, true, 11,00);
-- 2nd inserted
INSERT INTO animals VALUES ('Charmander', '2020-02-8',0, false, -11.00);
INSERT INTO animals VALUES ('Plantmon', '2021-11-15', 2, true, -5.70);
INSERT INTO animals VALUES ('Squirtle', '1993-04-2', 3, false, -12.13);
INSERT INTO animals VALUES ('Angemon', '2005-06-12', 1, true, -45.00);
INSERT INTO animals VALUES ('Boarmon', '2005-06-7', 7, true, 20.40);
INSERT INTO animals VALUES ('Blossom', '1998-10-13', 3, true, 17.00);
INSERT INTO animals VALUES ('Ditto', '2022-05-14', 4, true, 22.00);

-- Inserting the following data into the owners table

INSERT INTO Owners (full_name, age) VALUES ('Sam Smith', 34),
INSERT INTO Owners (full_name, age) VALUES ('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);

-- Inserting the following data into the species table
INSERT INTO Species (name) VALUES ('Pokemon'),('Digimon');

-- Modify your inserted animals so it includes the species_id value:
UPDATE animals SET species_id = 2 WHERE name like '%mon';
UPDATE animals SET species_id = 1 WHERE species_id is null;

-- Modify your inserted animals to include owner information (owner_id): 
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon' ,'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');
