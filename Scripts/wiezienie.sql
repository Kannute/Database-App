/********************** TWORZENIE BAZY DANYCH WIEZIENIA ************************/

create schema wiezienie;

/******** TWORZENIE TABEL I ODPOWIADAJACYM IM SEKWENCJI *******/

/**** TABELA WIEZIEN ****/
CREATE SEQUENCE wiezienie.wiezien_id_wieznia_seq;

CREATE TABLE wiezienie.wiezien(
                id_wieznia  INTEGER NOT NULL DEFAULT nextval('wiezienie.wiezien_id_wieznia_seq'),
                imie        VARCHAR NOT NULL,
                nazwisko    VARCHAR NOT NULL,
                PESEL       NUMERIC NOT NULL,
                CONSTRAINT wiezien_pk PRIMARY KEY (id_wieznia)
);

ALTER SEQUENCE wiezienie.wiezien_id_wieznia_seq OWNED BY wiezienie.wiezien.id_wieznia;


/**** TABELA WIEZIEN INFO ****/

CREATE SEQUENCE wiezienie.wiezien_info_id_wpisu_seq;

CREATE TABLE wiezienie.wiezien_info(
                id_wpisu INTEGER NOT NULL DEFAULT nextval('wiezienie.wiezien_info_id_wpisu_seq'),
                id_wieznia INTEGER NOT NULL,
                id_celi INTEGER NOT NULL,
                id_depozytu INTEGER NOT NULL, 
                id_wyroku INTEGER NOT NULL,
                CONSTRAINT wiezien_info_pk PRIMARY KEY (id_wpisu)

);

ALTER SEQUENCE wiezienie.wiezien_info_id_wpisu_seq OWNED BY wiezienie.wiezien_info.id_wpisu;


/**** TABELA PRACOWNIK ****/
CREATE SEQUENCE wiezienie.pracownik_id_pracownika_seq;

CREATE TABLE wiezienie.pracownik(
                id_pracownika INTEGER NOT NULL DEFAULT nextval('wiezienie.pracownik_id_pracownika_seq'),
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                CONSTRAINT pracownik_pk PRIMARY KEY (id_pracownika)
);

ALTER SEQUENCE wiezienie.pracownik_id_pracownika_seq OWNED BY wiezienie.pracownik.id_pracownika;


/**** TABELA PRACOWNIK_INFO ****/
CREATE SEQUENCE wiezienie.pracownik_info_pracownik_info_id_seq;

CREATE TABLE wiezienie.pracownik_info(
                pracownik_info_id INTEGER NOT NULL DEFAULT nextval('wiezienie.pracownik_info_pracownik_info_id_seq'),
                id_zawodu INTEGER NOT NULL,
                id_pracownika INTEGER NOT NULL,
                id_pokoju INTEGER NOT NULL,
                CONSTRAINT pracownik_info_pk PRIMARY KEY (pracownik_info_id)
);

ALTER SEQUENCE wiezienie.pracownik_info_pracownik_info_id_seq OWNED BY wiezienie.pracownik_info.pracownik_info_id;

/**** TABELA ZAWOD ****/
CREATE SEQUENCE wiezienie.zawod_id_zawodu_seq;

CREATE TABLE wiezienie.zawod(
                id_zawodu INTEGER NOT NULL DEFAULT nextval('wiezienie.zawod_id_zawodu_seq'),
                nazwa VARCHAR,
                CONSTRAINT zawod_pk PRIMARY KEY (id_zawodu)
);

ALTER SEQUENCE wiezienie.zawod_id_zawodu_seq OWNED BY wiezienie.zawod.id_zawodu;


/**** TABELA WYROK ****/
CREATE SEQUENCE wiezienie.wyrok_id_wyroku_seq;

CREATE TABLE wiezienie.wyrok(
                id_wyroku INTEGER NOT NULL DEFAULT nextval('wiezienie.wyrok_id_wyroku_seq'),
                nazwa_wyroku VARCHAR NOT NULL,
                data_rozpoczecia DATE NOT NULL,
                data_zakonczenia DATE,
                CONSTRAINT wyrok_pk PRIMARY KEY (id_wyroku)
);

ALTER SEQUENCE wiezienie.wyrok_id_wyroku_seq OWNED BY wiezienie.wyrok.id_wyroku;


/**** TABELA CELA ****/
CREATE SEQUENCE wiezienie.cela_id_celi_seq;

CREATE TABLE wiezienie.cela(
                id_celi INTEGER NOT NULL DEFAULT nextval('wiezienie.cela_id_celi_seq'),
                nr_celi INTEGER NOT NULL,
                ilosc_miejsc INTEGER NOT NULL,
                id_segmentu INTEGER NOT NULL,
                typ_celi VARCHAR NOT NULL,
                CONSTRAINT cela_pk PRIMARY KEY (id_celi)
);

ALTER SEQUENCE wiezienie.cela_id_celi_seq OWNED BY wiezienie.cela.id_celi;


/**** TABELA SEGMENT ****/
CREATE SEQUENCE wiezienie.segment_id_segmentu_seq;

CREATE TABLE wiezienie.segment(
                id_segmentu INTEGER NOT NULL DEFAULT nextval('wiezienie.segment_id_segmentu_seq'),
                nazwa_segmentu VARCHAR NOT NULL,
                id_naczelnika INTEGER NOT NULL,
                CONSTRAINT segment_pk PRIMARY KEY (id_segmentu)
);

ALTER SEQUENCE wiezienie.segment_id_segmentu_seq OWNED BY wiezienie.segment.id_segmentu;


/**** TABELA POKOJ ****/
CREATE SEQUENCE wiezienie.pokoj_id_pokoju_seq;

CREATE TABLE wiezienie.pokoj(
                id_pokoju INTEGER NOT NULL DEFAULT nextval('wiezienie.pokoj_id_pokoju_seq'),
                nr_pokoju INTEGER NOT NULL,
                nazwa_pokoju VARCHAR NOT NULL,
                id_segmentu INTEGER NOT NULL,
                CONSTRAINT pokoj_pk PRIMARY KEY (id_pokoju)
);

ALTER SEQUENCE wiezienie.pokoj_id_pokoju_seq OWNED BY wiezienie.pokoj.id_pokoju;


/**** TABELA DEPOZYT ****/
CREATE SEQUENCE wiezienie.depozyt_id_depozytu_seq;

CREATE TABLE wiezienie.depozyt(
                id_depozytu INTEGER NOT NULL DEFAULT nextval('wiezienie.depozyt_id_depozytu_seq'),
                nazwa VARCHAR NOT NULL,
                id_pokoju INTEGER NOT NULL,
                id_zasobu INTEGER NOT NULL,
                CONSTRAINT depozyt_pk PRIMARY KEY (id_depozytu)
);

ALTER SEQUENCE wiezienie.depozyt_id_depozytu_seq OWNED BY wiezienie.depozyt.id_depozytu;


/**** TABELA ZASOBY ****/
CREATE SEQUENCE wiezienie.zasoby_id_zasobu_seq;

CREATE TABLE wiezienie.zasoby(
                id_zasobu INTEGER NOT NULL DEFAULT nextval('wiezienie.zasoby_id_zasobu_seq'),
                nazwa VARCHAR NOT NULL,
                ilosc INTEGER NOT NULL,
                CONSTRAINT zasoby_id PRIMARY KEY (id_zasobu)
);

ALTER SEQUENCE wiezienie.zasoby_id_zasobu_seq OWNED BY wiezienie.zasoby.id_zasobu;


/*TABLICA POMOCNICZA DO WPISU WIEZNIA DO WIEZIENIA*/
CREATE TABLE wiezienie.wpis_wieznia(
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                pesel NUMERIC NOT NULL,
                nr_celi INTEGER NOT NULL,
                nr_segmentu INTEGER NOT NULL,  
                nazwa_wyroku VARCHAR NOT NULL,
                data_zakonczenia_wyroku DATE,
                nazwa_depozytu VARCHAR NOT NULL,
                ilosc_depozytowa INTEGER NOT NULL
);

/*TABLICA POMOCNICZA DO ZATRUDNIENIA PRACOWNIKA*/
CREATE TABLE wiezienie.wpis_pracownika(
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                zawod VARCHAR NOT NULL,
                nr_pokoju INTEGER NOT NULL

);

/***** NADAWANIE KLUCZY OBCYCH *****/

/** TABELA WIEZIEN_INFO **/

ALTER TABLE wiezienie.wiezien_info ADD CONSTRAINT wiezien_wiezien_info_fk
FOREIGN KEY (id_wieznia)
REFERENCES wiezienie.wiezien (id_wieznia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE wiezienie.wiezien_info ADD CONSTRAINT cela_wiezien_info_fk
FOREIGN KEY (id_celi)
REFERENCES wiezienie.cela (id_celi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE wiezienie.wiezien_info ADD CONSTRAINT depozyt_wiezien_info_fk
FOREIGN KEY (id_depozytu)
REFERENCES wiezienie.depozyt (id_depozytu)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE wiezienie.wiezien_info ADD CONSTRAINT wyrok_wiezien_info_fk
FOREIGN KEY (id_wyroku)
REFERENCES wiezienie.wyrok (id_wyroku)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


/** TABELA PRACOWNIK_INFO **/

ALTER TABLE wiezienie.pracownik_info ADD CONSTRAINT pracownik_pracownik_info_fk
FOREIGN KEY (id_pracownika)
REFERENCES wiezienie.pracownik (id_pracownika)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE wiezienie.pracownik_info ADD CONSTRAINT zawod_pracownik_info_fk
FOREIGN KEY (id_zawodu)
REFERENCES wiezienie.zawod (id_zawodu)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE wiezienie.pracownik_info ADD CONSTRAINT pokoj_pracownik_info_fk
FOREIGN KEY (id_pokoju)
REFERENCES wiezienie.pokoj (id_pokoju)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


/** TABELA CELA **/

ALTER TABLE wiezienie.cela ADD CONSTRAINT segment_cela_fk
FOREIGN KEY (id_segmentu)
REFERENCES wiezienie.segment (id_segmentu)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


/** TABELA POKOJ **/

ALTER TABLE wiezienie.pokoj ADD CONSTRAINT segment_pokoj_fk
FOREIGN KEY (id_segmentu)
REFERENCES wiezienie.segment (id_segmentu)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



/** TABELA DEPOZYT **/

ALTER TABLE wiezienie.depozyt ADD CONSTRAINT zasob_depozyt_fk
FOREIGN KEY (id_zasobu)
REFERENCES wiezienie.zasoby (id_zasobu)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE wiezienie.depozyt ADD CONSTRAINT pokoj_depozyt_fk
FOREIGN KEY (id_pokoju)
REFERENCES wiezienie.pokoj (id_pokoju)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;