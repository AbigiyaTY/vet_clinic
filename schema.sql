/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial primary key NOT NULL,
    name  TEXT NOT NULL,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg NUMERIC
);

ALTER TABLE animals ADD species varchar(255);

-- Creating a table named owners
CREATE TABLE Owners (
    id serial PRIMARY KEY,
    full_name varchar(255) NOT NULL,
    age INTEGER
);

-- Creating a table named species
CREATE TABLE Species (
    id serial PRIMARY KEY,
    name varchar(255) NOT NULL
);

-- Modifying animals table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners (id);

-- ALTER TABLE animals DROP species_id;
-- ALTER TABLE animals DROP owner_id;

CREATE TABLE vets(
    id serial PRIMARY KEY,
    name varchar(255) NOT NULL,
    age INTEGER,
    date_of_graduation date
);

CREATE TABLE specializations (
    species_id INT REFERENCES species(id),
    vets_id INT REFERENCES vets(id)
);

CREATE TABLE visits (
    animal_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    date date
);

CREATE INDEX idx_animal_id ON visits (animal_id);
CREATE INDEX idx_vets_id ON visits (vets_id);
CREATE INDEX idx_species_id ON specializations (species_id);

explain analyze SELECT * FROM visits WHERE animal_id = 4;
explain analyze SELECT * FROM visits WHERE vets_id = 2;
explain analyze SELECT * FROM email WHERE email = 'owner_18327@mail.com';
