-- Function: log_set(integer, text, integer, text, timestamp without time zone)

-- DROP FUNCTION log_set(integer, text, integer, text, timestamp without time zone);

CREATE OR REPLACE FUNCTION log_set(
    IN _idproduct integer,
    IN _type text,
    IN _count integer,
    IN _comment text,
    IN _date timestamp without time zone DEFAULT now(),
    OUT _id integer)
  RETURNS integer AS
$BODY$
declare 
begin
  if coalesce(_idproduct, 0) <> 0 and coalesce(_type, '0') <> '0' and _count > 0 then
    insert into t_log(id_product, c_date, c_type, c_comment, c_count) 
      values(_idproduct, _date, _type, _comment, _count)
      returning id into _id;

    perform change_count_product(_idproduct, _type, _count);
  end if;
end; 
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION log_set(integer, text, integer, text, timestamp without time zone)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION log_set(integer, text, integer, text, timestamp without time zone) TO postgres;
GRANT EXECUTE ON FUNCTION log_set(integer, text, integer, text, timestamp without time zone) TO public;
COMMENT ON FUNCTION log_set(integer, text, integer, text, timestamp without time zone) IS 'Добавление/изменение товара';
