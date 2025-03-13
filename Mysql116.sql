-- Transacciones (TRANSACTION) 116

-- se ejecutan todas o ninguna

drop table if exists cuentas;

CREATE TABLE cuentas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    saldo DECIMAL(10,2)
);

INSERT INTO cuentas (nombre, saldo) VALUES ('Alexis', 1000), ('Carlos', 500);

select * from cuentas;

-- inciar transaccion

start transaction;

UPDATE cuentas SET saldo = saldo - 200 WHERE nombre = 'Alexis';

UPDATE cuentas SET saldo = saldo + 200 WHERE nombre = 'Carlos';

commit;

-- descativar el modo safe
SET SQL_SAFE_UPDATES = 0;

-- rollback; a para no registrar
rollback;
