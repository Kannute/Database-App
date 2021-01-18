/*TWORZENIE WIDOKOW
    todo
    -Spis pracownikow i gdzie przebywaja
    -Spis zdeponowanych przedmiotow nalezacych do wiezniow
    -Spis wolnych cel
    
*/

/*SPIS WSZYSTKICH WIEZNIOW Z WYROKIEM*/
CREATE VIEW wszyscy_wiezniowie AS SELECT w.imie, w.nazwisko, wy.nazwa_wyroku as wyrok FROM 
wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.wyrok wy WHERE
w.id_wieznia = wi.id_wieznia and wi.id_wyroku = wy.id_wyroku;

/*SPIS WIEZNIOW Z DOZYWOTNIM WYROKIEM*/
CREATE VIEW dozywotni_wiezniowie AS SELECT w.imie, w.nazwisko, wy.nazwa_wyroku as wyrok FROM 
wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.wyrok wy WHERE
w.id_wieznia = wi.id_wieznia and wi.id_wyroku = wy.id_wyroku and wy.data_zakonczenia IS NULL;

/*SPIS PRACOWNIKOW*/
CREATE VIEW wszyscy_pracownicy AS SELECT p.imie, p.nazwisko, z.nazwa as zawod, po.nazwa_pokoju as pokoj, s.nazwa_segmentu as segment FROM
wiezienie.pracownik p, wiezienie.pracownik_info pi, wiezienie.zawod z, wiezienie.pokoj po, wiezienie.segment s WHERE
p.id_pracownika = pi.id_pracownika and pi.id_zawodu = z.id_zawodu and pi.id_pokoju = po.id_pokoju and po.id_segmentu = s.id_segmentu
ORDER BY s.id_segmentu;

/*SPIS RZECZY NALEZACYCH DO WIEZNIOW */
CREATE VIEW depozyt_wiezniow AS SELECT  w.imie, w.nazwisko, z.nazwa, z.ilosc FROM wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.depozyt d, wiezienie.zasoby z WHERE
w.id_wieznia = wi.id_wieznia AND wi.id_depozytu = d.id_depozytu AND d.id_zasobu = z.id_zasobu;

/*SPIS DOSTEPNYCH CEL*/
CREATE VIEW wszystkie_dostepne_cele AS SELECT c.nr_celi, c.ilosc_miejsc, c.typ_celi, s.nazwa_segmentu FROM wiezienie.cela c, wiezienie.segment s WHERE 
c.ilosc_miejsc > 0 AND c.id_segmentu = s.id_segmentu;