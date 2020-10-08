USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('organisation_vagos', 'vagos', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('organisation_vagos', 'vagos', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('organisation_vagos', 'vagos', 1)
;

INSERT INTO `org` (name, label) VALUES
	('vagos', 'Vagos')
;

INSERT INTO `org_gradeorg` (org_name, gradeorg, name, label, salary, skin_male, skin_female) VALUES
	('vagos',0,'recruit','Recrue',20,'{}','{}'),
	('vagos',1,'gangster','Gangster',40,'{}','{}'),
	('vagos',2,'bandit','Bandit',60,'{}','{}'),
	('vagos',3,'boss','OG',100,'{}','{}')
;

INSERT INTO `fine_types_org` (label, org ,amount, category) VALUES 
	('Raket','vagos',3000,0),
	('Raket','vagos',5000,0),
	('Raket','vagos',10000,1),
	('Raket','vagos',20000,1),
	('Raket','vagos',50000,2),
	('Raket','vagos',150000,3),
	('Raket','vagos',350000,3)
;