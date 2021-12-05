CREATE OR REPLACE FUNCTION get_number_of_characters_of_given_attribute(attribute_name VARCHAR) RETURNS INT
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN (SELECT COUNT(*)
            FROM characters
                     INNER JOIN attributes a on characters.main_attribute = a.id
            WHERE a.name = attribute_name);
END;
$$;

