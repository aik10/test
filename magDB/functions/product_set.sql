-- Function: product_set(integer, text, text, numeric, integer, integer, integer)

-- DROP FUNCTION product_set(integer, text, text, numeric, integer, integer, integer);

CREATE OR REPLACE FUNCTION product_set(
    INOUT _id integer,
    IN _name text,
    IN _description text,
    IN _price numeric,
    IN _idcategory integer,
    IN _count integer,
    IN _idmagazin integer)
  RETURNS integer AS
$BODY$
declare 
begin
  if _id is null then
    insert into t_products(c_name, c_description, c_price, id_category, c_date_create, c_count, id_magazin) 
      values(_name, _description, _price, _idcategory, now(), count, _idmagazin)
      returning id into _id;
  else
    update t_products set
      c_name = _name,
      c_description = _description,
      c_price = _price,
      id_category = _idcategory,
      c_count = _count,
      id_magazin = _idmagazin
    where id = _id;
  end if;
end; 
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION product_set(integer, text, text, numeric, integer, integer, integer)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION product_set(integer, text, text, numeric, integer, integer, integer) TO postgres;
GRANT EXECUTE ON FUNCTION product_set(integer, text, text, numeric, integer, integer, integer) TO public;
COMMENT ON FUNCTION product_set(integer, text, text, numeric, integer, integer, integer) IS 'Добавление/изменение товара';
