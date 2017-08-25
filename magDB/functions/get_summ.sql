-- Function: get_summ(text, timestamp with time zone, timestamp with time zone, integer)

-- DROP FUNCTION get_summ(text, timestamp with time zone, timestamp with time zone, integer);

CREATE OR REPLACE FUNCTION get_summ(
    IN _type text,
    IN _datestart timestamp with time zone,
    IN _dateend timestamp with time zone,
    IN _idmagazin integer,
    OUT _sum double precision)
  RETURNS double precision AS
$BODY$
declare
begin
  if _type is not null then
    _sum = 0;
    select sum(l.c_count * p.c_price) into _sum from t_log l
    inner join t_products p on p.id = l.id_product
    where l.c_date between _datestart and _dateend and l.c_type = _type and p.id_magazin = _idmagazin;
  end if;
end; 
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION get_summ(text, timestamp with time zone, timestamp with time zone, integer)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION get_summ(text, timestamp with time zone, timestamp with time zone, integer) TO public;
GRANT EXECUTE ON FUNCTION get_summ(text, timestamp with time zone, timestamp with time zone, integer) TO postgres;
COMMENT ON FUNCTION get_summ(text, timestamp with time zone, timestamp with time zone, integer) IS 'Получение суммы товара';
