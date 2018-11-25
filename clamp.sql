DROP DATABASE IF EXISTS clamp;

CREATE DATABASE clamp;

\c clamp;

CREATE TABLE families (
    family_id SERIAL PRIMARY KEY,
    family_name VARCHAR
);

CREATE TABLE native_distributions (
    distribution_id SERIAL PRIMARY KEY,
    distribution_name VARCHAR
);

CREATE TABLE latin_binomials (
	binomial_id SERIAL PRIMARY KEY,
	binomial_name VARCHAR,
    family_id INT REFERENCES families(family_id)
);

CREATE TABLE common_names (
    common_id SERIAL PRIMARY KEY,
    common_name VARCHAR,
    binomial_id INT REFERENCES latin_binomials (binomial_id) 
);

CREATE TABLE plant_distributions (
    plant_distributions_id SERIAL PRIMARY KEY,
    plant_id INT REFERENCES latin_binomials(binomial_id),
    distribution_id INT REFERENCES native_distributions(distribution_id)
);

INSERT INTO families (family_name) VALUES 
('Caryophyllaceae'),
('Scrophulariaceae'),
('Saxifragaceae'),
('Apocynaceae'),
('Convolvulaceae'),
('Fabaceae'),
('Asteraceae'),
('Chenopodiaceae');

INSERT INTO latin_binomials (binomial_name, family_id) VALUES
('Silene seelyi Morton & J.W. Thomp.', 1),
('Collinsia heterophylla Buist ex Graham', 2),
('Jepsonia malvifolia (Greene) Small', 3),
('Nerium oleander L.', 4),
('Ipomoea repanda Jacq.', 5),
('Lathyrus bijugatus T.G. White', 6),
('Castilleja angustifolia (Nutt.) G. Don var. dubia A. Nelson', 2),
('Oligoneuron riddellii (Frank ex Riddell) Rydb.', 7),
('Astragalus tortipes J.L. Anderson & J.M. Porter', 6),
('Chenopodium pallescens Standl.', 8);

INSERT INTO common_names (common_name, binomial_id) VALUES
('Seely''s Catchfly', 1),
('Seely''s silene', 1),
('Purple Chinese Houses', 2),
('Innocence', 2),
('Island Jepsonia', 3),
('Oleander', 4),
('Laurier Rose', 4),
('Bejuco Colorado', 5),
('Drypark Pea', 6),
('Pinewoods Sweetpea', 6),
('Latah Tule-pea', 6),
('Northwestern Indian Paintbrush', 7),
('Desert Indian paintbrush', 7),
('Riddell''s Goldenrod', 8),
('Sleeping Ute Milkvetch', 9),
('Slimleaf Goosefoot', 10);

INSERT INTO native_distributions (distribution_name) VALUES
('Africa'),
('Europe'),
('North America'),
('South America'),
('Asia'),
('Australia'),
('Antarctica');

-- INSERT INTO plant_distributions (plant_id, distribution_id) VALUES
-- (),


SELECT binomial_name FROM families JOIN latin_binomials ON families.family_id = latin_binomials.family_id JOIN common_names ON latin_binomials.binomial_id = common_names.binomial_id WHERE common_names.common_name = 'Oleander';