/** SPRAWDZANIE DOSTEPNOSCI MIEJSCA W CELI**/
CREATE OR REPLACE  FUNCTION wiezienie.dostepnoscCeli() RETURNS TRIGGER AS'
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
CREATE OR REPLACE  FUNCTION wiezienie.zmianaIlosciMiejscCeli() RETURNS TRIGGER AS'
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

CREATE TRIGGER zmianaMiejscCeli AFTER INSERT on wiezienie.wiezien_info
FOR EACH ROW EXECUTE PROCEDURE wiezienie.zmianaIlosciMiejscCeli();


/**  SPRAWDZANIE CZY NIE MA TAKIEGO SAMEGO WIEZNIA (PESEL) **/

CREATE OR REPLACE  FUNCTION wiezienie.istniejeWiezien() RETURNS TRIGGER AS'
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



/**  WYZWALACZ DO WPISU WIEZNIA DO WIEZIENIA **/

CREATE OR REPLACE FUNCTION wiezienie.wpisWieznia() RETURNS TRIGGER AS'
DECLARE
    zasob_id int ;
    wiezien_id int ;
    depozyt_id int ;
    cela_id int ;
    wyrok_id int ;
BEGIN
    INSERT INTO wiezienie.wiezien VALUES (DEFAULT, NEW."imie", NEW."nazwisko", NEW."pesel");
    INSERT INTO wiezienie.wyrok VALUES (DEFAULT, NEW."nazwa_wyroku", current_date, NEW."data_zakonczenia_wyroku");
    INSERT INTO wiezienie.zasoby VALUES (DEFAULT, NEW."nazwa_depozytu", NEW."ilosc_depozytowa");
    
    SELECT z.id_zasobu INTO zasob_id FROM wiezienie.zasoby z WHERE z.nazwa = NEW."nazwa_depozytu" and z.ilosc = NEW."ilosc_depozytowa";
    IF(zasob_id = NULL) THEN
        RETURN NULL;
    END IF;

    SELECT w.id_wieznia INTO wiezien_id FROM wiezienie.wiezien w WHERE w.pesel = NEW."pesel";
    IF(wiezien_id = NULL) THEN
        RETURN NULL;
    END IF;

    SELECT c.id_celi INTO cela_id FROM wiezienie.cela c WHERE c.nr_celi = NEW."nr_celi";
    IF(cela_id = NULL) THEN
        RETURN NULL;
    END IF;

    SELECT w.id_wyroku INTO wyrok_id FROM wiezienie.wyrok w WHERE w.nazwa_wyroku = NEW."nazwa_wyroku" and w.data_zakonczenia = NEW."data_zakonczenia_wyroku";
    IF(wyrok_id = NULL) THEN
        RETURN NULL;
    END IF;    

    IF(NEW."nr_segmentu" = 1) THEN    
        INSERT INTO wiezienie.depozyt VALUES (DEFAULT, ''Depozyt wieznia'', 2, zasob_id);

    ELSIF(NEW."nr_segmentu" = 2) THEN
        INSERT INTO wiezienie.depozyt VALUES (DEFAULT, ''Depozyt wieznia'', 8, zasob_id);

    ELSIF(NEW."nr_segmentu" = 3) THEN
        INSERT INTO wiezienie.depozyt VALUES (DEFAULT, ''Depozyt wieznia'', 15, zasob_id);
    ELSE 
        RAISE NOTICE ''NIE MA TAKEIGO SEGMENTU!'';
        RETURN NULL;

    END IF;

    SELECT d.id_depozytu INTO depozyt_id FROM wiezienie.depozyt d WHERE d.id_zasobu = zasob_id;
    IF(depozyt_id = NULL) THEN
        RETURN NULL;
    END IF;    


    INSERT INTO wiezienie."wiezien_info" VALUES (DEFAULT, wiezien_id, cela_id, depozyt_id,  wyrok_id);

    RETURN NEW;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER wiezniaWpis AFTER INSERT ON wiezienie.wpis_wieznia 
FOR EACH ROW EXECUTE PROCEDURE wiezienie.wpisWieznia();



/* WYZWALACZ DO WPISU PRACOWNIKA*/
CREATE OR REPLACE FUNCTION wiezienie.zatrudnijPracownika() RETURNS TRIGGER AS'
DECLARE
    pracownik_id int;
    pokoj_id int;
    zawod_id int;
BEGIN
    INSERT INTO wiezienie.pracownik VALUES(DEFAULT, NEW."imie", NEW."nazwisko");

    SELECT p.id_pracownika INTO pracownik_id FROM wiezienie.pracownik p WHERE p.imie = NEW."imie" AND p.nazwisko = NEW."nazwisko";
    IF(pracownik_id = NULL) THEN
        RETURN NULL;
    END IF;

    SELECT z.id_zawodu INTO zawod_id FROM wiezienie.zawod z WHERE z.nazwa = NEW."zawod";
    IF(zawod_id = NULL) THEN
        RETURN NULL;
    END IF;

    SELECT p.id_pokoju INTO pokoj_id FROM wiezienie.pokoj p WHERE p.nr_pokoju = NEW."nr_pokoju";
    IF(pokoj_id = NULL) THEN
        RETURN NULL;
    END IF;

    INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, zawod_id, pracownik_id, pokoj_id);

    RETURN NEW;

END;

' LANGUAGE 'plpgsql';

CREATE TRIGGER pracownikaWpis AFTER INSERT ON wiezienie.wpis_pracownika 
FOR EACH ROW EXECUTE PROCEDURE wiezienie.zatrudnijPracownika();

/*WYZWALACZ DO PRZENIESIENIA WIEZNIA DO NOWEJ CELI*/
CREATE OR REPLACE FUNCTION wiezienie.przeniesienieWieznia() RETURNS TRIGGER AS '
    DECLARE
        cela_id int;
        cela_id_stara int;
        wiezien_id int;
    BEGIN
        SELECT  c.id_celi INTO cela_id FROM wiezienie.cela c WHERE c.nr_celi = NEW.nr_celi AND c.id_segmentu = NEW.nr_segmentu;
        SELECT  c.id_celi INTO cela_id_stara FROM wiezienie.cela c WHERE c.nr_celi = OLD.nr_celi AND c.id_segmentu = OLD.nr_segmentu;
        SELECT w.id_wieznia INTO wiezien_id FROM wiezienie.wiezien w WHERE w.imie = NEW.imie AND w.nazwisko = NEW.nazwisko;

        IF(cela_id = NULL) THEN
            RAISE NOTICE ''cela id nie moze byc null'';
            RETURN NULL;
        ELSIF(wiezien_id = NULL) THEN
            RAISE NOTICE ''wiezien id nie moze byc null'';
            RETURN NULL;
        END IF;

        UPDATE wiezienie.wiezien_info SET id_celi = cela_id WHERE id_wieznia = wiezien_id;
        UPDATE wiezienie.cela SET ilosc_miejsc = (ilosc_miejsc+1) WHERE id_celi = cela_id_stara;
        UPDATE wiezienie.cela SET ilosc_miejsc = (ilosc_miejsc-1) WHERE id_celi = cela_id;
        RETURN NEW;

    END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER wiezienPrzeniesienie AFTER UPDATE ON wiezienie.wpis_wieznia
FOR EACH ROW EXECUTE PROCEDURE wiezienie.przeniesienieWieznia();

