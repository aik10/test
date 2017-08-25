-- Table: t_products

-- DROP TABLE t_products;

CREATE TABLE t_products
(
  id integer NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  c_name text NOT NULL, -- название товара
  c_description text, -- описание товара
  c_price numeric(10,2) NOT NULL, -- цена
  id_category integer, -- категория товара
  c_date_create timestamp with time zone,
  c_deleted integer NOT NULL DEFAULT 0, -- флаг удаления
  c_date_delete timestamp with time zone,
  c_count integer DEFAULT 0,
  id_magazin integer,
  CONSTRAINT pk_products_id PRIMARY KEY (id),
  CONSTRAINT fk_products_category_id FOREIGN KEY (id_category)
      REFERENCES t_categorys (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_products_magazin FOREIGN KEY (id_magazin)
      REFERENCES t_magazins (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_products
  OWNER TO postgres;
COMMENT ON COLUMN t_products.c_name IS 'название товара';
COMMENT ON COLUMN t_products.c_description IS 'описание товара';
COMMENT ON COLUMN t_products.c_price IS 'цена';
COMMENT ON COLUMN t_products.id_category IS 'категория товара';
COMMENT ON COLUMN t_products.c_deleted IS 'флаг удаления';
COMMENT ON COLUMN t_products.id_magazin IS 'ссылка на магазин';


-- Index: fki_products_category_id

-- DROP INDEX fki_products_category_id;

CREATE INDEX fki_products_category_id
  ON t_products
  USING btree
  (id_category);

-- Index: i_products_name

-- DROP INDEX i_products_name;

CREATE UNIQUE INDEX i_products_name
  ON t_products
  USING btree
  (c_name COLLATE pg_catalog."default");

