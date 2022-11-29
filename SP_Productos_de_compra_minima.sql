CREATE DEFINER=`root`@`localhost` PROCEDURE `Productos_de_compra_minima`(IN p_IDProd int)
BEGIN
 SELECT IF ( pesoProd < 500 , "Peso menor a 500,comprar min 5 u", "Peso mayor a 500,comprar 1 u")as Resultado, nomprod nombre_producto
 ,pesoProd peso_producto FROM Productos
 WHERE IDProd = p_IDProd;

 END
