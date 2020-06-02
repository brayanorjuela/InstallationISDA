DROP TABLE IF EXISTS Bootsklasse;
DROP TABLE IF EXISTS Wettfahrt;
DROP TABLE IF EXISTS Teilnehmer;
DROP TABLE IF EXISTS Platzierung;
CREATE TABLE Bootsklasse(
  Klasse CHAR(12) NOT NULL PRIMARY KEY,
  Bauart CHAR(12) NOT NULL
);

INSERT INTO Bootsklasse (Klasse, Bauart) VALUES ('Folkeboot', 'Holz'), ('H-Boot', 'GFK'), ('Optimist', 'GFK'), ('Pirat', 'Holz');

CREATE TABLE Wettfahrt(
FahrtNr SMALLINT NOT NULL,
Name CHAR(50) NOT NULL,
Datum DATE NOT NULL,
Zeit TIME NOT NULL,
PRIMARY KEY(FahrtNr)
);

INSERT INTO Wettfahrt (FahrtNr, Name, Datum, Zeit) VALUES(1, 'Moorpokal', '2003-06-18', '10:00:00'), (2, 'Herbstmeister', '2003-09-16', '14:00:00'), (3, 'Franz Huber Gedenk Preis', '2003-05-15', '14:00:00'),(4, 'Blaues Band', '2003-05-29', '10:00:00');

CREATE TABLE Teilnehmer (
  SegelNr CHAR(8) NOT NULL PRIMARY KEY,
  Name CHAR(50) NOT NULL,
  Bootsklasse CHAR(12) NOT NULL,
  Baujahr CHAR(4) NOT NULL,
  Farbe CHAR(10) NOT NULL,
  Eigner CHAR(20) NOT NULL,
  CONSTRAINT fgk_Bootsklasse FOREIGN KEY(Bootsklasse) REFERENCES Bootsklasse(Klasse)
);


INSERT INTO Teilnehmer (SegelNr, Name, Bootsklasse, Baujahr, Farbe, Eigner) VALUES
('GER 1393', 'Carla F.', 'Folkeboot', 1972, 'Weiß', 'G.Gerhard'),
('GER 3876', 'No. Uno', 'Folkeboot', 1993, 'Rot', 'N. Nichts'),
('GER 3999', 'Willi', 'Optimist', 1989, 'Weiß', 'E. Ernst'),
('GER 4309', 'Elkche', 'H-Boot', 1981, 'Blau', 'M. Michel'),
('GER 4318', 'Marie', 'Pirat', 1992, 'Blau', 'D. Dummer'),
('GER 4833', 'Martha H.', 'H-Boot', 1994, 'Weiß', 'O. Otter'),
('GER 4995', 'Celeste', 'Pirat', 1991, 'Rot', 'S. Schott'),
('GER 5107', 'Windrose', 'Optimist', 1987, 'Lila', 'V. Voelz'),
('GER 5503', 'Lisa', 'H-Boot', 1983, 'Grün', 'H. Hiller'),
('GER 5505', 'Pistensau', 'Optimist', 1993, 'Braun', 'F. Faser'),
('GER 5703', 'Grünspan', 'Optimist', 1988, 'Grün', 'M. Meise');

CREATE TABLE Platzierung(
SEGELNR CHAR(8) NOT NULL,
WETTFAHRT SMALLINT NOT NULL,
PLATZ CHAR(3),
CONSTRAINT fgk_Teilnehmer FOREIGN KEY(SegelNr) REFERENCES Teilnehmer(SegelNr),
CONSTRAINT fgk_Wettfahrt FOREIGN KEY(Wettfahrt) REFERENCES Wettfahrt(FahrtNr),
PRIMARY KEY(SEGELNR, WETTFAHRT)
);

INSERT INTO Platzierung (SegelNr, Wettfahrt, Platz) VALUES
('GER 1393', 3, '1'),
('GER 3876', 3, '4'),
('GER 4309', 3, '3'),
('GER 4318', 1, '1'),
('GER 4318', 2, '2'),
('GER 4833', 3, 'dnf'),
('GER 4995', 1, '2'),
('GER 4995', 2, '1'),
('GER 5107', 4, '1'),
('GER 5503', 3, '2'),
('GER 5505', 4, '3'),
('GER 5703', 4, '2')
