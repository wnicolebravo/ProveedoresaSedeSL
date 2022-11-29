DELIMITER //
-- este SP lo que hace es almacenar los productos con peso menor a 500 para luego seleccionarlos.
CREATE PROCEDURE `Productos_de_menor500`(IN pesoProd CHAR(50))
	IF pesoProd<500 THEN
    SELECT nomProd,pesoProd FROM Productos ;
 END IF;
 