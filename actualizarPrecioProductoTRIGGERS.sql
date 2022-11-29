DELIMITER //
CREATE TRIGGER `actualizarPrecioProducto`
BEFORE UPDATE ON `Productos`
FOR EACH ROW
BEGIN
  IF NEW.preUnProd <> OLD.preUnProd
    THEN
      SET NEW.preUnProd = NEW.preUnProd * 2;
  END IF ;
END
DELIMITER ;