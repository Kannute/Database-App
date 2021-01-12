/*TWORZENIE WIDOKOW*/

/*SPIS WSZYSTKICH WIEZNIOW Z WYROKIEM*/

CREATE VIEW wszyscy_wiezniowie AS SELECT w.imie, w.nazwisko, wy.nazwa_wyroku as wyrok FROM 
wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.wyrok wy WHERE
w.id_wieznia = wi.id_wieznia and wi.id_wyroku = wy.id_wyroku;

/*SPIS WIEZNIOW Z DOZYWOTNIM WYROKIEM*/
CREATE VIEW dozywotni_wiezniowie AS SELECT w.imie, w.nazwisko, wy.nazwa_wyroku as wyrok FROM 
wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.wyrok wy WHERE
w.id_wieznia = wi.id_wieznia and wi.id_wyroku = wy.id_wyroku and wy.data_zakonczenia IS NULL;
