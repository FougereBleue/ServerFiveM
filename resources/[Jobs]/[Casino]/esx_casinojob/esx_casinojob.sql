SET @job_name = 'casino';
SET @society_name = 'society_casino';
SET @job_Name_Caps = 'Casino';



INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_casino', 'Casino', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_casino_fridge', 'casino (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_casino', 'Casino', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('casino', 'Casino', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('casino', 0, 'barman', 'Barman', 300, '{}', '{}'),
  ('casino', 1, 'secu', 'Sécurité', 300, '{}', '{}'),
  ('casino', 2, 'boss', 'Patron', 600, '{}', '{}')
;

INSERT INTO `items` VALUES  
    ('jager', 'Jägermeister', 5, 0, 1),
    ('coffee', 'Café', 5, 0, 1),
    ('vodka', 'Vodka', 5, 0, 1),
    ('rhum', 'Rhum', 5, 0, 1),
    ('whisky', 'Whisky', 5, 0, 1),
    ('tequila', 'Tequila', 5, 0, 1),
    ('martini', 'Martini blanc', 5, 0, 1),
    ('soda', 'Soda', 5, 0, 1),
    ('jusfruit', 'Jus de fruits', 5, 0, 1),
    ('icetea', 'Ice Tea', 5, 0, 1),
    ('energy', 'Energy Drink', 5, 0, 1),
    ('drpepper', 'Dr. Pepper', 5, 0, 1),
    ('limonade', 'Limonade', 5, 0, 1),
    ('bolcacahuetes', 'Bol de cacahuètes', 5, 0, 1),
    ('bolnoixcajou', 'Bol de noix de cajou', 5, 0, 1),
    ('bolpistache', 'Bol de pistaches', 5, 0, 1),
    ('bolchips', 'Bol de chips', 5, 0, 1),
    ('saucisson', 'Saucisson', 5, 0, 1),
    ('grapperaisin', 'Grappe de raisin', 5, 0, 1),
    ('jagerbomb', 'Jägerbomb', 5, 0, 1),
    ('golem', 'Golem', 5, 0, 1),
    ('whiskycoca', 'Whisky-coca', 5, 0, 1),
    ('vodkaenergy', 'Vodka-energy', 5, 0, 1),
    ('vodkafruit', 'Vodka-jus de fruits', 5, 0, 1),
    ('rhumfruit', 'Rhum-jus de fruits', 5, 0, 1),
    ('teqpaf', "Teq'paf", 5, 0, 1),
    ('rhumcoca', 'Rhum-coca', 5, 0, 1),
    ('mojito', 'Mojito', 5, 0, 1),
    ('ice', 'Glaçon', 5, 0, 1),
    ('mixapero', 'Mix Apéritif', 3, 0, 1),
    ('metreshooter', 'Mètre de shooter', 3, 0, 1),
    ('jagercerbere', 'Jäger Cerbère', 3, 0, 1),
    ('menthe', 'Feuille de menthe', 10)
;
