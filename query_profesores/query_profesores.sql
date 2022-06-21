-- Insertar en la tabla PROFESORES los datos de una profesora con estos apellidos y nombre. 'QUIROGA MARTIN, A. ISABEL', de la especialidad 'INFORMATICA' y con el codigo de centro 45.
INSERT INTO profesores (cod_centro,apellidos,especialidad)
VALUES 
    (
    45,
    'Quiroga Martin, A. Isabel',
    'INFORMATICA'
    );


-- Insertar un profesor en la tabla PROFESORES de apellidos y nombre 'GONZALEZ SEVILLA, MIGUEL A.', en el codigo de centro 22, con DNI 23444800 y de la especialidad de 'HISTORIA'.
INSERT profesores
VALUES
    (
    22,
    23444800,
    'Gonzalez Sevilla, Miguel A.',
    'HISTORIA'
    );

-- Inserta en la tabla PERSONAL los profesores de la tabla PROFESORES. El cod_centro, el dni y los apellidos son los mismos que los de la tabla PROFESORES, la funcion es PROFESOR y el salario , 1900.
INSERT INTO personal VALUES (45,0,'Quiroga Martin, A. Isabel','INFORMATICA',1900);
INSERT INTO personal VALUES (22,23444800,'Gonzalez Sevilla, Miguel A.','HISTORIA', 1900);


-- 

-- Inserta en la tabla PROFESORES un profesor de apellidos y nombre 'GUIJARRO ALIA, MANUELA', con DNI 28848110, de la especialidad de 'INFORMATICA' en el codigo de centro que tenga dos trabajadores cuya funcion sea 'CONSERJE'.
 
INSERT INTO profesores(cod_centro,dni,apellidos,especialidad)
VALUES (
		(SELECT
			cod_centro
	
		FROM repaso1.personal
		LEFT JOIN centros USING(cod_centro)
		WHERE funcion = 'CONSERJE'
		GROUP BY cod_centro
		HAVING count('DNI') = 2),
    28848110,
    'GUIJARRO ALIA, MANUELA'
    ,'INFORMATICA'
);