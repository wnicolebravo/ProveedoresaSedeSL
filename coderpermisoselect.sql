-- aca creamos un usuario, luego le permitimos que tenga permisos solo para leer

USE mysql;
CREATE USER 'coderhouse@localhost' IDENTIFIED BY 'coderhouse';
SELECT* FROM user;

"Grants for coder@dbProdServer@%"
"GRANT USAGE ON *.* TO `coder@dbProdServer`@`%`"
"GRANT SELECT ON `ProvASEDE`.* TO `coder@dbProdServer`@`%`"
