-- Funcion de particiones http port 80
CREATE OR REPLACE FUNCTION http_port_80_partition_function() RETURNS TRIGGER

LANGUAGE plpgsql

AS $_$

DECLARE

_Tablename   VARCHAR;
sql       VARCHAR;

BEGIN

_Tablename = 'http_port_80' || '_' || to_char(NEW.date, 'YYYY_MM_DD');

PERFORM 1
FROM   pg_catalog.pg_class c
JOIN   pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE  c.relkind = 'r'
AND    c.relname = _Tablename;

IF NOT FOUND THEN
-- Crear Partition
EXECUTE 'CREATE TABLE ' || _Tablename || ' (
CONSTRAINT http_port_80_date_check
	CHECK (date = '|| quote_literal(to_char(NEW.date, 'YYYY-MM-DD')) ||')
) inherits (http_port_80)';

-- Asignar Permisos
EXECUTE 'ALTER TABLE ' || _Tablename || ' OWNER TO upload_data_osr';
EXECUTE 'GRANT ALL ON TABLE ' || _Tablename || ' TO upload_data_osr';
EXECUTE 'GRANT SELECT ON TABLE ' || _Tablename || ' TO web_osr';

-- Agregar indices
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_btree' || ' ON ' || _Tablename || ' USING btree (ip)';
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_hash' || ' ON ' || _Tablename || ' USING hash (ip)';

END IF;

sql := 'INSERT INTO ' || _Tablename || ' VALUES ( ($1).*)';

EXECUTE sql USING NEW;

return NULL;

END $_$;

-- Crear trigger http port 80
CREATE TRIGGER trg_http_port_80_insert

BEFORE INSERT ON http_port_80

FOR EACH ROW

EXECUTE PROCEDURE http_port_80_partition_function();

-----------------------------------------------------------
-----------------------------------------------------------

-- Funcion de particiones http port 443
CREATE OR REPLACE FUNCTION http_port_443_partition_function() RETURNS TRIGGER

LANGUAGE plpgsql

AS $_$

DECLARE

_Tablename   VARCHAR;
sql       VARCHAR;

BEGIN

_Tablename = 'http_port_443' || '_' || to_char(NEW.date, 'YYYY_MM_DD');

PERFORM 1
FROM   pg_catalog.pg_class c
JOIN   pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE  c.relkind = 'r'
AND    c.relname = _Tablename;

IF NOT FOUND THEN
-- Crear Partition
EXECUTE 'CREATE TABLE ' || _Tablename || ' (
CONSTRAINT http_port_443_date_check
	CHECK (date = '|| quote_literal(to_char(NEW.date, 'YYYY-MM-DD')) ||')
) inherits (http_port_443)';

-- Asignar Permisos
EXECUTE 'ALTER TABLE ' || _Tablename || ' OWNER TO upload_data_osr';
EXECUTE 'GRANT ALL ON TABLE ' || _Tablename || ' TO upload_data_osr';
EXECUTE 'GRANT SELECT ON TABLE ' || _Tablename || ' TO web_osr';

-- Agregar indices
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_btree' || ' ON ' || _Tablename || ' USING btree (ip)';
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_hash' || ' ON ' || _Tablename || ' USING hash (ip)';

END IF;

sql := 'INSERT INTO ' || _Tablename || ' VALUES ( ($1).*)';

EXECUTE sql USING NEW;

return NULL;

END $_$;

-- Crear trigger http port 443
CREATE TRIGGER trg_http_port_443_insert

BEFORE INSERT ON http_port_443

FOR EACH ROW

EXECUTE PROCEDURE http_port_443_partition_function();

-----------------------------------------------------------
-----------------------------------------------------------

-- Funcion de particiones http port 8000
CREATE OR REPLACE FUNCTION http_port_8000_partition_function() RETURNS TRIGGER

LANGUAGE plpgsql

AS $_$

DECLARE

_Tablename   VARCHAR;
sql       VARCHAR;

BEGIN

_Tablename = 'http_port_8000' || '_' || to_char(NEW.date, 'YYYY_MM_DD');

PERFORM 1
FROM   pg_catalog.pg_class c
JOIN   pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE  c.relkind = 'r'
AND    c.relname = _Tablename;

IF NOT FOUND THEN
-- Crear Partition
EXECUTE 'CREATE TABLE ' || _Tablename || ' (
CONSTRAINT http_port_8000_date_check
	CHECK (date = '|| quote_literal(to_char(NEW.date, 'YYYY-MM-DD')) ||')
) inherits (http_port_8000)';

-- Asignar Permisos
EXECUTE 'ALTER TABLE ' || _Tablename || ' OWNER TO upload_data_osr';
EXECUTE 'GRANT ALL ON TABLE ' || _Tablename || ' TO upload_data_osr';
EXECUTE 'GRANT SELECT ON TABLE ' || _Tablename || ' TO web_osr';

-- Agregar indices
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_btree' || ' ON ' || _Tablename || ' USING btree (ip)';
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_hash' || ' ON ' || _Tablename || ' USING hash (ip)';

END IF;

sql := 'INSERT INTO ' || _Tablename || ' VALUES ( ($1).*)';

EXECUTE sql USING NEW;

return NULL;

END $_$;

-- Crear trigger http port 8000
CREATE TRIGGER trg_http_port_8000_insert

BEFORE INSERT ON http_port_8000

FOR EACH ROW

EXECUTE PROCEDURE http_port_8000_partition_function();

-----------------------------------------------------------
-----------------------------------------------------------

-- Funcion de particiones http port 8080
CREATE OR REPLACE FUNCTION http_port_8080_partition_function() RETURNS TRIGGER

LANGUAGE plpgsql

AS $_$

DECLARE

_Tablename   VARCHAR;
sql       VARCHAR;

BEGIN

_Tablename = 'http_port_8080' || '_' || to_char(NEW.date, 'YYYY_MM_DD');

PERFORM 1
FROM   pg_catalog.pg_class c
JOIN   pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE  c.relkind = 'r'
AND    c.relname = _Tablename;

IF NOT FOUND THEN
-- Crear Partition
EXECUTE 'CREATE TABLE ' || _Tablename || ' (
CONSTRAINT http_port_8080_date_check
	CHECK (date = '|| quote_literal(to_char(NEW.date, 'YYYY-MM-DD')) ||')
) inherits (http_port_8080)';

-- Asignar Permisos
EXECUTE 'ALTER TABLE ' || _Tablename || ' OWNER TO upload_data_osr';
EXECUTE 'GRANT ALL ON TABLE ' || _Tablename || ' TO upload_data_osr';
EXECUTE 'GRANT SELECT ON TABLE ' || _Tablename || ' TO web_osr';

-- Agregar indices
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_btree' || ' ON ' || _Tablename || ' USING btree (ip)';
EXECUTE 'CREATE INDEX ' || _Tablename || '_index_hash' || ' ON ' || _Tablename || ' USING hash (ip)';

END IF;

sql := 'INSERT INTO ' || _Tablename || ' VALUES ( ($1).*)';

EXECUTE sql USING NEW;

return NULL;

END $_$;

-- Crear trigger http port 8080
CREATE TRIGGER trg_http_port_8080_insert

BEFORE INSERT ON http_port_8080

FOR EACH ROW

EXECUTE PROCEDURE http_port_8080_partition_function();