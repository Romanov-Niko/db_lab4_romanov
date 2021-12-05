-- Function test
do
$$
    begin
        ASSERT (SELECT get_number_of_characters_of_given_attribute('Intelligence')) = 2, 'WRONG RESULT!';
    end;
$$ LANGUAGE plpgsql;

--Procedure test
CALL create_characters_temporary_table_for_tests('_temp_table');

select *
from characters_temp_table;

--Trigger test
insert into attributes(id, name) VALUES (8, 'ATTRIBUTE');

do
$$
    begin
        ASSERT (SELECT count(*) from attributes where name='Attribute') = 1, 'WRONG RESULT!';
    end;
$$ LANGUAGE plpgsql;