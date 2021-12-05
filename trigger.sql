CREATE TRIGGER attributes_state_insert
AFTER INSERT ON attributes
FOR EACH ROW EXECUTE FUNCTION make_first_letter_capital_and_other_lowercase();

CREATE OR REPLACE FUNCTION make_first_letter_capital_and_other_lowercase() RETURNS trigger AS
$$
     BEGIN
          UPDATE attributes
          SET name = initcap(lower(name)) WHERE attributes.id = new.id;
		  RETURN NULL;
     END;
$$ LANGUAGE 'plpgsql';
