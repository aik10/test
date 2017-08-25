-- View: v_log_sale

-- DROP VIEW v_log_sale;

CREATE OR REPLACE VIEW v_log_sale AS
 SELECT l.id,
    l.id_product,
    l.c_date,
    l.c_type,
    l.c_comment,
    l.c_product,
    l.c_category,
    l.c_count,
    l.id_magazin,
    l.c_magazin
   FROM v_log l
  WHERE l.c_type::text = 'sale'::text;

ALTER TABLE v_log_sale
  OWNER TO postgres;
COMMENT ON VIEW v_log_sale
  IS 'проданные товары';
