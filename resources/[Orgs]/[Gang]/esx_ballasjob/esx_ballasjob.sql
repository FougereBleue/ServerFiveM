USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('organisation_ballas', 'ballas', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('organisation_ballas', 'ballas', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('organisation_ballas', 'ballas', 1)
;

INSERT INTO `org` (name, label) VALUES
	('ballas', 'Ballas')
;

INSERT INTO `org_gradeorg` (org_name, gradeorg, name, label, salary, skin_male, skin_female) VALUES
	('ballas',0,'recruit','Recrue',20,'{}','{}'),
	('ballas',1,'gangster','Gangster',40,'{}','{}'),
	('ballas',2,'bandit','Bandit',60,'{}','{}'),
	('ballas',3,'boss','OG',100,'{}','{}')
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
	('Raket','ballas',3000,0),
	('Raket','ballas',5000,0),
	('Raket','ballas',10000,1),
	('Raket','ballas',20000,1),
	('Raket','ballas',50000,2),
	('Raket','ballas',150000,3),
	('Raket','ballas',350000,3)
;