-- Creating roles for Members 2 & 3

CREATE ROLE 'member2_role';
CREATE ROLE 'member3_role';

-- Creating users for members 2 & 3
CREATE USER IF NOT EXISTS 'member2'@'localhost' IDENTIFIED BY '12345';
CREATE USER IF NOT EXISTS 'member3'@'localhost' IDENTIFIED BY '12345';

--  Grant access
GRANT 'member2_role' TO 'member2'@'localhost';
GRANT 'member3_role' TO 'member3'@'localhost';

-- For member 2 to access publisher and book_language tables
GRANT SELECT ON library_system.publisher TO 'member2_role';
GRANT SELECT ON library_system.book_language TO 'member2_role';

-- For member 3 to access book table
GRANT SELECT ON library_system.book TO 'member3_role';



