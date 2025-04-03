--creacion de tablas

create table TB_asistencia (
id_asistencia int primary key identity(1,1),
Carnet VARCHAR(20) foreign key references TB_alumnos(carnet),
fecha date,
presente char(1) check(presente in ('S','N'))
);

CREATE TABLE notas_finales (
    id_nota_final INT PRIMARY KEY IDENTITY(1,1),
    Carnet VARCHAR(20) FOREIGN KEY REFERENCES Tb_alumnos(carnet),
    nota_final DECIMAL(5,2)
);
--inserta documentacion
SELECT * FROM Tb_alumnos;

INSERT INTO TB_asistencia(Carnet, fecha, presente) VALUES
('0905-24-7370', '2024-03-29', 'S'),
('0905-15-9622', '2024-03-29', 'N'),
('0905-15-14297', '2024-03-29', 'S'),
('0905-18-4689', '2024-03-29', 'S'),
('0905-19-6478', '2024-03-29', 'N'),
('0905-10-1279', '2024-03-29', 'S'); 



INSERT INTO notas_finales (Carnet, nota_final) VALUES
('0905-24-7370', 100.00),
('0905-15-9622', 98.00),
('0905-15-14297', 62.75),
('0905-18-4689', 59.50),
('0905-19-6478', 60.75);
--el cambio de la A ala B y de la B a la A
update TB_alumnos set seccion = 'C' where seccion = 'A';
select * from TB_Alumnos
update TB_alumnos set seccion = 'A' where seccion = 'B';
update TB_alumnos set seccion = 'B' where seccion = 'C';
-- consulta basica
SELECT * FROM Tb_alumnos;
--Consulta con filtro 
select * from Tb_alumnos where seccion = 'A';
--Consulta de la manera que vimos en clase
select * from tareas;
SELECT a.Estudiante, t.nota1, t.nota2, t.nota3, t.nota4
FROM TB_alumnos a, tareas t
WHERE a.Carnet = t.Carnet;
--Actualización 
UPDATE notas_finales  SET nota_final = 80.00 WHERE Carnet = '0905-15-9622';
select * from notas_finales;
--Elimanacion
delete from  TB_asistencia where id_asistencia = '5'
select * from TB_asistencia;
--exportar datos
select * from TB_alumnos;

--ingresar datos
create table  alumnos_temp(
    carnet VARCHAR(20),
    Estudiante NVARCHAR(255),
    email NVARCHAR(255),
    seccion CHAR(1)
); 
select * from alumnos_temp;


BULK INSERT TB_alumnos
FROM 'C:\Users\Jose Carlos\OneDrive\UMG\Tercer semestre\Programacion l\PruebaSQL\TB_alumnos.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2           
);

select * from alumnos_temp;

