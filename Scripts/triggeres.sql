/*TO DO TRIGGERS
    -DOSTEPNOSC CELI
    -
*/

/** SPRAWDZANIE CZY ZASOB JUZ ISTNIEJE**/
CREATE FUNCTION sprawdzZasoby() RETURNS OPAQUE AS'
DECLARE 
    zasob record;
BEGIN
    IF(TG_OP= ''UPDATE'') THEN
        RETURN NEW;
    ELSIF(TG_OP=''INSERT'') THEN
        SELECT * INTO zasob FROM wiezienie.zasoby WHERE nazwa = new.nazwa;
        IF NOT FOUND THEN
             RETURN NEW;
        ELSE
            RAISE NOTICE ''Taki zasob juz istnieje, zwieksz ilosc zasobu za pomoca UPDATE'';
            RETURN NULL;
        END IF;
    END IF;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER zasobySprawdz BEFORE INSERT OR UPDATE ON wiezienie.zasoby
FOR EACH ROW EXECUTE PROCEDURE sprawdzZasoby();

/** SPRAWDZANIE DOSTEPNOSCI MIEJSCA W CELI**/
CREATE FUNCTION dostepnoscCeli() RETURNS TRIGGER AS'
DECLARE
    cela record;
BEGIN 
    SELECT * into cela FROM wiezienie.cela WHERE id_celi = new.id_celi;
    IF(cela.ilosc_miejsc = 0) THEN
        RAISE NOTICE ''Cela % jest pelna!'',cela.id_celi;
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;  
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER celiDostepnosc BEFORE INSERT OR UPDATE ON wiezienie.wiezien_info
FOR EACH ROW EXECUTE PROCEDURE dostepnoscCeli();

/** ZMIANA ILOSCI MIEJSC W CELI **/
CREATE FUNCTION zmianaIlosciMiejscCeli() RETURNS TRIGGER AS'
DECLARE
    cela_record record;
BEGIN
    SELECT * into cela_record FROM wiezienie.cela WHERE id_celi = new.id_celi;
    IF(cela_record.ilosc_miejsc = 0) THEN
        RAISE NOTICE ''CELA PELNA!!!'';
        RETURN NULL;
    ELSE
        UPDATE wiezienie.cela SET ilosc_miejsc = (ilosc_miejsc - 1) WHERE id_celi = cela_record.id_celi;
        RETURN NEW;
    END IF;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER zmianaMiejscCeli AFTER INSERT OR UPDATE on wiezienie.wiezien_info
FOR EACH ROW EXECUTE PROCEDURE zmianaIlosciMiejscCeli();