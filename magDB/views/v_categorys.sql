-- View: v_categorys

-- DROP VIEW v_categorys;

CREATE OR REPLACE VIEW v_categorys AS
 SELECT c.id,
    c.c_name,
    c.c_date_create
   FROM t_categorys c;

ALTER TABLE v_categorys
  OWNER TO postgres;
COMMENT ON VIEW v_categorys
  IS 'категории товаров';
