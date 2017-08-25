-- Table: t_log

-- DROP TABLE t_log;

CREATE TABLE t_log
(
  id integer NOT NULL DEFAULT nextval('log_id_seq'::regclass),
  id_product integer NOT NULL, -- продукт
  c_date timestamp with time zone, -- датаВремя
  c_type character varying(4) NOT NULL, -- тип записи в лог-е. (add/sale) = (добавлено/продано)
  c_comment text, -- комментарий
  c_count integer DEFAULT 0,
  CONSTRAINT pk_log_id PRIMARY KEY (id),
  CONSTRAINT fk_log_product_id FOREIGN KEY (id_product)
      REFERENCES t_products (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_log_type FOREIGN KEY (c_type)
      REFERENCES t_log_type (c_code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_log
  OWNER TO postgres;
COMMENT ON COLUMN t_log.id_product IS 'продукт';
COMMENT ON COLUMN t_log.c_date IS 'датаВремя';
COMMENT ON COLUMN t_log.c_type IS 'тип записи в лог-е. (add/sale) = (добавлено/продано)';
COMMENT ON COLUMN t_log.c_comment IS 'комментарий';


-- Index: ix_log

-- DROP INDEX ix_log;

CREATE INDEX ix_log
  ON t_log
  USING btree
  (id_product, c_type COLLATE pg_catalog."default");

