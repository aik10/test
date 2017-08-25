-- View: v_log_add

-- DROP VIEW v_log_add;

CREATE OR REPLACE VIEW v_log_add AS
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
  WHERE l.c_type::text = 'add'::text;

ALTER TABLE v_log_add
  OWNER TO postgres;
COMMENT ON VIEW v_log_add
  IS 'добавленные товары';
