CREATE DATABASE IF NOT EXISTS pokemon_db;
USE pokemon_db;

-- テーブル: pokemon
CREATE TABLE pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    national_id INT NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    english_name VARCHAR(255) NOT NULL,
    type_id_1 INT NOT NULL,
    type_id_2 INT,
    ability_id_1 INT NOT NULL,
    ability_id_2 INT,
    ability_id_3 INT,
    hit_point INT NOT NULL,
    attack INT NOT NULL,
    defense INT NOT NULL,
    special_attack INT NOT NULL,
    special_defense INT NOT NULL,
    speed INT NOT NULL,
    height FLOAT NOT NULL,
    weight FLOAT NOT NULL,
    FOREIGN KEY (type_id_1) REFERENCES types(id),
    FOREIGN KEY (type_id_2) REFERENCES types(id),
    FOREIGN KEY (ability_id_1) REFERENCES abilities(id),
    FOREIGN KEY (ability_id_2) REFERENCES abilities(id),
    FOREIGN KEY (ability_id_3) REFERENCES abilities(id)
);

-- テーブル: types
CREATE TABLE types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL UNIQUE,
    english_type_name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO types (type_name, english_type_name) VALUES 
('ノーマル', 'Normal'),
('ほのお', 'Fire'),
('みず', 'Water'),
('くさ', 'Grass'),
('でんき', 'Electric'),
('こおり', 'Ice'),
('かくとう', 'Fighting'),
('どく', 'Poison'),
('じめん', 'Ground'),
('ひこう', 'Flying'),
('エスパー', 'Psychic'),
('むし', 'Bug'),
('いわ', 'Rock'),
('ゴースト', 'Ghost'),
('ドラゴン', 'Dragon'),
('あく', 'Dark'),
('はがね', 'Steel'),
('フェアリー', 'Fairy');

-- テーブル: abilities
CREATE TABLE abilities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ability_name VARCHAR(255) NOT NULL UNIQUE,
    battle_effect TEXT,
    field_effect TEXT
);

LOAD DATA INFILE '/docker-entrypoint-initdb.d/pokemon_data.csv'
INTO TABLE pokemon
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(national_id, name, english_name, type_id_1, type_id_2, ability_id_1, ability_id_2, ability_id_3, hit_point, attack, defense, special_attack, special_defense, speed, height, weight);
