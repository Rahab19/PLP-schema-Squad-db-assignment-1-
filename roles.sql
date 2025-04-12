-- Create roles
CREATE ROLE librarian;
CREATE ROLE catalog_assistant;
CREATE ROLE viewer;
CREATE ROLE sys_admin;

-- Create users
CREATE USER 'lib1'@'localhost' IDENTIFIED BY 'lib123';
CREATE USER 'cat1'@'localhost' IDENTIFIED BY 'cat123';
CREATE USER 'view1'@'localhost' IDENTIFIED BY 'view123';
CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'admin123';

-- Grant roles to users
GRANT librarian TO 'lib1'@'localhost';
GRANT catalog_assistant TO 'cat1'@'localhost';
GRANT viewer TO 'view1'@'localhost';
GRANT sys_admin TO 'admin1'@'localhost';

-- Privileges for the librarian
GRANT SELECT, INSERT, UPDATE, DELETE ON library_system.book TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON library_system.author TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON library_system.book_author TO librarian;
GRANT SELECT, INSERT, UPDATE ON library_system.book_language TO librarian;
GRANT SELECT, INSERT, UPDATE ON library_system.publisher TO librarian;

-- Privileges for the catalo_assistant
GRANT SELECT, INSERT ON library_system.book TO catalog_assistant;
GRANT SELECT, INSERT ON library_system.author TO catalog_assistant;
GRANT SELECT, INSERT ON library_system.book_author TO catalog_assistant;
GRANT SELECT ON library_system.publisher TO catalog_assistant;

-- Privileges for the viewer - can view books and author info
GRANT SELECT ON library_system.book TO viewer;
GRANT SELECT ON library_system.author TO viewer;
GRANT SELECT ON library_system.book_language TO viewer;
GRANT SELECT ON library_system.publisher TO viewer;

-- Privileges for the system admin - full access
GRANT ALL PRIVILEGES ON library_system.* TO sys_admin;



