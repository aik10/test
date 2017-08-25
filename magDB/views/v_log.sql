-- View: v_log

-- DROP VIEW v_log;

CREATE OR REPLACE VIEW v_log AS
 SELECT l.id,
    l.id_product,
    l.c_date,
    l.c_type,
    l.c_comment,
    p.c_name AS c_product,
    p.c_category,
    l.c_count,
    p.id_magazin,
    p.c_magazin
   FROM t_log l
   LEFT JOIN v_products p ON p.id = l.id_product;

ALTER TABLE v_log
  OWNER TO postgres;
COMMENT ON VIEW v_log
  IS 'лог - полный список';
