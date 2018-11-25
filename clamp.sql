DROP DATABASE IF EXISTS clamp;

CREATE DATABASE clamp;

\c clamp;

CREATE TABLE families (
    family_id SERIAL PRIMARY KEY,
    family_name VARCHAR
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

INSERT INTO families (family_name) VALUES 
('Caryophyllaceae'),
('Scrophulariaceae'),
('Saxifragaceae'),
('Apocynaceae'),
('Convolvulaceae'),
('Fabaceae'),
('Scrophulariaceae'),
('Asteraceae'),
('Fabaceae'),
('Chenopodiaceae');

INSERT INTO latin_binomials (binomial_name, family_id) VALUES
('Silene seelyi Morton & J.W. Thomp.', 1),
('Collinsia heterophylla Buist ex Graham', 2),
('Jepsonia malvifolia (Greene) Small', 3),
('Nerium oleander L.', 4),
('Ipomoea repanda Jacq.', 5),
('Lathyrus bijugatus T.G. White', 6),
('Castilleja angustifolia (Nutt.) G. Don var. dubia A. Nelson', 7),
('Oligoneuron riddellii (Frank ex Riddell) Rydb.', 8),
('Astragalus tortipes J.L. Anderson & J.M. Porter', 9),
('Chenopodium pallescens Standl.', 10);

INSERT INTO common_names (common_name, binomial_id) VALUES
('Seely''s Catchfly', 1),
('Seely''s silene', 1),
('Purple Chinese Houses', 2),
('innocence', 2),
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

SELECT family_name, binomial_name, common_name FROM families JOIN latin_binomials ON families.family_id = latin_binomials.family_id JOIN common_names ON latin_binomials.binomial_id = common_names.binomial_id;
WHERE family_name = 'Fabaceae';