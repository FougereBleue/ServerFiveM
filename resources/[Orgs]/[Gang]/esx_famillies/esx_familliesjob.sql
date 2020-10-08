USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('organisation_famillies', 'famillies', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('organisation_famillies', 'famillies', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('organisation_famillies', 'famillies', 1)
;

INSERT INTO `org` (name, label) VALUES
	('famillies', 'famillies')
;

INSERT INTO `org_gradeorg` (org_name, gradeorg, name, label, salary, skin_male, skin_female) VALUES
	('famillies',0,'recruit','Recrue',20,'{}','{}'),
	('famillies',1,'gangster','Gangster',40,'{}','{}'),
	('famillies',2,'bandit','Bandit',60,'{}','{}'),
	('famillies',3,'boss','OG',100,'{}','{}')
;

CREATE TABLE `fine_types_org` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_org` (label, org ,amount, category) VALUES 
	('Raket','famillies',3000,0),
	('Raket','famillies',5000,0),
	('Raket','famillies',10000,1),
	('Raket','famillies',20000,1),
	('Raket','famillies',50000,2),
	('Raket','famillies',150000,3),
	('Raket','famillies',350000,3)
;