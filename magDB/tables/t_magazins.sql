-- Table: t_magazins

-- DROP TABLE t_magazins;

CREATE TABLE t_magazins
(
  id serial,
  c_name text,
  CONSTRAINT pk_t_magazins PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_magazins
  OWNER TO postgres;
COMMENT ON COLUMN t_magazins.c_name IS 'Название магазина';

