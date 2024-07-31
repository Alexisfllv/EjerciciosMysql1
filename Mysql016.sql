-- Tipos de datos de texto
VARCHAR(n)      -- Cadena de caracteres de longitud variable con un máximo de n caracteres.
CHAR(n)         -- Cadena de caracteres de longitud fija de exactamente n caracteres.
TEXT            -- Cadena de caracteres de longitud variable, utilizada para texto largo.

-- Tipos de datos numéricos
INT             -- Número entero, puede ser positivo o negativo.
FLOAT(p,d)      -- Número de coma flotante, con precisión p y d dígitos decimales.
DOUBLE          -- Número de coma flotante de doble precisión.
DECIMAL(p,d)    -- Número decimal con precisión p y d dígitos decimales.

-- Tipos de datos de fecha y hora
DATE            -- Fecha en formato 'YYYY-MM-DD'.
TIME            -- Hora en formato 'HH:MM:SS'.
DATETIME        -- Combinación de fecha y hora en formato 'YYYY-MM-DD HH:MM:SS'.
TIMESTAMP       -- Marca de tiempo que representa la fecha y hora UTC de la última modificación actual
YEAR            -- Año en formato de 4 dígitos (por ejemplo, 2022).

-- Otros tipos de datos
BOOLEAN         -- Almacenamiento de valores booleanos, puede ser verdadero (1) o falso (0).
ENUM('val1','val2',...) -- Enumeración de un conjunto finito de valores. // puedes insertar solo 1 valor
SET('val1','val2',...)  -- Conjunto de cero o más valores de una lista de valores permitidos. //puedes ingresar mas de 1 valor
BLOB            -- Almacena datos binarios grandes, como imágenes o archivos.
