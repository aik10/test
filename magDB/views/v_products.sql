-- View: v_products

-- DROP VIEW v_products;

CREATE OR REPLACE VIEW v_products AS 
 SELECT p.id,
    p.c_name,
    p.c_description,
    p.c_price,
    p.id_category,
    c.c_name AS c_category,
    p.c_count,
    p.c_date_create,
    p.id_magazin,
    m.c_name as c_magazin
   FROM t_products p
   INNER JOIN t_categorys c ON c.id = p.id_category
   INNER JOIN t_magazins m on m.id = p.id_magazin;

ALTER TABLE v_products
  OWNER TO postgres;
COMMENT ON VIEW v_products
  IS 'товары';
