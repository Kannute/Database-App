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

ALTER SEQUENCE wiezienie.wiezien_id_seq OWNED BY wiezienie.wiezien.id_wieznia;


/**** TABELA WIEZIEN INFO ****/

CREATE SEQUENCE wiezienie.wiezien_info_id_wpisu_seq;

CREATE TABLE wiezien_info(
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

CREATE TABLE pracownik_info(
                pracownik_info_id INTEGER NOT NULL DEFAULT nextval('wiezienie.pracownik_info_pracownik_info_id_seq'),
                id_zawodu INTEGER NOT NULL,
                id_pracownika INTEGER NOT NULL,
                id_pokoju INTEGER NOT NULL,
                ADD CONSTRAINT pracownik_info_pk PRIMARY KEY (pracownik_info_id)
);

ALTER SEQUENCE wiezienie.pracownik_info_pracownik_info_id_seq OWNED BY pracownik_info.pracownik_info_id;

/**** TABELA ZAWOD ****/
CREATE SEQUENCE wiezienie.zawod_id_zawodu_seq;

CREATE TABLE zawod(
                id_zawodu INTEGER NOT NULL DEFAULT nextval('wiezienie.zawod_id_zawodu_seq'),
                nazwa VARCHAR,
                ADD CONSTRAINT zawod_pk PRIMARY KEY (id_zawodu)
);

ALTER SEQUENCE wiezienie.zawod_id_zawodu_seq OWNED BY wiezienie.zawod.id_zawodu;


/**** TABELA WYROK ****/
CREATE SEQUENCE wiezienie.wyrok_id_wyroku_seq;

CREATE TABLE wyrok(
                id_wyroku INTEGER NOT NULL DEFAULT nextval('wiezienie.wiezien_info_id_wpisu_seq'),
                nazwa_wyroku VARCHAR NOT NULL,
                data_rozpoczecia DATE NOT NULL,
                data_zakonczenia DATE,
                CONSTRAINT wyrok_pk PRIMARY KEY (id_wyroku)
);

ALTER SEQUENCE wiezienie.wyrok_id_wyroku_seq OWNED BY wiezienie.wyrok.id_wyroku;


/**** TABELA CELA ****/
CREATE SEQUENCE wiezienie.cela_id_celi_seq;

CREATE TABLE cela(
                id_celi INTEGER NOT NULL DEFAULT nextval('wiezienie.cela_id_celi_seq'),
                nr_celi INTEGER NOT NULL,
                ilosc_miejsc INTEGER NOT NULL,
                id_segmentu INTEGER NOT NULL,
                typ_celi VARCHAR NOT NULL
                CONSTRAINT cela_pk PRIMARY KEY (id_celi)
);

ALTER SEQUENCE wiezienie.cela_id_celi_seq OWNED BY wiezienie.cela.id_celi;


/**** TABELA SEGMENT ****/
CREATE SEQUENCE wiezienie.segment_id_segmentu_seq;

CREATE TABLE segment(
                id_segmentu INTEGER NOT NULL DEFAULT nextval('wizienie.segment_id_segmentu_seq'),
                nazwa_segmentu VARCHAR NOT NULL,
                id_naczelnika INTEGER NOT NULL,
                CONSTRAINT segment_pk PRIMARY KEY (id_segmentu)
);

ALTER SEQUENCE wiezienie.segment_id_segmentu_seq OWNED BY wizienie.segment.id_segmentu;


/**** TABELA POKOJ ****/
CREATE SEQUENCE wiezienie.pokoj_id_pokoju_seq;

CREATE TABLE pokoj(
                id_pokoju INTEGER NOT NULL DEFAULT nextval('wiezienie.pokoj_id_pokoju_seq'),
                nazwa_pokoju VARCHAR NOT NULL,
                id_segmentu INTEGER NOT NULL,
                id_depozytu INTEGER NOT NULL,
                CONSTRAINT pokoj_pk PRIMARY KEY (id_pokoju)
);

ALTER SEQUENCE wiezienie.pokoj_id_pokoju_seq OWNED BY wiezienie.pokoj.id_pokoju;


/**** TABELA DEPOZYT ****/
CREATE SEQUENCE wiezienie.depozyt_id_depozytu_seq;

CREATE TABLE depozyt(
                id_depozytu INTEGER NOT NULL DEFAULT nextval('wiezienie.depozyt_id_depozytu_seq'),
                nazwa VARCHAR NOT NULL,
                id_zasobu INTEGER NOT NULL,
                CONSTRAINT depozyt_pk PRIMARY KEY (id_depozytu)
);

ALTER SEQUENCE wiezienie.depozyt_id_depozytu_seq OWNED BY wiezienie.depozyt.id_depozytu;


/**** TABELA ZASOBY ****/
CREATE SEQUENCE wiezienie.zasoby_id_zasobu_seq;

CREATE TABLE zasoby(
                id_zasobu INTEGER NOT NULL DEFAULT nextval('wiezienie.zasoby_id_zasobu_seq'),
                nazwa VARCHAR NOT NULL,
                ilosc INTEGER NOT NULL,
                ADD CONSTRAINT zasoby_id OWNED BY wiezienie.zasoby.id_zasobu
);

ALTER SEQUENCE wiezienie.zasoby_id_zasobu_seq OWNED BY wizienie.zasoby.zasoby_id;