create user rainbowuser with password 'rainbowrainbowrainbow';

create database rainbow_dev owner rainbowuser;

CREATE TABLE colors (
    id serial PRIMARY key,
    color_name varchar(50) UNIQUE NOT null,
    hex_code char(6) NOT NULL
);

DROP TABLE colors;

INSERT INTO colors (color_name, hex_code) VALUES ('Regular Blue', '30A9DE');
INSERT INTO colors (color_name, hex_code) VALUES ('Mustard', 'EFDC05');
INSERT INTO colors (color_name, hex_code) VALUES ('Ketchup', 'E53A40');
INSERT INTO colors (color_name, hex_code) VALUES ('Midnight', '090707');
INSERT INTO colors (color_name, hex_code) VALUES ('Burnt Orange', 'DE6449');
INSERT INTO colors (color_name, hex_code) VALUES ('Lakers', '791E94');
INSERT INTO colors (color_name, hex_code) VALUES ('Jeffrey', 'FFFFF2');
INSERT INTO colors (color_name, hex_code) VALUES ('Teal', '41D3BD');
INSERT INTO colors (color_name, hex_code) VALUES ('Electric Melon', 'F16B6F');
INSERT INTO colors (color_name, hex_code) VALUES ('Sidewalk', 'C5C6B6');
INSERT INTO colors (color_name, hex_code) VALUES ('Sad Lime', 'AACD6E');
INSERT INTO colors (color_name, hex_code) VALUES ('Charcoal', '3C3530');

CREATE TABLE palettes (
    id serial PRIMARY key,
    palette_name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO palettes (palette_name) VALUES ('Galactic Picnic');
INSERT INTO palettes (palette_name) VALUES ('Amnesia');
INSERT INTO palettes (palette_name) VALUES ('Art School Student');

CREATE TABLE color_palette (
    id serial PRIMARY key,
    color_id INTEGER REFERENCES colors,
    palette_id INTEGER REFERENCES palettes
);

INSERT INTO color_palette (color_id, palette_id) VALUES (
    (SELECT id FROM colors WHERE color_name='Regular Blue'),
    (SELECT id FROM palettes WHERE palette_name='Galactic Picnic')
);
INSERT INTO color_palette (color_id, palette_id) VALUES (2, 1);
INSERT INTO color_palette (color_id, palette_id) VALUES (3, 1);
INSERT INTO color_palette (color_id, palette_id) VALUES (4, 1);
INSERT INTO color_palette (color_id, palette_id) VALUES (5, 2);
INSERT INTO color_palette (color_id, palette_id) VALUES (6, 2);
INSERT INTO color_palette (color_id, palette_id) VALUES (7, 2);
INSERT INTO color_palette (color_id, palette_id) VALUES (8, 2);
INSERT INTO color_palette (color_id, palette_id) VALUES (9, 3);
INSERT INTO color_palette (color_id, palette_id) VALUES (10, 3);
INSERT INTO color_palette (color_id, palette_id) VALUES (11, 3);
INSERT INTO color_palette (color_id, palette_id) VALUES (12, 3);

-- All colors in 'Galactic Picnic'
SELECT * FROM colors
JOIN color_palette ON colors.id = color_palette.color_id
JOIN palettes ON color_palette.palette_id = palettes.id
WHERE palettes.palette_name = 'Galactic Picnic';

-- Same results, written differently
SELECT colors.* FROM palettes
JOIN color_palette ON palettes.id = color_palette.palette_id
JOIN colors ON color_palette.color_id = colors.id
WHERE palettes.palette_name = 'Galactic Picnic';

-- This doesn't work
SELECT FROM palettes WHERE id=1;

-- This does
SELECT * FROM palettes WHERE id=1;

