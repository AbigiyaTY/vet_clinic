/*Queries that provide answers to the questions from all projects.*/
SELECT name from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth >= '2016-01-01' and date_of_birth <= '2019-12-31';
SELECT name from animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.4; 
SELECT name from animals WHERE neutered;
SELECT name from animals WHERE name NOT ILIKE '%Gabumon%';
SELECT name from animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;
