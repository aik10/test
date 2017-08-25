-- Function: category_del(integer)

-- DROP FUNCTION category_del(integer);

CREATE OR REPLACE FUNCTION category_del(INOUT _id integer)
  RETURNS integer AS
$BODY$
declare 
begin
  if _id is null then
    update t_categorys set c_deleted = 1, c_date_delete = now() where id = _id;
  end if;
end; 
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION category_del(integer)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION category_del(integer) TO postgres;
GRANT EXECUTE ON FUNCTION category_del(integer) TO public;
COMMENT ON FUNCTION category_del(integer) IS 'Удаление категорию товара';
