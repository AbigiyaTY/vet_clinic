/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER primary key NOT NULL,
    name  TEXT NOT NULL,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg NUMERIC
);
        
