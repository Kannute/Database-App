create schema wiezienie;

CREATE SEQUENCE wiezienie.wiezien_id_wieznia_seq;

CREATE TABLE wiezienie.wiezien(
                id_wieznia  INTEGER NOT NULL DEFAULT nextval('wiezienie.wiezien_id_wieznia_seq'),
                imie        VARCHAR NOT NULL,
                nazwisko    VARCHAR NOT NULL,
                PESEL       NUMERIC NOT NULL,
                CONSTRAINT wiezien_pk PRIMARY KEY (id_wieznia)
);

ALTER SEQUENCE wiezienie.wiezien_id_seq OWNED BY wiezienie.wiezien.id_wieznia;


CREATE SEQUENCE wiezienie.wiezien_info_id_wpisu_seq;

CREATE TABLE wiezien_info(
                id_wpisu INTEGER NOT NULL DEFAULT nextval('wiezienie.wiezien_info_id_wpisu_seq'),
                id_wieznia INTEGER NOT NULL,
                cela_id INTEGER NOT NULL,
                depozyt_id INTEGER NOT NULL, 
                wyrok_id INTEGER NOT NULL,
                CONSTRAINT wiezien_info_pk PRIMARY KEY (id_wpisu)

);

ALTER SEQUENCE wiezienie.wiezien_info_id_wpisu_seq OWNED BY wiezienie.wiezien_info.id_wpisu;


CREATE SEQUENCE wiezienie.pracownik_id_pracownika_seq;

CREATE TABLE wiezienie.pracownik(
                id_pracownika INTEGER NOT NULL DEFAULT nextval('wiezienie.pracownik_id_pracownika_seq'),
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                CONSTRAINT pracownik_pk PRIMARY KEY (id_pracownika)
);

ALTER SEQUENCE wiezienie.pracownik_id_pracownika_seq OWNED BY wiezienie.pracownik.id_pracownika;


CREATE SEQUENCE wiezienie.pracownik_info_id_zawodu_seq;

CREATE TABLE pracownik_info(
                id_zawodu INTEGER NOT NULL DEFAULT nextval('wiezienie.pracownik_info_id_zawodu_seq'),
                id_pracownika INTEGER NOT NULL,
                id_pokoju INTEGER NOT NULL,

                nazwa_
                
);

CREATE SEQUENCE wiezienie.wyrok_id_wyroku_seq;

CREATE TABLE wyrok(
                id_wyroku INTEGER NOT NULL DEFAULT nextval('wiezienie.wiezien_info_id_wpisu_seq'),
                nazwa_wyroku VARCHAR NOT NULL,
                data_rozpoczecia DATE NOT NULL,
                data_zakonczenia DATE,
                CONSTRAINT wyrok_pk PRIMARY KEY (id_wyroku)
);

ALTER SEQUENCE wiezienie.wyrok_id_wyroku_seq OWNED BY wiezienie.wyrok.id_wyroku;


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


CREATE SEQUENCE wiezienie.segment_id_segmentu_seq;

CREATE TABLE segment(
                id_segmentu INTEGER NOT NULL DEFAULT nextval('wizienie.segment_id_segmentu_seq'),
                nazwa_segmentu VARCHAR NOT NULL,
                id_naczelnika INTEGER NOT NULL,
                CONSTRAINT segment_pk PRIMARY KEY (id_segmentu)
);

ALTER SEQUENCE wiezienie.segment_id_segmentu_seq OWNED BY wizienie.segment.id_segmentu;


CREATE SEQUENCE wiezienie.pokoj_id_pokoju_seq;

CREATE TABLE pokoj(
                id_pokoju INTEGER NOT NULL DEFAULT nextval('wiezienie.pokoj_id_pokoju_seq'),
                nazwa_pokoju VARCHAR NOT NULL,
                id_segmentu INTEGER NOT NULL,
                id_depozytu INTEGER NOT NULL,
                CONSTRAINT pokoj_pk PRIMARY KEY (id_pokoju)
)
