-- Function: category_set(integer, text)

-- DROP FUNCTION category_set(integer, text);

CREATE OR REPLACE FUNCTION category_set(
    INOUT _id integer,
    IN _name text)
  RETURNS integer AS
$BODY$
declare 
begin
  if _id is null then
    insert into t_categorys(c_name, c_date_create) 
      values(_name, now())
      returning id into _id;
  else
    update t_categorys set
      c_name = _name
    where id = _id;
  end if;
end; 
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION category_set(integer, text)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION category_set(integer, text) TO postgres;
GRANT EXECUTE ON FUNCTION category_set(integer, text) TO public;
COMMENT ON FUNCTION category_set(integer, text) IS 'Добавление/изменение категории товара';
