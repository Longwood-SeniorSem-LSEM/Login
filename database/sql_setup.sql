DROP TABLE IF EXISTS rosters CASCADE;
DROP TABLE IF EXISTS class_info CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS instructor_info CASCADE;
DROP TABLE IF EXISTS user_credentials CASCADE;
DROP TABLE IF EXISTS user_info CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS assignment_storage CASCADE;
CREATE TABLE users (user_id INTEGER PRIMARY KEY AUTO_INCREMENT, email VARCHAR(255) UNIQUE NOT NULL, account_type VARCHAR(11), passwd VARCHAR(255)   NOT NULL, first_name TEXT NOT NULL, last_name TEXT NOT NULL, CONSTRAINT passwdLength CHECK (LENGTH(passwd) > 8), CONSTRAINT idMaxSize CHECK (id < 100000000) );
CREATE TABLE instructor_info (user_id INTEGER REFERENCES users(id), office TEXT, phone_number INTEGER, CONSTRAINT validPhoneNumber CHECK (phone_number BETWEEN 999999999 AND 10000000000) );
-- Class Tables --
CREATE TABLE classes (class_id INTEGER PRIMARY KEY AUTO_INCREMENT, subject VARCHAR(5) NOT NULL, course INTEGER NOT NULL, section INTEGER NOT NULL, semester VARCHAR(6) NOT NULL, title TEXT NOT NULL, class_key VARCHAR(12) UNIQUE NOT NULL, CONSTRAINT check_id CHECK (id BETWEEN 9999 AND 100000), CONSTRAINT check_section CHECK (section > 0), CONSTRAINT check_cn CHECK (course_number BETWEEN 0 AND 999) );
ALTER TABLE classes AUTO_INCREMENT = 10000;
CREATE TABLE rosters (class_id INTEGER REFERENCES classes(class_id), user_id INTEGER REFERENCES users(user_id));
-- Assignment Submission and Assignment Information Tables --
CREATE TABLE assignment_storage (assignment_data LONGBLOB, assignment_id INTEGER(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, user_id INTEGER REFERENCES users(user_id), class_id INTEGER REFERENCES classes(class_id), assignment_des TEXT, assignment_name TEXT NOT NULL);
INSERT INTO classes (semester,year,subject,course,section,title,class_key) VALUES ("fall",2015,"LSEM",100,1,"Longwood Seminar","SIS17YQT2HRq"),("fall",2015,"LSEM",100,2,"Longwood Seminar","PZQ27VRN4HBF"),("fall",2015,"LSEM",100,3,"Longwood Seminar","XHE95GNT5HQR"),("fall",2015,"LSEM",100,4,"Longwood Seminar","GUG56PVC8SMt"),("fall",2015,"LSEM",100,5,"Longwood Seminar","DEK79AHJ3LYX"),("fall",2015,"LSEM",100,6,"Longwood Seminar","AXZ49QJT7TYj"),("fall",2015,"LSEM",100,7,"Longwood Seminar","HOJ76ULE4XCh"),("fall",2015,"LSEM",100,8,"Longwood Seminar","KPS85YTK1PYQ"),("fall",2015,"LSEM",100,9,"Longwood Seminar","RGT94BOA4XYx"),("fall",2015,"LSEM",100,10,"Longwood Seminar","OEF14CGN8STQ");
INSERT INTO rosters (user_id,class_id) VALUES (1,50008);
INSERT INTO rosters (user_id,class_id) VALUES (2,50001);
INSERT INTO rosters (user_id,class_id) VALUES (3,50009);
INSERT INTO rosters (user_id,class_id) VALUES (4,50006);
INSERT INTO rosters (user_id,class_id) VALUES (5,50005);
INSERT INTO rosters (user_id,class_id) VALUES (6,50005);
INSERT INTO rosters (user_id,class_id) VALUES (7,50003);
INSERT INTO rosters (user_id,class_id) VALUES (8,50003);
INSERT INTO rosters (user_id,class_id) VALUES (9,50000);
INSERT INTO rosters (user_id,class_id) VALUES (10,50001);
INSERT INTO rosters (user_id,class_id) VALUES (11,50007);
INSERT INTO rosters (user_id,class_id) VALUES (12,50009);
INSERT INTO rosters (user_id,class_id) VALUES (13,50000);
INSERT INTO rosters (user_id,class_id) VALUES (14,50008);
INSERT INTO rosters (user_id,class_id) VALUES (15,50002);
INSERT INTO rosters (user_id,class_id) VALUES (16,50003);
INSERT INTO rosters (user_id,class_id) VALUES (17,50000);
INSERT INTO rosters (user_id,class_id) VALUES (18,50000);
INSERT INTO rosters (user_id,class_id) VALUES (19,50000);
INSERT INTO rosters (user_id,class_id) VALUES (20,50000);
INSERT INTO rosters (user_id,class_id) VALUES (21,50008);
INSERT INTO rosters (user_id,class_id) VALUES (22,50005);
INSERT INTO rosters (user_id,class_id) VALUES (23,50007);
INSERT INTO rosters (user_id,class_id) VALUES (24,50006);
INSERT INTO rosters (user_id,class_id) VALUES (25,50006);
INSERT INTO rosters (user_id,class_id) VALUES (26,50004);
INSERT INTO rosters (user_id,class_id) VALUES (27,50005);
INSERT INTO rosters (user_id,class_id) VALUES (28,50004);
INSERT INTO rosters (user_id,class_id) VALUES (29,50002);
INSERT INTO rosters (user_id,class_id) VALUES (30,50001);
INSERT INTO rosters (user_id,class_id) VALUES (31,50008);
INSERT INTO rosters (user_id,class_id) VALUES (32,50000);
INSERT INTO rosters (user_id,class_id) VALUES (33,50008);
INSERT INTO rosters (user_id,class_id) VALUES (34,50008);
INSERT INTO rosters (user_id,class_id) VALUES (35,50003);
INSERT INTO rosters (user_id,class_id) VALUES (36,50009);
INSERT INTO rosters (user_id,class_id) VALUES (37,50008);
INSERT INTO rosters (user_id,class_id) VALUES (38,50008);
INSERT INTO rosters (user_id,class_id) VALUES (39,50000);
INSERT INTO rosters (user_id,class_id) VALUES (40,50008);
INSERT INTO rosters (user_id,class_id) VALUES (41,50009);
INSERT INTO rosters (user_id,class_id) VALUES (42,50008);
INSERT INTO rosters (user_id,class_id) VALUES (43,50003);
INSERT INTO rosters (user_id,class_id) VALUES (44,50000);
INSERT INTO rosters (user_id,class_id) VALUES (45,50001);
INSERT INTO rosters (user_id,class_id) VALUES (46,50001);
INSERT INTO rosters (user_id,class_id) VALUES (47,50007);
INSERT INTO rosters (user_id,class_id) VALUES (48,50007);
INSERT INTO rosters (user_id,class_id) VALUES (49,50002);
INSERT INTO rosters (user_id,class_id) VALUES (50,50006);
INSERT INTO rosters (user_id,class_id) VALUES (51,50007);
INSERT INTO rosters (user_id,class_id) VALUES (52,50005);
INSERT INTO rosters (user_id,class_id) VALUES (53,50006);
INSERT INTO rosters (user_id,class_id) VALUES (54,50003);
INSERT INTO rosters (user_id,class_id) VALUES (55,50001);
INSERT INTO rosters (user_id,class_id) VALUES (56,50007);
INSERT INTO rosters (user_id,class_id) VALUES (57,50002);
INSERT INTO rosters (user_id,class_id) VALUES (58,50008);
INSERT INTO rosters (user_id,class_id) VALUES (59,50007);
INSERT INTO rosters (user_id,class_id) VALUES (60,50009);
INSERT INTO rosters (user_id,class_id) VALUES (61,50002);
INSERT INTO rosters (user_id,class_id) VALUES (62,50000);
INSERT INTO rosters (user_id,class_id) VALUES (63,50006);
INSERT INTO rosters (user_id,class_id) VALUES (64,50003);
INSERT INTO rosters (user_id,class_id) VALUES (65,50003);
INSERT INTO rosters (user_id,class_id) VALUES (66,50009);
INSERT INTO rosters (user_id,class_id) VALUES (67,50003);
INSERT INTO rosters (user_id,class_id) VALUES (68,50007);
INSERT INTO rosters (user_id,class_id) VALUES (69,50005);
INSERT INTO rosters (user_id,class_id) VALUES (70,50007);
INSERT INTO rosters (user_id,class_id) VALUES (71,50008);
INSERT INTO rosters (user_id,class_id) VALUES (72,50007);
INSERT INTO rosters (user_id,class_id) VALUES (73,50002);
INSERT INTO rosters (user_id,class_id) VALUES (74,50008);
INSERT INTO rosters (user_id,class_id) VALUES (75,50005);
INSERT INTO rosters (user_id,class_id) VALUES (76,50008);
INSERT INTO rosters (user_id,class_id) VALUES (77,50004);
INSERT INTO rosters (user_id,class_id) VALUES (78,50007);
INSERT INTO rosters (user_id,class_id) VALUES (79,50001);
INSERT INTO rosters (user_id,class_id) VALUES (80,50009);
INSERT INTO rosters (user_id,class_id) VALUES (81,50007);
INSERT INTO rosters (user_id,class_id) VALUES (82,50000);
INSERT INTO rosters (user_id,class_id) VALUES (83,50007);
INSERT INTO rosters (user_id,class_id) VALUES (84,50008);
INSERT INTO rosters (user_id,class_id) VALUES (85,50000);
INSERT INTO rosters (user_id,class_id) VALUES (86,50003);
INSERT INTO rosters (user_id,class_id) VALUES (87,50001);
INSERT INTO rosters (user_id,class_id) VALUES (88,50003);
INSERT INTO rosters (user_id,class_id) VALUES (89,50005);
INSERT INTO rosters (user_id,class_id) VALUES (90,50004);
INSERT INTO rosters (user_id,class_id) VALUES (91,50005);
INSERT INTO rosters (user_id,class_id) VALUES (92,50008);
INSERT INTO rosters (user_id,class_id) VALUES (93,50008);
INSERT INTO rosters (user_id,class_id) VALUES (94,50003);
INSERT INTO rosters (user_id,class_id) VALUES (95,50008);
INSERT INTO rosters (user_id,class_id) VALUES (96,50000);
INSERT INTO rosters (user_id,class_id) VALUES (97,50008);
INSERT INTO rosters (user_id,class_id) VALUES (98,50007);
INSERT INTO rosters (user_id,class_id) VALUES (99,50003);
INSERT INTO rosters (user_id,class_id) VALUES (100,50006);
INSERT INTO rosters (user_id,class_id) VALUES (101,50000);
INSERT INTO rosters (user_id,class_id) VALUES (102,50000);
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('William.Mcgee@live.longwood.edu', 'student', 2, 'WilliamMcgeepass', 'William','Mcgee');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Colleen.Olson@live.longwood.edu', 'student', 3, 'ColleenOlsonpass', 'Colleen','Olson');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Shelley.Brennan@live.longwood.edu', 'student', 4, 'ShelleyBrennanpass', 'Shelley','Brennan');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Zelenia.Camacho@live.longwood.edu', 'student', 5, 'ZeleniaCamachopass', 'Zelenia','Camacho');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Nero.Hall@live.longwood.edu', 'student', 6, 'NeroHallpass', 'Nero','Hall');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('India.Thomas@live.longwood.edu', 'student', 7, 'IndiaThomaspass', 'India','Thomas');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Courtney.Wood@live.longwood.edu', 'student', 8, 'CourtneyWoodpass', 'Courtney','Wood');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Fulton.Holden@live.longwood.edu', 'student', 9, 'FultonHoldenpass', 'Fulton','Holden');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Leila.Conner@live.longwood.edu', 'student', 10, 'LeilaConnerpass', 'Leila','Conner');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Teegan.Dale@live.longwood.edu', 'student', 11, 'TeeganDalepass', 'Teegan','Dale');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Kylee.Case@live.longwood.edu', 'student', 12, 'KyleeCasepass', 'Kylee','Case');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Raphael.Greer@live.longwood.edu', 'student', 13, 'RaphaelGreerpass', 'Raphael','Greer');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Edan.Haynes@live.longwood.edu', 'student', 14, 'EdanHaynespass', 'Edan','Haynes');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Aurora.Watkins@live.longwood.edu', 'student', 15, 'AuroraWatkinspass', 'Aurora','Watkins');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Keefe.Olson@live.longwood.edu', 'student', 16, 'KeefeOlsonpass', 'Keefe','Olson');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Andrew.Salazar@live.longwood.edu', 'student', 17, 'AndrewSalazarpass', 'Andrew','Salazar');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Gail.Cohen@live.longwood.edu', 'student', 18, 'GailCohenpass', 'Gail','Cohen');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Ignatius.Norton@live.longwood.edu', 'student', 19, 'IgnatiusNortonpass', 'Ignatius','Norton');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Damon.Rowland@live.longwood.edu', 'student', 20, 'DamonRowlandpass', 'Damon','Rowland');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Nash.Crane@live.longwood.edu', 'student', 21, 'NashCranepass', 'Nash','Crane');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Caldwell.Herring@live.longwood.edu', 'student', 22, 'CaldwellHerringpass', 'Caldwell','Herring');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Zahir.Russell@live.longwood.edu', 'student', 23, 'ZahirRussellpass', 'Zahir','Russell');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Wallace.Bird@live.longwood.edu', 'student', 24, 'WallaceBirdpass', 'Wallace','Bird');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Sybill.Mccray@live.longwood.edu', 'student', 25, 'SybillMccraypass', 'Sybill','Mccray');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Nissim.Fletcher@live.longwood.edu', 'student', 26, 'NissimFletcherpass', 'Nissim','Fletcher');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Hilary.Cole@live.longwood.edu', 'student', 27, 'HilaryColepass', 'Hilary','Cole');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Carly.Bryan@live.longwood.edu', 'student', 28, 'CarlyBryanpass', 'Carly','Bryan');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Alvin.Ross@live.longwood.edu', 'student', 29, 'AlvinRosspass', 'Alvin','Ross');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Duncan.Santana@live.longwood.edu', 'student', 30, 'DuncanSantanapass', 'Duncan','Santana');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Britanney.Noble@live.longwood.edu', 'student', 31, 'BritanneyNoblepass', 'Britanney','Noble');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Fritz.Andrews@live.longwood.edu', 'student', 32, 'FritzAndrewspass', 'Fritz','Andrews');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Mannix.Wynn@live.longwood.edu', 'student', 33, 'MannixWynnpass', 'Mannix','Wynn');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Brandon.Ewing@live.longwood.edu', 'student', 34, 'BrandonEwingpass', 'Brandon','Ewing');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Iola.Barr@live.longwood.edu', 'student', 35, 'IolaBarrpass', 'Iola','Barr');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Halee.Gibson@live.longwood.edu', 'student', 36, 'HaleeGibsonpass', 'Halee','Gibson');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Melinda.Yates@live.longwood.edu', 'student', 37, 'MelindaYatespass', 'Melinda','Yates');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Driscoll.Curry@live.longwood.edu', 'student', 38, 'DriscollCurrypass', 'Driscoll','Curry');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Isaac.Todd@live.longwood.edu', 'student', 39, 'IsaacToddpass', 'Isaac','Todd');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Sonia.Sanford@live.longwood.edu', 'student', 40, 'SoniaSanfordpass', 'Sonia','Sanford');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Grace.Pruitt@live.longwood.edu', 'student', 41, 'GracePruittpass', 'Grace','Pruitt');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Aaron.Young@live.longwood.edu', 'student', 42, 'AaronYoungpass', 'Aaron','Young');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Neve.Mcgee@live.longwood.edu', 'student', 43, 'NeveMcgeepass', 'Neve','Mcgee');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Montana.Potter@live.longwood.edu', 'student', 44, 'MontanaPotterpass', 'Montana','Potter');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Janna.Landry@live.longwood.edu', 'student', 45, 'JannaLandrypass', 'Janna','Landry');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Whilemina.Charles@live.longwood.edu', 'student', 46, 'WhileminaCharlespass', 'Whilemina','Charles');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Kirestin.Erickson@live.longwood.edu', 'student', 47, 'KirestinEricksonpass', 'Kirestin','Erickson');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Yen.Edwards@live.longwood.edu', 'student', 48, 'YenEdwardspass', 'Yen','Edwards');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Chelsea.Hampton@live.longwood.edu', 'student', 49, 'ChelseaHamptonpass', 'Chelsea','Hampton');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Olivia.Adams@live.longwood.edu', 'student', 50, 'OliviaAdamspass', 'Olivia','Adams');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Mikayla.Robbins@live.longwood.edu', 'student', 51, 'MikaylaRobbinspass', 'Mikayla','Robbins');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Hoyt.Whitaker@live.longwood.edu', 'student', 52, 'HoytWhitakerpass', 'Hoyt','Whitaker');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Plato.Pate@live.longwood.edu', 'student', 53, 'PlatoPatepass', 'Plato','Pate');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Wanda.Rasmussen@live.longwood.edu', 'student', 54, 'WandaRasmussenpass', 'Wanda','Rasmussen');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Abraham.Hogan@live.longwood.edu', 'student', 55, 'AbrahamHoganpass', 'Abraham','Hogan');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Zephr.Lancaster@live.longwood.edu', 'student', 56, 'ZephrLancasterpass', 'Zephr','Lancaster');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Alexandra.Ryan@live.longwood.edu', 'student', 57, 'AlexandraRyanpass', 'Alexandra','Ryan');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Conan.Mckinney@live.longwood.edu', 'student', 58, 'ConanMckinneypass', 'Conan','Mckinney');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Adrienne.Boone@live.longwood.edu', 'student', 59, 'AdrienneBoonepass', 'Adrienne','Boone');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Dennis.Rivas@live.longwood.edu', 'student', 60, 'DennisRivaspass', 'Dennis','Rivas');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Jamalia.Merrill@live.longwood.edu', 'student', 61, 'JamaliaMerrillpass', 'Jamalia','Merrill');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Courtney.Mcintosh@live.longwood.edu', 'student', 62, 'CourtneyMcintoshpass', 'Courtney','Mcintosh');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Daquan.Finley@live.longwood.edu', 'student', 63, 'DaquanFinleypass', 'Daquan','Finley');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Skyler.Simon@live.longwood.edu', 'student', 64, 'SkylerSimonpass', 'Skyler','Simon');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Bryar.Anderson@live.longwood.edu', 'student', 65, 'BryarAndersonpass', 'Bryar','Anderson');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Rosalyn.Cleveland@live.longwood.edu', 'student', 66, 'RosalynClevelandpass', 'Rosalyn','Cleveland');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Jade.Howard@live.longwood.edu', 'student', 67, 'JadeHowardpass', 'Jade','Howard');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Lareina.Savage@live.longwood.edu', 'student', 68, 'LareinaSavagepass', 'Lareina','Savage');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Reuben.Wiley@live.longwood.edu', 'student', 69, 'ReubenWileypass', 'Reuben','Wiley');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Samantha.Atkins@live.longwood.edu', 'student', 70, 'SamanthaAtkinspass', 'Samantha','Atkins');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Ishmael.Rowe@live.longwood.edu', 'student', 71, 'IshmaelRowepass', 'Ishmael','Rowe');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Bryar.Baker@live.longwood.edu', 'student', 72, 'BryarBakerpass', 'Bryar','Baker');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Oliver.Kelley@live.longwood.edu', 'student', 73, 'OliverKelleypass', 'Oliver','Kelley');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Karleigh.Montoya@live.longwood.edu', 'student', 74, 'KarleighMontoyapass', 'Karleigh','Montoya');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Courtney.Carpenter@live.longwood.edu', 'student', 75, 'CourtneyCarpenterpass', 'Courtney','Carpenter');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Kalia.Haney@live.longwood.edu', 'student', 76, 'KaliaHaneypass', 'Kalia','Haney');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Charity.Maynard@live.longwood.edu', 'student', 77, 'CharityMaynardpass', 'Charity','Maynard');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Neville.Jacobs@live.longwood.edu', 'student', 78, 'NevilleJacobspass', 'Neville','Jacobs');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Xenos.Hurley@live.longwood.edu', 'student', 79, 'XenosHurleypass', 'Xenos','Hurley');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Kato.Battle@live.longwood.edu', 'student', 80, 'KatoBattlepass', 'Kato','Battle');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Amity.Rosario@live.longwood.edu', 'student', 81, 'AmityRosariopass', 'Amity','Rosario');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Debra.Wilkins@live.longwood.edu', 'student', 82, 'DebraWilkinspass', 'Debra','Wilkins');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Mira.Andrews@live.longwood.edu', 'student', 83, 'MiraAndrewspass', 'Mira','Andrews');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Skyler.Moses@live.longwood.edu', 'student', 84, 'SkylerMosespass', 'Skyler','Moses');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Yvonne.Ayala@live.longwood.edu', 'student', 85, 'YvonneAyalapass', 'Yvonne','Ayala');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Gray.Rowland@live.longwood.edu', 'student', 86, 'GrayRowlandpass', 'Gray','Rowland');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Aspen.Wynn@live.longwood.edu', 'student', 87, 'AspenWynnpass', 'Aspen','Wynn');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Kato.Evans@live.longwood.edu', 'student', 88, 'KatoEvanspass', 'Kato','Evans');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Drew.Wilson@live.longwood.edu', 'student', 89, 'DrewWilsonpass', 'Drew','Wilson');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Miriam.Leach@live.longwood.edu', 'student', 90, 'MiriamLeachpass', 'Miriam','Leach');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Ahmed.Vaughn@live.longwood.edu', 'student', 91, 'AhmedVaughnpass', 'Ahmed','Vaughn');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Yardley.Tate@live.longwood.edu', 'student', 92, 'YardleyTatepass', 'Yardley','Tate');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Guinevere.Campbell@live.longwood.edu', 'student', 93, 'GuinevereCampbellpass', 'Guinevere','Campbell');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Thomas.Schneider@live.longwood.edu', 'student', 94, 'ThomasSchneiderpass', 'Thomas','Schneider');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Cedric.Maynard@live.longwood.edu', 'student', 95, 'CedricMaynardpass', 95, 'CedricMaynardpass', 'Cedric','Maynard');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Wynne.Suarez@live.longwood.edu', 'student', 'Wynne','Suarez');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Wylie.Sutton@live.longwood.edu', 'student', 97, 'WylieSuttonpass', 'Wylie','Sutton');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Dominic.Leon@live.longwood.edu', 'student', 98, 'DominicLeonpass', 'Dominic','Leon');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Armando.Cantu@live.longwood.edu', 'student', 99, 'ArmandoCantupass', 'Armando','Cantu');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Clayton.Frederick@live.longwood.edu', 'student', 100, 'ClaytonFrederickpass', 'Clayton','Frederick');
INSERT INTO users (email, account_type, user_id, passwd, first_name, last_name) VALUES ('Warren.Fletcher@live.longwood.edu', 'student', 101, 'WarrenFletcherpass', 'Warren','Fletcher');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,1,'Longwood Seminar - Math and Computer Science');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,2,'Longwood Seminar - Liberal Studies');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,3,'Longwood Seminar - Undeclared');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,4,'Longwood Seminar - Athletic Training');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,5,'Longwood Seminar - Honors');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,6,'Longwood Seminar - Nursing');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,7,'Longwood Seminar - Biology');
INSERT INTO classes (subject, course, section, title) VALUES ('LSEM',100,8,'Longwood Seminar - Chemistry & Physics');
