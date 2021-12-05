CREATE
OR REPLACE PROCEDURE create_characters_temporary_table_for_tests(suffix varchar)
LANGUAGE 'plpgsql'
AS $$
BEGIN
EXECUTE 'CREATE TABLE characters' || quote_ident(suffix) || ' as (select * from characters);';
END;
$$;
