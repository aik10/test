-- Function: change_count_product(integer, text, integer)

-- DROP FUNCTION change_count_product(integer, text, integer);

CREATE OR REPLACE FUNCTION change_count_product(
    _idproduct integer,
    _type text,
    _count integer)
  RETURNS void AS
$BODY$
declare
  count_cur integer;
begin

  --добавление товара, увеличиваем количество товара
  if _type = 'add' then
    update t_products set c_count = c_count + _count where id = _idproduct;
  --продали товар, уменьшение количества товара
  else
    select c_count into count_cur from t_products where id = _idproduct;
    if _count > count_cur then
      raise exception 'В наличии товара меньше чем продано';
    end if;

    update t_products set c_count = c_count - _count where id = _idproduct;
  end if;
end; 
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION change_count_product(integer, text, integer)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION change_count_product(integer, text, integer) TO postgres;
GRANT EXECUTE ON FUNCTION change_count_product(integer, text, integer) TO public;
COMMENT ON FUNCTION change_count_product(integer, text, integer) IS 'Изменение количества товара';
