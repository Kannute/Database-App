/** SPRAWDZANIE CZY ZASOB JUZ ISTNIEJE**/

CREATE FUNCTION wiezienie.sprawdzZasoby() RETURNS TRIGGER AS'
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
FOR EACH ROW EXECUTE PROCEDURE wiezienie.sprawdzZasoby();

/** SPRAWDZANIE DOSTEPNOSCI MIEJSCA W CELI**/
CREATE FUNCTION wiezienie.dostepnoscCeli() RETURNS TRIGGER AS'
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
FOR EACH ROW EXECUTE PROCEDURE wiezienie.dostepnoscCeli();

/** ZMIANA ILOSCI MIEJSC W CELI **/
CREATE FUNCTION wiezienie.zmianaIlosciMiejscCeli() RETURNS TRIGGER AS'
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
FOR EACH ROW EXECUTE PROCEDURE wiezienie.zmianaIlosciMiejscCeli();


/**  SPRAWDZANIE CZY NIE MA TAKIEGO SAMEGO WIEZNIA (PESEL) **/

CREATE FUNCTION wiezienie.istniejeWiezien() RETURNS TRIGGER AS'
DECLARE 
    wiezien record;
BEGIN
    SELECT * INTO wiezien FROM wiezienie.wiezien WHERE pesel = new.pesel;
    IF NOT FOUND THEN
            RETURN NEW;
    ELSE
        RAISE NOTICE ''Taki wiezien juz istnieje!!!'';
        RETURN NULL;
    END IF;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER wiezienIstnieje BEFORE INSERT on wiezienie.wiezien
FOR EACH ROW EXECUTE PROCEDURE wiezienie.istniejeWiezien();

