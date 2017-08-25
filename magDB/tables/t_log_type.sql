-- Table: t_log_type

-- DROP TABLE t_log_type;

CREATE TABLE t_log_type
(
  c_code text, -- код типа (add/sale) = (добавлено/продано)
  c_text text -- название типа
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_log_type
  OWNER TO postgres;
COMMENT ON COLUMN t_log_type.c_code IS 'код типа (add/sale) = (добавлено/продано)';
COMMENT ON COLUMN t_log_type.c_text IS 'название типа';


-- Index: ix_log_type

-- DROP INDEX ix_log_type;

CREATE UNIQUE INDEX ix_log_type
  ON t_log_type
  USING btree
  (c_code COLLATE pg_catalog."default");

