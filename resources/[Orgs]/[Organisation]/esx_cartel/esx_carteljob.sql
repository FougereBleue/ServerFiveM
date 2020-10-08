USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('organisation_cartel', 'cartel', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('organisation_cartel', 'cartel', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('organisation_cartel', 'cartel', 1)
;

INSERT INTO `org` (name, label) VALUES
	('cartel', 'Cartel')
;

INSERT INTO `org_gradeorg` (org_name, gradeorg, name, label, salary, skin_male, skin_female) VALUES
	('cartel',0,'recruit','Recrue',20,'{}','{}'),
	('cartel',1,'gangster','Gangster',40,'{}','{}'),
	('cartel',2,'bandit','Bandit',60,'{}','{}'),
	('cartel',3,'boss','OG',100,'{}','{}')
;

INSERT INTO `fine_types_org` (label, org ,amount, category) VALUES 
	('Raket','cartel',3000,0),
	('Raket','cartel',5000,0),
	('Raket','cartel',10000,1),
	('Raket','cartel',20000,1),
	('Raket','cartel',50000,2),
	('Raket','cartel',150000,3),
	('Raket','cartel',350000,3)
;