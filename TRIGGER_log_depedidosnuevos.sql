DELIMITER //

CREATE TRIGGER log_pedidos_nuevos BEFORE INSERT ON Pedido
FOR EACH ROW BEGIN
	INSERT INTO Movimientos (Detalle,FechaEntrada) VALUE ('Se ha insertado un pedido',current_timestamp());
END //
