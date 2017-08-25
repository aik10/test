-- Function: product_del(integer)

-- DROP FUNCTION product_del(integer);

CREATE OR REPLACE FUNCTION product_del(INOUT _id integer)
  RETURNS integer AS
$BODY$
declare 
begin
  if _id is null then
    update t_products set c_deleted = 1, c_date_delete = now() where id = _id;
  end if;
end; 
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION product_del(integer)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION product_del(integer) TO postgres;
GRANT EXECUTE ON FUNCTION product_del(integer) TO public;
COMMENT ON FUNCTION product_del(integer) IS 'Удаление товара';
