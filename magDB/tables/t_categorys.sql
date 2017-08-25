-- Table: t_categorys

-- DROP TABLE t_categorys;

CREATE TABLE t_categorys
(
  id integer NOT NULL DEFAULT nextval('categorys_id_seq'::regclass),
  c_name text, -- название категории
  c_date_create time with time zone,
  c_deleted integer NOT NULL DEFAULT 0, -- флаг удаления
  c_date_delete timestamp with time zone,
  CONSTRAINT pk_cetagorys_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_categorys
  OWNER TO postgres;
COMMENT ON COLUMN t_categorys.c_name IS 'название категории';
COMMENT ON COLUMN t_categorys.c_deleted IS 'флаг удаления';

