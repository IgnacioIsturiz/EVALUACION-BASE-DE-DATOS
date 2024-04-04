--create database GestionRestaurantes
use GestionRestaurantes;

CREATE TABLE RESTAURANTE1(
id_Restaurante int not null PRIMARY KEY,
nombre varchar(50) not null,
direccion varchar(50) not null,
cuidad varchar(50) not null,
pais varchar(50) not null,
telefono varchar(20) not null,
horario_Apertura TIME not null,
horario_Cierre TIME not null,
imagen image,
);

CREATE TABLE CLIENTE1(
id_Cliente int not null PRIMARY KEY,
nombre varchar(50) not null,
direccion varchar(50) not null,
cuidad varchar(50) not null,
pais varchar(50) not null,
telefono varchar(20) not null,
correoelectronico varchar(50),
);

CREATE TABLE TIPOCOMIDA1 (
id_Cocina int not null PRIMARY KEY,
nombre varchar(50) not null,
descripcion varchar(100) not null,
id_Restaurante int FOREIGN KEY (id_Restaurante) REFERENCES RESTAURANTE1 (id_Restaurante),
);

CREATE TABLE RESERVAS1 (
id_Reserva int not null PRIMARY KEY,
fecha date not null,
hora time not null,
num_personas int not null,
id_Restaurante int 
FOREIGN KEY (id_Restaurante) REFERENCES RESTAURANTE1 (id_Restaurante),
id_Cliente int 
FOREIGN KEY (id_Cliente) REFERENCES CLIENTE1 (id_Cliente),
);

CREATE TABLE PEDIDOS1 (
id_Pedidos int not null PRIMARY KEY,
fecha date not null,
hora time not null,
tipoPedido varchar(50) not null,
estado varchar(50) not null,
precioTotal float not null,
id_Restaurante int 
FOREIGN KEY (id_Restaurante) REFERENCES RESTAURANTE1 (id_Restaurante),
id_Cliente int 
FOREIGN KEY (id_Cliente) REFERENCES CLIENTE1 (id_Cliente),
cantidadPlatos int,
);

CREATE TABLE MENUS1 (
id_Menu int not null PRIMARY KEY,
id_Restaurante int not null 
FOREIGN KEY (id_Restaurante) REFERENCES RESTAURANTE1 (id_Restaurante),
id_Cocina int not null 
FOREIGN KEY (id_Cocina) REFERENCES TIPOCOMIDA1 (id_Cocina)
);

CREATE TABLE PLATO1 (
id_Plato int not null PRIMARY KEY,
nombre varchar(50) not null,
descripcion varchar(100) not null,
precio float not null,
id_Menu int not null 
FOREIGN KEY (id_Menu) REFERENCES MENUS1 (id_Menu),
id_Restaurante int not null 
FOREIGN KEY (id_Restaurante) REFERENCES RESTAURANTE1 (id_Restaurante),
);

CREATE TABLE RESTAURANTECLIENTE1(
Id_RestaurantesClientes int not null,
id_Restaurante int, 
FOREIGN KEY (id_Restaurante) REFERENCES RESTAURANTE1 (id_Restaurante),
id_Cliente int,
FOREIGN KEY (id_Cliente) REFERENCES CLIENTE1 (Id_Cliente),
);

INSERT INTO RESTAURANTE1 (id_Restaurante, nombre, direccion, cuidad, pais, telefono, horario_Apertura, horario_Cierre, imagen) VALUES
(1, 'El Rinc�n Mexicano', 'Calle de los Burritos 123', 'Ciudad de M�xico', 'M�xico', '555-123-4567', '09:00:00', '22:00:00', NULL),
(2, 'La Trattoria Italiana', 'Via Roma 456', 'Roma', 'Italia', '333-789-0123', '11:00:00', '23:00:00', NULL),
(3, 'Sushi House', 'Calle de los Sushis 789', 'Tokio', 'Jap�n', '111-222-3333', '12:00:00', '23:00:00', NULL),
(4, 'El Asador Argentino', 'Avenida del Asado 234', 'Buenos Aires', 'Argentina', '444-555-6666', '17:00:00', '01:00:00', NULL),
(5, 'Le Bistro Fran�ais', 'Rue de la Gastronomie 567', 'Par�s', 'Francia', '666-777-8888', '10:00:00', '22:00:00', NULL);


INSERT INTO CLIENTE1(id_Cliente, nombre, direccion, cuidad, pais, telefono, correoelectronico) VALUES
(1, 'Juan P�rez', 'Calle Principal 123', 'Ciudad Ejemplo', 'Pa�s Ejemplo', '1234567890', 'juanperez@example.com'),
(2, 'Mar�a Garc�a', 'Avenida Central 456', 'Otra Ciudad', 'Otro Pa�s', '9876543210', 'mariagarcia@example.com'),
(3, 'Carlos Rodr�guez', 'Plaza Mayor 789', 'Ciudad Principal', 'Pa�s Principal', '5551234567', 'carlosrodriguez@example.com'),
(4, 'Laura Mart�nez', 'Calle de los Artistas 234', 'Ciudad Creativa', 'Pa�s Creativo', '7778889999', 'lauramartinez@example.com'),
(5, 'Pedro L�pez', 'Paseo Costero 567', 'Ciudad Costera', 'Pa�s Costero', '3334445555', 'pedrolopez@example.com');


INSERT INTO TIPOCOMIDA1 VALUES
(1, 'Comida Mexicana', 'Comida tradicional mexicana con sabores picantes y especiados', 1),
(2, 'Comida Italiana', 'Comida tradicional italiana con pastas, pizzas y salsas de tomate', 2),
(3, 'Comida Asi�tica', 'Comida tradicional asi�tica con sabores dulces y salados', 3),
(4, 'Comida Argentina', 'Comida tradicional argentina con carnes a la parrilla y empanadas', 4),
(5, 'Comida Francesa', 'Comida tradicional francesa con quesos, vinos y postres deliciosos', 5);

INSERT INTO RESERVAS1 VALUES
 (1, '2024-04-15', '19:00:00', 4, 1, 4),
 (2, '2024-04-20', '20:30:00', 2, 5, 1),
 (3, '2024-04-25', '18:00:00', 6, 2, 1),
 (4, '2024-04-30', '19:30:00', 3, 1, 2),
 (5, '2024-05-05', '21:00:00', 5, 4, 1);

INSERT INTO PEDIDOS1 VALUES
(1, '2024-04-15', '19:30:00', 'Entrega a domicilio', 'En preparaci�n', 50.00, 1, 4, 2),
(2, '2024-04-16', '20:00:00', 'Recoger en el restaurante', 'Listo para recoger', 35.50, 2, 2, 5),
(3, '2024-04-17', '18:30:00', 'Entrega a domicilio', 'En camino', 70.00, 3, 5, 1),
(4, '2024-04-18', '19:00:00', 'Recoger en el restaurante', 'Listo para recoger', 40.00, 4, 4, 3),
(5, '2024-04-19', '21:00:00', 'Entrega a domicilio', 'En preparaci�n', 85.00, 5, 3, 2);

INSERT INTO MENUS1 VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO PLATO1 (id_Plato, nombre, descripcion, precio, id_Menu, id_Restaurante) VALUES

--MEXICANO
(1, 'Tacos al pastor', 'Tacos de cerdo adobado con cebolla', 18.10, 1, 1),
(2, 'Enchiladas rojas', 'Enchiladas con salsa de chile pasilla, queso y crema', 22.20,  1, 1),
(3, 'Quesadillas de flor de calabaza', 'Quesadillas de flor de calabaza con queso y epazote', 20.20,  1, 1),
(4, 'Chiles rellenos', 'Chiles poblanos rellenos de queso y carne molida', 28.20,  1, 1),
(5, 'Guacamole', 'Guacamole con aguacate, cebolla, cilantro, tomate y lim�n', 12.20,  1, 1),

--ITALIANO
(6, 'Pizza Margherita', 'Pizza con salsa de tomate, mozzarella y albahaca', 2.20, 2, 2),
(7, 'Lasagna bolognesa', 'Lasagna con salsa bolognesa, mozzarella y parmesano', 30.20,  2, 2),
(8, 'Spaghetti carbonara', 'Spaghetti con bacon, huevo y parmesano', 28.20,  2, 2),
(9, 'Pollo alla parmigiana', 'Pollo empanizado con salsa de tomate y mozzarella', 32.20,  2, 2),
(10, 'Tiramis�', 'Postre de mascarpone, bizcocho, caf� y cacao', 15.20,  2, 2),

--ASIATICO
(11, 'Sushi Roll', 'Roll de sushi con salm�n, aguacate y queso crema', 25.20, 3, 3),
(12, 'Tataki de at�n', 'Tataki de at�n con salsa de soya y jengibre', 30.20, 3, 3),
(13, 'Tempura de vegetales', 'Tempura de vegetales con salsa de soya y wasabi', 20.20, 3, 3),
(14, 'Ramen de pollo', 'Ramen de pollo con fideos, huevo y verduras', 35.20, 3, 3),
(15, 'Yakitori de pollo', 'Brochetas de pollo con salsa teriyaki', 21.20, 3, 3),

--ARGENTINO
(16, 'Bistec a la parrilla', 'Bistec de res a la parrilla con papas a la francesa y ensalada mixta', 25.32, 4, 4),
(17, 'Churrasco', 'Churrasco de res con papas fritas y huevo frito', 22.50, 4, 4),
(18, 'Pollo a la plancha', 'Pollo a la plancha con arroz y ensalada', 20.50, 4, 4),
(19, 'Pescado frito', 'Pescado frito con arroz y ensalada', 23.50, 4, 4),
(20, 'Tiradito de at�n', 'Tiradito de at�n con salsa de soya y jengibre', 28.50, 4, 4),

--FRANCES
(21, 'Coq au Vin', 'Pollo guisado en vino tinto con champi�ones, tocino y cebolla', 25.50, 5, 5),
(22, 'Ratatouille', 'Guiso de berenjena, pimiento, calabac�n y tomate con ajo y albahaca', 22.50, 5, 5),
(23, 'Quiche Lorraine', 'Tarta salada de huevo, nata y tocino', 20.50, 5, 5),
(24, 'Boeuf Bourguignon', 'Guiso de ternera en vino tinto con champi�ones, cebolla y zanahoria', 30.50, 5, 5),
(25, 'Cr�pes Suzette', 'Cr�pes flambeadas con naranja, mantequilla y Grand Marnier', 18.50, 5, 5);

CREATE TABLE MENUPLATO1 (
id_MenuPlatos int not null,
id_Menu int not null 
FOREIGN KEY (id_Menu) REFERENCES MENUS1 (id_Menu),
id_Plato int not null 
FOREIGN KEY (id_Plato) REFERENCES PLATO1 (id_Plato),
id_Restaurante int not null 
FOREIGN KEY (id_Restaurante) REFERENCES RESTAURANTE1 (id_Restaurante),
);

INSERT INTO MENUPLATO1 VALUES
--MEXICANO
(21, 5, 21, 5),

--ITALIANO
(22, 5, 22, 5),

--ASIATICO
(23, 5, 23, 5),

--ARGENTINO
(24, 5, 24, 5),

--FRANCES
(25, 5, 25, 5);

----CONSULTAS----
--consulta 1
SELECT r.nombre , t.nombre AS tipoComida FROM RESTAURANTE1 r JOIN TIPOCOMIDA1 t ON r.id_Restaurante = t.id_Restaurante 
WHERE t.nombre = 'Comida Italiana'; 

--consulta 2
SELECT r.nombre AS restaurante, p.nombre AS plato
FROM Restaurantes r
JOIN Menu m ON r.restaurante_id = m.restaurante_id
JOIN Platos p ON m.menu_id = p.menu_id
LEFT JOIN (
    SELECT plato_id, COUNT(*) AS total_pedidos
    FROM Pedidos
    GROUP BY plato_id
) AS pedidos ON p.plato_id = pedidos.plato_id
GROUP BY r.nombre
ORDER BY total_pedidos DESC;

--consulta 3
SELECT R.Nombre AS 'Nombre del Restaurante', 
       COUNT(PEDIDOS1.id_Pedidos) AS 'Cantidad de Pedidos'
	FROM PEDIDOS1
	JOIN RESTAURANTE1 R ON PEDIDOS1.Id_Restaurante = R.Id_Restaurante
	GROUP BY R.Nombre;

--consulta 4
select count(*) as total_reservas from RESERVAS1 where fecha like '2024-04-17'

---PUNTO 5
SELECT R.nombre AS 'Nombre del Restaurante', 
       M.id_Menu AS 'Nombre del Men�', 
       P.Nombre AS 'Nombre del Plato', 
       Pedidos.tipoPedido AS 'Tipo de Pedido', 
       Reservas.Fecha AS 'Fecha de Reserva', 
       Reservas.Hora AS 'Hora de Reserva'
	FROM RESTAURANTE1 R
	JOIN Menus M ON R.id_Restaurante = M.Id_Restaurante
	JOIN PLATO1 P ON M.Id_Menu = P.Id_Menu
	LEFT JOIN Pedidos ON R.id_Restaurante = Pedidos.Id_Restaurante
	LEFT JOIN Reservas ON R.id_Restaurante = Reservas.Id_Restaurante;